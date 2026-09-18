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

```bash
. ./setup-spack.sh
```

## Building and Installing ParaView

You can use the `make-paraview.sh` to build ParaView. Consider first editing the
script to select the version of ParaView you want. Then run the script to build
ParaView. This will take many hours, so consider launching the build in the
background with `nohup`.

```bash
nohup ./make-paraview.sh > build.log &
tail -f build.log
```

Many things can go wrong with the build. If the build fails, run it again to see
if it progresses further before debugging. Intermittent failures with limited
resources or the non-POSIX-compliant file system can be resolved by just
restartting.

The `make-paraview.sh` script creates a Spack environment named `paraview`
containing the built paraview package and all its dependencies. To ensure you
get packages that match the ParaView build, you can activate this environment.

```bash
spack env activate paraview
```

Or simply call `spacktivate paraview`.
