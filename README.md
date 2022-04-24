# SimpleBlog - Simple ruby blog

The idea of SimpleBlog is creating a very simple home page and blog using a rails application and markdown files. This way it is super easy to write your posts using markdown on GitHub without even running the project locally, but also customize your blog easily with your Ruby on Rails knowledge.

The intention of this gem is just to share the work I've done for my blog and allow other people to use the same if they want.

## Install

### Pre requisites

* Ruby 3.0.3

Start a fresh rails project.

```shell
rails new my_blog -O -M
cd my_blog
```

Add gem and sass dependency to the project

```shell
bundle add sass-rails
bundle add simpleblog
```

Install template files

```shell
rails simpleblog:install
```

Search for `@author` variable on your `application.html.erb` and add your name to it.

Start the application

```shell
rails s
```

Now just customize as you wish. :)

## Contribute
### Instructions to install this gem locally

```shell
gem build simpleblog.gemspec
gem install ./simpleblog-x.x.x.gem
```

### Instructions to push the gem to rubygems

```shell
gem push simpleblog-x.x.x.gem
```
