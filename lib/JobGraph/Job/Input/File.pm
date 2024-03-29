# POD documentation - main docs before the code

=head1 NAME

JobGraph::Job::Input::File - Input interface between L<JobGraph::Job> and L<JobGraph::Data::File>

=head1 SYNOPSIS

    # Instantiate
    my $input = JobGraph::Job::Input::File->new({
        NAME     => A name for the input/output object,
        SOURCE   => JobGraph::Data::File,
    });

=head1 DESCRIPTION

    This class serves as an input interface between L<JobGraph::Job> and L<JobGraph::Data::File>
    It implements JobGraph::Job::Input.

=head1 EXAMPLES

    # Get the input type
    $input->type
    
    # Get the filename
    $input->filename
    
=cut

# Let the code begin...

package JobGraph::Job::Input::File;
use strict;

use JobGraph::Data::File;
use JobGraph::Job::Output::File;

use base qw(JobGraph::Job::Input);

sub _init {
	my ($self,$data) = @_;
	
	$self->SUPER::_init($data);
	$self->create_source_from_filename($$data{FILENAME});
	
	return $self;
}

#######################################################################
#########################   General Methods   #########################
#######################################################################
sub source_is_appropriate { # Override
	my ($self, $value) = @_;
	
	unless ($value->isa('JobGraph::Data::File')) {
		die "Data source object $value does not implement JobGraph::Data::File\n";
	}
}

sub create_source_from_filename {
	my ($self, $value) = @_;
	
	if (defined $value) {
		$self->{SOURCE} = JobGraph::Data::File->new({
			FILENAME => $value,
		});
	}
}

sub to_output {
	my ($self) = @_;
	
	return JobGraph::Job::Output::File->new({
		SOURCE => $self->source,
	});
}

sub filename {
	my ($self) = @_;
	return $self->source->filename;
}

sub type { # Override
	my ($self) = @_;
	return $self->source->type;
}

1;
