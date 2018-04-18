rem gemアップデート
rem call gem update --system
rem call gem update bundler

rem call gem install rubygems-update
rem call update_rubygems
rem call gem update

rem コマンドインストール
rem call bundle update
rem call bundle --system

rem bundlerのインストール
rem call gem install bundler

rem gemファイル作成
    call gem build WWWCHtmlConverter.gemspec

rem アップロード
rem call gem push WWWCHtmlConverter-0.0.1.gem

rem いっぱいアップロード
rem call bundle exec WWWCHtmlConverter GemUPLoder

rem Gemのインストール
    call gem install WWWCHtmlConverter

	
rem bundle install
call bundle install --path vendor/bundle
call bundle clean
call gem cleanup
	
	
REM otintin.land.waai@gmail.com

pause
