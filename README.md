# virtualenv modified by S.Adachi
update: 2022/06/05

This repository is forked from ykyohei/virturalenv.
The master branch is the original one.
The mysoenv is branch to generate the my so env.

# Scripts
- (Main script) ``gen\_mysoenv.sh``: to generate my special so env
  - ``envdir``: a directory for the generated virtual env (default: 11/data/adachi/software/virtualenv``)
  - ``envprefix``: prefix of the directory name of each virtual env
  - env name: ``<envprefix>\_<generate-date>``
- ``gen\_soenv.sh``: the original script to generate the so env for public (located in 11/software/`` in cmb-ws2)
- requirements.txt: python libraries to be installed in gen\_mysoenv.sh and gen\_soenv.sh

# How to run script
- ``$ source gen_mysoenv.sh 2>&1 | tee <YYmmdd>.log ``

# Prerequisite
apt install python3.8 gfortran build-essential gcc g++ make libtool texinfo dpkg-dev pkg-config libfftw3-dev libfftw3-3 libgsl-dev libcfitsio-dev git wget autoconf automake libtool autoconf-doc libtool-doc mpich
pip install virtualenv

# Logs
### 2022/06/05
- pymaster could not installed in requirement.txt. So it was installed after installing requirements.txt.
- There was 'Failed to install pysqlite3'. But, it seems to be installed right after that console out.
- In the virtualenv, there is no need to add '--user' option to install any package. (It will not work.) 
