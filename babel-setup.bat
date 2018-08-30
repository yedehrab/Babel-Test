@echo İşlemler tamamlanınca package.json için scriptinizi eklemeyi unutmayın.
@echo off
npm install -g babel-cli babel-register
npm init
npm install babel-preset-env --save-dev
@echo { "presets": [ "env" ] } > .babelrc
mkdir dağıtım && babel index.js -s -d dağıtım
mkdir komutlar && @echo require("babel-register") > komutlar/derleme && @echo require("./../index.js") >> komutlar/derleme
start package.json
@echo off
@echo Babel başarılı bir şekilde kuruldu :). 