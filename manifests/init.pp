class jenkins(
  $url            = $fqdn,
  $email_address  = "ci@${domain}",
  $views          = {},
  $slaves         = []
) {
  class { 'jenkins::files':
    url             => $url,
    email_address   => $email_address,
    slaves          => $slaves,
    views           => $views
  }

  include jenkins::files
  include jenkins::package
  include jenkins::service
  include jenkins::user

  Class['jenkins::user'] -> Class['jenkins::package'] -> Class['jenkins::files'] -> Class['jenkins::service']
}
