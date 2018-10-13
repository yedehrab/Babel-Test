### Gerekli paketlerin kurulumu

```CMD
npm install - g babel-cli 
npm install babel-register babel-preset-env --save-dev
```

> ---
> Global olarak babel consol komutlarını ve işleyicisini ekler.
> * babel-cli: Konsoldan "babel" ile başlayan komutlara izin verir. (Global olarak kurulması gerekmekte)
> * babel-register: NPM üzerinden require ile babel modüllerine erişimi sağlar.
> * babel-preset-env: ES5'i derlemek için kullanılır.
> ---

### Babel yapılandırma dosyasını oluşturma

```CMD
@echo {"presets":[["env",{"targets":{"edge":"17","firefox":"60","chrome":"67","safari":"11.1","node":"current"}}]]} > .babelrc
```

>  **Bu işlem oluşturulması istenen dizinde yapılmalıdır.**
> Babelrc dosyası belli ayarlarla oluşturur. Targets kısmı silinebilir. (Hedeflenen tarayıcıyı ifade etmektedir.) 

### Gerekli dosya ve klasörleri oluşturma (Windows)

```CMD
mkdir dist & babel index.js -s -d dist
```
> **(İsteğe Bağlı)** Bu kod ile çıktılar "dist" adlı klasöre kaydedilir. 

```CMD
mkdir bin & @echo require("babel-register") > bin/dev && @echo require("./../index.js") >> bin/dev
```

> "bin" isminde klasör açıp içine "dev" dosyası açıyoruz

> Not: Bu kısımdaki "bin/dev" ile diğer adımdaki işlem yapılmaktadır.

### Package.json dosyası oluşturma

```CMD
npm init
```

> Bu işlem oluşturulması istenen dizinde yapılmalıdır.

### Son adım "package.json" düzenleme

```JSON
"scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "start": "node bin/dev",
    "build": "mkdir dist & babel index.js -s -d dist",
    "clean": "rd /s /q dist",
    "rebuild": "npm run clean & npm run build"
  }
```
> package.json dosyası içindeki script kısmı yerine bunlar yazılır. ("dist" örnek amaçlı klasör ismidir.) (win10)

### Derleme işlemi

```NPM
npm run start
```
> Bu komut ile, package.json'daki start scriptimiş çalışmış oluyor. Yani program derlenmiş oluyor.
