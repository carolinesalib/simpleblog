Gem::Specification.new do |s|
  s.name = "simpleblog"
  s.version = "1.0.0"
  s.summary = "Helpers to generate markdown blog pages using Rails"
  s.description = "Create a simple blog that can be edit with markdown"
  s.authors = ["Caroline Salib"]
  s.email = "carolinesalibc@gmail.com"
  s.files = Dir.glob("{lib}/**/*")
  s.files += ["simpleblog.gemspec"]
  s.bindir = "exe"
  s.executables = s.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.homepage = "https://rubygems.org/gems/simpleblog"
  s.metadata = {"source_code_uri" => "https://github.com/carolinesalib/simpleblog"}
  s.license = "MIT"

  s.add_runtime_dependency "redcarpet"
  s.add_runtime_dependency "rouge"
end
