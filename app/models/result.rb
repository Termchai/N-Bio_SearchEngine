class Result < ActiveRecord::Base
	def get_name
		s = name
		if(s.include? ",")
			s = s.split(",")[0]
		end
		s
	end

	def get_status
		if(created_at == updated_at)
			"Searching..."
		else
			"Finish!"
		end
	end

	def get_dup
		hash = Hash.new
		s = duplicate
		s = s.delete("\"")
		s = s.delete("[")
		s = s.delete("]")
		s = s.split(",")
		for i in 0..(s.length)
			if i%2 == 0
				hash[s[i]] = s[i+1]
			end
		end

		hash
	end

	def get_output
		hash = Hash.new
		s = output
		s = s.delete("\"")
		s = s.delete("[")
		s = s.delete("]")
		s = s.split(",")
		for i in 0..(s.length)
			if i%2 == 0
				hash[s[i]] = s[i+1]
			end
		end

		hash
	end

end
