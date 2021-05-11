#!/bin/bash
./hashcat.bin --stdout rockyou.txt -r OneRuleToRuleThemAll.rule | ./hashcat.bin -m 11300 hash.txt
