FreqAdjust <- function(gene.name, mut.table=infile,lambda=1){
    
  location <- infile$Start_position[which(infile$Hugo_Symbol == gene.name)]
  f.old <- infile$Mut_freq[which(infile$Hugo_Symbol == gene.name)]
  
  f.adj <- numeric(length=length(f.old))
  location.penalty <- numeric(length=length(f.old))
  
  for(i in 1:length(f.old)){
    location.penalty  <- 1 - abs(location[i] - location)/max(abs(location[i] - location))
    f.adj[i] <- sum( f.old * location.penalty^lambda)
  }
  
  chr_bp <- location
  old_freq <- f.old  
  adj_freq <- f.adj
  
  return(    
    data.frame(
      chr_bp, old_freq, adj_freq)
  )
}

TP53 <- FreqAdjust("TP53",lambda=250)
plot(TP53$chr_bp, TP53$old_freq,type="l")
plot(TP53$chr_bp, TP53$adj_freq,type="l")

rm(TP53)

