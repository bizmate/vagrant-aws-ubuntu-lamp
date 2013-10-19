Vagrant.configure("2") do |config|
	config.vm.box = "dummy"
	
  config.vm.provider :aws do |aws, override|
  	aws.access_key_id = ENV["AWS_ROOT_ACCESS_KEY_ID"]
    aws.secret_access_key = ENV["AWS_ROOT_SECRET_ACCESS_KEY"]
    aws.keypair_name = ENV["AWS_KEYPAIR_NAME"]
    aws.ami = ENV["AWS_AMI"]
    aws.security_groups = ["webSSH_Mysql_DEVSecurity"]
    
    aws.instance_type = "t1.micro"
    aws.region = "eu-west-1"
    
    override.ssh.username = "ubuntu"
    override.ssh.private_key_path = ENV["AWS_SSH_PRIVATE_KEY_PATH"]
  end
end