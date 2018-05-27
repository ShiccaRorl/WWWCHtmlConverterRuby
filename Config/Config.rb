# -*- encoding: utf-8 -*-

module WWWCHtmlConverter
  class Config
    attr_accessor :home_title, :top_home_page, :home_description, :css_theme_path
    attr_accessor :www_html_out_path, :www_html_in_path
    def initialize()
      # ホームページタイトル
      @home_title = ""

      # ホームページトップ
      @top_home_page = ""

      # ホームページのdescription
      @home_description = "日々勉強中"

      # CSS Path
      @css_theme_path = "./css"

      # WWCのディレクトリ
      @www_html_in_path = "./../../../../保存ファイル/プログラム/WWWC/ban/"

      # ｈｔｍｌの作成先
      @www_html_out_path = ""
    end
  end
end
