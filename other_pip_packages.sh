#!

pip config set global.index-url https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple # If you are in Mainland.

pip install openai-clip trimesh

pip install torch==2.0.1+cu118 torchvision==0.15.2+cu118 --index-url https://download.pytorch.org/whl/cu118

cd ./Grounded-Segment-Anything && \
    python3 -m pip install --no-cache-dir -e segment_anything && cd ..
        
cd ./Grounded-Segment-Anything && \
    pip install setuptools==58.2.0 && \
    python3 -m pip install --no-cache-dir wheel && \
    python3 -m pip install --no-cache-dir --no-build-isolation -e GroundingDINO && cd ..

cd ./recognize-anything && \
    pip3 install --upgrade setuptools &&\ pip install -e . && cd ..

pip install setuptools==58.2.0 

echo 'export GSA_PATH="/home/lujia/peter_workspace/m2g_vln_env/Grounded-Segment-Anything"' >> ~/.bashrc

cd habitat-sim && \
    python setup.py install --headless --with-cuda && cd ..

cd habitat-lab && \
    pip3 install -e . && cd .. 
