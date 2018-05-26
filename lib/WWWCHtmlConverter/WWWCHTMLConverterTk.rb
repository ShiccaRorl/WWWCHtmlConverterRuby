# -*- encoding: utf-8 -*-




# ペインドウィンドウ 1
pw1 = TkPanedWindow.new(sashrelief: 'ridge')
pw1.pack(expand: true, fill: 'both')

pw2 = TkPanedWindow.new(sashrelief: 'ridge')
pw2.pack(expand: true, fill: 'both')

# フォントの設定
TkOptionDB.add('*font', 'Takaoゴシック 14')

# 式を格納するオブジェクト
$buffer_1 = TkVariable.new('')
$buffer_2 = TkVariable.new('')

# Entry の生成
lavel_1 = TkLabel.new(text: "WWWC path")
lavel_1.pack(expand: true, fill: 'both')
button_4 = TkButton.new(text: "in",command: proc { load_file_1() })
button_4.pack(expand: true, side: 'right')
text_1 = TkEntry.new(textvariable: $buffer_1)
text_1.pack(expand: true, fill: 'both')
pw1.add(lavel_1)
pw1.add(text_1)
pw1.add(button_4)

# Entry の生成
lavel_2 = TkLabel.new(text: "html path")
lavel_2.pack(expand: true, fill: 'both')
button_5 = TkButton.new(text: "out",command: proc { load_file_2() })
button_5.pack(expand: true, side: 'right')
text_2 = TkEntry.new(textvariable: $buffer_2)
text_2.pack(expand: true, fill: 'both')
pw2.add(lavel_2)
pw2.add(text_2)
pw2.add(button_5)

button_1 = TkButton.new(text: "保  存",command: proc { exit })
button_1.pack(fill: 'both')

button_3 = TkButton.new(text: "実  行",command: proc { exit })
button_3.pack(fill: 'both')

button_2 = TkButton.new(text: "キャンセル",command: proc { exit })
button_2.pack(fill: 'both')

# ファイルの選択
def load_file_1()
  filetype = "{{Item Files} {.dat}}"
  filename = Tk.getOpenFile(filetypes: filetype, initialdir: $path_name)
  if filename != ""
    $path_name = File::dirname(filename)
    p $path_name
    #$image_data = TkPhotoImage.new(file: filename)
    #$label.configure(image: $image_data)
  end
end

# ファイルの選択
def load_file_2()
  filetype = "{{html Files} {.htm}} {{html Files} {.html}} {{All Files} {*}}"
  filename = Tk.getOpenFile(filetypes: filetype, initialdir: $path_name)
  if filename != ""
    $path_name = File::dirname(filename)
    p $path_name
    #$image_data = TkPhotoImage.new(file: filename)
    #$label.configure(image: $image_data)
  end
end

Tk.mainloop




