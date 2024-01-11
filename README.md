# test-containerize

Steps taken to build this workflow:

```
snakemake --snakefile workflow/Snakefile --conda-prefix .snakemake/ --conda-frontend conda --containerize all > Dockerfile
docker build -f Dockerfile -t 0.0.0 .
docker tag 67e550fc030f ctbushman/test-containerize:0.0.0
docker push ctbushman/test-containerize:0.0.0
```

From here, running this fails:

```
snakemake --snakefile workflow/Snakefile --software-deployment-method apptainer --conda-prefix .snakemake/ --conda-frontend conda --cores 8 all
```