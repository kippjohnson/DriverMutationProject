DROP TABLE IF EXISTS mutation_frequency_COAD;
CREATE TABLE IF NOT EXISTS mutation_frequency_COAD

SELECT *, count(*) as Mut_count from somatic_COAD group by Chromosome, Start_position, End_Position, Tumor_Seq_Allele2;

alter table mutation_frequency_COAD 
add column Mut_freq decimal(10,4) UNSIGNED NULL;

update mutation_frequency_COAD set Mut_freq = Mut_Count / 220;

