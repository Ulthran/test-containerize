FROM condaforge/mambaforge:latest
LABEL io.github.snakemake.containerized="true"
LABEL io.github.snakemake.conda_env_hash="46d8746bb0f311f91f0cbf578cabc00e5bfcc0725f06cafbd74d2728d6e1de60"

# Step 1: Retrieve conda environments

# Conda environment:
#   source: workflow/envs/TEST.yml
#   prefix: /conda-envs/0a1d598ba4e0591f0e000503cb42adf7
#   channels:
#     - conda-forge
#   depencies:
#     - python=3.10
RUN mkdir -p /conda-envs/0a1d598ba4e0591f0e000503cb42adf7
COPY workflow/envs/TEST.yml /conda-envs/0a1d598ba4e0591f0e000503cb42adf7/environment.yaml

# Step 2: Generate conda environments

RUN mamba env create --prefix /conda-envs/0a1d598ba4e0591f0e000503cb42adf7 --file /conda-envs/0a1d598ba4e0591f0e000503cb42adf7/environment.yaml && \
    mamba clean --all -y
