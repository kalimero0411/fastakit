# fastakit
A bash script for FASTA sequence formatting and modification.

```
fastakit [OPTIONS] [Sequence.fasta | stdin]
	-i | --in-place	Modify file in-place
	-c | --complement	Complementary sequence
	-m | --reverse_seq	Reverse sequence
	--unique	Remove duplicate sequences
	--multi #	Convert to multi-line FASTA (nucleotide only)
	--random	Create random sequences of respective length
	-n | --name_sort	Sort FASTA by name
	-l | --length_sort	Sort FASTA by sequence length (shortest to longest)
	-r | --reverse_sort	Sort in reverse order
	--upper	Sequences to UPPERCASE
	--lower	Sequences to lowercase
	-g | --orf	Retrieve ORFs
	--max_orf_num #	Maximum number of ORFs to output per sequence
	-p | --translate	Protein sequences in current frame
	--table #	Translation code (Default = standard code)
	--frame #	Frame to extract codons (Any of frames 1,2,3,4,5,6; 0 = six frames; Default = 1)
	--gc	Calculate percent GC per sequence (Disables --translate)
	--mw	Calculate the moleculare weight of DNA/RNA/protein per sequence (ss ds)
	--separate DIR	Separate sequnces into files in directory DIR
	--nonnuc	Non-ACTGU characters
	--rna_dna	Convert RNA to DNA / DNA to RNA (Default = no conversion)
	--seq_range #,#	Minimum/Maximum sequence size (e.g. 10,50 ; 0 to ignore)
	--max_seq Return the # of largest sequences for each input sequence (ORFs, proteins, etc.)
	--check	Check if FASTA file is single line
	--makebed	Create BED output for ORFs (Assumes --orf)
	--upstream #	Retrieve # size upstream flanking sequence of ORFs (Assumes --orf)
	--downstream #	Retrieve # size downstream flanking sequence of ORFs (Assumes --orf)
	--detect	Detect molucule and exit
	--re string,#,#,#,#	Detect restriction enzyme recognition sites (Restriction enzyme name, min_length, max_length, min_number, max_number; 0 to ignore; 'list' to list all enzymes)
	-t | --threads #	Number of CPU threads to use (Default = Detected processors or 1)
	-v | --verbose	Verbose
	-h | --help	Display help
	--stats	Calculate basic stats
	--version	Print version date
	
	Example: fastakit --orf --frame 0 --seq_range 100,1000 --length-sort sequences.fasta > orfs.fasta


	Available translation codes:
	1 - Standard code
	2 - Vertebrate Mitochondrial code
	3 - Yeast mitochondrial code
	4 - Mold, protozoan, and coelenterate mitochondrial code and the mycoplasma/spiroplasma code
	
```

- The `-g | --orf` option divides each sequence into individual ORFs from a start to a stop codon in the current frame, or until the end of the sequence.
- The `-i | --in-place` is not selected, all output is to stdout by default.
- The `--frame` option can take multiple inputs of numbers 1-6 seperated by a comma, or number 0 which is equivilant to 1,2,3,4,5,6.
- The `-p | --translate` option applies to each ORF only if `--orf` is selected, otherwise it applies to the entire sequence, regardless of start/stop codons.
- The `-l | --length_sort` option applies after ORFs are retrieved and/or sequences are translated.
- If you want the reverse complement, use `-c | --complement` and `-m | --reverse_seq`.
- The `--seq_range` option applies to the nucleic acid sequences or protein sequences (excluding the protein stop character) after translation. For example, in order to translate nucleotide sequences between 50 and 100 bp use `fastakit --seq_range 50,100 sequences.fasta | fastakit --translate`.
- The `--check` option returns exit code 0 if the FASTA file is single-line.
- The `--mw` option detects DNA/RNA/Protein sequences, and outputs the average molecular weight of ssDNA/ssRNA and dsDNA/dsRNA seperated by a tab or protein average molecular weight.
- The `--re` option detects restriction enzyme recognition sites, but **IGNORES** cut sites and methylation sensitivity. The inputs for this option are a restriction enzyme name, minimum and maximum length of recognition site, and minimum and maximum number of detected sites; seperated by a comma (e.g. HpaII,0,0,1,2). Each parameter can be ignored with 0.
- If `--re` is given a restriction enzyme name (i.e. not 0), the restrictions for recognition site length are removed.
- Selecting `--re list` gives a list of all possible enzymes.
- The `--random` option applies after all other sequence manipulation processes.
- The `--makebed` option enables `--orf` and disables `--translate`. Works with `--seq_range` and `--max_seq`.
