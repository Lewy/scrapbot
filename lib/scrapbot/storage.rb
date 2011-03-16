require 'grit'

module Scrapbot
  class Storage

    attr_accessor :magazine

    def initialize
      self.magazine = []
    end

    def save_all
      self.magazine.each do |response|
        File.open(save_path,'wb') do |f|
          f.write(response.body)
        end
      end
    end

    private

      def save_path(response)
        File.join(PATH,"index.html")
      end

  end
end