CleaningDataProject
===================

Example Usage
-------------
<pre><code>
source("run_analysis.R")
project.dir <- "C:\\training\\CleaningData"
zipfile <- "UCI HAR Dataset.zip"
data <- run_analysis(project.dir,zipfile)
write.table(data,file="tidydataset.txt",row.name=FALSE )
</code>
</pre>
