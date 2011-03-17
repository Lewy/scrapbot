require 'uri'
require 'git'

module Scrapbot
  class Storage

    attr_accessor :magazine

    def initialize
      self.magazine = []

    end

    def save_all
      self.magazine.each do |response|
        File.open(save_path(response),'wb') do |f|
          f.write(response.body)
        end
      end
      g = Git.new
      g.init
    end

    private

    def save_path(response)
      filename = URI.parse(response.effective_url).host
      File.join(Settings[:path_to_git],"#{filename}.html")
    end

  end
end

#require 'grit'
#include Grit
#r = Repo.new("/home/lewy/programowanie/projekty/downloads")