# Load tests

## Description
This repository contains test data, test data generation scripts and tools to run performance tests. 

### Test scenarios

* amend accountable people
* amend business details
* amend empowerments
* amend personal details
* edit land external
* edit land
* filter business list
* get active farmer declaration embedded screens
* get apply bps application embedded screens
* get commons embedded screens
* get farm business details embedded screens
* get land use embedded screens
* get transfer entitlements embedded screens
* get transfer land embedded screens
* get view bps application embedded screens
* get view entitlements embedded screens
* go to land viewer parcel details external user
* go to land viewer parcel details ungrouped
* notifications
* view business details
* view personal details

## JMeter test tool
The `JMeter` application is open source software, a 100% pure Java application designed to load test 
functional behavior and measure performance. To learn more visit http://jmeter.apache.org/

## How to run test
Tests are intended to run though a specific task against desired environment via TeamCity

While writing tests you may run JMeter application (apache-jmeter-2.12/bin/jmeter) locally
and load specific test from /tests folder.

