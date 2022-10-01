# egkap : A Package Manager written in Shell Script
---

## ideal usecase
---
```bash
update   checks an update and install a new package
install  installs a package from current repo or a new GitHub repo (if mentioned) and create a symlink in ~/bin or ~/.bin
remove   uninstalls a package, does proper cleanup and removes the symlink
list     lists egkap packages available
```
Options are as usual
```bash
-v, --version  prints version of egkap
-h, --help     prints help message
```

## base roadmap
---
- have modular structure
- each package should have 2 installations
  - on-prem
  - containerised
- each package should have uninstallation scripts
  - these scripts should do proper cleanup
  - warn user if this causes issues in dependency graph
- should be central enough that upon cloning and installing the repo, `ansible` can use the scripts
  - have an `ansible` folder as well.
- lastly try to use the scripts for `terraform` `inline`.

## base language
---
(to be deccided)
- go lang
- python3
