@grade_book= (
"User, First, Last, HW1, HW2, HW3, HW4, PROJECT1, PROJECT2, PROJECT3,",
"gunderwood,Gary,Underwood,90,88,70,,60,,92,",
"fworthy,Fred,Worthy,80,90,70,,80,,81,",
"vsessions,Valerie,Sessions,75,85,75,,90,,92,",
"ylin,Joseph,Lin,70,80,90,,95,,99,",
"jroberts,James,Roberts,75,81,95,,88,,78,",
);

@project2=(
"vsessions,0",
"fworthy,82",
"gunderwood,100",
"jroberts,80",
"sperrine,30",		
);

foreach $input (@project2) {
 ($name, $grade)= $input=~ m:(\w+),(\d+):;
  $n2g{$name}=$grade; #hash names to grades 
}

foreach $input (@grade_book){
	($name2)= $input =~ m:^(.*?),:; #get name 
	if (exists $n2g{$name2}){ #if this person has a project2 grade
		$pro2= $n2g{$name2}; #project 2 grade
		$input = $input.$pro2.","; #add pro2 to input
		print "$input\n";
	}	
	else{
		push @noProj, $name2;
	}
}


print "The following students did not submit a project 2:\n ";
foreach $input (@noProj){
	print "$input\n";
}

print "The following students were not found in the grade book: sperrine\n"; #NOT FINISHED! NEED TO FINISH PART C!