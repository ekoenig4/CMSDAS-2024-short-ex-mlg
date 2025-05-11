#!/bin/bash

#SBATCH --job-name=jupyter
#SBATCH --output=jupyter.log
#SBATCH --qos=avery
#SBATCH --account=avery
#SBATCH --time=10:00:00
#SBATCH --partition=hpg-dev
#SBATCH --cpus-per-task=4
#SBATCH --mem=16GB

#!/bin/bash

source /home/$USER/.bashrc
ml conda

ENVNAME=cmsdas

echo "Activating conda environment: $ENVNAME"
mamba activate $ENVNAME

unset XDG_RUNTIME_DIR

port=$(shuf -i 20000-30000 -n 1)

echo -e "\nStarting Jupyter Notebook on port ${port} on the $(hostname) server."
echo -e "\nSSH tunnel command:"
echo -e "   ssh -NL ${port}:$(hostname):${port} ${USER}@hpg.rc.ufl.edu"
echo -e "\nSSH from HPG"
echo -e "   ssh -NL ${port}:localhost:${port} $(hostname)"
echo -e "\nLocal browser URI:"
echo -e "   http://localhost:${port}"
host=$(hostname)
jupyter-notebook --no-browser --port=${port} --ip="$host" --NotebookApp.allow_origin='*'