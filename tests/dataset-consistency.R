# Dataset consistency checks (plain base-R test; no testthat, no added Suggests).
# Run by R CMD check. Two guarantees, both platform-stable (structural facts only):
#   1. Every shipped dataset still has the exact structure recorded in the golden
#      manifest (tests/dataset-manifest.rds): dimensions, column names in order,
#      column classes, factor levels in order, and orderedness. This is the
#      structural half of the byte-freeze -- a renamed/reordered/retyped column,
#      a changed factor level, or a dropped/added row or column fails the check.
#   2. Each dataset's documented @format ("N rows and M columns") matches the
#      actual dimensions, so the help pages cannot silently drift from the data.
# (The value-level freeze -- a changed number inside an unchanged structure -- is
#  covered by the developer-side data-identity harness, not here, to keep this
#  test free of any platform-sensitive serialization.)

library(datarium)

manifest <- readRDS("dataset-manifest.rds")
fail <- character(0)

## ---- 1. structure vs golden manifest ---------------------------------------
shipped <- utils::data(package = "datarium")$results[, "Item"]
shipped <- sub("\\s.*$", "", shipped)            # strip any "name (alias)" form

missing <- setdiff(names(manifest), shipped)
if (length(missing))
  fail <- c(fail, sprintf("dataset removed since manifest: %s", paste(missing, collapse = ", ")))

extra <- setdiff(shipped, names(manifest))
if (length(extra))
  fail <- c(fail, sprintf("dataset not in manifest (update tests/dataset-manifest.rds after adding): %s",
                          paste(extra, collapse = ", ")))

for (nm in intersect(names(manifest), shipped)) {
  e <- new.env()
  utils::data(list = nm, package = "datarium", envir = e)
  x <- get(nm, envir = e)
  m <- manifest[[nm]]

  if (!identical(nrow(x), m$nrow) || !identical(ncol(x), m$ncol))
    fail <- c(fail, sprintf("%s: dim %dx%d, manifest %dx%d", nm, nrow(x), ncol(x), m$nrow, m$ncol))
  if (!identical(names(x), m$names))
    fail <- c(fail, sprintf("%s: column names/order changed: [%s] vs [%s]",
                            nm, paste(names(x), collapse = ","), paste(m$names, collapse = ",")))
  cls <- unname(vapply(x, function(c) class(c)[1], ""))
  if (!identical(cls, m$classes))
    fail <- c(fail, sprintf("%s: column classes changed: [%s] vs [%s]",
                            nm, paste(cls, collapse = ","), paste(m$classes, collapse = ",")))
  lv <- lapply(stats::setNames(seq_along(x), names(x)),
               function(i) if (is.factor(x[[i]])) levels(x[[i]]) else NULL)
  if (!identical(lv, m$levels))
    fail <- c(fail, sprintf("%s: factor levels changed", nm))
  ord <- unname(vapply(x, is.ordered, TRUE))
  if (!identical(ord, m$ordered))
    fail <- c(fail, sprintf("%s: factor orderedness changed", nm))
}

## ---- 2. documented @format dimensions vs data ------------------------------
fmt_text <- function(rd) {
  out <- character(0)
  rec <- function(z) {
    tag <- attr(z, "Rd_tag")
    if (!is.null(tag) && tag == "\\format") out[[length(out) + 1L]] <<- paste(unlist(z), collapse = "")
    if (is.list(z)) lapply(z, rec)
  }
  rec(rd)
  paste(out, collapse = " ")
}
db <- tools::Rd_db("datarium")
names(db) <- sub("[.]Rd$", "", names(db))

for (nm in intersect(names(manifest), names(db))) {
  txt <- fmt_text(db[[nm]])
  hit <- regmatches(txt, regexpr("[0-9]+ rows and [0-9]+ column", txt))
  if (!length(hit)) {
    fail <- c(fail, sprintf("%s: @format has no 'N rows and M columns' statement", nm))
    next
  }
  dims <- as.integer(regmatches(hit, gregexpr("[0-9]+", hit))[[1]])
  m <- manifest[[nm]]
  if (!identical(dims[1], m$nrow) || !identical(dims[2], m$ncol))
    fail <- c(fail, sprintf("%s: @format says %dx%d but data is %dx%d", nm, dims[1], dims[2], m$nrow, m$ncol))
}

## ---- report -----------------------------------------------------------------
if (length(fail)) {
  stop("dataset consistency check failed:\n  ", paste(fail, collapse = "\n  "), call. = FALSE)
}
cat(sprintf("dataset consistency OK: %d datasets, structure and @format dimensions verified\n",
            length(manifest)))
