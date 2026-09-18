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
