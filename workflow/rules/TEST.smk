rule all_TEST:
    input: "test.txt"
    output: "output.txt"
    conda: "../envs/TEST.yml"
    shell: "cutadapt -h"