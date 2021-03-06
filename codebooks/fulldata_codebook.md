# Codebook for UC Croatia Life History Datatset

The full dataset contains records for individuals identified in the linkage procedure of deaths, births, and burials for seven parishes in central Croatia. Each line of the data represents a single individual. View the full documention on raw data sources and reconstitution procedures at the [project page](https://github.com/uc-croatia-project/croat_hist_match). 

The dataset itself is formatted as a tab-delimited text file with a header row that provides variable names.  There may be some white space around characters so trimming white space is recommended. in R, the following code will read in the dataset using the `readr` package:

```r
library(readr)
fulldata <- read_tsv("fulldata.tsv", guess_max=170000)
```



All dates in the file are the number of years or fractions thereof since 1700.

More information and code for the linkage procedure is available at [https://github.com/uc-croatia-project/croat_hist_match](https://github.com/AaronGullickson/croat_hist_match).

* **bid**: This variable is the id number for the birth record of this individual. This is the unique id that we use to identify each individual and link them to other individuals. However, not all observations in the dataset actually have an observed birth. There are three types of individuals identified by the range of their birth id:
  * *bid<200,000*: This represents a person with an observed birth record in the dataset. The birth id here matches the first birth id identified in the birth records.
  * *200,000>=bid<400,000*: A non-existent birth record imputed for a person identified through their marriage record. This is a person who we can track to an existing marriage record but for whom we cannot identify a birth record.
  * *bid>=400,000*: A non-existent birth record imputed for a person identified as a parent of a child but without an existing birth or marriage record.
* **bdate**: date of birth for this person.
* **sex**: Sex of this person,  "f" for female and "m" for male.
* **motherid**: The birth record for this individual's mother. 
* **fatherid**: The birth record for this individual's father.
* **mid1-mid5**: The marriage id number for this person's first to fifth marriage. Marriage ids greater than or equal to 30,000 represent unobserved marriages identified by the parents to a set of births.
* **sid1-sid5**: The birth id of the spouse for this person's first to fifth marriage.
* **mdate1-mdate5**: The date of the first through fifth marriage.
* **did**: The death record id for this individual. This corresponds to the death id in the original burial data.
* **ddate**: The date of death for this individual.
* **idk1-idk14**: The birth id of the first through the fourteenth child born to this person.
* **dobk1-dobk14**: The date of birth of the first through the fourteenth child born to this person.
* **sidk1-sidk14**: The birth id of the other parent of the first through fourteenth child born to this person.
* **remark1-remark14**: A dummy variable (0=FALSE; 1=TRUE) indicating whether this child was born in a remarriage for the person.
* **remarok1-remarok14**: A dummy variable (0=FALSE;1=TRUE) indicating whether this child was born in a remarriage for the spouse of this person.
* **park1-park14**: The parish of birth for the first through fourteenth child of this person, identified by letter. There are seven parishes in the dataset.
  * B - Bogicevci. This is a military parish.
  * C - Cernik. This is the only civil parish.
  * G - Gradiska. This is a military parish.
  * O - Oriovac. This is a military parish.
  * P - Petrovo Selo. This is a military parish.
  * S - Stivica. This is a military parish.
  * V - Vrbje. This is a military parish.
* **loe** - The date of the last observed event for this person (including their own potential death). This last observed event can include being listed as a godparent in the birth data.
