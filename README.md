# Nodejs Babel Kurulumu <!-- omit in toc -->

Babel, es6 kodlama formatını tarayıcılarda kullanabilmemizi sağlar

## İçerikler <!-- omit in toc -->

- [Gerekli paketlerin kurulumu](#gerekli-paketlerin-kurulumu)
- [Babel Yapılandırması](#babel-yap%C4%B1land%C4%B1rmas%C4%B1)
  - [Babel Derleyici Yapılandırmasını Oluşturma](#babel-derleyici-yap%C4%B1land%C4%B1rmas%C4%B1n%C4%B1-olu%C5%9Fturma)
  - [Babel Derleme Araçlarını Yapılandırma](#babel-derleme-ara%C3%A7lar%C4%B1n%C4%B1-yap%C4%B1land%C4%B1rma)
- [Package.json Yapılandırma](#packagejson-yap%C4%B1land%C4%B1rma)
  - [Packege.json Oluşturma](#packegejson-olu%C5%9Fturma)
  - [Package.json Scriptlerini Oluşturma](#packagejson-scriptlerini-olu%C5%9Fturma)
    - [Build Script Yapısı](#build-script-yap%C4%B1s%C4%B1)
- [Programı Derleme İşlemi](#program%C4%B1-derleme-i%CC%87%C5%9Flemi)
- [Yazar](#yazar)

## Gerekli paketlerin kurulumu

Global olarak babel consol komutlarını ve işleyicisini ekler.

```CMD
npm install -g babel-cli
npm install babel-register babel-preset-env --save-dev
```

- `babel-cli` Konsoldan "babel" ile başlayan komutlara izin verir
  - Global olarak kurulması gerekmekte
- `babel-register` NPM üzerinden require ile babel modüllerine erişimi sağlar
- `babel-preset-env` ES5'i derlemek için kullanılır

## Babel Yapılandırması

> Bu adım ve sonrasındaki işlemler projenin (index.js) dizininde yapılmalıdır

### Babel Derleyici Yapılandırmasını Oluşturma

Babelrc dosyası belli ayarlarla oluşturma

```CMD
@echo {"presets":[["env",{"targets":{"edge":"17","firefox":"60","chrome":"67","safari":"11.1","node":"current"}}]]} > .babelrc
```

> `targets` isteğe bağlıdır. Hedeflenen tarayıcıları gösterir.

### Babel Derleme Araçlarını Yapılandırma

Tools dizini oluşturup, içindeki dosyaya derleme parametrelerini yazıyoruz.

```CMD
mkdir tools & @echo require("babel-register") > tools/dev && @echo require("./../index.js") >> tools/dev
```

> Not: Bu kısımdaki "tools/dev" ile diğer adımdaki işlemler yapılmaktadır.

## Package.json Yapılandırma

### Packege.json Oluşturma

```CMD
npm init
```

> Bu işlem oluşturulması istenen dizinde yapılmalıdır.

### Package.json Scriptlerini Oluşturma

`package.json` dosyası içerisindeki script kısmında alttakiler eklenir.

```json
"scripts": {
    "test": "node test",
    "start": "node dist/index.js",
    "dev": "node tools/dev",
    "build": "mkdir dist & babel *.js lib/*.js -s -d dist & xcopy public dist\\public /s /i /e /y",
    "build:db": "mkdir dist & babel *.js lib/*.js -s -d dist & xcopy public dist\\public /s /i /e /y & xcopy database dist\\database /s /i /e /y",
    "build:start": "npm run build & npm run start",
    "clean": "xcopy dist\\database database /s /i /e /y & rd /s /q dist",
    "clean:all": "rd /s /q dist",
    "rebuild": "npm run clean & npm run build",
    "rebuild:db": "npm run clean & npm run build:db"
}
```

#### Build Script Yapısı

- `mkdir dist` Dist adlı klasör oluşturulur
- `babel [her bir js dosyasının yolu] -s -d dist` Javasciprt dosyaları es5 tipinde düzenlenip dist içine atılır
- `xcopy [klasör] dist\\[klasör] /s /i /e /y` Dinamik veri tutan klasörler varsa dist içine kopyalanır

## Programı Derleme İşlemi

Package.json dosyasındaki scriptleri çalıştırma

```NPM
npm run-script [script]
```

- `[script]` scripts içindeki isimler; start, dev, build

## Yazar

Yunus Emre

- [Github](https://github.com/yedehrab)
- [Gitlab](https://gitlab.com/yedehrab)
