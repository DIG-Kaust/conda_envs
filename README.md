# CondaEnvs KAUST
Set of conda environments for KAUST linux machines and clusters at KAUST.

For each environment, an `environment_$ENVNAME.yml` file is provided alonside with a
shell installation script  `install_$ENVNAME.sh`. 

Simply run:
```
./install_$ENVNAME.sh $PATH_TO_DEV_LIB
```
where `$PATH_TO_DEV_LIB` contains the path of the library to install in developer mode 
(if empty, no library will be installed in developer model).

## Environments

- PyLops: CPU installation of PyLops and its dependencies
- PyLops_cupy: GPU-enabled installation of PyLops with Cupy (cuda11.1.0)
- PyLops_cupy_cusignal: GPU-enabled installation of PyLops with Cupy + CuSignal (cuda10.2.89)
- PyLops_cupy: GPU-enabled installation of PyLops-gpu with PyTorch + Cupy (cuda10.2.89)
