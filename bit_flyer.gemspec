
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "bit_flyer/version"

Gem::Specification.new do |spec|
  spec.name          = "bit_flyer"
  spec.version       = BitFlyer::VERSION
  spec.authors       = ["sohakahori"]
  spec.email         = ["soh.shizuoka@gmail.com"]

  spec.summary       = %q{bitFlyerのAPIに関するgem}
  spec.description   = %q{bitFlyerのAPIに関するgem}
  spec.homepage      = "https://github.com/sohakahori/bit_flyer.git"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "http://test@test.com"

    # spec.metadata["homepage_uri"] = spec.homepage
    # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
    # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'activesupport', '>= 4.0.0'
  spec.add_dependency 'faraday'
  spec.add_dependency 'pry-byebug'
  spec.add_dependency 'pry-doc'

  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
