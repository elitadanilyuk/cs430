Assignment: Module Lab 9: Updating a Database using JDBC with XML Input
Class: CS470
Author: Elita Danilyuk

## Execution

The accompanying `run.sh` script is meant to be executed to compile and run this program on activityfile.xml.
The program is compiled in to a directory called target.
The libraries need to be included in the CLASSPATH when executing.

### Program arguments

`java lab9.Main [xmltarget] ['V' for verbose output]`
**Example**
`$ java -cp target:lib/mysql-connector-java-8.0.27.jar:lib/jdom/jdom-2.0.6.1.jar lab9.Main activityfile.xml`

## Overview

This program is a database application written using jdbc for sql connectivity and jdom for XML parsing. It works with a MariaDB database containing mock library data. The activityfile.xml is meant to be read in as checkin/checkout transactions.
