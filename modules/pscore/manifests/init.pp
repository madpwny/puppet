# This modules pulls and installs the version of powershell core listed in the file source. No user action required.
class pscore {
  file { '/opt/puppet':
    ensure => directory,
  }
  file { '/opt/puppet/sources':
    ensure => directory,
  }
  file { '/opt/puppet/sources/powershell-lts_7.2.2-1.deb_amd64.deb':
    ensure => present,
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///modules/pscore/powershell-lts_7.2.2-1.deb_amd64.deb'
  }
  package { 'powershellcore':
    ensure   => installed,
    provider => dpkg,
    source   => '/opt/puppet/sources/powershell-lts_7.2.2-1.deb_amd64.deb'
  }
}
