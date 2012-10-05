# POD documentation - main docs before the code

=head1 NAME

JobGraph::Job::Output - Abstract class for the output of a job

=head1 SYNOPSIS

    # Should not be instantiated but if it was the fields it supports are 
    my $output = JobGraph::Job::Output->new({
        NAME      => 'A name',
        SOURCE    => 'An output source eg. file, database table, etc',
    });

=head1 DESCRIPTION

    Implements and defines methods that need to be present in all derived classes that handle the output
    of a job

=cut

# Let the code begin...

package JobGraph::Job::Output;
use strict;

use base qw(_Initializable);

sub _init {
	my ($self,$data) = @_;
	
	$self->set_name($$data{NAME});
	$self->check_and_set_source($$data{SOURCE});
	
	return $self;
}

#######################################################################
########################   Attribute Setters   ########################
#######################################################################
sub set_name {
	my ($self,$value) = @_;
	$self->{NAME} = $value if defined $value;
}

sub check_and_set_source {
	my ($self, $value) = @_;
	
	if (defined $value and $self->source_is_appropriate($value)) {
		$self->{SOURCE} = $value;
	}
}

#######################################################################
############################   Accessors  #############################
#######################################################################
sub name {
	my ($self) = @_;
	return $self->{NAME};
}

sub source {
	my ($self) = @_;
	return $self->{SOURCE};
}

#######################################################################
#########################   General Methods   #########################
#######################################################################
sub source_is_appropriate {
	my ($self, $value) = @_;
	
	unless ($value->isa('JobGraph::Data')) {
		die "Data source object $value does not implement JobGraph::Data\n";
	}
}

#######################################################################
########################   Abstract Methods   #########################
#######################################################################
sub type {
	my ($self) = @_;
	
	my $class = ref($self) || $self;
	if ($class eq __PACKAGE__) {
		return undef;
	}
	else {
		die "Error: Undefined Abstract Method \"".(caller(0))[3]."\" used by $class\n";
	}
}

sub clean {
	my ($self) = @_;
	
	my $class = ref($self) || $self;
	if ($class eq __PACKAGE__) {
		return undef;
	}
	else {
		die "Error: Undefined Abstract Method \"".(caller(0))[3]."\" used by $class\n";
	}
}

sub start_devel_mode {
	my ($self) = @_;
	
	my $class = ref($self) || $self;
	if ($class eq __PACKAGE__) {
		return undef;
	}
	else {
		die "Error: Undefined Abstract Method \"".(caller(0))[3]."\" used by $class\n";
	}
}

sub stop_devel_mode {
	my ($self) = @_;
	
	my $class = ref($self) || $self;
	if ($class eq __PACKAGE__) {
		return undef;
	}
	else {
		die "Error: Undefined Abstract Method \"".(caller(0))[3]."\" used by $class\n";
	}
}

sub is_devel_mode_on {
	my ($self) = @_;
	
	my $class = ref($self) || $self;
	if ($class eq __PACKAGE__) {
		return undef;
	}
	else {
		die "Error: Undefined Abstract Method \"".(caller(0))[3]."\" used by $class\n";
	}
}

1;
