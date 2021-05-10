
```
python bitcoin2john.py wallet.dat > hash.txt
hashcat --stdout wordlist0.txt -r OneRuleToRuleThemAll.rule | hashcat -m 11300 hash.txt
```


