#In this version of the script, we use the PdfPages class to create a new PDF file called "coverage.pdf".
#We set the bbox_inches argument of the pdf.savefig function to "tight" to remove unnecessary whitespace around the plots.
#
#We also define a variable called chromosomes_per_page to specify the number of chromosomes to include on each page of the PDF file.
#After plotting each chromosome, we check if the current chromosome is a multiple of chromosomes_per_page, and add an empty page as a page break using pdf.savefig().
#
#The resulting PDF file will have one page for every chromosomes_per_page chromosomes, with up to chromosomes_per_page plots per page.
#Each plot will show the coverage for one chromosome, with the chromosome name as the title.
#You can adjust chromosomes_per_page to display a different number of chromosomes per page, and modify the plot settings as before to customize the appearance of the plots.
#

import pysam
import matplotlib.pyplot as plt
from matplotlib.backends.backend_pdf import PdfPages

# Load the BAM file and fetch the reference sequence names and lengths
bamfile = pysam.AlignmentFile("Mat.bam", "rb")
ref_names = bamfile.references
ref_lengths = bamfile.lengths

# Set the number of chromosomes per page
chromosomes_per_page = 9

# Loop over each chromosome and create a line graph of the coverage
with PdfPages("coverage.pdf") as pdf:
    for i in range(len(ref_names)):
        ref_name = ref_names[i]
        ref_length = ref_lengths[i]
        coverage = [0] * ref_length
        for pileupcolumn in bamfile.pileup(ref=ref_name):
            coverage[pileupcolumn.reference_pos] = pileupcolumn.nsegments
        fig, ax = plt.subplots()
        ax.plot(coverage)
        ax.set_xlabel("Genomic position")
        ax.set_ylabel("Coverage")
        ax.set_title(f"{ref_name} coverage")
        pdf.savefig(fig, bbox_inches='tight')
        plt.close()
       
        # Add a page break after the specified number of chromosomes per page
        if (i+1) % chromosomes_per_page == 0:
            pdf.savefig()  # Add an empty page as a page break