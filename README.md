This repository contains the Spack configuration required to compile vis on
Riker as well as scripts to enable the configuration and compile the code. This
repository also has submodules for Spack itself and the builtin Spack packages.
Thus, when you check out this repository, you need to initialize and update the
submodules.

``` bash
git clone https://github.com/kmorel/riker-spack-scripts.git
cd riker-frontier-scripts
git submodule update --init
```

To set up and load the Spack environment, simply source the
`setup-spack.sh` script.

``` sh
. ./setup-spack.sh
```
