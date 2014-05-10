class jenkins::package {
  include apt

#  file { "/usr/share/jenkins-key":
#    ensure    => file,
#    owner     => "root",
#    group     => "root",
#    mode      => "0644",
#    source    => "puppet:///modules/jenkins/jenkins-ci.org.key",
#  }

  apt::source { 'jenkins':
    location    => 'http://pkg.jenkins-ci.org/debian',
    release     => 'binary/',
    repos       => '',
    key         => 'D50582E6',
    key_source  => 'http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key',
    include_src => false,
  }

  package { 'jenkins':
    ensure    => installed
  }
#
#  exec { "git-plugin" :
#    command   => "/bin/sh -c 'cd /var/lib/jenkins/plugins && wget http://updates.jenkins-ci.org/download/plugins/git/1.1.26/git.hpi'",
#    unless    => "test -f /var/lib/jenkins/plugins/git.hpi",
#    user      => 'jenkins',
#    require   => Package[ 'jenkins' ],
#  } ~>
#  Class['jenkins::service']
}
