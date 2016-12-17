FROM continuumio/anaconda3

RUN pip install pillow
RUN /opt/conda/bin/conda install -c https://conda.anaconda.org/menpo opencv3
RUN /opt/conda/bin/conda install jupyter -y --quiet
RUN mkdir /opt/notebooks

RUN pip install moviepy

ENTRYPOINT [ "/usr/bin/tini", "--" ]
CMD ["/opt/conda/bin/jupyter", "notebook", "--notebook-dir=/opt/notebooks", "--ip='*'", "--port=8888", "--no-browser"]
