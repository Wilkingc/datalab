FROM ubuntu:24.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
        bsdmainutils \
        curl \
        file \
        python3-pip \
        tree \
        vim

RUN pip3 install --break-system-packages \
        pandas \
        jupyterlab \
        pyarrow \
        bash_kernel \
    && pip cache purge

RUN python3 -m bash_kernel.install

EXPOSE 8888

WORKDIR /workspace

#USER nonroot #create non root user if needed.

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--NotebookApp.token=''"]
