
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "task/version"

Gem::Specification.new do |spec|
  spec.name          = "task"
  spec.version       = Task::VERSION
  spec.authors       = ["sumiyoshi"]
  spec.email         = ["shimeji9@gmail.com"]

  spec.summary       = %q{Task management tool}
  spec.description   = %q{Task managements your todos.}
  spec.homepage      = "https://github.com/tessai9/task"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "yard", "~> 0.9"
  spec.add_dependency "activerecord", "~> 5.0.0"
  spec.add_dependency "sqlite3", "~> 1.3.0"
end
