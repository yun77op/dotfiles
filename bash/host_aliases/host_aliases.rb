#!/usr/bin/env ruby

require "yaml"

host_aliases = YAML::load_file(File.expand_path(File.join(File.dirname(__FILE__), "host_aliases.yml")))
hosts = []

host_aliases.each_key do |protocol|
  host_aliases[protocol].each_key do |alias_host|
    host = host_aliases[protocol][alias_host]
    hosts << %(alias #{protocol}-#{alias_host}="expect -c 'spawn #{protocol} #{host[:username]}@#{host[:host]}; expect assword: ; send #{'\"' << host[:password] << '\n\"' } ; interact'")
  end
end

puts hosts.join(";")