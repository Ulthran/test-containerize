FROM condaforge/mambaforge:latest
LABEL io.github.snakemake.containerized="true"
LABEL io.github.snakemake.conda_env_hash="b4f844ec3b19f750c12992b7a8e06f6417511430bb4bf574ab0ba540a3aae18d"

# Step 1: Retrieve conda environments

# Conda environment:
#   source: workflow/envs/TEST.yml
#   prefix: /conda-envs/3bfe5f4206a8fd147048f31866b332bd
#   channels:
#     - conda-forge
#     - bioconda
#   depencies:
#     - cutadapt
RUN mkdir -p /conda-envs/3bfe5f4206a8fd147048f31866b332bd
COPY workflow/envs/TEST.yml /conda-envs/3bfe5f4206a8fd147048f31866b332bd/environment.yaml

# Step 2: Generate conda environments

RUN mamba env create --prefix /conda-envs/3bfe5f4206a8fd147048f31866b332bd --file /conda-envs/3bfe5f4206a8fd147048f31866b332bd/environment.yaml && \
    mamba clean --all -y
