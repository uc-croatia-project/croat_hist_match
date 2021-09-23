#####################
# lastevent.pl      #
# Perl Script       #
# Aaron Gullickson  #
# 10/03/2001        #
#####################

##########################################
# This is the last program to be run to create the full dataset.  It will
# search each record for the last observed event.
##########################################

print "Getting last observed event.....";

require generalsubs;

$croatdatafile="output/croatdata.txt";
open (CROAT, "<$croatdatafile") || die ("cant open"." $croatdatafile");

%croat=();

foreach $line(<CROAT>) {

  chop $line;

  ($bid, $bdate, $sex, 
   $motherid, $fatherid, 
   $mid1, $mid2, $mid3, $mid4, $mid5,
   $sid1, $sid2, $sid3, $sid4, $sid5,
   $mdate1, $mdate2, $mdate3, $mdate4, $mdate5, 
   $did, $ddate,
   $idk1,$idk2,$idk3,$idk4,$idk5,$idk6,$idk7,
   $idk8,$idk9,$idk10,$idk11,$idk12,$idk13,$idk14,
   $dobk1, $dobk2, $dobk3, $dobk4, $dobk5, $dobk6, $dobk7, $dobk8, 
   $dobk9, $dobk10, $dobk11, $dobk12, $dobk13, $dobk14, 
   $sidk1,$sidk2,$sidk3,$sidk4,$sidk5,$sidk6,
   $sidk7,$sidk8,$sidk9,$sidk10,$sidk11,$sidk12,$sidk13,$sidk14,
   $remark1,$remark2,$remark3,$remark4,$remark5,$remark6,
   $remark7,$remark8,$remark9,$remark10,$remark11,$remark12,$remark13,$remark14,
   $remarok1,$remarok2,$remarok3,$remarok4,$remarok5,$remarok6,
   $remarok7,$remarok8,$remarok9,$remarok10,$remarok11,$remarok12,$remarok13,$remarok14,
   $park1,$park2,$park3,$park4,$park5,$park6,$park7,
   $park8,$park9,$park10,$park11,$park12,$park13,$park14)=split("\t", $line);
  
  #collect all the dates into an array

  @dates=($bdate, 
   $mdate1, $mdate2, $mdate3, $mdate4, $mdate5, 
   $dobk1, $dobk2, $dobk3, $dobk4, $dobk5, $dobk6, $dobk7, $dobk8, $dobk9, $dobk10, 
   $dobk11, $dobk12, $dobk13, $dobk14, 
   $ddate);

  $lastdate=&max(@dates);

  #get first line of headers
  if($bid eq "bid") {
    $lastdate="loe"
  }

  $newline=join("\t", $bid, $bdate, $sex, 
		 $motherid, $fatherid, 
		 $mid1, $mid2, $mid3, $mid4, $mid5, 
		 $sid1, $sid2, $sid3, $sid4, $sid5,
		 $mdate1, $mdate2, $mdate3, $mdate4, $mdate5, 
		 $did, $ddate,
		 $idk1,$idk2,$idk3,$idk4,$idk5,$idk6,$idk7,
		 $idk8,$idk9,$idk10,$idk11,$idk12,$idk13,$idk14,
		 $dobk1, $dobk2, $dobk3, $dobk4, $dobk5, $dobk6, $dobk7, $dobk8, 
		 $dobk9, $dobk10, $dobk11, $dobk12, $dobk13, $dobk14, 
		 $sidk1,$sidk2,$sidk3,$sidk4,$sidk5,$sidk6,
		 $sidk7,$sidk8,$sidk9,$sidk10,$sidk11,$sidk12,$sidk13,$sidk14,
		 $remark1,$remark2,$remark3,$remark4,$remark5,$remark6,$remark7,$remark8,
     $remark9,$remark10,$remark11,$remark12,$remark13,$remark14,
		 $remarok1,$remarok2,$remarok3,$remarok4,$remarok5,$remarok6,$remarok7,
     $remarok8,$remarok9,$remarok10,$remarok11,$remarok12,$remarok13,$remarok14,
		 $park1,$park2,$park3,$park4,$park5,$park6,$park7,
		 $park8,$park9,$park10,$park11,$park12,$park13,$park14,$lastdate);
  
  $croat{$bid}=$newline;
  
}

close FINAL;
open (CROAT,">$croatdatafile") || die ("cant open"." $croatdatafile");

@bid =keys %croat;
foreach $bid (@bid) {
  $line=$croat{$bid};
  print(CROAT "$line\n");
}

print "done\n\n";