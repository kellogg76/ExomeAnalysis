import requests

# Define the gene list
gene_list = ['NDP', 'FZD4', 'LRP5', 'TSPAN12']

# Set the parameters for the GenePrioritizer tool
tool_url = 'https://genecards.weizmann.ac.il/tools/ajax/genePrioritizer'
payload = {'geneList': '\n'.join(gene_list), 'disease': 'Familial exudative vitreoretinopathy'}

# Submit the request to the GenePrioritizer tool
response = requests.post(tool_url, data=payload)

# Parse the response to extract the prioritized gene list
priority_list = response.json()['results']

# Print the top 10 prioritized genes
for rank, gene in enumerate(priority_list[:10], start=1):
    print(f"{rank}. {gene['symbol']} ({gene['score']})")