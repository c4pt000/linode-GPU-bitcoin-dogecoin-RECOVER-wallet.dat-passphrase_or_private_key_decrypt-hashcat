# requires CUDA toolkit for nvidia
```
wget https://developer.download.nvidia.com/compute/cuda/11.3.0/local_installers/cuda-repo-fedora33-11-3-local-11.3.0_465.19.01-1.x86_64.rpm
sudo rpm -i cuda-repo-fedora33-11-3-local-11.3.0_465.19.01-1.x86_64.rpm
wget https://download.nvidia.com/XFree86/Linux-x86_64/460.56/NVIDIA-Linux-x86_64-460.56.run
yum install kernel-headers kernel-devel -y
bash NVIDIA-Linux-x86_64-460.56.run

yum install p7zip-full
```

```
python bitcoin2john.py wallet.dat > hash.txt
hashcat --stdout wordlist0.txt -r OneRuleToRuleThemAll.rule | hashcat -m 11300 hash.txt
```


