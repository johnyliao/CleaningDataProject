CleaningDataProject
===================

Data Codebook
-------------
<table>
<tr><td>Variable<br/>Name</td><td>Variable</td><td>Values or<br/>Explanation</td></tr></table>
<tr><td>SubjectID</td><td>Id of Test Subject</td><td>Test subject is referenced by a number as ID</tr>
<tr><td>ActivityLabel</td><td>Activities performed by Subject</td><td>Measurements were performed for the following activities<br/>
LAYING<br/>SITTING<br/>STANDING<br/>WALKING<br/>WALKING_DOWNSTAIRS<br/>WALKING_UPSTAIRS</tr>

</table>

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
