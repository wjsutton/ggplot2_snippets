# repo working directory
wd <- '~/Github/ggplot2_snippets/'

# Destination for images
setwd(paste0(wd,'images'))

folders <- c('bar_charts','line_charts')

# find all scripts in chart folders and
# execute them, generating a new image
for(a in 1:length(folders)){
  
  file_path <- paste0(wd,folders[a])
  
  scripts <- list.files(path = file_path)
  
  for(i in 1:length(scripts)){
    source(paste0(file_path,'/',scripts[i]))
  }
          
}

