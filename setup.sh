#!/bin/bash 

ml conda 

ENVNAME=cmsdas 

mamba create -n $ENVNAME -y python=3.10 pip

mamba activate $ENVNAME

pip install -r requirements.txt