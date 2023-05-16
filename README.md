# Building CP/M 3 on Unix

The contents of this repository are based on the work of John Elliott as summarized [here](https://www.seasip.info/Cpm/building.html). A few things needed to be tweaked, and the build process now works fine on my system. 

The CP/M system components and transient commands are all built using original Digital Research asm and plm source files. Several patches that were published by DR have been applied. Please see the README file in the cpm3 directory for additional detail.
 
 
## Prerequisites

You will need to download and build the following two packages:

* ZXCC, found [here](http://www.seasip.info/Unix/Zxcc/zxcc-0.5.7.tar.gz)
* Thames, found [here](http://www.seasip.info/Unix/Thames/thames-0.1.1.tar.gz)

ZXCC is a neat utility that can run native CP/M commands on the Unix platform. Thames is an Intel ISIS-II emulator. This environment was used by Digital Research at the time CP/M was developed, specifically to build the original PLM source files using tools such as PLM80 and ASM80. I was able to build both of these packages without issue on my system.

Copy the resulting zxcc and thames binaries to a directory somewhere in your path. Additionally, you will need to copy the bios.bin file in the Z80 directory of the zxcc source tree to the cpm3 directory of this repository.

Last, edit the cpm3/runthames script and change the four paths to match your home directory/environment.

 
## Build

Building is simply a matter of changing to the cpm3 directory and running 'make'.


### Notes

* You may see a 'corrupt FCB' error assicated with two of the files during the build process (save.com and help.hlp). Per the original README file, this is caused by the GENCOM utility attempting to close a file that it didn't actually open, and is normal (I've confirmed that both files are fine).
* The build process has been tested on Ubuntu 20.04.


