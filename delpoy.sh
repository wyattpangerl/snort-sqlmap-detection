#!/bin/bash
# Function to deploy Snort rules to the local.rules file
deploy_rules() {
    echo "$1" | sudo tee -a /etc/snort/rules/local.rules > /dev/null
}
# Function to restart Snort so configuration changes are applied
restart_snort() {
    sudo systemctl restart snort
}
# Snort rule 1
rule1='alert tcp $HOME_NET any -> $EXTERNAL_NET $HTTP_PORTS (msg:"Connection: close header detected"; flow:to_server,established; content:"Connection: close"; nocase; pcre:"/Connection:\s*close.*Connection:\s*close/i"; sid:1000001;)'
# Snort rule 2
rule2='alert tcp any any -> any any (msg:"SQLMap User-Agent Detected"; content:"User-Agent"; nocase; http_header; pcre:"/sqlmap/i"; sid:123456789;)'
# Deploy rules to the correct rules file
deploy_rules "$rule1"
deploy_rules "$rule2"
# Restart Snort
restart_snort
echo "Snort rules deployed and Snort restarted."