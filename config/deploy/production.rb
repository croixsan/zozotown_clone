server '13.114.9.54', user: 'ec2-user', roles: %w{app db web}

set :ssh_options, {
keys: [File.expand_path('~/.ssh/id_rsa.pem)')]
}
