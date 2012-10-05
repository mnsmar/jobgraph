package Test::TestObjects;
use strict;

use JobGraph::Job::Input;
use JobGraph::Job::Output;
use JobGraph::Job::Description;

################################################
################ JobGraph ######################
################################################
sub get_testobject_JobGraph_Job_Generic {
	return [
		{
			INPUT => [
				JobGraph::Job::Input->new({Test::TestObjects->get_testobject_JobGraph_Input->[0]}),
				JobGraph::Job::Input->new({Test::TestObjects->get_testobject_JobGraph_Input->[0]})
			],
			
			OUTPUT => [
				JobGraph::Job::Output->new({Test::TestObjects->get_testobject_JobGraph_Output->[0]}),
				JobGraph::Job::Output->new({Test::TestObjects->get_testobject_JobGraph_Output->[0]})
			],
			
			DESCRIPTION => JobGraph::Job::Description->new({
				Test::TestObjects->get_testobject_JobGraph_Description->[0]
			}),
			
			LOG => 'anything',
			
			CODE => sub {
				return 'anything';
			}
		},
	];
}

sub get_testobject_JobGraph_IO {
	return [
		{
			NAME         => 'anything',
			SOURCE       => 'anything',
		},
	];
}

sub get_testobject_JobGraph_Input {
	return [
		{
			NAME         => 'anything',
			SOURCE       => 'anything',
		},
	];
}

sub get_testobject_JobGraph_Output {
	return [
		{
			NAME         => 'anything',
			SOURCE       => 'anything',
		},
	];
}

sub get_testobject_JobGraph_Description {
	return [
		{
			HEADER     => 'anything {{var1}} anything {{var2}}',
			ABSTRACT   => 'anything',
			TEXT       => 'anything',
			VARIABLES  => {
				'var1' => 'value for var1',
				'var2' => 'value for var2',
			},
		},
	];
}

1;
