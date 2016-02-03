
@tests = ( 'add $t1, $t2, $t3', 'addi $s1, $a0, 15', 'sub $t3, $t4, $t5', 'lw $t3, 4($t5)', 'sw $t4, HELLO', 'add hello, $ra, $t0', 'sw hello, $v0', 'wrong $s1, $s2');


$imP = '(-?\d+)'; #reusable code to find positive or negative immediate values
$regP = '(\$a[0-3]|\$at|\$fp|\$gp|\$ra|\$v[0-1]|\$t[0-9]|\$s[0-7]|\$sp|\$k[0-1]|\$zero)'; #reusable code to find possible registers
$locP = "(\\d\\($regP\\)|\\w+)"; #for lw and sw




foreach $input (@tests){
print "\n$input\t";
($nem, $param) = $input =~ m:^\s*(\w+)\s+(.*)$:;
	if($nem eq 'add' || $nem eq 'sub'){
		($r1, $r2, $s3) = $param =~ m:^$regP,\s*$regP,\s*$regP$:;  
		if($r1){print "is valid\n";} 
		else{print "parameters: $param do not match mnemonic $nem"}
	}
	elsif($nem eq 'addi')||($nem eq 'xori'){
	(	$r1, $r2, $s3) = $param =~ m:^$regP,\s*$regP,\s*$imP$:;
		if($r1){print "is valid\n";}
		else{print "parameters: $param do not match mnemonic $nem"}
	}
	elsif($nem eq 'lw' || $nem eq 'sw'){
		($r1, $s2) = $param =~ m:^$regP,\s*$locP$:;
		if($r1){print "is valid\n";}
		else{print "parameters: $param do not match mnemonic $nem"}
	}
	
	else{print " invalid mnemonic: $nem\n"}


}