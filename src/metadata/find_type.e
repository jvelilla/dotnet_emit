note
	description: "Summary description for {FIND_TYPE}."
	date: "$Date$"
	revision: "$Revision$"

once class
	FIND_TYPE

create
	s_notFound,
	s_ambiguous,
	s_namespace,
	s_class,
	s_enum,
	s_field,
	s_property,
	s_method

feature {NONE} -- Creation procedures

	s_notFound once end
	s_ambiguous once end
	s_namespace once end
	s_class once end
	s_enum once end
	s_field once end
	s_property once end
	s_method once end

feature -- Instances

	instances: ITERABLE [FIND_TYPE]
			-- All known find_types's.
		do
			Result := <<
					{FIND_TYPE}.s_notFound,
					{FIND_TYPE}.s_ambiguous,
					{FIND_TYPE}.s_namespace,
					{FIND_TYPE}.s_class,
					{FIND_TYPE}.s_enum,
					{FIND_TYPE}.s_field,
					{FIND_TYPE}.s_property,
					{FIND_TYPE}.s_method
				>>
		ensure
			instance_free: class
		end

end
