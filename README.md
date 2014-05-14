## Android Patches Script

#### This script will automate the process of applying the needed patches before building a ROM.


***Patches preparation***:
- Every patch should have as name the path of the folder where it should be applied, ending with **.patch**
- On the patch name, the folders which form part of the patch destination are delimited with an underscore.
- If a destination folder has an underscore in the name, then the patch should be named with an @ (at-sign) instead.


***How to use***:

1. Create a folder for your device.
2. Put patches inside the folder.
3. Run `./ patch.sh`
4. Select your device from the list.
5. Relax, the script will do the rest for you.

### Feel free to push your patches.
