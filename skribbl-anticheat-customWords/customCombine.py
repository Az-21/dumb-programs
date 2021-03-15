import glob, os

# Initialize list
customWords:list[str] = []

# Read all .txt files
dir_path = os.path.dirname(os.path.realpath(__file__))
os.chdir(dir_path)
for file in glob.glob("*.txt"):
    if(file != 'output.txt'):
        with open(file, 'r') as f:
            f_contents = f.read()
            customWordTemp = f_contents.split(',')
            customWords.extend(customWordTemp)


# Write output.txt with all responses combined
filter(None, customWords)                                   # remove blank elements
strCustomWords:str = ', '.join(map(str, customWords))       # list to str
with open('output.txt', 'w') as f:
    f.write(strCustomWords)
    
    
print('Success. Open `output.txt` for the combined space separated list.')