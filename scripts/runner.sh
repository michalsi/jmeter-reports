#!/bin/sh

#paths
WORKSPACE=`dirname $0`
RESULTS=$WORKSPACE/../results
CMD_RUNNER=$WORKSPACE/../apache-jmeter-2.12/lib/ext/CMDRunner.jar
JMETER=$WORKSPACE/../apache-jmeter-2.12/bin/jmeter
XALAN=$WORKSPACE/../apache-jmeter-2.12/lib/xalan-2.7.0.jar
XLS=$WORKSPACE/../apache-jmeter-2.12/extras/jmeter-results-detail-report_21.xsl
ICONS=$WORKSPACE/../apache-jmeter-2.12/extras

TEST_CASES=$WORKSPACE/../tests/*.jmx

IMAGE_WIDTH=1280
IMAGE_HEIGHT=800

rm -r $RESULTS/*
mkdir -p $RESULTS


numberOfTests=`find $TEST_CASES -maxdepth 1 -type f | wc -l`
echo "=============="
echo "About to execute tests: $numberOfTests"
echo "Tests to be run:"
find $TEST_CASES | grep '[0-9a-zA-Z\-]*\.jmx' -o
# find $TEST_CASES | grep '[a-zA-Z\-]*\.jmx' -o
# find $TEST_CASES -maxdepth 1 -type f | grep '[a-zA-Z\-]*\.jmx' -o
# IMAGES=`find $IMAGE_FILES | grep $test_name'[A-Za-z0-9]*\.png' -o`
echo "=============="

echo "<html><head><title>JMeter results</title><script src=\"toggling.js\"></script> \
<link rel=\"stylesheet\" type=\"text/css\" href=\"styles.css\"> \
</head><body><h1>JMeter results</h1>" >> $RESULTS/results.html
echo "<h2 ><a href=\"report/index.html\" class=\"inline-link-1\">Smmary report</a></h2>">> $RESULTS/results.html
echo "<ul>">> $RESULTS/results.html

for test_case in $TEST_CASES
do
    #result files
    test_name=`basename $test_case .jmx`
    result=$RESULTS/`basename $test_case .jmx`.jtl
    resultResponses=$RESULTS/`basename $test_case .jmx`ResponseTimesOverTime.png
    resultBytesThroughputOverTime=$RESULTS/`basename $test_case .jmx`BytesThroughputOverTime.png
    resultHitsPerSecond=$RESULTS/`basename $test_case .jmx`HitsPerSecond.png
    resultResponseTimesPercentiles=$RESULTS/`basename $test_case .jmx`ResponseTimesPercentiles.png
    resultCSV=$RESULTS/`basename $test_case .jmx`.csv
    resultAggregateReport=$RESULTS/`basename $test_case .jmx`AggregateReport.csv
    resultHtml=$RESULTS/`basename $test_case .jmx`.html
    
    #run load test
    "$JMETER" -n -t $test_case -l $result \

    #create reports
    java -cp "$XALAN" org.apache.xalan.xslt.Process -IN $result -XSL "$XLS" -OUT $resultHtml
    java -jar "$CMD_RUNNER" --tool Reporter --generate-csv $resultCSV \
             --input-jtl $result --plugin-type SynthesisReport 
    java -jar "$CMD_RUNNER" --tool Reporter --generate-csv $resultAggregateReport \
             --input-jtl $result --plugin-type AggregateReport 
    java -jar "$CMD_RUNNER" --tool Reporter --generate-png $resultResponses \
             --input-jtl $result --plugin-type ResponseTimesOverTime --width $IMAGE_WIDTH --height $IMAGE_HEIGHT
    java -jar "$CMD_RUNNER" --tool Reporter --generate-png $resultBytesThroughputOverTime \
             --input-jtl $result --plugin-type BytesThroughputOverTime --width $IMAGE_WIDTH --height $IMAGE_HEIGHT
    java -jar "$CMD_RUNNER" --tool Reporter --generate-png $resultHitsPerSecond \
             --input-jtl $result --plugin-type HitsPerSecond --width $IMAGE_WIDTH --height $IMAGE_HEIGHT
    java -jar "$CMD_RUNNER" --tool Reporter --generate-png $resultResponseTimesPercentiles \
             --input-jtl $result --plugin-type ResponseTimesPercentiles --width $IMAGE_WIDTH --height $IMAGE_HEIGHT
    
    echo "<div><p><a href='`basename $test_case .jmx`.html' target='_blank' class=\"inline-link\" >`basename $test_case .jmx`</a> </p>" >> $RESULTS/results.html
    
    # prepate list of colapsable images
    IMAGE_FILES=$RESULTS/*.png
	IMAGES=`find $IMAGE_FILES | grep $test_name'[A-Za-z0-9]*\.png' -o`

	counter=1
	for image in $IMAGES
		do
		img_id=$test_name"_id"$counter"_img"
		elem_id=$test_name"_id"$counter
		echo "<input type=\"image\" src=\"expand.png\" onclick=\"return toggleMe('$elem_id')\" value=\"Toggle\" id=\"$img_id\" >" >> $RESULTS/results.html
		echo "${image/`basename $test_case .jmx`/} <br>" >> $RESULTS/results.html
		echo "<div id=\"$elem_id\" style=\"display:none\" >" >> $RESULTS/results.html
		echo "<img src=\"$image\" alt=$image > </div><br> " >> $RESULTS/results.Html
		counter=$((counter+1))
	done
	echo"</div>" >> $RESULTS/results.Html
done

echo "</ul></body></html>" >> $RESULTS/results.html
cp "$ICONS/expand.png" $RESULTS 
cp "$ICONS/collapse.png" $RESULTS
cp ./toggling.js $RESULTS
cp ./styles.css $RESULTS
