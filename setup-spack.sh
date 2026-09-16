if test -n "$BASH" ; then myscript=$BASH_SOURCE
elif test -n "$TMOUT"; then myscript=${.sh.file}
elif test -n "$ZSH_NAME" ; then myscript=${(%):-%x}
elif test ${0##*/} = dash; then x=$(lsof -p $$ -Fn0 | tail -1); myscript=${x#n}
else myscript=$0
fi

myspack_base_dir=`dirname $myscript`
myspack_base_dir=`realpath $myspack_base_dir`

unset myscript

export SPACK_USER_CONFIG_PATH=$myspack_base_dir/spack-config
. $myspack_base_dir/spack/share/spack/setup-env.sh
