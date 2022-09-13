note
	description: "Summary description for {PARAM}."
	date: "$Date$"
	revision: "$Revision$"

class
	PARAM

inherit

	VALUE
		rename
			make as make_value
		end

create
	make

feature {NONE} -- Initialization

	make (a_name: STRING_32; a_type: CLS_TYPE)
		do
			make_value (a_name, a_type)
			index := -1
		end

feature -- Access		

	index: INTEGER_32
		-- Index of Argument.


feature --Change Element

	set_index (a_index: INTEGER_32)
			-- Set index of argument to `a_index`.
		do
			index := a_index
		end

end
