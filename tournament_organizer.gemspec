
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "tournament_organizer/version"

Gem::Specification.new do |spec|
  spec.name          = "tournament_organizer"
  spec.version       = TournamentOrganizer::VERSION
  spec.authors       = ["Rousseau Alexandre"]
  spec.email         = ["contact@rousseau-alexandre.fr"]

  spec.summary       = %q{Organize a tournament.}
  spec.description   = %q{The goal is to make a tournament where all players play each other on differents games in differents rounds (not a the same time, of course..)}
  spec.homepage      = "https://github.com/madeindjs/tournament_organizer"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = ['tournament_organizer']
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
