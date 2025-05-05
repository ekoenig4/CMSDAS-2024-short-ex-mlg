# Machine learning tutorial at CMSDAS at CERN, June 2024

Evan Armstrong Koenig, Matthias Komm, Pietro Vischia

The core of this tutorial comes from https://github.com/vischia/data_science_school_igfae2024 (Pietro Vischia (pietro.vischia@cern.ch)).

The CMSDAS version extends it to consider a convolutional network to regress Higgs quantities, plus some fixes.

## Introductory slides

They are embedded into this repository. You can download them by clicking on [this link](./Machine\ Learning\ Short\ Exercise\ at\ CMSDAS\ 2024.pdf)

## Alternative data path

In case CERN EOS doesn't work, add to your first notebook this line:
<verbatim>
#!cd data/; wget https://www.hep.uniovi.es/vischia/cmsdas2024/ft_tth_multilep_igfae2024.tar.gz; tar xzvf ft_tth_multilep_igfae2024.tar.gz; mv igfae2024/* .; rmdir igfae2024; rm ft_tth_multilep_igfae2024.tar.gz; cd -;
</verbatim>

## Tutorial organization

The tutorial is structured in five parts.

- 1: data inspection, BDTs
- 2: binary classification
- 3: multiclass classification (builds on 2)
- 4: regression using a dense neural network (a bit more tricky)
- 5: regression using a convolutional neural network (a bit mode advanced)

We suggest you to go through exercise 1 and then, depending on your perceived level, choose one among the others. If you are up for it, you could run 2+3 and compare the results or 4+5 and compare the results.


## How to run

We have reserved (thanks Matthias!) a slot of GPUs on CERN SWAN. Ideally you would be running the tutorial there (see next item). If, for any reason, it does not work for you then you can look into the other sections of this readme for instructions on how to run locally or on google colab.

## Open tutorial in CERN SWAN (recommended)

[![Open in SWAN](https://swanserver.web.cern.ch/swanserver/images/badge_swan_white_150.png)](https://cern.ch/swanserver/cgi-bin/go?projurl=https://gitlab.cern.ch/cmsdas-cern-2024/short-ex-mlg.git)


## How to run the tutorial on your local machine

#### 1. Check out the code
```
git clone https://github.com/ekoenig4/CMSDAS-2024-short-ex-mlg.git
cd CMSDAS-2024-short-ex-mlg/
```
or
```
git clone https://github.com/ekoenig4/CMSDAS-2024-short-ex-mlg.git
cd CMSDAS-2024-short-ex-mlg/
```

#### 2. Create a python environment and install requirements (follow one of the options 2.1, 2.2, or 2.3)

##### 2.1 Using virtualenv

```
virtualenv -p python3.9 cmsdas_mlg_tutorial
source cmsdas_mlg_tutorial/bin/activate
pip install -r requirements.txt # or requirements_macos.txt on MacOS Monterey
```

A participant of a previous school (Geoffrey Mullier) reports that on MacOS 12.5 `virtualenv` doesn't work, and that in that case `python3 -m venv venv_tutorial` works as intended.

To deactivate the environment, you should run `deactivate` from the command prompt.

##### 2.2 Using conda

```
conda create --name cmsdas_mlg_tutorial python==3.9.13
conda activate cmsdas_mlg_tutorial
pip install -r requirements.txt # or requirements_macos.txt on MacOS Monterey
```

To deactivate the environment, you should run `conda deactivate` from the command prompt.


##### 2.3 Using Google Colab (google account needed)

Go to [Google Colab](https://colab.research.google.com/), select `GitHub` as a source, and fill in the path to this repository (`https://github.com/ekoenig4/CMSDAS-2024-short-ex-mlg`). Possibly Google will ask for access to your GitHub account, although installing from a public third party repository should not require that, in principle.

When the colab instance is active, open the jupyter notebook `train_hyp.ipynb` and run the cell labelled "*If you are using COLAB*"


#### 3. Run the tutorial

For local environments, run

```
jupyter notebook
```

and open one of the notebooks in the browser window that is opened.

From Colab, open one of the notebooks.

If you prefer to run a regular python script, you can convert the notebook using the command:

```
jupyter nbconvert --to script name_of_the_notebook.ipynb
```

This will create a file `name_of_the_notebook.py` that you can pass as a command line argument to the python interpreter.
You may have to add a few `plt.show()` or `plt.savefig()` to the code here and there, to visualize/save outputs, though.
