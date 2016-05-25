# Script to run Jmeter test plans and format HTML rapport

This is a small script that runs jmeter with configured result parameters. It's part of our work that we've done around performance tests in on of the Kainos projects. Big kudos should go to the guys with whom I worked with there! :star: 

+ Automatically detects tests plans that are placed in `tests` directory and run all of them.
+ Uses tools shipped with Jmeter (**CMDRunner** and **Xalan**) to parse results, prepare them in tabular form and generate graphs.
+ Different types of reports can be added, removed and configured in the script.
+ Creates HTML report for all tests scripts that has been run 
+ Displays collapsible images with performance metrics

There's also a link to 'Summary report' which is produced by separate process but is not included here at the moment.


**Working Example** of report for 2 test plans and 4 types of charts can be viewed 
[here](https://rawgit.com/michalsi/jmeter-reports/master/results/results.html)


## Execution


Just run `runner.sh` from `scripts` directory.

Output is generated in `results` directory.