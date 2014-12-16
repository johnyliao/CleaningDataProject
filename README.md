CleaningDataProject
===================

Data Codebook
-------------
<table>
<tr><td>Variable<br/>Name</td><td>Variable</td><td>Values or<br/>Explanation</td></tr>
<tr><td>SubjectID</td><td>Id of Test Subject</td><td>Test subject is referenced by a number as ID</tr>
<tr><td>ActivityLabel</td><td>Activities performed by Subject</td><td>Measurements were performed for the following activities<br/>
LAYING<br/>SITTING<br/>STANDING<br/>WALKING<br/>WALKING_DOWNSTAIRS<br/>WALKING_UPSTAIRS</tr>
</table>

<p>
The remaining data columns will have a format similar to the following:
</p>
<p>
* tBodyAcc-mean()-X
* tBodyAcc-std()-Y
* fBodyAccMag-mean()
* fBodyAccMag-std()
</p>
You can decode the above column name as follows and similar pattern follows for all data columns
* The t or f prefix references either a time domain data or frequency domain data.
* The embedded -mean() or -std() indicates the data as mean data or standard deviation data
* The trailing -X, -Y, or -Z indicates the data three dimension direction of the data in X, Y or Z coordinates
* The label after the initial f or t describes the data, eg. BodyAcc indicates Body acceleration data.
* All data are actually mean values.  That is, fBodyAccMag-mean() is actually a mean of means data and fBodyAccMag-std() is mean of the standard deviation data.


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
