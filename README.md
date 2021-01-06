# Prediction	of	transcription	factor	binding	based on	DNA	sequence

### Machine learning notebooks
* Classifying sequences as bound or unbound using only sequence data (target is either 0 or 1)
[Binary_Classification_without_shapes.ipynb](Binary_Classification_without_shapes.ipynb)
    * Same but with shapes [Binary_WithShapes.ipynb](Binary_WithShapes.ipynb)
    * Same but with hot encoded target (not sure why I didn't do that in the other ones) [Softmax_without_shapes.ipynb](Softmax_without_shapes.ipynb)
* Regression analysis of actual binding sequences [OnlyPositiveSamples.ipynb](OnlyPositiveSamples.ipynb)
    * Same but negative samples have a target of 0 [PositiveAndNegative.ipynb](PositiveAndNegative.ipynb)
    * Same but with random sequences with a target of 0 [PositiveAndRandom.ipynb](PositiveAndRandom.ipynb)

### MATLAB for pre-processing the data
* [main.mlx](./MATLAB/main.mlx) Get all the binding and non-binding sites for a particular TF, includes figures and instructions throughout 
    * [predict_positions.m](./MATLAB/predict_positions.m) Function that takes as input a full chromosome sequence, a PWM and a score threshhold and returns the positions of all the regions from that sequence that have a score above the threshhold. 
        * [get_score.m](./MATLAB/get_score.m) Function that returns the score for a possible binding sequence given a PWM. 
    * [check_found.m](./MATLAB/check_found.m) Filter the sequences into binding and not binding
* [getTFsequences.mlx](./MATLAB/getTFsequences.mlx) Get all the actual binding sequences for a particular transcription factor and analyze them. 
* [calculate_shapes.mlx](./MATLAB/calculate_shapes.mlx) Calulate DNA physical shape using pentamer method 
    * [create_pentamer_dict.mlx](./MATLAB/create_pentamer_dict.mlx) Create a dictionary of all possible pentamers for the shape calculations 


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
    * Stored here as [wgEncodeRegTfbsClusteredV3.GM12878.merged.bed](./Data/wgEncodeRegTfbsClusteredV3.GM12878.merged.bed)
* A	set	of	genomic	coordinates of	actual	transcription	factor	binding	sites	for	
several	transcription	factors:	
    * [http://www.cs.mcgill.ca/~blanchem/561/factorbookMotifPos.txt.gz](http://www.cs.mcgill.ca/~blanchem/561/factorbookMotifPos.txt.gz)
    * Stored here as [factorbookMotifPos.txt](./Data/factorbookMotifPos.txt)
    * Each	line	looks	like	this:
        * 585					chr1				16245			16260			CTCF				1.97				-
        * Field	1:	Ignore
        * Field	2,3,4:	Genomic	coordinate
        * Field	5:	Name	of	transcription	factor
        * Field	6:	Score	of	predicted	binding	site	(could	probably	be	ignored)
        * Field	7:	DNA	strand	(+	or	-)	of	binding	site
* Position	weight	matrices	for	each	TF	is	available	here:
    * [http://www.cs.mcgill.ca/~blanchem/561/factorbookMotifPwm.txt.gz](http://www.cs.mcgill.ca/~blanchem/561/factorbookMotifPwm.txt.gz)
    * Stored here as [factorbookMotifPwm.txt](./Data/factorbookMotifPwm.txt)
* Predicted	structural	properties	for	every	human	genome	positions	are	
available	here:	[http://rohsdb.cmb.usc.edu/](http://rohsdb.cmb.usc.edu/)

