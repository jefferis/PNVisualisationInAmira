tryCatch({
  rdir<-dirname(attr(body(function() {}), 'srcfile')$filename)
  projectdir=dirname(rdir)
  amiradir=file.path(projectdir, 'amira')
  message(amiradir)

  # write files
  unlink(file.path(amiradir, 'WarpTransformed'), recursive=TRUE)
  message("Writing neurons!")
  write.neurons(allpns.IS2, dir=file.path(amiradir, 'WarpTransformed'), format='hxlineset',
    subdir=Glomerulus)
  
  # write list files
  files=with(allpns.IS2, by(names(allpns.IS2), Glomerulus,I) )
  unlink(file.path(amiradir, 'lists'), recursive=TRUE)
  dir.create(file.path(amiradir, 'lists'))
  message("Writing list files!")
  for (g in names(files)){
    f=file.path(amiradir, "lists", paste0(g, '_listfile.txt'))
    t=paste(file.path("../WarpTransformed", g, files[[g]]),4)
    writeLines(t, f)
  }
  }, err=function(e) {message("Failed to write files! Detailed error:\n"); e})

