#!/bin/bash

declare -a extensions=(
    public.plain-text
    public.source-code
    public.unix-executable
    public.data
    public.html

    .adl
    .aspx
    .atom
    .bash
    .bat
    .bzl
    .c
    .c++
    .cc
    .cfg
    .cl
    .cmake
    .coffee
    .cpp
    .css
    .csv
    .cxx
    .d
    .diff
    .dtd
    .ejs
    .el
    .elm
    .erb
    .fish
    .go
    .gradle
    .groovy
    .h
    .h++
    .haml
    .hh
    .hpp
    .hs
    # .htm
    # .html
    .hxml
    .hxx
    .ini
    .java
    .js
    .json
    .jsp
    .jsx
    .kt
    .less
    .lhs
    .lisp
    .lm
    .m
    .markdown
    .md
    .mk
    .mkd
    .mm
    .patch
    .php
    .php3
    .php4
    .php5
    .phtml
    .pl
    .plist
    .pm
    .properties
    .proto
    .py
    .pyw
    .rb
    .rss
    .rst
    .sas
    .sass
    .scala
    .scss
    .sh
    .spec
    .sql
    .svg
    .swift
    .tcl
    .text
    .textile
    .toml
    .tpl
    .ts
    .tsv
    .tsx
    .txt
    .vb
    .vbs
    .vhd
    .vhdl
    .xml
    .xsd
    .xsl
    .yaml
    .ym
    .yml
)

pwd=`pwd`

# Loop through each extension and set Sublime Text 4 as the default
for ext in "${extensions[@]}"; do
    duti -s com.sublimetext.4 "$ext" all
done

# Sublime 4 Config
ln -sf "$pwd/.sublime/Preferences.sublime-settings" "$HOME/Library/Application Support/Sublime Text/Packages/User/Preferences.sublime-settings"
# ln -sf "/usr/local/Cellar/openssl@1.1/1.1.1o/lib/libcrypto.dylib" "/usr/local/lib/"
