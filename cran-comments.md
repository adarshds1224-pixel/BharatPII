## Test environments

* Local: Windows 11 x64, R 4.6.1
* GitHub Actions (r-lib/actions check-standard): Windows, macOS and Ubuntu
* win-builder: R-devel (2026-10-09 r90655 ucrt)

## R CMD check results

0 errors | 0 warnings | 0 notes locally and on GitHub Actions.

win-builder (R-devel) reports 1 NOTE: this is a new submission, and
the maintainer address is checked as part of that.

## Notes

* All examples, tests and vignettes use synthetic data only.
* The package does not write files outside `tempdir()` unless the user
  supplies an output location.
* Identifier checks are structural (format and checksum) and do not
  prove that an identifier was issued. The DPDP-informed classifications
  and scores are technical conventions, not legal advice.
