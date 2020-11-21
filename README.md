# Prediction	of	transcription	factor	binding	based	on	DNA	physical properties

## Data Sources

* The	sequence	of	the	human	genome	(assembly	hg19),	available	at:	
http://hgdownload.soe.ucsc.edu/goldenPath/hg19/bigZips/chromFa.tar.gz
The	format	is	self-explanatory.	Lower-case	letters	correspond	to	repetitive	
regions,	uppercase	to	non-repetitive	regions.	For	this	project,	you	should	
consider	both	as	the	same.
* A	set	of	genomic	regions	that	are	active	regulatory	regions	in	a	particular	cell	
type	(GM12878,	which	is	a	cell	line	derived	from	lymphoblasts).	This	is	
available	here:
    * [http://www.cs.mcgill.ca/~blanchem/561/wgEncodeRegTfbsClusteredV3.GM12878.merged.bed.gz](http://www.cs.mcgill.ca/~blanchem/561/wgEncodeRegTfbsClusteredV3.GM12878.merged.bed.gz)
    * Stored here as [wgEncodeRegTfbsClusteredV3.GM12878.merged.bed](wgEncodeRegTfbsClusteredV3.GM12878.merged.bed)
* A	set	of	genomic	coordinates of	actual	transcription	factor	binding	sites	for	
several	transcription	factors:	
    * [http://www.cs.mcgill.ca/~blanchem/561/factorbookMotifPos.txt.gz](http://www.cs.mcgill.ca/~blanchem/561/factorbookMotifPos.txt.gz)
    * Stored here as [factorbookMotifPos.txt](factorbookMotifPos.txt)
    * Each	line	looks	like	this:
        * 585					chr1				16245			16260			CTCF				1.97				-
        * Field	1:	Ignore
        * Field	2,3,4:	Genomic	coordinate
        * Field	5:	Name	of	transcription	factor
        * Field	6:	Score	of	predicted	binding	site	(could	probably	be	ignored)
        * Field	7:	DNA	strand	(+	or	-)	of	binding	site
* Position	weight	matrices	for	each	TF	is	available	here:
    * [http://www.cs.mcgill.ca/~blanchem/561/factorbookMotifPwm.txt.gz](http://www.cs.mcgill.ca/~blanchem/561/factorbookMotifPwm.txt.gz)
    * Stored here as [factorbookMotifPwm.txt](factorbookMotifPwm.txt)
* Predicted	structural	properties	for	every	human	genome	positions	are	
available	here:	[http://rohsdb.cmb.usc.edu/](http://rohsdb.cmb.usc.edu/)

