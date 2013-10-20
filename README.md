vagrant-aws-ubuntu-lamp
=======================

This is a basic example on how to use [Vagrant](http://www.vagrantup.com) 1.2+, with the vagrant-aws plugin and vagrant-puppet-install, to provision an Amazon EC2 [AWS](http://aws.amazon.com) ubuntu micro instance based VM with the LAMP stack

## Usage

Install using standard Vagrant 1.1+ plugin installation methods. After
installing, `vagrant up` and specify the `aws` provider. Steps below:

```
* $ vagrant plugin install vagrant-aws
...
* $ vagrant plugin install vagrant-puppet-install
...
* $ vagrant up --provider=aws
```

Notice all the AWS environment variables need to be set in your shell session


