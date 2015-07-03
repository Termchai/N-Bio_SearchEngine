class Search < ActiveRecord::Base
	require 'rubygems'
	require 'google-search'
	require 'net/http'

	def self.query 
		["interleukin 6",
		 "il6",
		 "il 6", 
		 "il-6"]
	end

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

	def self.sentence
		 ["interact",
		 "bind",
		 "adjacent",
		 "join",
		 "connect",
		 "against",
		 "attach"]
	end

	def self.extract_word
		["a","are","the","is","of","on",
		 "an","for","has","have","been",
		 "shown","be","begin","with","make",
		 "so","when","to","begin","in","half",
		 "full","it","then","which","upon","see",
		 "factor","site","type","this","that",
		 "only", "contains", "and", "  ","also","termed","design",
		 "from", "as", "/", "protein", "complex", "dna", "between",
		 "determinant","proteins", "exits"]
	end

	def self.s 
		set = Set.new
		hash = Hash.new(0)
		count = 0;
		time = Time.now
		query.each do |query|
		  temp = query
		  puts "========================================================"
		  puts "searching for #{query}"
		  puts "========================================================"
		  Google::Search::Web.new do |search|
		    search.query = query
		    search.size = :large
		  end.first(10).each { |item| 

		if set.include? item.uri.to_s
			next
		else
			set.add(item.uri.to_s)
		end


		begin
		  	url = URI.parse(item.uri)
		  	# puts url
			req = Net::HTTP::Get.new(url.to_s)
			res = Net::HTTP.start(url.host, url.port) {|http| http.request(req) }
				s = (ActionView::Base.full_sanitizer.sanitize(res.body)).downcase
				# puts s
				s = self.extract(s)
				s = s.delete!("\n")
				# puts s.length
			self.sentence.each do |q|

				self.query.each do |qq|
					que =  qq + " " + q
					# que = q
					# if s.include? qq	
						# puts q.length + self.query.length + 1
						temp = (0 ... s.length).find_all { |i| s[i, que.length] == 	que }
						temp.each do |i| 
							count += 1
							puts url.to_s
							puts s[i-20,80]
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
		
		self.extract_word.each do |w|
			hash.delete(w)
		end
		
		self.query.each do |w|
			hash.delete(w)
		end

		hash.each {|key, value| 
			self.sentence.each do |w|
				if key.to_s.include? w
					hash.delete key
				end

			end
		}

		hash = hash.sort_by {|_key, value| value}.reverse
		hash.first(10)

	end

	def self.extract str
		self.extract_word.each do |e| 
			str = str.gsub(" " + e + " "," ")
		end
		str
	end

	def self.time_diff(start_time, end_time)
	  seconds_diff = (start_time - end_time).to_i.abs

	  hours = seconds_diff / 3600
	  seconds_diff -= hours * 3600

	  minutes = seconds_diff / 60
	  seconds_diff -= minutes * 60

	  seconds = seconds_diff

	  "#{hours.to_s.rjust(2, '0')}:#{minutes.to_s.rjust(2, '0')}:#{seconds.to_s.rjust(2, '0')}"
	end

end