# requires CUDA toolkit for nvidia (fedora 34)
```
yum install nano wget git -y





wget https://github.com/c4pt000/kernel-5.11.6-expSEHDsec-cgroup-virtio/releases/download/5.11.6-expSEHDsec/kernel-5.11.6_expSEHDsec-cgroupvirtio.x86_64.rpm
wget https://github.com/c4pt000/kernel-5.11.6-expSEHDsec-cgroup-virtio/releases/download/5.11.6-expSEHDsec/kernel-devel_5.11.6_expSEHDsec-cgroupvirtio.x86_64.rpm
wget https://github.com/c4pt000/kernel-5.11.6-expSEHDsec-cgroup-virtio/releases/download/5.11.6-expSEHDsec/kernel-headers-5.11.6_expSEHDsec-cgroupvirtio.x86_64.rpm

rm -rf /boot/initramfs*
rm -rf /boot/vmlinuz*

        change -> GRUB_ENABLE_BLSCFG=true to GRUB_ENABLE_BLSCFG=false in /etc/default/grub

rpm -Uvh --force --nodeps kernel-5.11.6_expSEHDsec-cgroupvirtio.x86_64.rpm
rpm -Uvh --force --nodeps kernel-headers-5.11.6_expSEHDsec-cgroupvirtio.x86_64.rpm
rpm -UVh --force --nodeps kernel-devel-5.11.6_expSEHDsec-cgroupvirtio.x86_64.rpm


grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg
grub2-mkconfig -o /boot/grub2/grub.cfg

yum groupinstall "C Development Tools and Libraries" -y
wget https://download.nvidia.com/XFree86/Linux-x86_64/460.56/NVIDIA-Linux-x86_64-460.56.run
bash NVIDIA-Linux-x86_64-460.56.run

wget https://developer.download.nvidia.com/compute/cuda/11.1.1/local_installers/cuda_11.1.1_455.32.00_linux.run
chmod +x cuda_11.1.1_455.32.00_linux.run
./cuda_11.1.1_455.32.00_linux.run --override


cat << EOF > /etc/profile.d/cuda.sh
if [ -z "${LD_LIBRARY_PATH}" ]; then
      LD_LIBRARY_PATH=/usr/local/cuda-11.1/lib64
    else
        LD_LIBRARY_PATH=/usr/local/cuda-11.1/lib64:$LD_LIBRARY_PATH
     fi
     export PATH LD_LIBRARY_PATH
     EOF
  
  
  
source /etc/profile.d/cuda.sh 

 echo $PATH
 echo $LD_LIBRARY_PATH

  cd /root/NVIDIA_CUDA-11.1_Samples/1_Utilities/deviceQuery
  make -j24
  ./deviceQuery 


yum install p7zip p7zip-plugins -y
```

```
python bitcoin2john.py wallet.dat > hash.txt
hashcat --stdout wordlist0.txt -r OneRuleToRuleThemAll.rule | hashcat -m 11300 hash.txt
```


