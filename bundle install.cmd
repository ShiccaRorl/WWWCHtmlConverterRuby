rem gem�A�b�v�f�[�g
rem call gem update --system
rem call gem update bundler

rem call gem install rubygems-update
rem call update_rubygems
rem call gem update

rem �R�}���h�C���X�g�[��
rem call bundle update
rem call bundle --system

rem bundler�̃C���X�g�[��
rem call gem install bundler

rem gem�t�@�C���쐬
    call gem build WWWCHtmlConverter.gemspec

rem �A�b�v���[�h
rem call gem push WWWCHtmlConverter-0.0.1.gem

rem �����ς��A�b�v���[�h
rem call bundle exec WWWCHtmlConverter GemUPLoder

rem Gem�̃C���X�g�[��
    call gem install WWWCHtmlConverter

	
rem bundle install
call bundle install --path vendor/bundle
call bundle clean
call gem cleanup
	
	
REM otintin.land.waai@gmail.com

pause
