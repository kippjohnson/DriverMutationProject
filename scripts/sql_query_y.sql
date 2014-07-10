select * 
from var_tcga_2013.laml_cleaned_filtered as c
join anno.mb_refseq_hg19 as rp on(c.Chromosome=rp.chr and c.Start_Position between rp.chrfrom and rp.chrto and Variant_Classification='Missense_Mutation')
join anno.mb_refseq_nucleotide_hg19 as rn on(rn.rid=rp.rid and rn.pos=c.Start_Position)
join anno.rs_pdb_protein as pp on(pp.qseqid=rp.rsprot and rn.ncodon between pp.qstart and pp.qend)
where rp.rid=(
     select rp.rid from anno.mb_refseq_hg19 as rp, anno.mb_refseq_nucleotide_hg19 as rn 
     where rn.rid=rp.rid and rn.pos=c.Start_Position and rp.chr=c.Chromosome and c.Start_Position between rp.chrfrom and rp.chrto
     order by rp.rid
     limit 1
   )
;
