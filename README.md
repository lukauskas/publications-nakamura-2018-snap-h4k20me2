# H4K20me0 recognition by BRCA1-BARD1 directs homologous recombination in sister chromatids

This repository contains the code to process the data from H4K20me2 SILAC Nucleosome Affinity Purifications as described in the manuscript "H4K20me0 recognition by BRCA1-BARD1 directs homologous recombination in sister chromatids".

The data has been deposited to PRIDE Archive with the identifier [`PXD009281`](https://www.ebi.ac.uk/pride/archive/projects/PXD009281).

In order to reproduce the results,
set up a [Docker](https://www.docker.com/) service on computer running unix ([see this page for information on how to do this on OSX](https://docs.docker.com/docker-for-mac/install/)). 

Then execute the `./run.sh` script.
This script will download [`lukauskas/publications-nakamura-2018-snap-h4k20me2`](https://hub.docker.com/r/lukauskas/publications-nakamura-2018-snap-h4k20me2/) image from the Docker Hub and run it.
In turn this will set up all the necessary dependancies and will start a [Jupyter](https://jupyter.org/) environment on `https://localhost:8888`. The access token for this environment will be printed to the standard output and will have to be input in the browser.

If the image is no longer available on Docker Hub, you can contact the corresponding author [Till Bartke](https://www.helmholtz-muenchen.de/ife/about-us/people/staff-detail/ma/5831/Dr-Bartke/index.html) for a copy.
Alternatively, the image could be built using the provided Dockerfile, for which the appropriate line will have to be uncommented in the `run.sh` script.

Once in the Jupyter environment, the code can be run step by step by following the notebook.
The `run.sh` script mounts the `output` directory to the docker container, which will allow the files in that directory to be overwritten by subsequent script runs.

It is possible to run this notebook without Docker as well, however the user will have to make sure that:

1. Unix-like system is used
2. `libhdf5` is installed with development headers
3. There exists a functioning R environment, which has `ggplot2`, `ggrepel`, `devtools` installed as well as a forked version of `ggExtra` is installed: `install_github("lukauskas/ggExtra@1pt_margins")`
4. There exists a functioning Python environment (>=3.6), with `click`, `cython`, `jupyter`, `matplotlib`, `mygene`, `numpy`, `networkx`, `pandas`, `PyYAML`, `requests`, `rpy2`, `scikits.bootstrap`, `scikit-learn`, `scipy`, `seaborn`, `statsmodels`, `tables`, `tqdm`, `xlrd`, `xlsxwriter` installed.
5. Jupyter is running on this Python environment.

Some file paths will have to be updated when the code is run this way.
