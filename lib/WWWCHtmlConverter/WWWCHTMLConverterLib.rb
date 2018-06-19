# -*- encoding: utf-8 -*-

require "erb"

module WWWCHtmlConverter
  # Your code goes here...
  class WWWC
    attr_accessor :dir_list
    def initialize()
      @config = WWWCHtmlConverter::WWWCConfig.new()
      @dir_list = []
      self.dir_list(@config.www_html_in_path)
    end

    def dir_kai(arr)
        return 0 if arr.shift.empty? #配列が空のときは終了

        self.dir_kai(arr)
    end

    def dir_list(dir)
      dir = Dir.open(dir)

      dir.each{|file| puts file }

    end
  end

end
