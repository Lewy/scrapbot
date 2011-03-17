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
        touch ".gitignore"
        push("Inital commit.")
      end
    end

    def add_all
      cd self.path_to_git
      `git add .`
    end

    def commit(msg)
      cd self.path_to_git
      `git commit -am "#{msg}"`
    end

    def push(msg)
      cd self.path_to_git
      add_all
      commit(msg)
    end

    def find_branch(name)
      cd self.path_to_git
      `git checkout #{name}`
    end

    def create_branch(name)
      cd self.path_to_git
      `git checkout -b #{name}`
    end
    
    private
    
    def git_directory
      File.join(self.path_to_git + ".git")
    end
    
  end
end