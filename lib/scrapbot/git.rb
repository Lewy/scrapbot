require 'fileutils'

module Scrapbot

  # Little git wrapper

  class Git
    include FileUtils

    attr_accessor :path_to_git

    def initialize
      self.path_to_git = Settings[:path_to_git]
    end

    def init

      unless File.directory?(git_directory)
        cd self.path_to_git
        `git init`
        add_all
        commit("Initial commit.")
      end
    end

    def add_all
      `git add .`
    end

    def commit(msg)
      `git commit -am #{msg}`
    end
    
    private
    
    def git_directory
      File.join(self.path_to_git + ".git")
    end

  end
end