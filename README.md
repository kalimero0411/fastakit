# fastakit
A bash script for FASTA sequence formatting and modification.

```
fastakit [OPTIONS] [Sequence.fasta | stdin]
	-o | --out	Output to file (otherwise to stdout)
	-i | --in-place	Modify file in-place
	-c | --complement	Complementary sequence
	-m | --reverse_seq	Reverse sequence
	--unique	Remove duplicate sequences
	--multi #	Convert to multi-line FASTA (nucleotide only)
	--random	Create random sequences of respective length
	-n | --name_sort	Sort FASTA by name
	-l | --length_sort	Sort FASTA by sequence length (shortest to longest)
	-r | --reverse_sort	Sort in reverse order
	--upper	Sequences to uppercase
	--lower	Sequences to lowercase
	-g | --orf	Sequence from first ATG in frame
	--max_orf_num #	Maximum number of ORFs to output per sequence
	-p | --translate	Protein sequences in current frame
	--table #	Translation code (Default = standard code)
	--frame #	Frame to extract codons (Frames 1, 2 or 3; 0 = six frames; Default = 1)
	--min_prot #	Minimum protein size (Assumes --translate)
	--gc	Get percent GC per sequence (Disables --translate)
	--mw	Calculate the moleculare weight of DNA/RNA/protein per sequence (ss ds)
	--separate DIR  Separate sequnces into files in directory DIR
	--nonnuc        Non-ACTGU characters (0 ignored)
	--rna_dna	Convert RNA to DNA / DNA to RNA (Default = no conversion)
	--min_max_seq #,#	Minimum/Maximum sequence size (e.g. 10,50 ; 0 to ignore)
	--maxseq Return the # of largest sequences for each input sequence (ORFs, proteins, etc.)
	--check	Check if FASTA file is single line
	--fullprot	Return only ORFs/proteins with start and stop codons
	--re_sites      Detect restriction enzyme recognition sites for each sequence (Incompatible with protein sequences)
	--ignorestart	Ignore start codon when getting ORFs
	-t | --threads #	Number of CPU threads to use (Default = Detected processors or 1)
	-v | --verbose	Verbose
	-h | --help	Display help


	Available translation codes:
	1 - Standard code
	2 - Vertebrate Mitochondrial code
	3 - Yeast mitochondrial code
	4 - Mold, protozoan, and coelenterate mitochondrial code and the mycoplasma/spiroplasma code
	
```

- The `--orf` option divides each sequence into individual ORFs from a start to a stop codon in the current frame, or until the end of the sequence.
- The `--frame` option can take multiple inputs of numbers 1-6 seperated by a comma, or number 0 which is equivilant to 1,2,3,4,5,6.
- The `--translate` option applies to each ORF only if `--orf` is selected, otherwise it applies to the entire sequence in the current frame, regardless of start/stop codons.
- The `--length_sort` option applies after ORFs are retrieved and/or sequences are translated.
- If you want the reverse complement, use `--complement` and `--reverse_seq`.
- The `--min_max_seq` option applies to the nucleic acid sequences.
- The `--min_max_seq` option together with `--translate` applies the `--min_prot` option for the respective minimum protein size (i.e. (minimum / 3) - 1).
- The `--check` option return exit code 0 if the FASTA file is single-line.
- The `--mw` option detects DNA/RNA/protein sequences, and ouputs the average molecular weight of ssDNA/sRNA and dsDNA/dsRNA seperated by a tab or protein average molecular weight.