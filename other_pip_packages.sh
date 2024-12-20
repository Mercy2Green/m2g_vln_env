# #!


conda create -n vln_310 anaconda python=3.10 cmake=3.14.0
conda activate vln_310

# conda env update vln_sim2real -f vln_sim2real.yml

pip config set global.index-url https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple # If you are in Mainland.

##### Install Pytorch according to your own setup #####
# For example, if you have a GPU with CUDA 11.8 (We tested it Pytorch 2.0.1)
conda install pytorch==2.0.1 torchvision==0.15.2 torchaudio==2.0.2 pytorch-cuda=11.8 -c pytorch -c nvidia
conda install -c conda-forge cudatoolkit-dev

# Install the required libraries
pip install tyro open_clip_torch wandb h5py openai hydra-core distinctipy

# for yolo
pip install ultralytics

# Install the Faiss library (CPU version should be fine)
conda install -c pytorch faiss-cpu=1.7.4 mkl=2021 blas=1.0=mkl

# Install Pytorch3D (https://github.com/facebookresearch/pytorch3d/blob/main/INSTALL.md)
# conda install pytorch3d -c pytorch3d # This detects a conflict. You can use the command below, maybe with a different version
conda install https://anaconda.org/pytorch3d/pytorch3d/0.7.4/download/linux-64/pytorch3d-0.7.4-py310_cu118_pyt201.tar.bz2


pip install openai-clip trimesh

# git clone https://github.com/Mercy2Green/Chamferdist_c17.git
cd Chamferdist_c17
pip install .
cd ..

# git clone https://github.com/gradslam/gradslam.git
cd gradslam
git checkout conceptfusion
pip install .
cd ..

export AM_I_DOCKER=False
export BUILD_WITH_CUDA=True
export CUDA_HOME=/usr/local/cuda-11.8

cd ./Grounded-Segment-Anything && \
    python3 -m pip install --no-cache-dir -e segment_anything && cd ..
        
cd ./Grounded-Segment-Anything && \
    pip install setuptools==58.2.0 && \
    python3 -m pip install --no-cache-dir wheel && \
    python3 -m pip install --no-cache-dir --no-build-isolation -e GroundingDINO && \
    cd grounded-sam-osx && bash install.sh && cd .. && cd ..

pip install --upgrade diffusers[torch]

cd ./recognize-anything && \
    pip3 install --upgrade setuptools && \ 
    pip install -e . && cd ..

#60.2.0
pip3 install setuptools==58.2.0 

echo 'export GSA_PATH="/home/lujia/peter_workspace/m2g_vln_env/Grounded-Segment-Anything"' >> ~/.bashrc

cd habitat-sim && \
    python setup.py install --headless --with-cuda && cd ..

cd habitat-lab && \
    pip3 install -e . && cd .. 

pip install tensorflow webdataset ifcfg dtw fastdtw jsonlines msgpack_numpy 