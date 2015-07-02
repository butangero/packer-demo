#!/bin/bash
set -x

puppet_source='https://url.to.puppet.repo/puppet-testing.git'
repo_dir='/etc/puppet'
git=/usr/bin/git
puppet=/usr/bin/puppet

yum -y install http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm

yum -y install puppet git

rm -rf $repo_dir
$git clone $puppet_source $repo_dir

pushd $repo_dir

$puppet apply --pluginsync --hiera_config /etc/puppet/hiera.yaml /etc/puppet/site.pp
