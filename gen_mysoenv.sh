#!/bin/bash
envdir='/data/adachi/software/virtualenv/'
py=python3.8
envprefix='mysoenv'
envname=${envprefix}_$(date +"%Y%m%d")

echo $py, $envname

# generate a new virtualenv
virtualenv -p $py $envdir/$envname
source $envdir/$envname/bin/activate

# install python packages
$envdir/$envname/bin/pip3 install -r requirements.txt
$envdir/$envname/bin/$py -m pip install pymaster
$envdir/$envname/bin/$py -m ipykernel install --prefix=$envdir/$envname/ --name=$envname --display-name=$envname
$envdir/$envname/bin/jupyter nbextension enable --py widgetsnbextension --sys-prefix

# clone sotodlib in $envdir/$envname/build/
cd $envdir/$envname
mkdir build
cd build
mkdir $envname"_sotodlib"
cd $envname"_sotodlib"
git clone git@github.com:simonsobs/sotodlib.git
# install sotodlib
cd sotodlib
$envdir/$envname/bin/pip3 install .
$envdir/$envname/bin/$py setup.py test

# make a symbolic link for the latest mysoenv
unlink $envdir/${envprefix}_latest
ln -s $envdir/$envname $envdir/${envprefix}_latest

## my setup ##
# install vim_binding extension for jupyter notebook
$envdir/$envname/bin/pip3 install jupyter_contrib_nbextensions
$envdir/$envname/bin/jupyter contrib nbextension install --user
echo "jupyter nbextensions PATH = $(jupyter --data-dir)/nbextensions"
mkdir -p $(jupyter --data-dir)/nbextensions
cd $(jupyter --data-dir)/nbextensions
git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding
$envdir/$envname/bin/jupyter nbextension enable vim_binding/vim_binding
