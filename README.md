# brix-rails

Brix for Rails gem, make you fast use Brix in you Rails application.

## Requirements

* Rails
* [kissy-rails](https://github.com/huacnlee/kissy-rails)
* SimpleForm
* WillPaginate

## Features

### Helpers

* bx_link_to
* bx_button_to

## Installation

1. Add this line to your Gemfile:

```ruby
gem "kissy-rails"
gem "will_paginate"
gem "simple_form"
gem "brix-rails"


2. Install brix template

```bash
rails g brix:install
```

# And you need remove gem 'jquery-rails'
```

2. Require brix assets in `application.js` and `application.css`

application.js

```js
//= require kissy
//= require kissy_ujs
//= require brix
```

application.css

```css
*= require brix
```

## Usage

Now you can use `bx_xxx` helper method in you Rails views. or write Brix style html



