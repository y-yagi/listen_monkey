# listen\_monkey

This gem provides :monkey: patches for `listen` gem.

### `:recursive` option

**CAUTION: This option works only in Linux.**

Allow to configure watch subdirectories or not. Default is `true`. If specify `false`, `listen` watches only specified a directory.

```ruby
listener = Listen.to("/path/to/dir", recursive: false) { puts "..." }.start
```
