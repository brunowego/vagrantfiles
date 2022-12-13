env_file = File.expand_path '../.env', __dir__

if File.exist? env_file
  begin
    require 'dotenv'

    Dotenv.load env_file
  rescue LoadError
    puts 'Failed attempting to load `dotenv` gem from within Vagrant.'
    puts 'Please install this explicitly by running:'
    puts 'vagrant plugin install dotenv'
    exit
  end
end
