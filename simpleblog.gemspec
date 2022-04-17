Gem::Specification.new do |s|
  s.name = "simpleblog"
  s.version = "0.0.3"
  s.summary = "Helpers to generate markdown blog pages using Rails"
  s.description = "Create a simple blog that can be edit with markdown"
  s.authors = ["Caroline Salib"]
  s.email = "carolinesalibc@gmail.com"
  s.files = ["lib/simpleblog.rb"]
  s.homepage = "https://rubygems.org/gems/simpleblog"
  s.metadata = {"source_code_uri" => "https://github.com/carolinesalib/simpleblog"}
  s.license = "MIT"

  s.add_runtime_dependency "redcarpet"
  s.add_runtime_dependency "rouge"
end
