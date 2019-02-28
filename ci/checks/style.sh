#!/bin/bash
# Copyright (c) 2018, NVIDIA CORPORATION.
#####################
# cuDF Style Tester #
#####################

# Ignore errors and set path
set +e
PATH=/conda/bin:$PATH

# Activate common conda env
source activate gdf

# for click/black
# https://click.palletsprojects.com/en/7.x/python3/
export LC_ALL=C.UTF-8
export LANG=C.UTF-8

pip install black

# Run black and get results/return code
BLACK=`black --check --diff --exclude=versioneer.py .`
RETVAL=$?

# Output results if failure otherwise show pass
if [ "$BLACK" != "" ]; then
  echo -e "\n\n>>>> FAILED: black style check; begin output\n\n"
  echo -e "$BLACK"
  echo -e "\n\n>>>> FAILED: black style check; end output\n\n"
else
  echo -e "\n\n>>>> PASSED: Black style enforcement\n\n"
fi

exit $RETVAL
