CleaningDataProject
===================

Example Usage
-------------
<pre><code>
source("run_analysis.R")
project.dir &lt;- "C:\\training\\CleaningData"
zipfile &lt;- "UCI HAR Dataset.zip"
data &lt;- run_analysis(project.dir,zipfile)
write.table(data,file="tidydataset.txt",row.name=FALSE )
</code>
</pre>
