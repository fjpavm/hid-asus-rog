This module is intended for ASUS ROG type laptops with the N-Key device to enable all FN+Key combos.

Add to dkms manually with:
1. `sudo dkms add .`
2. `sudo dkms build hid-asus-rog/1.0.3`
2. `sudo dkms install hid-asus-rog/1.0.3`
 
Cloned from https://gitlab.com/asus-linux/hid-asus-rog to update for kernels >= 6.3. Version now 1.0.3   
Tested on ASUS ROG Zephyrus G14 GA401QM - Linux Mint 21.3 with kernel 6.8 installed  
Tested on ASUS ROG Zephyrus G14 GA401QM - Linux Mint 21.3 with kernel 6.11 installed  
Tested on ASUS ROG Zephyrus G14 GA401QM - Linux Mint 21.3 with kernel 6.14 installed  
