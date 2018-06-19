# -*- encoding: utf-8 -*-

config = ""
config = '# -*- encoding: utf-8 -*-

module WWWCHtmlConverter
  class WWWCConfig
    attr_accessor :home_title, :top_home_page, :home_description, :css_theme_path, :www_html_in_path, :www_html_out_path
    def initialize()
      # ホームページタイトル
      @home_title = ""

      # ホームページトップ
      @top_home_page = ""

      # ホームページのdescription
      @home_description = ""

      # CSS Path
      @css_theme_path = "./style.css"

      # WWCのディレクトリ
      @www_html_in_path = ""

      # ｈｔｍｌの作成先
      @www_html_out_path = ""
    end
  end
end
'

# ディレクトリの確認
if Dir.exist?("./WWWCConfig") == false then
  # ディレクトリの作成
  Dir.mkdir('WWWCConfig')
end

if File.exist?("./WWWCConfig/WWWCConfig.rb") == false then
  File.open("./WWWCConfig/WWWCConfig.rb", "w:utf-8") do |f|
    f.puts(config)
  end
else
  require './WWWCConfig/WWWCConfig'
end

