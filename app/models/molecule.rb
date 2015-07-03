class Molecule < ActiveRecord::Base
	require 'rubygems'
	require 'google-search'
	require 'net/http'

	has_many :molecule_synonyms

	def get_interacts
		s = ""
		Interact.where(m1: id).each do |inter|
			s = s + Molecule.find(inter.m2).name + ", "
		end

		Interact.where(m2: id).each do |inter|
			s = s + Molecule.find(inter.m1).name + ", "
		end

		s[0..-3]
	end

	def get_synonym
		s = ""
		molecule_synonyms.each do|syn|
			s = s + syn.synonym + ", "
		end

		s[0..-3]
	end

	def query
		arr = [name]
		molecule_synonyms.each do |s|
			arr.push(s.synonym.downcase)
		end
		arr

	end

	def sentence
		arr = []
		Sentence.all.each do |s|
			arr.push(s.sen.downcase)
		end
		arr
	end

	def extract_word
		arr = []
		ExtractWord.all.each do |ext|
			arr.push(ext.word.downcase)
		end
		arr
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

	def search

		querys = self.query
		sentence = self.sentence
		extract_word = self.extract_word


		result = Array.new
		set = Set.new
		hash = Hash.new(0)
		count = 0;
		time = Time.now
		querys.each do |query|
		  temp = query
		  puts "========================================================"
		  puts "searching for #{query}"
		  puts "========================================================"
		  Google::Search::Web.new do |search|
		    search.query = query
		    search.size = :large
		  end.first(5).each { |item| 

		if set.include? item.uri.to_s
			next
		else
			set.add(item.uri.to_s)
		end


		begin
		  	url = URI.parse(item.uri)
		  	puts url
			req = Net::HTTP::Get.new(url.to_s)
			res = Net::HTTP.start(url.host, url.port) {|http| http.request(req) }
				s = (ActionView::Base.full_sanitizer.sanitize(res.body)).downcase
				# puts s
				s = self.extract(s, extract_word)
				s = s.delete!("\n")
				# puts s.length
			sentence.each do |q|
				querys.each do |qq|
					que =  qq + " " + q
					# que = q
					# if s.include? qq	
						# puts q.length + query.length + 1
						temp = (0 ... s.length).find_all { |i| s[i, que.length] == 	que }
						temp.each do |i| 
							count += 1
							puts url.to_s
							puts s[i-20,80]
							result.push([s[i-20,80],url.to_s])
							arr = s[i-20,80].split(' ')
							arr.each do |word|
								hash[word] = hash[word] + 1
							end
						 	puts "-------------------------------------"
						end
					# end
				end
			end

		rescue

	    end
		}

		end 
		puts "==============================================="
		puts "End of Searching."
		puts "Found " + count.to_s + " outputs."
		puts "Time spend: " + self.time_diff(Time.now, time)
		puts "Top 10 Duplicate Word"
		
		extract_word.each do |w|
			hash.delete(w)
		end
		
		query.each do |w|
			hash.delete(w)
		end

		hash.each {|key, value| 
			sentence.each do |w|
				if key.to_s.include? w
					hash.delete key
				end

			end

			if key.to_s.length <= 2
				hash.delete key
			end
		}

		hash = hash.sort_by {|_key, value| value}.reverse
		puts hash.first(10)

		puts result.to_s

		callback = Hash.new
		callback[:count] = count.to_s
		callback[:time] = self.time_diff(Time.now,time)
		callback[:dup] = hash.first(10)
		callback[:res] = result

		callback


	end

	def extract str, ext
		ext.each do |e| 
			str = str.gsub(" " + e + " "," ")
		end
		str
	end

	def time_diff(start_time, end_time)
	  seconds_diff = (start_time - end_time).to_i.abs

	  hours = seconds_diff / 3600
	  seconds_diff -= hours * 3600

	  minutes = seconds_diff / 60
	  seconds_diff -= minutes * 60

	  seconds = seconds_diff

	  "#{hours.to_s.rjust(2, '0')}:#{minutes.to_s.rjust(2, '0')}:#{seconds.to_s.rjust(2, '0')}"
	end

end
