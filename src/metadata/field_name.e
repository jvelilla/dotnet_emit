note
	description: "value: a field name (used as an operand)"
	date: "$Date$"
	revision: "$Revision$"

class
	FIELD_NAME

inherit

	VALUE
		rename
			make as make_value
		end

create
	make

feature {NONE} -- Initialization

	make (a_field: FIELD)
			--| Can be used to make the field a reference to another
			--|assembly, in a rudimentary way
		do
			make_value("", Void)
		end

end
