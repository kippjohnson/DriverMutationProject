#infile <- read.csv("~/Desktop/CancerProject/mutation_frequencies.csv")

gene_list <- levels(infile$Hugo_Symbol)

gene_name <- vector()
mutations_per_gene <- vector()
max_count_mutation <- vector()

j <- 1
for( i in gene_list){
  #cat( i, "\t", length(infile[which(infile$Hugo_Symbol == i ),]$Mut_count), "\n") 
  gene_name[i] <- gene_list[i]
  mutations_per_gene[i] <- length(infile[which(infile$Hugo_Symbol == i ),]$Mut_count)
  max_count_mutation[i] <- max(infile[which(infile$Hugo_Symbol == i ),]$Mut_count)
  cat( c( j / length(gene_list), "\n"))
  j = j+1
}

hist(mutations_per_gene)
hist(max_count_mutation)
plot(density(mutations_per_gene))

GeneStats <- data.frame(gene_name, mutations_per_gene, max_countuency_mutation)

#for(i in gene_list){ print(i )}

which(gene_list == "TP53") #15226
count <- infile$Mut_count[which(infile$Hugo_Symbol == "TP53")]
location <- infile$Start_position[which(infile$Hugo_Symbol == "TP53")]
plot(location, count, xlab="Location",ylab="Mutation countuency",main="TP53")
hisq.test(count)

which(gene_list == "KRAS")
count <- infile$Mut_count[which(infile$Hugo_Symbol == "KRAS")]
location <- infile$Start_position[which(infile$Hugo_Symbol == "KRAS")]
plot(location, count, xlab="Location",ylab="Mutation countuency",main="KRAS")
chisq.test(count)

which(gene_list == "RB1")
count <- infile$Mut_count[which(infile$Hugo_Symbol == "RB1")]
location <- infile$Start_position[which(infile$Hugo_Symbol == "RB1")]
plot(location, count, xlab="Location",ylab="Mutation countuency",main="RB1")
chisq.test(count)

which(gene_list == "VHL")
count <- infile$Mut_count[which(infile$Hugo_Symbol == "VHL")]
location <- infile$Start_position[which(infile$Hugo_Symbol == "VHL")]
plot(location, count, xlab="Location",ylab="Mutation countuency",main="VHL")
#chisq.test(count) #Req. two elements

