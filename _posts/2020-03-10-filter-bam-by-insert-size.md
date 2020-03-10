---
layout: single
title: Filter BAM/SAM files by insert size
category: bioinformatics
tags: RNAseq
---

In this blog post, we will talk about what is the insert size in Illumina sequencing reads, and how to find it in SAM/BAM files.

## Background

In an Illumina sequencing run, either single-end sequencing (SE) or paired-end sequencing (PE) can be used. In any case, DNA is chopped into small fragments, ligated with adapters at both ends, and sequenced either from one end (SE) or from both ends (PE). For PE reads, *insert size* refers to the fragment size (excluding the adapters). The name *insert*, as pointed out by the great blog post [Paired-end read confusion - library, fragment or insert size?](http://thegenomefactory.blogspot.com/2013/08/paired-end-read-confusion-library.html), comes from the cloning era. It refers to the piece of DNA **inserted** between the adapters.

Therefore, the *insert size* includes forward and reverse read as well as the unknown gap between them. The unknown gap can be called the *inner mate distance*.

It can be visually represented in the following way (discovered from [biostars.org][1]):

![fragment](http://www.frontiersin.org/files/Articles/77572/fgene-05-00005-HTML/image_m/fgene-05-00005-g001.jpg)

## How to find out insert size from a BAM/SAM file or filter the file by it?

The ninth column of a [SAM file](https://samtools.github.io/hts-specs/SAMv1.pdf), observed Template LENgth (`TLEN`), can be used as an approximate of the fragment length. It is approximate because as documented in the SAM file specification, the exact definition of mapping starts and ends are specific to implementations.

### Example 1: list insert sizes, one line per read

Say we want to plot the distribution of insert sizes in a BAM file, considering only the first pair of the properly mapped pair (flag `-f66`, see [Decoding SAM flags](https://broadinstitute.github.io/picard/explain-flags.html))

```bash
samtools view -f66 file.bam | cut -f 9
```

### Example 2: filter by insert sizes

Say we want to only keep reads of insert sizes under 500. `-f2` indicates that reads are kept only if they are mapped in proper pair.

```bash
samtools view -f2 file.bam | awk '{abs($9)<=500}'
```

## Conclusion

Insert size refers to the fragment length consisting of forward and reverse reads and the un-sequenced gap between the paired reads. It is possible to use `samtools` and command-line tools such as `awk` and `cut` to collect insert sizes or to filter BAM/SAM files.

[1]: https://www.biostars.org/p/106291/
