# On load, register this package's bundled skills directory with the core aisdk
# skill registry. Core's default_skill_roots() already reads the
# `aisdk.skill_roots` option, so the bundled skills become discoverable without
# any change to the core skill-loading runtime.
.onLoad <- function(libname, pkgname) {
  skills_dir <- system.file("skills", package = "aisdk.skills")
  if (nzchar(skills_dir) && dir.exists(skills_dir)) {
    current <- getOption("aisdk.skill_roots", character(0))
    options(aisdk.skill_roots = unique(c(current, skills_dir)))
  }
  invisible()
}
