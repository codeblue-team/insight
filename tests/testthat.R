if (require("testthat")) {
  library(insight)

  if (length(strsplit(packageDescription("insight")$Version, "\\.")[[1]]) > 3) {
    Sys.setenv("RunAllinsightTests" = "yes")
  } else {
    Sys.setenv("RunAllinsightTests" = "no")
  }

  osx <- tryCatch(
    {
      si <- Sys.info()
      if (!is.null(si["sysname"])) {
        si["sysname"] == "Darwin" || grepl("^darwin", R.version$os)
      } else {
        FALSE
      }
    },
    error = function(e) {
      FALSE
    }
  )

  if (!osx || (osx && getRversion() >= "4.0.0")) {
    test_check("insight")
  }
}
