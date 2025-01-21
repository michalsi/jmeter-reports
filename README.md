# JMeter Test Plan Runner and HTML Report Generator

This script automates the execution of JMeter test plans and generates HTML reports.

## Features

- Automatically detects and runs test plans in the `tests` directory.
- Utilizes JMeter's **CMDRunner** and **Xalan** to parse results and generate reports with graphs.
- Configurable report types.
- Generates HTML reports with collapsible performance metric images.

## Usage

1. Navigate to the `scripts` directory.
2. Execute `runner.sh`.

The output is stored in the `results` directory.

## Example Report

View a sample report with two test plans and four chart types [here](https://rawgit.com/michalsi/jmeter-reports/master/results/results.html).
