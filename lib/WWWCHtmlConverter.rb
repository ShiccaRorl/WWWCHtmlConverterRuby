# -*- encoding: utf-8 -*-

require "WWWCHtmlConverter/version"
require "WWWCHtmlConverter/WWWCHtmlConverterLib"
require 'tk'

module WWWCHtmlConverter

  # Your code goes here...


  def tk()


  end
end

wwwc_html_converter = WWWCHTMLConverter::WWWCHTMLConverter.new


lavel_1 = TkLabel.new(text: "WWWC path")
text_1 = TkEntry.new()

lavel_2 = TkLabel.new(text: "html save path")
text_2 = TkEntry.new()

button_1 = TkButton.new(text: "保存")
button_1.pack

button_2 = TkButton.new(text: "キャンセル")
button_2.pack


Tk.mainloop