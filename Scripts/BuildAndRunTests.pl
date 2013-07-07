#!/usr/bin/perl -w

use Cwd;
use Cwd 'abs_path';

$QMAKE = "/usr/lib/x86_64-linux-gnu/qt5/bin/qmake";

# qmake path for local qmake, uncomment it for test purpose
#$QMAKE = "/home/marcin/Public/ApplicationInstalled/Qt5.1rc/5.1.0-rc1/gcc_64/bin/qmake";

$RUN_COMMAND = "./test.out";
$MAKE = "make";

print "Script call directory: ".getcwd()."\n";
system( "cd /home/travis/build/thewitcher/Traffic/Src/Tests" ) == 0 or die "Cannot change directory 1\n";
$currentDir = getcwd();

print "Searching for all tests in\n$currentDir\n";

opendir( TEST_DIR, $currentDir ) or die "Cannot open $currentDir directory\n";
@FILES = readdir( TEST_DIR );
closedir( TEST_DIR );

$currentElement = "";
$absPath = "";
foreach( @FILES )
{
	system( "cd ".$currentDir ) == 0 or die "Cannot change directory 2\n";
	$currentElement = $_;
	$absPath = abs_path( $currentElement );

	print "Element: $absPath\n";
	if( -d $absPath ) # current element in the list
	{
		print "Is a directory\n";
		if( $currentElement !~ /\./ )
		{
			print "Get into directory: $absPath\n";
			print "Call qmake from here\n";
			system( "cd ".$absPath ) == 0 or die "Cannot change directory 3\n";
		        system( $QMAKE ) == 0 or die "Qmake failed in $absPath\n";
			system( $MAKE ) == 0 or die "Make failed in $absPath\n";
			system( $RUN_COMMAND ) == 0 or die "Run test failed\n";
		}
	}
}
