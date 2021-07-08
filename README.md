# fastakit
A bash script for FASTA sequence formatting and modification.

```
fastakit [OPTIONS] FASTA_file.fasta
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
	--orf	Sequence from first ATG in frame (Default = frame 1)
	--translate	Protein sequences in current frame (Default = frame 1)
	--table #	Translation code (Default = standard code)
	--frame #	Frame to extract codons (must be 1, 2 or 3)
	--min_prot #	Minimum protein size (Assumes --translate)
	--gc	Get percent GC per sequence (Disables --translate)
	--rna_dna	Convert RNA to DNA / DNA to RNA (Default = no conversion)
	--check	Check if FASTA file is single line (TRUE = exit 0; FALSE = exit 1)
	-t | --threads #	Number of CPU threads to use (Default = 1)
	-v | --verbose	Verbose
	-h | --help	Display help
	--skip_singleline	Skip changing multi-line FASTA to single-line FASTA 
	--available_codes	Show available translation codes 
```

- Single line conversion is the default, use `--skip_singleline` to avoid it.
- If `--orf` option is selected, each sequence will be divided into individual ORFs from a start to a stop codon in the current frame, or until the end of the sequence.
- The `--translate` option applies to each ORF only if `--orf` is selected, otherwise it applies to the entire sequence in the current frame, regardless of start/stop codons.
- The `--length_sort` option applies after ORFs are retrieved and/or sequences are translated.
- If you want the reverse complement, use `--complement` and `--reverse_seq`.
- Currently, output from `--verbose` is printed into the output file.
