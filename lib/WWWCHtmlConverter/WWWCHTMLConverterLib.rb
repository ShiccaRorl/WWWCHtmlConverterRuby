# -*- encoding: utf-8 -*-


require "erb"
require "thor"

module WWWCHTMLConverter
  # Your code goes here...
  class CommandLine < Thor
    attr_accessor :wwwc
    desc "in_to WWWCのディレクトリ",　"out アウトプットディレクトリ"
    def initialize()
      @wwwc = WWWC.new()
    end

    def in_to(dir_path)
      @wwwc.dir_path_in = dir_path
    end

    def out(dir_path)
      @wwwc.dir_path_out = dir_path
    end
  end

  class WWWCHTMLConverter
    def initialize()
      @commandline = CommandLine.new()
    end
  end

  class WWWC
    attr_accessor :file_path, :dir_path, :dir_path_out, :dir_path_split, :file_name, :dir_list, :item_list
    def initialize()
      @file_path = ""
      @dir_path_in  = ""
      @dir_path_out  = ""
      @dir_path_split = []
      @file_name = ""
      @dir_list = DirList.new(@dir_path)
      @item_list = ItemList.new(@file_path)

    end
  end

  class DirList
    def initialize(dir_path)

    end
  end

  class ItemList
    def initialize(file_path)

    end
  end







  class Link
    def initialize(wwwc_path, html_path)
      if wwwc_path == nil or html_path == nil then
        help()
        return 0
      end

      if Dir::exist?(wwwc_path) == true and Dir::exist?(html_path) == true then

        if File::ftype(wwwc_path) == "directory" then
          p wwwc_path.encode(Encoding::SJIS) + "WWWCのディレクトリではないです".encode(Encoding::SJIS)
          return 0
        end

        if File::ftype(html_path) == "directory" then
          p html_path.encode(Encoding::SJIS) + "Linkのディレクトリではないです".encode(Encoding::SJIS)
          return 0
        end

      end

      @wwwc = WWWC_HTML_Converter.new

      # Item.datのパスを回帰的に取得
      @items = []
      Dir.glob("Item.dat/**/*").each{|dir|
        wwwc = WWWC_HTML_Converter.new
        wwwc.item_date_pach = dir
        p dir.encode(Encoding::SJIS)
      }

      # ディレクトリリスト作成
      @items.each{|wwwc|
        dir_list = Dir::entries()
        dir_list.each{|dir|
          if File::ftype(dir) == true then
            wwwc.dir_list << dir
          end
        }
      }

      @items.each{|wwwc|
        f = File.open(wwwc.item_dat_pach, 'r:SJIS'){|f|
          @source = f.read  # 全て読み込む
        }

      }
    end

    def help()
      p "WWWC_HTML_Converter.exe wwwc_path html_path"
    end
  end

  class Item
    def initiarize()

    end
  end

  class Day
    attr_accessor :day, :daytiem, :title, :log
    def initialize(data)
      @data  = data
      @datetime = ""
      @title = ""
      @log   = ""

      # データが有るかチェックする
      if @data[:Datetime] == nil then
        p "日付無し".encode(Encoding::SJIS)
        @data[:Datetime] = Time.now
      end
      if @data[:Title] == nil then
        p "タイトル無し".encode(Encoding::SJIS)
        @data[:Title] = ""
      end
      if @data[:Log] == nil then
        p "ログ無し".encode(Encoding::SJIS)
        @data[:Log] = ""
      end
      # データをUTP-8に変換
      begin
        p "===================================="
        p "day   :" + @data[:Datetime].strftime("%Y-%m-%d %H:%M:%S (%A)")
        p "title :" + @data[:Title].encode(Encoding::SJIS)
        #p "log " + day[:Log].encode(Encoding::SJIS)
        @data[:Title].encode!("UTF-8")
        @data[:Log].encode!("UTF-8")
      rescue
        p "UTF-8　変換エラー"#.encode(Encoding::SJIS)
      end

      # 改行文字変換
      if @data[:Log] != nil then
        @data[:Log].gsub!(/(\r\n|\r\f\n|\r|\n)/, "</p>\n<p>")
      end

      # データの代入
      @datetime = @data[:Datetime]
      @title = @data[:Title]
      @log   = @data[:Log]

      @data_db = [@datetime, @title, @log]

    end

    def get_data_db()
      return @data_db
    end

    def get_Datetime()
      return @data_db[0]
    end

    def get_day_s()
      return @data_db[0].strftime("%Y-%m-%d")
    end

    def get_Datetime_s()
      return @data_db[0].strftime("%Y-%m-%d %H:%M:%S (%A)")
    end

    def get_tile()
      return @data_db[1]
    end

    def get_log()
      return @data_db[2]
    end
  end

  class Days
    attr_accessor :days
    def initialize(db)
      @db = db
      @days = []

      @db.each{|day_data|
        day = Day.new(day_data)
        @days << day
      }
      @days.sort!{|a, b| b.get_Datetime_s() <=> a.get_Datetime_s() }
    end

    def get_days()
      return @days
    end

    # 重複日付を消したデータ
    def sort_data()

      # 日付だけのデータを作ります
      @days_time = []
      @days.each{|day|
        @days_time << day.get_day_s()
      }
      return @days_time.uniq!
    end
  end

  class Index
    attr_accessor :db, :keywords, :keyword, :css_theme_path, :link, :hiduke, :day, :title
    def initialize()
      # コンフィング
      # main file
      @thml_path = "./../../html/"           # 出力ディレクトリ
      @file_name = "index.html"              # 出力ファイル
      @css_path = "./theme/"           # テーマディレクトリ
      @css_theme = "3minutes"                # テーマ
      @day_hach_path = "./../../html/index/" # コラム出力ディレクトリ
      @day_hach = {}                         # コラムを入れる

      dir_css = Dir.glob('./../../html/theme/*')
      @css_theme = dir_css[rand(dir_css.size)].sub!("./../../html/theme/", "")

      # データベース
      @db_file_name = ARGV[0]
      #@db = Sequel.sqlite(@db_file_name)

      # データベースからデータ取得
      dataset = @db[:index].where(:Private => false).order(:Datetime)
      datas = dataset.all

      @days = Days.new(datas)

      @css_theme_path = @css_path + @css_theme + "/" + @css_theme + ".css"

      moto = []
      Dir.glob("./*.jpg").each{|i| moto << i}
      Dir.glob("./*.png").each{|i| moto << i}
      Dir.glob("./*.gif").each{|i| moto << i}
      #FileUtils.cp(moto, @thml_pach)

      @header   = File.open("./../header.erb").read
      @footer   = File.open("./../footer.erb").read
      @body     = File.open("./../body.erb").read
      @day_body = File.open("./../day_body.erb").read
      @all_body = File.open("./../all_body.erb").read

    end

    def create_body()
      # くっつける

      @htmls = []
      @days.get_days().each{|day|
        html = @header + @body + @footer
        @htmls << [day.get_day_s(), day.get_tile(), html] # くっつける
      }

      @htmls.each{|day_time, tile, body|
        erb = ERB.new(body)
        @htmls << [day_time, tile, erb.result(binding)] # ファイル名とｈｔｍｌの配列
      }
      file_save()
    end

    def day_create_body()
      @days.sort_data().each{|day_s| # 文字列だけのデータ
        @daydata = []
        @days.get_days.each{|day|
          if day_s == day.get_day_s() then
            @daydata << day
          else
            #@daydata << day
          end
          @daydata.sort!{|a, b| a.get_Datetime() <=> b.get_Datetime() }
          @css_path = "./../theme/"
          @css_theme_path = @css_path + @css_theme + "/" + @css_theme + ".css"
          htmls = @header + @body + @footer
          erb = ERB.new(htmls)
          html = erb.result(binding)
          # ファイル書き込み
          begin
            File.write(@thml_path + "index/" + day_s + ".html", html)
          rescue
            p day_s + ".html"
            p "ファイル書き込みエラー".encode(Encoding::SJIS)
          end
        }
      }
    end

    def all_create_body()

      htmls = @header + @all_body + @footer

      erb = ERB.new(htmls)
      html = erb.result(binding)

      # ファイル書き込み
      File.write(@thml_path + @file_name, html)
    end

    def create_html()
      keyword()     # キーワード作成

      p "HTMLデータ作成".encode(Encoding::SJIS)
      #create_body() # html作成
      all_create_body() # 日付ごとのHTML作成
      day_create_body()    # 日付ごとのHTML作成

    end

    def file_save()
      # ファイル書き込み
      @days.get_days.each{|day_name, title, ｈｔｍｌ|
        File.write(@thml_path + @file_name, ｈｔｍｌ)
      }
    end
  end
end

#link = WWWC_HTML_Converter::Link.new(ARGV[0], ARGV[1]) #

