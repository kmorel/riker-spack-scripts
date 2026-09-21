#!/bin/bash

set -e

module purge

pv_version=6.1.1

scriptdir=$(dirname $(realpath $0))

cd ${scriptdir}

. $scriptdir/setup-spack.sh

if spack env activate paraview 2> /dev/null ; then
  :
else
  echo "Creating Spack environment 'paraview'."
  spack env create paraview
  spack env activate paraview
fi

spack add paraview@$pv_version
spack concretize
spack install

# Make a custom server configuration that points to this build.

# This works best if this build directory has the date in it.
build_name=riker-$(basename $scriptdir)-$pv_version
pvsc_file=$scriptdir/$build_name.pvsc

# Create standard pvsc file to connect to this build.
cp -f $scriptdir/pvsc/ORNL/ORNL-riker.pvsc $pvsc_file
sed -i "s/ORNL riker (OLCF Official)/$build_name/" $pvsc_file
sed -i "s|/sw/riker/paraview/pvsc|$scriptdir/pvsc|" $pvsc_file
