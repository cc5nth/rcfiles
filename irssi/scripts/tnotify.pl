use strict;
use vars qw($VERSION %IRSSI);

use Irssi;
$VERSION = '0.1.1';
%IRSSI = (
    authors     => 'Ken Cao',
    contact     => 'kcao@gmail.com',
    name        => 'knotify',
    description => 'Use log the hilight and priv msg to file, on what IRC Network.',
    url         => 'http://www.epedia.net',
    license     => 'GPLv2',
    changed     => '$Date: 2014-09-27 01:37:13 +0800 (Sat, 27 Sep 2014) $'
);


#--------------------------------------------------------------------
# Private message
#--------------------------------------------------------------------

sub priv_msg {
    my ($server, $msg, $nick, $address) = @_;

    txt_print($server->{chatnet} . " pm from: $nick");
}

#--------------------------------------------------------------------
# Printing hilight's
#--------------------------------------------------------------------

sub hilight {
    my ($dest) = @_;
    if ($dest->{level} & MSGLEVEL_HILIGHT) {
        txt_print($dest->{window}->{active_server}->{chatnet}
                  . ": " . $dest->{target});
    }
}

#--------------------------------------------------------------------
# The actual printing
#--------------------------------------------------------------------

sub txt_print {
    my ($text) = @_;

    # Get the hour and minute from the localtime on the users machine.
    my $hour = (localtime)[2];
    my $minute = (localtime)[1];

    system("echo '$text - $hour:$minute' >> zz_irc_msg.txt");
}

#--------------------------------------------------------------------
# Irssi::signal_add_last / Irssi::command_bind
#--------------------------------------------------------------------

Irssi::signal_add_last("message private", "priv_msg");
Irssi::signal_add_last("print text", "hilight");

#- end
