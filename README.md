# fastakit
A bash script for FASTA sequence formatting and modification.

```
fastakit [OPTIONS] Sequence.fasta
	-o | --out	Output to file (otherwise to stdout)
	-i | --in-place	Modify file in-place
	-c | --complement	Complementary sequence
	-m | --reverse_seq	Reverse sequence
	--unique	Remove duplicate sequences
	--random	Create random sequences of respective length
	--name_sort	Sort FASTA by name
	--length_sort	Sort FASTA by sequence length (shortest to longest)
	--reverse_sort	Sort in reverse order
	--upper	Sequences to uppercase
	--lower	Sequences to lowercase
	--orf	Sequence from first ATG in frame
	--max_orf_num #	Maximum number of ORFs to output per sequence
	--translate	Protein sequences in current frame
	--table #	Translation code (Default = standard code)
	--frame #	Frame to extract codons (Frames 1, 2 or 3; 0 = six frames; Default = 1)
	--min_prot #	Minimum protein size (Assumes --translate)
	--gc	Get percent GC per sequence (Disables --translate)
	--rna_dna	Convert RNA to DNA / DNA to RNA (Default = no conversion)
	--min_max_seq #,#	Minimum/Maximum sequence size (e.g. 10,50 ; 0 to ignore)
	--check	Check if FASTA file is single line
	-t | --threads #	Number of CPU threads to use (Default = 1)
	-v | --verbose	Verbose
	-h | --help	Display help
	--available_codes	Show available translation codes 
```

- If `--orf` option is selected, each sequence will be divided into individual ORFs from a start to a stop codon in the current frame, or until the end of the sequence.
- The `--translate` option applies to each ORF only if `--orf` is selected, otherwise it applies to the entire sequence in the current frame, regardless of start/stop codons.
- The `--length_sort` option applies after ORFs are retrieved and/or sequences are translated.
- If you want the reverse complement, use `--complement` and `--reverse_seq`.
- The `--min_max_seq` option applies to the nucleic acid sequence, for minimum protein sequence filtering use `--min_prot`.
