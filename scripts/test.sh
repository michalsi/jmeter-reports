#!/bin/sh
#
 
test_case="testPlan1.jmx"

WORKSPACE=`dirname $0`
RESULTS=$WORKSPACE/../results
IMAGE_FILES=$RESULTS/*.png

echo $IMAGE_FILES
echo "======="
echo `basename $test_case .jmx`
test_case=`basename $test_case .jmx`
FILES_NAMES=`find $IMAGE_FILES | grep $test_case'[A-Za-z0-9]*\.png' -o`

echo $FILES_NAMES

image="testPlan1SomeImage.png"

echo "After Replacement:" ${image/`basename $test_case .jmx`/}