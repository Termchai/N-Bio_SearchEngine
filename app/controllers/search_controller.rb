class SearchController < ApplicationController
  def index
  	@molecule = Molecule.all
  	

  	@hash = Hash.new
  	@molecule.each do |m|
  		str = ""
  		arr = m.molecule_synonyms
  		arr.each do |s|
  			str = str + s.synonym + ", "
  		end
  		str = str[0..-3]
  		@hash[m.name] = str.to_s
  	end
  end
  
end
