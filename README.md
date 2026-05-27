# aisdk.skills

Skill-ecosystem tooling and content for the
[aisdk](https://github.com/YuLab-SMU/aisdk) toolkit.

- **Authoring** — scaffolding helpers (`init_skill()`, `package_skill()`).
- **Store** — a global skill store for sharing/installing skills (`list_skills()`,
  `search_skills()`, install/download).
- **Forge** — skill-forge authoring/verification tools (`create_skill_forge_tools()`).
- **Bundled skill pack** — ready-to-use skills under `inst/skills/`.

## Dependency inversion

The skill-loading **runtime** (the `Skill` class, `create_skill_tools()`, the
registry/discovery) stays in `aisdk` core, because agents load skills as a core
capability. This package holds the *authoring/store/content* layer.

On load, `aisdk.skills` registers its bundled skills directory with the core
registry via the existing `aisdk.skill_roots` option, so the core
skill-discovery runtime finds the bundled skills without any change to core and
without shipping this content inside core.

## Installation

```r
# install.packages("remotes")
remotes::install_github("YuLab-SMU/aisdk")          # core (skill runtime)
remotes::install_github("YuLab-SMU/aisdk.skills")   # this package
```

## Usage

```r
library(aisdk)
library(aisdk.skills)   # bundled skills become discoverable

init_skill("my_skill")          # scaffold a new skill
list_skills()                   # browse the store
```
