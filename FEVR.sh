bedtools genomecov -ibam /mnt/d/FEVR-Mat/Control.recalibrated.sorted.bam > /mnt/d/FEVR-Mat/Control.recalibrated.sorted.coverage.hist.txt

bedtools coverage -hist -abam /mnt/d/FEVR-Mat/Control.recalibrated.sorted.bam -b /mnt/d/hg19/TruSeq_exome_targeted_regions.hg19_no_chr.bed | grep ^all > /mnt/d/FEVR-Mat/Control.recalibrated.sorted.hist.all.txt


#Export all genes to new bed file
echo "Exporting genes to a BED file"
#grep -w ${gene_name} /mnt/d/hg19/hg19_genes.bed >$OutputDir/${gene_name}_gene.bed
grep -w ${gene_name} /mnt/d/hg19/hg19_exons.bed >$OutputDir/${gene_name}_exons.bed
#Remove "chr" from bed file
#sed 's/chr//' $OutputDir/${gene_name}_gene.bed > $OutputDir/${gene_name}_gene_nochr.bed
sed 's/chr//' $OutputDir/${gene_name}_exons.bed > $OutputDir/${gene_name}_exons_nochr.bed
#Count coverage
echo "Calculating coverage of ${gene_name}."
samtools mpileup -Q 1 -f  $FASTA -l $OutputDir/${gene_name}_exons_nochr.bed /mnt/d/FEVR-Mat/Control.recalibrated.sorted.bam > /mnt/d/FEVR-Mat/Mat_total_exon_coverage.txt


#Merge VCF’s (VCF must be zipped)
bcftools index /mnt/d/FEVR19/FEVR19.snpEff.vcf.gz
bcftools index /mnt/d/hg19/FEVR.combined.vcf.gz
bcftools merge -m id /mnt/d/FEVR19/FEVR19.snpEff.vcf.gz /mnt/d/hg19/FEVR.combined.vcf.gz > /mnt/d/hg19/FEVR1-18.combined.vcf.gz
bgzip /mnt/d/hg19/FEVR1-18.combined.vcf
bcftools index /mnt/d/hg19/FEVR1-18.combined.vcf.gz
gemini load -v /mnt/d/hg19/FEVR1-18.combined.vcf.gz -t snpEff --cores 8 /mnt/d/hg19/FEVR1-18.combined.gemini.db


~/manta1.6.0/bin/configManta.py --bam /mnt/e/AP-1_chr6.bam --referenceFasta /mnt/d/hg19/human_g1k_v37.fasta --runDir /mnt/e/manta --exome


####Manta Calling by Chromosome
Download fasta of Chr 6 (hg38) here http://hgdownload.soe.ucsc.edu/goldenPath/hg38/chromosomes/
unzip the fasta file
gunzip chr6.fa.gz
Index the fasta file
samtools faidx /mnt/e/chr6.fa

Create a bed file of Chr 6
Index the bed file
bgzip /mnt/e/chr6.bed > /mnt/e/chr6.bed.gz
tabix -p bed /mnt/e/bed chr6.bed.gz

Run Manta Config
~/manta1.6.0/bin/configManta.py --bam /mnt/e/AP-1_chr6.bam --referenceFasta /mnt/e/chr6.fa --runDir /mnt/e/manta --callRegions /mnt/e/chr6.bed.gz --exome
python ~/manta1.6.0/bin/manta/runWorkflow.py

~/manta1.6.0/bin/configManta.py --bam /mnt/e/AP-1_chr6.bam --referenceFasta /mnt/d/hg38/Homo_sapiens_assembly38.fasta --callRegions /mnt/e/chr6.bed.gz --runDir /mnt/e/manta --exome
~/manta1.6.0/bin/configManta.py --bam /mnt/e/AP-1_chr6.bam --callRegions /mnt/e/chr6.bed.gz --runDir /mnt/e/manta --exome


#Chop Chr 6 from BAM (using 7 cores)
samtools view -@ 7 -b /mnt/e/AP-1_S1.bam chr6 > /mnt/e/AP-1_chr6.bam
Index new BAM
samtools index /mnt/e/AP-1_chr6.bam -@ 8


