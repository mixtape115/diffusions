FROM nvidia/cuda:11.7.1-cudnn8-runtime-ubuntu20.04

RUN apt-get update
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get install -yq --no-install-recommends python3-pip \
        python3-dev \
        wget \
        git  \
        tzdata && apt-get upgrade -y && apt-get clean

RUN ln -s /usr/bin/python3 /usr/bin/python

# RUN python -m pip install --upgrade pip setuptools

# RUN python -m pip install numpy pillow
COPY requirements.txt .
RUN pip install -U pip && \
    pip install --no-cache-dir -r requirements.txt
# RUN python3 -m pip install opencv-python
# RUN pip3 install -U pip wheel setuptools japanize-matplotlib
# RUN pip3 install jupyter click numpy matplotlib seaborn pandas tqdm timm
# RUN pip install torch==1.10.1+cu111 torchvision==0.11.2+cu111 torchaudio==0.10.1 -f https://download.pytorch.org/whl/torch_stable.html
# RUN pip3 install torch==1.12.1+cu116 torchvision==0.13.1+cu116 torchaudio==0.12.1 --extra-index-url https://download.pytorch.org/whl/cu116
# RUN pip3 install visdom jupyter torchviz torchinfo japanize_matplotlib
# RUN pip3 install --upgrade diffusers[torch] transformers
# ENV USER_NAME=user
# ENV USER_UID=1000
# ARG wkdir=/home/${USER_NAME}

# RUN echo "root:root" | chpasswd \
#     && useradd -m -u ${USER_UID} --groups sudo,video ${USER_NAME} \
#     && echo "${USER_NAME}:${USER_NAME}" | chpasswd \
#     && echo "%${USER_NAME}    ALL=(ALL)    NOPASSWD:    ALL" >> /etc/sudoers.d/${USER_NAME} \
#     && chmod 0440 /etc/sudoers.d/${USER_NAME}

# USER ${USER_NAME}
# WORKDIR ${wkdir}

RUN git clone https://github.com/huggingface/diffusers.git

COPY ./src/lora.sh ./diffusers/examples/dreambooth/.

# RUN sudo chown -hR ${USER_NAME}:${USER_NAME} ${wkdir}
