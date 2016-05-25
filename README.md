# Script tu run Jmeter test plans and format HTML raport

This is a small script that runs jmeter with confugured result paramteres. It's part of our work that we've done arround performance tests in on of the Kainos projects. Big kudos should go to the guys with whom I worked with there! :star: 

It automatically detects tests plans that are placed in `tests` directory and run all of them.

It uses tools shipped with Jmeter (**CMDRunner** and **Xalan**)to parse results, prepare them in tabular form and generate graphs.

Different types of reports can be added,removed and configured in the script.  

It creates HTML report with run tests plans and attached images with performence metrics and are collapsable.

There's also a link to 'Summary report' which is produced by separate process and not included in this package yet.