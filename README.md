### Gerekli paketlerin kurulumu

```CMD
npm install -g babel-cli babel-register
```

> ---
> Global olarak babel consol komutlarını ve işleyicisini ekler.
> * babel-cli: Konsoldan "babel" komutlarına izin verir.
> * babel-register: npm üzerinden require ile babel modüllerine erişimi sağlar.
> ---
### Package.json dosyası oluşturma

```CMD
npm init
```

> Bu işlem oluşturulması istenen dizinde yapılmalıdır.

### Node için babel modülleri oluşturma

 ```CMD
 npm install babel-preset-env --save-dev
 ```
> Bu işlem oluşturulması istenen dizinde yapılmalıdır.

```CMD
@echo { "presets": [ "env" ] } > .babelrc
```
> Babelrc dosyası oluşturur. 

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

### Hata 

**babel-register not found**

> Bu hata durumunda node_modules adlı klasörü projenize kopyalayın.

### Derleme işlemi

```NPM
npm run start
```
> Bu komut ile, package.json'daki start scriptimiş çalışmış oluyor. Yani program derlenmiş oluyor.
