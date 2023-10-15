# Usage

In order to use Code Block Plus in your book the script and stylesheet must be
included in your project. Depending on the location of these files within your
project directory following lines need to be added or modified in your `book.toml`
configuration file.

```toml,filepath=book.toml,icon=gear
# ...
[output.html]
additional_css = ["theme/codeblockplus.css"]
additional_js = ["scripts/codeblockplus.min.js"]
```

After that your code block's appearance should be changed in a way that they have
a header with the name of the language you specified. So this does not apply to
code blocks where no language is specified.

```admonish tip
While code blocks often accept a short variant of the name, it is a good idea to
go with the longer one so readers can identify the language better. The syntax
is not affected by such changes. For example `js` and `javascript` both use the
JavaScript highlighter.
```


## Customization

### Add an Icon

You can add [Font Awesome icons](https://fontawesome.com/v4/icons/) to the code
block headers. Sadly mdBook uses version 4 which does not have many icons of
programming languages.

A workaround is planned for using Font Awesome 5 _and_ custom SVGs.

````markdown
```html,icon=html5
<p>Hello World!</p>
```
````

This code block uses the icon named [`html5`](https://fontawesome.com/v4/icon/html5)
which reneders like below:

```html,icon=html5
<p>Hello World!</p>
```


### Overriding or Setting the Language

Code Block Plus takes the language specified in the code block but can be overriden
(or set when no language is specified) by using the `lang` class.

````markdown
```python,lang=MOJO
def greet(name: str) -> str:
    print(f"Hello {name}")
```
````

The above renders as below:

```python,lang=MOJO
def greet(name: str) -> str:
    print(f"Hello {name}")
```

If you want to fully remove the header while remaining the syntax highlighting, then
do the following:

````markdown
```python,lang=none
def greet(name: str) -> str:
    print(f"Hello {name}")
```
````

This will render as familar:

```python,lang=none
def greet(name: str) -> str:
    print(f"Hello {name}")
```


### Including a file path

A file path can be specified to give the user an idea of which file is beeing talked
about. This can be approached by setting the `filepath` class.

````markdown
```toml,filepath=app/config.toml
[controls]
jump = 0
left = 4
right = 6
duck = 1
```
````

The rendered result is:

```toml,filepath=app/config.toml
[controls]
jump = 0
left = 4
right = 6
duck = 1
```


### Everything combined

````markdown,filepath=src/some_chapter.md
```html,filepath=path/to/file.html,icon=html5,lang=MEGAHTML,hidelines=%
%<html>
%<body>
<p>hi</p>
%</body>
%</html>
```
````

As you can see above,
[built-in classes](https://rust-lang.github.io/mdBook/format/mdbook.html#mdbook-specific-features)
such as `hidelines` can still be used. In this case the "view" button on the top
right of the code block below can be toggled.

```html,filepath=path/to/file.html,icon=html5,lang=MEGAHTML,hidelines=%
%<html>
%<body>
<p>hi</p>
%</body>
%</html>
```
