use strict;
use warnings;

use ExtUtils::MakeMaker;
use Pod::Text;
 
my $parser = new Pod::Text(sentence => 0, width => 78);
$parser->parse_from_file ('lib/Finance/Bank/Kraken.pm', 'README');

eval 'use ExtUtils::MakeMaker::Coverage';

WriteMakefile(
	'NAME' => 'Finance::Bank::Kraken',
	'AUTHOR' => 'Philippe Kueck <projects@unixadm.org>',
	'LICENSE' => 'LGPL',
	'VERSION_FROM' => 'lib/Finance/Bank/Kraken.pm',
	'ABSTRACT' => 'api.kraken.com connector',
	'MIN_PERL_VERSION' => '5.6.0',
	'PM' => {
		'lib/Finance/Bank/Kraken.pm' => '$(INST_LIB)/Finance/Bank/Kraken.pm'
	},
	'PREREQ_PM' => {
		'HTTP::Request' => 0,
		'LWP::UserAgent' => 0,
		'MIME::Base64' => 0,
		'Digest::SHA' => 0
	},
	'dist' => {'COMPRESS' => 'gzip -9f', 'SUFFIX' => 'gz'},
	'clean' => {'FILES' => 'bogus'}
);
