use strict;
use vars qw($VERSION %IRSSI);

use Irssi;
$VERSION = '0.1.1';
%IRSSI = (
    authors     => 'Ken Cao',
    contact     => 'kcao@gmail.com',
    name        => 'gnotify',
    description => 'Use notify-send to show who is talking to you, on what IRC Network.',
    url         => 'http://www.epedia.net',
    license     => 'GPLv2',
    changed     => '$Date: 2014-01-17 01:37:13 +0800 (Fri, 17 Jan 2014) $'
);

#--------------------------------------------------------------------
# Based on osd.pl 0.3.3 by Jeroen Coekaerts, Koenraad Heijlen
# http://www.irssi.org/scripts/scripts/osd.pl
#--------------------------------------------------------------------

#--------------------------------------------------------------------
# Private message parsing
#--------------------------------------------------------------------

sub priv_msg {
    my ($server, $msg, $nick, $address) = @_;
    notify_send($server->{chatnet} . " pm from: $nick");
}

#--------------------------------------------------------------------
# Printing hilight's
#--------------------------------------------------------------------

sub hilight {
    my ($dest) = @_;
    if ($dest->{level} & MSGLEVEL_HILIGHT) {
        notify_send($dest->{window}->{active_server}->{chatnet}
                      . ":"
                      . $dest->{target});
    }
}

#--------------------------------------------------------------------
# The actual printing
#--------------------------------------------------------------------

sub notify_send {
    my ($text) = @_;

    # Get the hour and minute from the localtime on the users machine.
    my $hour = (localtime)[2];
    my $minute = (localtime)[1];

    system("notify-send 'irssi' '$text - $hour:$minute' "
            . "--icon=dialog-information");
}

#--------------------------------------------------------------------
# Irssi::signal_add_last / Irssi::command_bind
#--------------------------------------------------------------------

Irssi::signal_add_last("message private", "priv_msg");
Irssi::signal_add_last("print text", "hilight");

#- end
