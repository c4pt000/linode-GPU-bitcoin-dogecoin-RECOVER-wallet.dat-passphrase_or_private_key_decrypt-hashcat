#!/bin/bash
hashcat.bin --stdout wordlist0.txt -r OneRuleToRuleThemAll.rule | hashcat -m 11300 hash.txt
