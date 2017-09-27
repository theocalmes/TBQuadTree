Pod::Spec.new do |s|
	s.name		= "TBQuadTree"
	s.version	= "0.0.2"
	s.summary 	= "Quad tree data structure build in C."
	s.homepage	= "https://github.com/thoughtbot/TBQuadTree.git"
	s.license	= 'MIT'
	s.author 	= {"Theodore Calmes" => "theo@thoughtbot.com"}
	s.source    = { 
    	:git => "https://github.com/thoughtbot/TBQuadTree.git",
    	:tag => "0.0.2"
  	}
  	s.source_files = 'TBQuadTree/**/*.{m,h}'
	s.requires_arc = true
end
