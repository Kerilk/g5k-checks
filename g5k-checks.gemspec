Gem::Specification.new do |s|
  s.name        = 'g5k-checks'
  s.version     = '0.4.14'
  s.licenses    = ['CeCILL-B']
  s.summary     = "Hardware verification tool for Grid'5000"
  s.description = "g5k-checks verifies that a node is matching its Grid'5000 Reference API description"
  s.authors     = ["Grid'5000"]
  s.email       = 'users@grid5000.fr'
  s.files       = Dir.glob("{bin,conf,lib}/**/*")
  s.executables = ["g5k-checks"]
  s.homepage    = 'https://github.com/grid5000/g5k-checks'
end