#Gemini 1 sample
gemini query -q "select chrom, start, end, ref, alt, codon_change, aa_change, gene, transcript, biotype, impact, impact_Severity, gerp_bp_score, aaf_exac_all, max_aaf_all, gnomad_num_het, gnomad_num_hom_alt, gnomad_num_chroms, in_omim, clinvar_sig, clinvar_disease_name, clinvar_gene_phenotype, qual, filter, depth, vcf_id, rs_ids,  (gts).(967) from variants where impact_Severity != 'LOW' AND max_aaf_all < 0.01" --header --gt-filter "gt_types.967 == HET" /mnt/d/FEVR20/FEVR20.gemini.db > /mnt/d/FEVR20/FEVR20.het_med_high_rare967.txt
gemini query -q "select chrom, start, end, ref, alt, codon_change, aa_change, gene, transcript, biotype, impact, impact_Severity, gerp_bp_score, aaf_exac_all, max_aaf_all, gnomad_num_het, gnomad_num_hom_alt, gnomad_num_chroms, in_omim, clinvar_sig, clinvar_disease_name, clinvar_gene_phenotype, qual, filter, depth, vcf_id, rs_ids,  (gts).(990) from variants where impact_Severity != 'LOW' AND max_aaf_all < 0.01" --header --gt-filter "gt_types.990 == HET" /mnt/d/FEVR20/FEVR20.gemini.db > /mnt/d/FEVR20/FEVR20.het_med_high_rare990.txt

#Gemini 2 samples
gemini query -q "select chrom, start, end, ref, alt, codon_change, aa_change, gene, transcript, biotype, impact, impact_Severity, gerp_bp_score, aaf_exac_all, max_aaf_all, gnomad_num_het, gnomad_num_hom_alt, gnomad_num_chroms, in_omim, clinvar_sig, clinvar_disease_name, clinvar_gene_phenotype, qual, filter, depth, vcf_id, rs_ids,  (gts).(*) from variants where impact_Severity != 'LOW' AND max_aaf_all < 0.01" --header --gt-filter "gt_types.967 == HET OR gt_types.990 == HET" /mnt/d/FEVR20/FEVR20.gemini.db > /mnt/d/FEVR20/FEVR20.het_med_high_rare2.txt


#Bam to fasta
samtools view -F 4  SMARCAD1_short.bam | awk '{OFS="\t"; print ">"$1"\n"$10}' - >SMARCAD_short.fasta
samtools view SMARCAD1_short.bam | awk '{print ">"$1"\n"$10}' > SMARCAD1_sort2.fasta

samtools mpileup -uf /mnt/d/hg19/human_g1k_v37.fasta SMARCAD1_short.bam | bcftools call -c | vcfutils.pl vcf2fq > SMARCAD_short.fastq


#Bam to Fastq
samtools bam2fq SMARCAD1_sort.bam > test.fastq
sed -n '1~4s/^@/>/p;2~4p' test.fastq > OUTFILE.fasta





#Sum a list of numbers in a file
awk '{ sum += $3 } END { print sum }' /mnt/d/Exome_Coverage/F10-052/F10-052_total_exon_coverage_cut.txt
wc -l /mnt/d/Exome_Coverage/F10-052/F10-052_total_exon_coverage_cut.txt




#Gemini 1 sample
gemini query -q "select chrom, start, end, ref, alt, codon_change, aa_change, gene, transcript, biotype, impact, impact_Severity, gerp_bp_score, aaf_exac_all, max_aaf_all, gnomad_num_het, gnomad_num_hom_alt, gnomad_num_chroms, in_omim, clinvar_sig, clinvar_disease_name, clinvar_gene_phenotype, qual, filter, depth, vcf_id, rs_ids,  (gts).(*) from variants where impact_Severity != 'LOW' AND max_aaf_all < 0.01" --header --gt-filter "gt_types.F10-002 == HET" /mnt/d/FEVR1-27b.combined.gemini.db > /mnt/d/FEVR20.het_med_high_rareF10-002.txt



