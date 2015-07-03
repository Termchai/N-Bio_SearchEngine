################ Molecule & Synonym ################
arr_mole_syn = [
	["Interleukin 6","il6","il 6", "il-6"],
	["hist1h1a", "histon h1a", "histh1a", "histone", "h1a", "histones", "h1"],
	["prnp", "prion", "prp", "cd230"],
	["Myoglobin", "mb"],
	["Nuclease S", "nucs"]
]

arr_mole_syn.each do |mole|
	a = Molecule.create(name:mole[0])
	for i in 1..(mole.length-1)
		b = MoleculeSynonym.create(synonym:mole[i])
		a.molecule_synonyms << b
	end
end

################ Sentence ################
arr_sentence = ["interact",
		 "bind",
		 "adjacent",
		 "join",
		 "connect",
		 "against",
		 "attach"]

arr_sentence.each do |s|
	Sentence.create(sen:s)
end

################ Extract Word ################
arr_ext = ["a","are","the","is","of","on",
		 "an","for","has","have","been",
		 "shown","be","begin","with","make",
		 "so","when","to","begin","in","half",
		 "full","it","then","which","upon","see",
		 "factor","site","type","this","that",
		 "only", "contains", "and", "  ","also","termed","design",
		 "from", "as", "/", "protein", "complex", "dna", "between",
		 "determinant","proteins", "exits"]

arr_ext.each do |ext|
	ExtractWord.create(word:ext)
end





	# def query 
	# 	["interleukin 6",
	# 	 "il6",
	# 	 "il 6", 
	# 	 "il-6"]
	# end

	# def self.query 
	# 	["hist1h1a",
	# 	 "histon h1a",
	# 	 "histh1a",
	# 	 "histone", 
	# 	 "h1a",
	# 	 "histones",
	# 	 "h1"]
	# end

	# def self.query 
	# 	["prnp",
	# 	 "prion",
	# 	 "prp",
	# 	 "cd230"]
	# end

	# def self.query 
	# 	["myoglobin",
	# 	 "mb"]
	# end

	# def self.query 
	# 	["nuclease s",
	# 	 "nucs"]
	# end

	# def sentence
	# 	 ["interact",
	# 	 "bind",
	# 	 "adjacent",
	# 	 "join",
	# 	 "connect",
	# 	 "against",
	# 	 "attach"]
	# end

	# def extract_word
	# 	["a","are","the","is","of","on",
	# 	 "an","for","has","have","been",
	# 	 "shown","be","begin","with","make",
	# 	 "so","when","to","begin","in","half",
	# 	 "full","it","then","which","upon","see",
	# 	 "factor","site","type","this","that",
	# 	 "only", "contains", "and", "  ","also","termed","design",
	# 	 "from", "as", "/", "protein", "complex", "dna", "between",
	# 	 "determinant","proteins", "exits"]
	# end