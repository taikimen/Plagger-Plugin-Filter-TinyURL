package Plagger::Plugin::Filter::TinyURL;
use strict;
use warnings;
use 5.00800;
our $VERSION = '0.01';
use base qw( Plagger::Plugin::Filter::Base );
use Encode;
use LWP::Simple qw/get/;
use URI::Escape;

sub init {
	my $self = shift;
	$self->SUPER::init(@_);
}

sub filter {
	
	my ($self,$body ) = @_;
	
	my $count = 0;	
	$count = $body =~ s/(s?https?:\/\/[-_.!~*'()a-zA-Z0-9;\/?:\@&=+\$,%#]+)/&tinyUrl($1)/meg;
	
	return ($count,$body);
	
}

sub tinyUrl{
        my $url = shift;
        $url = get("http://tinyurl.com/api-create.php?url=".uri_escape($url));
        return $url;
}



1;
__END__

=head1 NAME

Plagger::Plugin::Filter::TinyURL -

=head1 SYNOPSIS

  use Plagger::Plugin::Filter::TinyURL;

=head1 DESCRIPTION
Plagger::Plugin::Filter::TinyURL is
Pplugin Filter for plagger, which changes all URL string in the body to TinyURL. 

=head1 AUTHOR

 taikimen<lt>taiki@elem.eco.to<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
