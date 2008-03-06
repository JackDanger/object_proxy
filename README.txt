= ObjectProxy

* http://github.com/JackDanger/object_proxy/tree/master

== DESCRIPTION

ObjectProxy provides a proxied interface to Ruby objects.  It lets you add methods to objects that don't normally support them.

== USAGE

A simple extension to a fixnum:

    fixnum = ObjectProxy.new(1234)
    # => 1234
    fixnum.proxy_class.class_eval do
     define_method :hi_there do
       'Ahoy!'
     end
    end
    # => #&lt;Proc:0x018f58f8&gt;
    fixnum.size
    # => 4
    fixnum.hi_there
    # => Ahoy!

A more complex example where a string is able to update itself from a text file

    class FetchedString < ObjectProxy
      def initialize(target, filename)
        @target = target
        @filename = filename
      end
      
      def update
        @target = File.read(filename)
      end
    end
    
    # write a string into a file
    File.open('/tmp/greeting.txt', 'w') {|f| f.write('welcome')}
    
    string = FetchedString.new('hey there', '/tmp/greeting.txt')
    # => 'hey there'
    string.class
    # => String
    string.update
    # => 'welcome'


== INSTALL:

* sudo gem install object_proxy

== LICENSE:

(The MIT License)

Copyright (c) 2008 FIX

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
