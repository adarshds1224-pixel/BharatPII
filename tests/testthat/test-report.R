test_that("report creates an HTML report in the requested directory", {
  skip_if_not_installed("rmarkdown")
  skip_if_not_installed("knitr")

  if (!rmarkdown::pandoc_available()) {
    skip("Pandoc is not available.")
  }

  audit <- pii_scan(data.frame(
    mobile = c("9876543210", "8123456789", "7012345678"),
    group = c("A", "A", "B")
  ))

  out_dir <- tempfile("bharatpii-report-")
  dir.create(out_dir)
  path <- report(audit, output_dir = out_dir)

  expect_true(file.exists(path))
  expect_match(basename(path), "^bharatpii-audit-.*\\.html$")
  expect_match(
    paste(readLines(path, warn = FALSE), collapse = "\n"),
    "bharatpii",
    ignore.case = TRUE
  )

  unlink(out_dir, recursive = TRUE)
})

test_that("report rejects invalid audit objects", {
  expect_error(report(list()), "pii_audit")
})

test_that("report rejects output filenames containing paths", {
  audit <- pii_scan(data.frame(mobile = c("9876543210", "8123456789")))

  expect_error(
    report(audit, output_file = "../outside.html"),
    "filename"
  )
})

test_that("PDF reporting explains missing LaTeX", {
  skip_if(nzchar(Sys.which("pdflatex")))
  audit <- pii_scan(data.frame(mobile = c("9876543210", "8123456789")))

  expect_error(report(audit, format = "pdf"), "pdflatex")
})

