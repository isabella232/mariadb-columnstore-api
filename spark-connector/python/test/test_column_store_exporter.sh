#!/bin/sh

if [ "$#" -ne 2 ]; then
    echo "$0 python_executable_path pyspark_driver_python"
	exit 2
fi

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

export PYSPARK_PYTHON=$1
export PYSPARK_DRIVER_PYTHON=$2
$1 -m pytest $SCRIPTPATH/test_column_store_exporter.py
