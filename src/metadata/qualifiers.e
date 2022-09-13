note
	description: "[
		Qualifiers is a generic class that holds all the 'tags' you would see on various objects in
		the assembly file.   Where possible things are handled implicitly for example 'nested'
		will automatically be added when a class is nested in another class.
	]"
	date: "$Date$"
	revision: "$Revision$"

class
	QUALIFIERS

create
	make,
	make_with_flags,
	make_from_other

feature {NONE} -- Initialization

	make
		do
			flags := 0
		end

	make_with_flags (a_flags: INTEGER)
		do
			flags := a_flags
		end

	make_from_other (other: QUALIFIERS)
		do
			flags := other.flags
		end



feature -- Access

	flags: INTEGER;


	qualifier_names: ARRAYED_LIST [STRING]
			-- TODO check if this is a good way to represent and
			-- equivalent static field in C++
			-- see QUALIFIERS class.
		once
			create Result.make (0)
		ensure
			instance_free: class
		end

feature -- Change Element

	set_flags (a_flag: INTEGER)
			-- Set `flags` with `a_flag`.
		do
			flags := a_flag
		end

end
