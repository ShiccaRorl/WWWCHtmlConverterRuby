# -*- encoding: utf-8 -*-

config = ""
config = '# -*- encoding: utf-8 -*-

module WWWCHtmlConverter
  class Config
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
if Dir.exist?("./Config") == false then
  # ディレクトリの作成
  Dir.mkdir('Config')
end

if File.exist?("./Config/Config.rb") == false then
  File.open("./Config/Config.rb", "w:utf-8") do |f|
    f.puts(config)
  end
else
  require './Config/Config'
end

