# Anchorage-test
This is the test repo for [anchorage](https://github.com/Shao-Group/anchorage) assembly method. All evaluations were performed on an intel iMac (2019 model).

# Packages and Experiments
Our experiments involve those tools. 

| Tool      | Version | Description                                   | Reference                                                    |
| --------- | ------- | --------------------------------------------- | ------------------------------------------------------------ |
| Anchorage |         | Assembly tool                                 | [[github]](https://github.com/Shao-Group/anchorage)          |
| SPAdes    | v3.15.5 | Assembly tool                                 | [[github]](https://github.com/ablab/spades) [[publication]](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3342519/) |
| MEGAHIT   | v1.2.9  | Assembly tool                                 | [[github]](https://github.com/voutcn/megahit) [[publication]](https://academic.oup.com/bioinformatics/article/31/10/1674/177884) |
| Polyester | 1.38.0  | Read simulator                                | [[github]](https://github.com/alyssafrazee/polyester) [[publication]](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4635655/) |
| QUAST     | v5.2.0  | Quality Assessment Tool for Genome Assemblies | [[github]](https://github.com/ablab/quast) [[publication]](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3624806/) |

Also, we used `seaborn` and `pandas` python packages to plot figures.

Most tools can be installed and managed using conda. We manually compiled and installed MEGAHIT as described [here](./programs/compiling_megahit_on_macOS.md). Users should make all related tools can be called directly from `$PATH`.  Also, anchorage should be installed in the `programs` directory and its dependencies should be properly installed.

```sh
cd programs
git clone https://github.com/Shao-Group/anchorage.git
# install anchorage dependencies
conda env create -f programs/anchorage/src/python/environment.yml
conda activate anchorage
```

After all related tools are installed. Run `sh scripts/main.sh` to reproduce results.

# License
This repo is under BSD 3-Clause License. Some of the scripts is based on code from [LoopCore](https://github.com/Elembio/loop-core) repo which is also under BSD 3-Clause License ([LoopCore license](https://github.com/Elembio/loop-core/blob/main/LICENSE)).