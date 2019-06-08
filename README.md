# listen\_monkey

This gem provides :monkey: patches for `listen` gem.

[![Gem Version](https://badge.fury.io/rb/listen_monkey.svg)](http://badge.fury.io/rb/listen_monkey)
[![Build Status](https://circleci.com/gh/y-yagi/listen_monkey.svg?style=svg)](https://circleci.com/gh/y-yagi/listen_monkey)

### `:recursive` option

**CAUTION: This option works only in Linux.**

Allow to configure watch subdirectories or not. Default is `true`. If specify `false`, `listen` watches only specified a directory.

```ruby
listener = Listen.to("/path/to/dir", recursive: false) { puts "..." }.start
```
