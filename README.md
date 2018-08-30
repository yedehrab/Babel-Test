
```CMD
npm install -g babel-cli babel-register
```

> ---
> Global olarak babel consol komutlarını ve işleyicisini ekler.
> * babel-cli: Konsoldan "babel" komutlarına izin verir.
> * babel-register: npm üzerinden require ile babel modüllerine erişimi sağlar.
> ---

```CMD
npm init
```
> node için package.json oluşturur. (dizine)

 ```CMD
 npm install babel-preset-env --save-dev
 ```
> node modüllerini oluşturur. (dizine)

```CMD
@echo { "presets": [ "env" ] } > .babelrc
```
> Babelrc dosyası oluşturur. 


```CMD
mkdir dağıtım && babel index.js -s -d dağıtım
```
> **(İsteğe Bağlı)** Bu kod ile çıktılar "dağıtım" adlı klasöre kaydedilir. 

```CMD
mkdir komutlar && @echo require("babel-register") > komutlar/derleme && @echo require("./../index.js") >> komutlar/derleme
```

> "komutlar" isminde klasör açıp içine "derleme" dosyası açıyoruz

> Not: Bu kısımdaki "komutlar/derleme" ile diğer adımdaki işlem yapılmaktadır.

```JSON
"scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "start": "node komutlar/derleme",
    "build": "mkdir dağıtım & babel index.js -s -d dağıtım",
    "clean": "rd /s /q dağıtım",
    "rebuild": "npm run clean & npm run build"
  }
```
> package.json dosyası içindeki script kısmı yerine bunlar yazılır. ("dağıtım" örnek amaçlı klasör ismidir.) (win10)

```NPM
npm run start
```
> Bu komut ile, package.json'daki start scriptimiş çalışmış oluyor. Yani program derlenmiş oluyor.
