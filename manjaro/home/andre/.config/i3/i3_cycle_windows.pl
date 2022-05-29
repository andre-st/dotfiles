#!/usr/bin/env perl

# Original via https://github.com/DavsX/dotfiles/blob/master/bin/i3_cycle_windows
# Modified:
# - Tab-indent and alignments
# - Added --reverse program option


use strict;
use warnings;
use JSON qw[ decode_json ];
use Getopt::Long qw(GetOptions);

my $is_reverse;
GetOptions( 'reverse' => \$is_reverse ) or die( 'Unknown program options' );


my $workspaces         = decode_json( `i3-msg -tget_workspaces` );
my $tree               = decode_json( `i3-msg -tget_tree`       );
my $focused_ws_num     = [ map{ $_->{num} } grep { $_->{focused} } @{ $workspaces } ]->[0];
my $node               = get_active_node( $tree, $focused_ws_num );
my ($ids, $focused_id) = get_leaf_ids   ( $node                  );
 @{ $ids }             = reverse(@{ $ids }) if $is_reverse;
my $next_id            = get_next_id    ( $ids, $focused_id      );



`i3-msg -tcommand '[con_id="$next_id"] focus'`;



sub get_next_id
{
	my ($ids, $focused_id) = @_;
	my $found_current      = 0;
	
	for my $id (@{ $ids })
	{
		return $id if $found_current;
		$found_current = 1 if $id == $focused_id;
	}
	
	return $ids->[0] || $focused_id;
}


sub get_leaf_ids
{
	my ($tree) = @_;
	my @ids    = ();
	my $focused_id;
	my @nodes  = ($tree);
	
	for my $node (@nodes)
	{
		if( @{ $node->{nodes}          }
		or  @{ $node->{floating_nodes} })
		{
			push @nodes, @{ $node->{nodes}          };
			push @nodes, @{ $node->{floating_nodes} };
		}
		elsif( $node->{id} )
		{
			push @ids, $node->{id};
			$focused_id = $node->{id} if $node->{focused};
		}
	}
	
	return ([sort(@ids)], $focused_id);
}


sub get_active_node
{
	my ($tree, $num) = @_;
	my @nodes        = ($tree);
	
	for my $node (@nodes)
	{
		if( defined($node->{num}) and $node->{num} == $num )
		{
			return $node;
		}
		else
		{
			push @nodes, @{ $node->{nodes}          };
			push @nodes, @{ $node->{floating_nodes} };
		}
	}
	
	return {};
}



