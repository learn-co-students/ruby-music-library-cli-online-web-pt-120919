module Concerns::Findable

	def find_by_name(name)
		all.detect do |object|
			object.name == name
		end
	end

	def find_or_create_by_name(name)
		object = find_by_name(name)
		if object == nil
			object = create(name)
		end
		object
	end
	
end