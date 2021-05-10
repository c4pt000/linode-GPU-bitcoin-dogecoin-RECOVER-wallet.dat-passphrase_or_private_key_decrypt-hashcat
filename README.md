# requires CUDA toolkit for nvidia
```
wget https://developer.download.nvidia.com/compute/cuda/11.3.0/local_installers/cuda-repo-fedora33-11-3-local-11.3.0_465.19.01-1.x86_64.rpm
sudo rpm -i cuda-repo-fedora33-11-3-local-11.3.0_465.19.01-1.x86_64.rpm
sudo dnf clean all
sudo dnf -y module install nvidia-driver:latest-dkms
sudo dnf -y install cuda
```
```
python bitcoin2john.py wallet.dat > hash.txt
hashcat --stdout wordlist0.txt -r OneRuleToRuleThemAll.rule | hashcat -m 11300 hash.txt
```


