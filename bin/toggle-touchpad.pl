#!/usr/bin/perl

my $device_id = $ARGV[0];
`xinput list-props ${device_id}` =~ /Synaptics Off \((\d+)\).*(\d)/;
my $param_id = $1;
my $param_status = abs($2 - 1);

system("xinput", "set-prop", $device_id, $param_id, $param_status);
