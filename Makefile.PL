
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'DBI::Profile panel',
  'AUTHOR' => 'Tim Bunce <Tim.Bunce@pobox.com>',
  'BUILD_REQUIRES' => {
    'Test::More' => '0.88'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'Plack-Middleware-Debug-CatalystPluginCache',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Plack::Middleware::Debug::CatalystPluginCache',
  'PREREQ_PM' => {
    'Catalyst::Plugin::Cache' => '0.10',
    'Class::Method::Modifiers' => '1.05',
    'Plack::Middleware::Debug' => '0.10',
    'Plack::Util::Accessor' => '0',
    'Text::MicroTemplate' => '0',
    'parent' => '0'
  },
  'VERSION' => '0.003',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



