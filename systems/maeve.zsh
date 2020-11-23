# add local bin to path
export path=(${HOME}/.local/bin $path)

# setup GMT
export GMT=/data/nil-bluearc/GMT

# freesurfer / fsl
export FREESURFER_HOME=/opt/freesurfer
export SUBJECTS_DIR=${GMT}/${USER}/subjects_dir
export FSLDIR=/opt/fsl
source ${FSLDIR}/etc/fslconf/fsl.sh
source ${FREESURFER_HOME}/SetUpFreeSurfer.sh > /dev/null

# ants
export ITK_GLOBAL_DEFAULT_NUMBER_OF_THREADS=8
export ANTSPATH=/opt/ants/install/bin
export path=($path $ANTSPATH)

# 4dfp tools
export NILSRC=/opt/4dfp_tools/NILSRC
export RELEASE=/opt/4dfp_tools/RELEASE
export REFDIR=${GMT}/refdir
export path=($path $RELEASE)

# c3d
export path=($path /opt/c3d/c3d-1.0.0-Linux-x86_64/bin)

# gcc8 tools
# source /opt/rh/devtoolset-8/enable 
    
# afni
export path=($path /usr/local/pkg/afni)

# add workbench
export path=($path /opt/workbench/exe_rh_linux64)

# add msm
export MSMBINDIR=/opt/msm/Centos
export path=($path /opt/msm/Centos)

# add dcmtk
export path=($path /opt/dcmtk/bin)

# set number of openmp threads to use
export OMP_NUM_THREADS=16

