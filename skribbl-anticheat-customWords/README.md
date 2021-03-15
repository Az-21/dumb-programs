# Custom Word List Combiner for skribbl.io

## Function
* Reads all `.txt` files in the working directory
* Creates a combined output at `output.txt` (reserved; won't read as input)
* Just place all inputs in the working directory and run

```
python3 customCombine.py
```


## Format
Each `.txt` input file must be a comma separated list. Example:

```
Alpha, beta 123, gamma delta, Zeta
```