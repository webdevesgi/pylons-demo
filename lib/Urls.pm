package Urls;

use Connexion;
use warnings;
use Data::Dumper;

sub new { bless {}, shift }

sub getUrls {
  my ($self, $user) = @_;
  my $z;

  my $dbh = Connexion->new();

  my $t = $dbh->prepare("SELECT url_origin, url_short, clics, id FROM urls WHERE name = '$user' ");
  $t->execute();

  my @return;

  $z = $t->fetchall_hashref('id');
  return $z;
  #my $i = 0;
  #while ($row = $t->selectall_hashref()) {
  #  $return[$i] = $row
  #  $i+1s;
  #}

  #return $return;

}

sub addUrl {
  my ($self, $user, $orig_url, $short_url) = @_;

  my $dbh = Connexion->new();

  my $t = $dbh->prepare("INSERT INTO urls(name, url_short, url_origin) VALUES ('$user', '$short_url', '$orig_url') ");
  $t->execute();
}

1;