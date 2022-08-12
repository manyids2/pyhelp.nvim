# pyhelp

Connecting sphinx to code, so commentary can be kept separate. Help should be
as easy to use as neovim's native help, esp wrt copying example usage, checking
flags, etc.

## Assumed structure

`tests` and `docs` mirror file structure of `lib`.

```
<project_name>

  - .git
  - README.md

  - <lib_name>

    - __init__.py
    - <topfile1>.py
    - <topfile2>.py
    - ...
    - <module1>
      - __init__.py
      - <file1>.py
      - <file2>.py
    - <module2>
      - ...
    - ...

  - tests

    - test_<topfile1>.py
    - test_<topfile2>.py
    - <module1>
      - test_<file1>.py
      - test_<file2>.py
    - <module2>
      - ...
    - ...

  - docs

    - source
      - conf.py
      - index.md
      - <topfile1>.md
      - <topfile2>.md
      - <module1>
        - index.md
        - <file1>.md
        - <file2>.md
      - <module2>
        - index.md

    - build
      - html
        - index.html
        - ...
      - ...
```

## General rants

Software code can be divided into

- config -> Loosely, the state of the program as object, including methods, etc.
- script -> Simple programatic manipulations of config
- code -> Actual atoms of the program
- docs -> Semantic understanding of the code
- tests -> Alignment of semantics, syntax and usage

By this definition, we understand some frustration and power of:

- boilerplate -> code that is actually config
- comments -> code that is actually docs
- doctest -> docs that is actually tests
- makefile, cmake -> script that usually is fine being just a config
- rcfiles -> config that can be powerful if it can be scripted/coded

In order of powerfulness, openness of software to hacking:

- simple -> config can be set - e.g. `word`, `excel`
- configurable? -> config can be scripted - e.g. `fish`, `macros`, `tex`
- extensible? -> config can be coded - e.g. `blender`, `visidata`, `datasette`
- native? -> everything is code - e.g. `neovim`, `emacs`
