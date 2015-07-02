class Molecule < ActiveRecord::Base
	has_many :molecule_synonyms

	def get_interacts
		s = ""
		Interact.where(m1: id).each do |inter|
			s = s + Molecule.find(inter.m2).name + ", "
		end

		s[0..-3]
	end
end
