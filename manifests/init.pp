class lamp {

  yumrepo { 'mysql-repo':
    ensure    => 'present',
    name      => 'mysql-57',
    descr     => 'MySQL 5.7 Community Server',
    baseurl   => 'http://repo.mysql.com/yum/mysql-5.7-community/el/7/$basearch/',
    gpgkey    => 'http://repo.mysql.com/RPM-GPG-KEY-mysql',
    enabled   => '1',
    gpgcheck  => '1',
    target    => '/etc/yum.repos.d/mysql-community.repo',
  }

  yumrepo { 'remi':
    ensure    => 'present',
    name      => 'remi',
    descr     => 'Remi RPM repository',
    baseurl   => 'http://rpms.remirepo.net/enterprise/7/remi/$basearch/',
    gpgkey    => 'https://rpms.remirepo.net/RPM-GPG-KEY-remi',
    enabled   => '1',
    gpgcheck  => '1',
    target    => '/etc/yum.repos.d/remi.repo',
  }

  yumrepo { 'remi-php73':
    ensure    => 'present',
    name      => 'remi-php73',
    descr     => 'Remi PHP 7.3 RPM repository',
    baseurl   => 'http://rpms.remirepo.net/enterprise/7/php73/$basearch/',
    gpgkey    => 'https://rpms.remirepo.net/RPM-GPG-KEY-remi',
    enabled   => '1',
    gpgcheck  => '1',
    target    => '/etc/yum.repos.d/remi-php.repo',
  }

  package { 'epel-release':
    ensure => installed,
  }

  package { 'httpd':
    ensure => installed,
  }

  service { 'httpd':
    enable => true,
    ensure => 'running'
  }

  package { 'mysql-community-server':
    ensure => installed,
  }

  service { 'mysqld':
    enable => true,
    ensure => 'running'
  }

  $php = [ 'php', 'php-mysql', 'php-curl', 'php-zip', 'php-mbstring', 'php-gd', 'php-cli', 'php-fpm' ]
  package { $php: ensure => 'installed' }

  service { 'php-fpm':
    enable => true,
    ensure => 'running'
  }

}
