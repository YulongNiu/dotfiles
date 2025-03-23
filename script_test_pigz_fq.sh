
## originally by Yulong Niu
## yulong.niu@hotmail.com

mv SRX20696735_1.fastq.gz SRX20696735_S1_L001_I1_001.fastq.gz
mv SRX20696735_2.fastq.gz SRX20696735_S1_L001_R1_001.fastq.gz
mv SRX20696735_3.fastq.gz SRX20696735_S1_L001_R2_001.fastq.gz

## run Cell Ranger count
BIN_PATH=/usr/bin
CR_PATH=/home/niuyl/Tools/cellranger-9.0.1/bin
REF_PATH=/home/niuyl/Databases/10XChromium/refdata-gex-GRCh38-2024-A

## test pigz compression
FASTQ_BASE=/home/niuyl/test_pigz
OUTPUT_BASE=/home/niuyl/test_pigz

${CR_PATH}/cellranger count \
          --id SRX20696735 \
          --transcriptome ${REF_PATH} \
          --fastqs ${FASTQ_BASE} \
          --sample SRX20696735 \
          --create-bam true \
          --output-dir ${OUTPUT_BASE}/outputs \
          --localcores 45 \
          --localmem 400

## test gzip compression
FASTQ_BASE=/home/niuyl/test_gzip
OUTPUT_BASE=/home/niuyl/test_gzip

${CR_PATH}/cellranger count \
          --id SRX20696735 \
          --transcriptome ${REF_PATH} \
          --fastqs ${FASTQ_BASE} \
          --sample SRX20696735 \
          --create-bam true \
          --output-dir ${OUTPUT_BASE}/outputs \
          --localcores 45 \
          --localmem 400
