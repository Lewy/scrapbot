

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
end