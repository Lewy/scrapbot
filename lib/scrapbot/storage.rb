require 'uri'
require_relative 'git'

module Scrapbot
  class Storage

    attr_accessor :magazine, :repository

    def initialize
      self.magazine = []
      self.repository = Git.new
      repository.init
    end

    def save_all
      self.magazine.each do |r|
        repository.find_branch("master")
        repository.create_branch(filename(r))
      end

      self.magazine.each do |response|
        repository.find_branch(filename(response))
        File.open(save_path(response),'wb') do |f|
          f.write(response.body)
        end
        repository.push("Correcly added new version of #{filename(response)}")
      end
    end

    private

    def save_path(response)
      File.join(Settings[:path_to_git],"#{filename(response)}.html")
    end

    def filename(response)
      URI.parse(response.effective_url).host
    end

  end
end

#require 'grit'
#include Grit
#r = Repo.new("/home/lewy/programowanie/projekty/downloads")