# Introduction

## Features

- 📱 Optimized for all screen sizes
- 🎨 Optimized for all themes
- 👑 Written in [Nim](https://nim-lang.org/)
- 📦 No additional dependencies required (not even Cargo or Rust)


## Planned

- Map languages to icons in `book.toml`
- Support local SVGs

## Installation

### Quick Install (CLI)

```shell,icon=usd
echo "Enter the path where the JavaScript file should be put in (no trailing slash, period for current directory)" && read path_scripts && echo $(curl -sS https://raw.githubusercontent.com/phoenixr-codes/mdbook-code-block-plus/master/codeblockplus.min.js) > "$path_scripts/codeblockplus.min.js" && echo "Enter the path where the CSS file should be put in (no trailing slash, period for current directory)" && read path_stylehseet && echo $(curl -sS https://raw.githubusercontent.com/phoenixr-codes/mdbook-code-block-plus/master/codeblockplus.css) > "$path_stylesheet/codeblockplus.css"
```


### Manual Installation

- Visit the [repository](https://github.com/phoenixr-codes/mdbook-code-block-plus)
- Download `codeblockplus.min.js`
- Download `codeblockplus.css`
- Move these file into your book directory


### Build Manually

#### Script and Stylesheet

```shell,icon=usd
git clone --depth 1 https://github.com/phoenixr-codes/mdbook-code-block-plus.git
./build
# or: ./build debug
cp codeblockplus.min.js PATH/TO/BOOK
cp codeblockplus.css PATH/TO/BOOK
```

#### Book

```
cd book
mdbook serve
```

