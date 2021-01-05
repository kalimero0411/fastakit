# fastakit
A bash script for FASTA sequence formatting and modification.

```
fastakit [OPTIONS] FASTA_file.fasta
	-o | --out	Output to file (otherwise to stdout)
	-n | --name_sort	Sort FASTA by name
	-s | --length_sort	Sort FASTA by sequence length (shortest to longest)
	-r | --reverse_sort	Sort in reverse order
	-u | --upper	Sequences to uppercase
	-l | --lower	Sequences to lowercase
	-c | --complement	Complementary sequence
	-m | --reverse_seq	Reverse sequence
	-g | --orf	Sequence from first ATG in frame (Default frame 1)
	-p | --translate	Protein sequences in current frame (Default frame 1)
	-a | --table	Translation code (Default standard code)
	-f | --frame	Frame to extract codons (must be 1, 2 or 3)
	-e | --min_prot #	Minimum protein size (assumes --translate)
	-t | --threads #	Number of CPU threads to use (Default = 1)
	-d | --gc	Get percent GC per sequence (turns off --translate)
	-v | --verbose	Verbose
	-h | --help	Display help
	--available_codes	Show available translation codes
```
  
- If `--orf` option is selected, each sequence will be divided into individual ORFs from a start to a stop codon in the current frame, or until the end of the sequence.
- The `--translate` option applies to each ORF only if `--orf` is selected, otherwise it applies to the entire sequence in the current frame, regardless of start/stop codons.
- The `--length_sort` option applies after ORFs are retrieved and/or sequences are translated.
- If you want the reverse complement, use `--complement` and `--reverse_seq`.
- Currently, output from `--verbose` is printed into the output file.
