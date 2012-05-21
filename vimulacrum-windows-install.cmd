@if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
@if not exist "%HOME%" @set HOME=%USERPROFILE%

@set BASE_DIR=%HOME%\.vimulacrum
call git clone --recursive git://github.com/kelsey/vimulacrum.git %BASE_DIR%
call mkdir %BASE_DIR%\.vim\bundle
call mkdir %BASE_DIR%\.vim\backups
call mkdir %BASE_DIR%\.vim\undos
call mkdir %BASE_DIR%\.vim\swaps
call mklink /J %HOME%\.vim %BASE_DIR%\.vim
call mklink %HOME%\.vimrc %BASE_DIR%\.vimrc
call mklink %HOME%\_vimrc %BASE_DIR%\.vimrc

call git clone http://github.com/gmarik/vundle.git %HOME%/.vim/bundle/vundle
