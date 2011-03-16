require_relative 'storage'

module Scrapbot
#  This class is responsible for downloading page
  class Downloader
    attr_accessor :urls
    
    def initialize(urls)
      self.urls = urls
    end

    def start
      s = Storage.new

      urls_list do |response|
        s.magazine << response
      end
      
      s.save_all
    end

  private

    def urls_list(&block)
      self.urls.each do |url|
        yield Typhoeus::Request.get(url)
      end
    end
  end


#  module Downloader

#    def archive(urls = [],options = {})
#      #      This method download given urls
#      urls.each do |url|
#        response = Typhoeus::Request.get(url)
#        Storage.new(response).save
#      end
#    end
#
#
#    # Create or switch to branch named response.effective_url
#    # Grit::Repo(path_to_repo)
#
#
#    class Storage
#      attr_accessor :response
#
#      def initialize(typh_url)
#        self.response = typh_url
#      end
#
#      def save
#
#      end
#
#      private
#
#      def find_or_create_branch
#
#      end
#    end
#  end
end