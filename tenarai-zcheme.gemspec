# coding: utf-8

(lib = (File.expand_path '../lib', __FILE__))
($LOAD_PATH.unshift lib unless ($LOAD_PATH.include? lib))
(require 'tenarai/zcheme/version')

(Gem::Specification.new do |spec|
   (spec.name          = "tenarai-zcheme")
   (spec.version       = Tenarai::Zcheme::VERSION)
   (spec.authors       = ["USAMI Kenta"])
   (spec.email         = ["tadsan@zonu.me"])
   (spec.description   = "")
   (spec.summary       = "")
   (spec.homepage      = "")
   (spec.license       = "CC BY 3.0")

   (spec.files         = (`git ls-files`.split $/))
   (spec.executables   = (spec.files.grep %r(^bin/) do |f| (File.basename f) end))
   (spec.test_files    = (spec.files.grep %r{^(test|spec|features)/}))
   (spec.require_paths = ["lib"])

   (spec.add_development_dependency "bundler", "~> 1.3")
   (spec.add_development_dependency "rake")
end)
