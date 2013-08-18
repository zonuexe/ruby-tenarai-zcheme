Tenarai::Zcheme
===============

A wicked "[μSchemeR](http://tatsu-zine.com/books/scheme-in-ruby)" implementation.

@zonuexe sed —— <q>全てのRubyist, Schemer, Lisperに殴られる覚悟はできてる</q>

Installation
------------

```bash
git clone git@github.com:zonuexe/ruby-tenarai-zcheme.git
cd ruby-tenarai-zcheme
rake install
```

Usage
-----

```ruby
require 'tenarai/zcheme'
include Tenarai

s = [:*, [:+, 1, 3], 8]
puts Zcheme.eval(s)
# => 32
```

Copyright
---------

 * Copyright (c) 2013 Masahiro Watanabe
 * Copyright (c) 2013 USAMI Kenta

 * [CC BY 3.0](http://creativecommons.org/licenses/by/3.0/deed)

Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
