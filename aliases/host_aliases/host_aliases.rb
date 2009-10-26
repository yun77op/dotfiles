#!/usr/bin/env ruby

require "yaml"

begin
  host_aliases = 
    YAML::load_file(File.expand_path(File.join(File.dirname(__FILE__), "host_aliases.yml")))
rescue Errno::ENOENT
  exit
end

exit unless host_aliases.is_a?(Hash)

hosts = []

host_aliases.each_key do |protocol|
  host_aliases[protocol].each_key do |alias_host|
    host = host_aliases[protocol][alias_host]
    hosts << %(alias #{protocol}-#{alias_host}="expect -c 'spawn #{protocol} #{host[:username].to_s}@#{host[:host].to_s}; expect assword: ; send #{'\"' << host[:password].to_s << '\n\"' } ; interact'")
  end
end

puts hosts.join(";")