# CondaEnvs KAUST
Set of conda environments for KAUST linux machines and clusters at KAUST.

First of all install Miniconda following instructions at: `https://github.com/kaust-rccl/ibex-miniconda-install` 

For each environment, an `environment_$ENVNAME.yml` file is provided alongside with a
shell installation script  `install_$ENVNAME.sh`. 

Simply run:
```
./install_$ENVNAME.sh $PATH_TO_DEV_LIB
```
where `$PATH_TO_DEV_LIB` contains the path of the library to install in developer mode 
(if empty, the library will be installed in user mode using pip or conda installers).


## Environments

- Scientific: CPU installation of basic scientific stack (customize this to your needs)
- Azure_CLI: CPU installation of azure-cli (to be able to programmatically download Volve data)
- MPI4PY: CPU installation of basic scientific stack with MPI4Py
- PyLops: CPU installation of PyLops and its dependencies
- PyLops_36: CPU installation of PyLops and its dependencies
- PyLops_37: CPU installation of PyLops and its dependencies
- PyLops_cupy: GPU-enabled installation of PyLops with Cupy (cuda11.1.0)
- PyLops_cupy_cusignal: GPU-enabled installation of PyLops with Cupy + CuSignal (cuda10.2.89)
- PyLops_cupy_cusignal_3090: GPU-enabled installation of PyLops with Cupy + CuSignal (cuda11.0 to be used with GeForce RTX 3090)
- PyLops_cupy_mpi4py_3090: GPU-enabled installation of PyLops with Cupy + PyLops (cuda11.8 to be used with GeForce RTX 3090)
- PyLops_gpu: GPU-enabled installation of PyLops-gpu with PyTorch + Cupy (cuda10.2.89)
- PyLops_gpu_3090: GPU-enabled installation of PyLops-gpu with PyTorch + Cupy (cuda11.0 to be used with GeForce RTX 3090)
- PyLops_diffusers_3090: GPU-enabled installation of PyLops-gpu with PyTorch + Cupy + Diffusers (cuda11.8 to be used with GeForce RTX 3090)

- PyLops_dist: CPU installation of PyLops-distributed and its dependencies
- Devito: CPU installation of Devito
- EGS: Stanford GPU-enabled FD propagators and PDE-constrained inversion

## Adds on:

- Jupyter Extensions: install Jupyter extensions (e.g., TOC)
- Curvelops: install FFWT, Curvelab and Curvelops (works only with PyLops_36 and PyLops_37)
