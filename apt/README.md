# apt
---
### Package Management
---
- `packages.txt` contains name of the packages.
- `versions.txt` contains name of the packages with their current versions.
### Procedure
---
- Initially we need to figure out which packages are the basic reqirements. Thus, `packages.txt` is to be created first.
- Once `packages.txt` is created, lets find out their versions on `apt-cache`
```
xargs -r -a packages.txt apt-cache policy | grep -i "installed"
```
*Output*
```
  Installed: 1:2.25.1-1ubuntu3.2
  Installed: 7.68.0-1ubuntu2.7
  Installed: 3.8.2-0ubuntu2
```
- Use this output to generate `versions.txt`
- Once `versions.txt` is generated packages with specific versions can be installed using the command
```
xargs -r -a packages.txt sudo apt install -y
```
*Output*
```
Reading package lists... Done
Building dependency tree       
Reading state information... Done
python3 is already the newest version (3.8.2-0ubuntu2).
curl is already the newest version (7.68.0-1ubuntu2.7).
git is already the newest version (1:2.25.1-1ubuntu3.2).
The following packages were automatically installed and are no longer required:
  linux-headers-5.11.0-40-generic linux-hwe-5.11-headers-5.11.0-40
  linux-image-5.11.0-40-generic linux-modules-5.11.0-40-generic
  linux-modules-extra-5.11.0-40-generic
Use 'sudo apt autoremove' to remove them.
0 upgraded, 0 newly installed, 0 to remove and 30 not upgraded.
```
