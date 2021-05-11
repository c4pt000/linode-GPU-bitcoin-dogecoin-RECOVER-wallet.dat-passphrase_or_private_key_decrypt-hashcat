# requires CUDA toolkit for nvidia (fedora 34)
```
yum install nano wget git -y



cd /opt

wget https://github.com/c4pt000/kernel-5.11.6-expSEHDsec-cgroup-virtio/releases/download/5.11.6-expSEHDsec/kernel-5.11.6_expSEHDsec-cgroupvirtio.x86_64.rpm
wget https://github.com/c4pt000/kernel-5.11.6-expSEHDsec-cgroup-virtio/releases/download/5.11.6-expSEHDsec/kernel-devel_5.11.6_expSEHDsec-cgroupvirtio.x86_64.rpm
wget https://github.com/c4pt000/kernel-5.11.6-expSEHDsec-cgroup-virtio/releases/download/5.11.6-expSEHDsec/kernel-headers-5.11.6_expSEHDsec-cgroupvirtio.x86_64.rpm

rm -rf /boot/initramfs*
rm -rf /boot/vmlinuz*

sed -i 's/GRUB_ENABLE_BLSCFG=true/GRUB_ENABLE_BLSCFG=false/g' /etc/default/grub 

sleep 2s
grub2-editenv create
rpm -e --nodeps kernel-core kernel-modules kernel-headers kernel-devel kernel-srpm-macros kernel

rpm -Uvh kernel-5.11.6_expSEHDsec-cgroupvirtio.x86_64.rpm
rpm -Uvh kernel-headers-5.11.6_expSEHDsec-cgroupvirtio.x86_64.rpm
rpm -Uvh kernel-devel_5.11.6_expSEHDsec-cgroupvirtio.x86_64.rpm 

 
   nano /root/.bashrc 
   source /root/.bashrc 



grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg
grub2-mkconfig -o /boot/grub2/grub.cfg

echo "SCRIPT HAS TO REBOOT FOR KERNEL CHANGES script will sleep for 10 seconds Ctrl-C to cancel script and reboot"
sleep 10s

```

```
cd /opt
yum groupinstall "C Development Tools and Libraries" -y
wget https://download.nvidia.com/XFree86/Linux-x86_64/460.56/NVIDIA-Linux-x86_64-460.56.run
bash NVIDIA-Linux-x86_64-460.56.run
modprobe nvidia
nvidia-smi


wget https://developer.download.nvidia.com/compute/cuda/11.1.1/local_installers/cuda_11.1.1_455.32.00_linux.run
chmod +x cuda_11.1.1_455.32.00_linux.run
./cuda_11.1.1_455.32.00_linux.run --override


cat << EOF >> /root/.bashrc
if [ -z "${LD_LIBRARY_PATH}" ]; then
      LD_LIBRARY_PATH=/usr/local/cuda-11.1/lib64
    else
        LD_LIBRARY_PATH=/usr/local/cuda-11.1/lib64:$LD_LIBRARY_PATH
     fi
     export PATH LD_LIBRARY_PATH
EOF
  
  
  
source /root/.bashrc 

 echo $PATH
 echo $LD_LIBRARY_PATH

  cd /root/NVIDIA_CUDA-11.1_Samples/1_Utilities/deviceQuery
  make -j24
  ./deviceQuery 

```
```
cd /opt
yum install p7zip p7zip-plugins -y

git clone https://github.com/c4pt000/linode-GPU-bitcoin-wallet.dat-passphrase_decrypt-hashcat
cd linode-GPU-bitcoin-wallet.dat-passphrase_decrypt-hashcat
7z x hashcat-6.2.0-rc2.7z 
cd hashcat-6.1.1/
wget https://github.com/praetorian-inc/Hob0Rules/raw/master/wordlists/rockyou.txt.gz
gunzip rockyou.txt.gz
cp -rf ../hashcat.sh .
cp -rf ../OneRuleToRuleThemAll.rule .
cp -rf ../bitcoin2john.py .
````
requires hash.txt in same dir
sh hashcat.sh






crack dogecoin master-key passphrase, or bitcoin master-key passphrase simple hashcat gpu accelerated example requires wallet.dat to make hash.txt in same dir
------
```
cd /opt

python bitcoin2john.py wallet.dat > hash.txt

wordset classic kali -> rockyou.txt
./hashcat.bin --stdout rockyou.txt -r OneRuleToRuleThemAll.rule | ./hashcat.bin -m 11300 hash.txt

RANDOM A-z0-0 
minimum 10 characters up to 24 characters random A-z0-9
-------------------------------------------------------------
./hashcat.bin -a3 -1?l?u?d ?1?1?1?1?1?1?1?1?1?1?1?1?1?1?1?1?1?1?1?1?1?1?1?1 --increment --increment-min 10 | ./hashcat.bin -m 11300 hash.txt
```




# instead of decrypting "encrypted" passphrase from wallet.dat through master key
extract unencrypted private key for wallet funds (from unencrypted wallet.dat with no passphrase)

# RUN WITH CAUTION VISIBLE PRIVATE KEYS WITH NO ENCRYPTION EXPOSE THE WALLET TO EXPORT INTO ANOTHER WALLET by
from bitcoin-qt or dogecoin-qt (non-prune mode) debug>console
importprivkey "private_key_here"


where /root/.bitcoin is the location of "wallet.dat" if wallet.dat exists in /opt/wallet/wallet.dat change accordingly cp -rf wallet.dat to /opt/wallet
```
docker run -it -d -v /opt/wallet:/root/.bitcoin c4pt/dump_private_key-dogecoinbitcoin
docker exec -it <docker_vm_hash> bash
cd /opt/bitcointools/
sh dump_private_key.sh 
```

