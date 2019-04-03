#require_relative "../config/environment.rb"
require 'bundler'
Bundler.require

module Concerns
  
  module Findable
  
  def find_by_name(song_name)
    self.all.detect {|song|songs.name == song_name}
  end
  
  def find_or_create_by_name(song_name)
    find_by_name(song_name) || create(song_name)
  end

end
end


require_all 'lib'
