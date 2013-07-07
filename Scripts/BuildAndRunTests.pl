#!/usr/bin/perl -w

use Cwd;
use Cwd 'abs_path';

$QMAKE = "/usr/lib/x86_64-linux-gnu/qt5/bin/qmake";
$RUN_COMMAND = "./test.out";
$MAKE = "make";

chdir( "../Src/Tests" );
$currentDir = getcwd();

print "Searching for all tests in\n$currentDir\n";

opendir( TEST_DIR, $currentDir ) or die "Cannot open $currentDir directory\n";
@FILES = readdir( TEST_DIR );

foreach( @FILES )
{
	if( -d $_ ) # current element in the list
	{
		if( $_ !~ /\./ )
		{
			my $absPath = abs_path( $_ );
			print "Get into directory: $absPath\n";
			print "Call qmake from here\n";
			chdir( $absPath );
		        system( $QMAKE );
			system( $MAKE );
			system( $RUN_COMMAND );
		}
	}
}
