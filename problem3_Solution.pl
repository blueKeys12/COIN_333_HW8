open (IN, "num2.txt") or die "can't open file\n";
@arr=<IN>;
close IN;


foreach $input (@arr){
($city, $count) = $input =~ m:\w+\s+(\w+)\s+(\d+):;
$cityTotal{$city} += $count;
$houseHoldTotal{$city}++;  #household total increases by 1 at this city
}

foreach $city (keys %cityTotal){
print "$city: $cityTotal{$city} people in $houseHoldTotal{$city} household";
if($houseHoldTotal{$city} > 1) {print "s";}
print "\n";
}