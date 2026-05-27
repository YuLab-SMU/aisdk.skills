# Verifies the dependency-inversion seam for bundled skill content: loading
# aisdk.skills registers its bundled skills directory with the core
# `aisdk.skill_roots` option, so the core skill registry can discover them.

test_that("bundled skills directory is registered via the aisdk.skill_roots option", {
  pkg_skills <- system.file("skills", package = "aisdk.skills")
  expect_true(nzchar(pkg_skills) && dir.exists(pkg_skills))
  roots <- getOption("aisdk.skill_roots", character(0))
  expect_true(pkg_skills %in% roots)
})

test_that("the bundled skill pack ships skills", {
  pkg_skills <- system.file("skills", package = "aisdk.skills")
  skill_dirs <- list.dirs(pkg_skills, recursive = FALSE)
  expect_true(length(skill_dirs) >= 1)
})
