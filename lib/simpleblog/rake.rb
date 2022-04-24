desc "Install simpleblog basic structure"
task :"simpleblog:install" do
  Dir.mkdir("app/posts") unless Dir.exist?("app/posts")

  copy_template_file("app/posts/posts.yml")
  copy_template_file("app/posts/1.md")
  copy_template_file("app/posts/2.md")

  copy_template_file("app/controllers/blog_controller.rb")
  copy_template_file("app/controllers/home_controller.rb")

  Dir.mkdir("app/views/blog") unless Dir.exist?("app/views/blog")
  Dir.mkdir("app/views/home") unless Dir.exist?("app/views/home")

  copy_template_file("app/views/blog/index.html.erb")
  copy_template_file("app/views/blog/show.html.erb")
  copy_template_file("app/views/home/index.html.erb")
  copy_template_file("app/views/layouts/application.html.erb")

  Dir.mkdir("app/assets/stylesheets/layouts") unless Dir.exist?("app/assets/stylesheets/layouts")

  copy_template_file("app/assets/stylesheets/blog.scss")
  copy_template_file("app/assets/stylesheets/rouge.scss.erb")
  copy_template_file("app/assets/stylesheets/layouts/application.scss")

  copy_template_file("app/helpers/blog_helper.rb")

  copy_template_file("config/routes.rb")
end

def copy_template_file(path)
  gem_path = File.dirname(__dir__)

  if File.exist?(path)
    $stdout.puts "#{path} already exist. Do you want to override? (y/n) default: y"
    input = $stdin.gets.chomp

    return if input == "n"

    p "Overriden: #{path}"
  else
    p "Created: #{path}"
  end

  copy_file("#{gem_path}/simpleblog/template/#{path}", path)
end
