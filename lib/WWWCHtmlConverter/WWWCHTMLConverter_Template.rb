# -*- encoding: utf-8 -*-

header = ""
header = '<!doctype html>
<html><head>
  <meta charset = "utf-8">
  <meta name="name" content="content">
  <meta http-equiv="Content-Style-Type" content="text/css">
  <meta http-equiv="Content-Script-Type" content="text/javascript">
  <meta http-equiv="Last-Modified" content="<%= Time.now().strftime("%Y-%m-%d %H:%M:%S") %> GMT">
  <meta name="keywords" content="<%= @keyword %> ">
  <meta name="description" content="<%= @config.home_description %>">
  	<link rel="stylesheet" href="theme/base.css" type="text/css" media="all">
	<link rel="stylesheet" href="<%= @config.css_theme_path %>" title="<%= @config.home_title %>" type="text/css" media="all">
  <title><%= @config.home_title %></title>

    <style type="text/css">

    </style>

</head>

<body>
<a href="<%= @config.top_home_page %>"><h1 style="text-align: center"><%= @config.home_title %></h1></a>
<hr>
'

body = ""
body = '

'


footer = ""
footer = '
</body>
<hr>
<p style="text-align: center"><%= Time.now.strftime("%Y-%m-%d %H:%M:%S (%A)") %></p>
</html>
'



# ディレクトリの確認
if Dir.exist?("./WWWCConfig/template") == false then
# ディレクトリの作成
  Dir.mkdir('WWWCConfig/template')
end

# header
if File.exist?("./WWWCConfig/template/header.erb") == false then
    File.open("./WWWCConfig/template/header.erb", "w:utf-8") do |f|
    f.puts(header)
  end
else
  @header   = File.open("./WWWCConfig/template/header.erb").read
end

# footer
if File.exist?("./WWWCConfig/template/footer.erb") == false then
    File.open("./WWWCConfig/template/footer.erb", "w:utf-8") do |f|
    f.puts(footer)
  end
else
  @footer   = File.open("./WWWCConfig/template/footer.erb").read
end

# body
if File.exist?("./WWWCConfig/template/body.erb") == false then
    File.open("./WWWCConfig/template/body.erb", "w:utf-8") do |f|
    f.puts(body)
  end
else
  @body     = File.open("./WWWCConfig/template/body.erb").read
end
