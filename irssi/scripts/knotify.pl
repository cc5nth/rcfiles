use strict;
use vars qw($VERSION %IRSSI);

use Irssi;
$VERSION = '0.1.1';
%IRSSI = (
    authors     => 'Ken Cao',
    contact     => 'kcao@gmail.com',
    name        => 'knotify',
    description => 'Use kdialog to show who is talking to you, on what IRC Network.',
    url         => 'http://www.epedia.net',
    license     => 'GPLv2',
    changed     => '$Date: 2014-01-17 01:37:13 +0800 (Fri, 17 Jan 2014) $'
);


#--------------------------------------------------------------------
# Private message
#--------------------------------------------------------------------

sub priv_msg {
    my ($server, $msg, $nick, $address) = @_;

    kde_print($server->{chatnet} . " pm from: $nick");
#    kde_print($server->{chatnet} . " pm: $nick: " . $msg);
#    kde_print("-" . Irssi::active_win()->get_active_name() . "-");
#    kde_print("-" . "$nick" . "-");
#    if ( (Irssi::active_win()->get_active_name() eq $nick) ) {
#            kde_print($server->{chatnet} . ": $nick");
#    }
}

#--------------------------------------------------------------------
# Printing hilight's
#--------------------------------------------------------------------

sub hilight {
    my ($dest) = @_;
    if ($dest->{level} & MSGLEVEL_HILIGHT) {
        kde_print($dest->{window}->{active_server}->{chatnet}
                  . ": " . $dest->{target});
    }
}

#--------------------------------------------------------------------
# The actual printing
#--------------------------------------------------------------------

sub kde_print {
    my ($text) = @_;

    # Get the hour and minute from the localtime on the users machine.
    my $hour = (localtime)[2];
    my $minute = (localtime)[1];

    system("kdialog --title 'irssi' --passivepopup '$text - $hour:$minute'");
}

#--------------------------------------------------------------------
# Irssi::signal_add_last / Irssi::command_bind
#--------------------------------------------------------------------

Irssi::signal_add_last("message private", "priv_msg");
Irssi::signal_add_last("print text", "hilight");

#- end
