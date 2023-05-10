#In this modified script, the --genes argument now specifies the path to a file containing a list of genes to search for variants in.
#The script reads this file into a list called gene_list, and then uses that list in the Gemini query to search for variants in those genes.
#
#Run with the path to your Gemini database file and the path to a file containing a list of genes to search for variants in.
#For example, if your list of genes is in a file called genelist.txt, you would run the script like this:
#python Gemini2Excel.py mydatabase.db --genes genelist.txt --outfile results.xlsx

import gemini
import argparse
import pandas as pd

# Define command line arguments
parser = argparse.ArgumentParser(description='Search for genetic variants in specified genes.')
parser.add_argument('dbfile', type=str, help='Path to the Gemini database file')
parser.add_argument('--genes', type=str, help='Path to file containing list of genes to search for variants in')
parser.add_argument('--outfile', type=str, help='Path to output Excel file')

# Parse the command line arguments
args = parser.parse_args()

# Load the list of genes to search
with open(args.genes) as f:
    gene_list = [line.strip() for line in f]

# Load the Gemini database file
db = gemini.connect(args.dbfile)

# Define the query to search for variants in the specified genes
query = "SELECT chrom, start, end, ref, alt, gene FROM variants WHERE gene IN ({})".format(','.join(['?']*len(gene_list)))

# Execute the query with the specified genes
results = db.execute(query, gene_list)

# Convert the results to a pandas dataframe
df = pd.DataFrame.from_records(results, columns=['Chrom', 'Start', 'End', 'Ref', 'Alt', 'Gene'])

# Write the dataframe to an Excel file
if args.outfile:
    df.to_excel(args.outfile, index=False)
else:
    print(df)