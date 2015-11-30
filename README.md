# The Fate generator

The Fate Generator is a character generator website for the [Fate RPG system](http://www.evilhat.com/home/fate-core/).

## Requirements

- Ruby 2.2.1
- NPM (I use [browserify-rails](https://github.com/browserify-rails/browserify-rails] for asset management)

## Bootstrap

- Run `bundle install`
- Config your `config/database.yml` according to `database.yml.example`
- Run `rake db:migrate && rake db:seed`
- Run `npm install`
- Start hacking

## Tests

Run `rspec` to run all tests or `guard` to keep tests running automatically as you change files. Code coverage is done with SimpleCov. A report is generated every time RSpec runs inside `coverage/`

## Licence

The MIT License (MIT)

Copyright (c) 2015 Mountain House

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
