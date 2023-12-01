# snort-sqlmap-detection
This repository contains snort rules and documentation for detecting sqlmap based upon HTTP request characatistics. 
1. snort.rules - Contains a rule for detecting the sqlmap useragent across all ports
2. sqlmap.pcap test file for testing rules. default sqlmap run, no flags specified. 
3. deploy.sh - a file that deploys the rules to the correct files and restarts snort so you can start detecting with the rules without the need for manual configurations. 
