__conda_url=https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
__conda_path="${HOME}/miniconda3"
__old_path=$PATH
PATH=$PATH:${__conda_path}/bin

tmpdir=$(mktemp -d)
echo "Downloading miniconda..."
wget -nv ${__conda_url} -O ${tmpdir}/miniconda.sh
echo "Installing miniconda..."
bash ${tmpdir}/miniconda.sh -b -p ${__conda_path}
rm ${tmpdir}/miniconda.sh

conda install --yes --quiet -n base -c conda-forge mamba
mamba install --yes --quiet -n base -c bioconda snakemake