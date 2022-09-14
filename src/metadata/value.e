note
	description: "[
		Object representing a value
		A value, typically to be used as an operand.
		Various other classes derive from this to make specific types of operand values.
	]"
	date: "$Date$"
	revision: "$Revision$"

class
	VALUE

create
	make

feature {NONE} --Initialization

	make (a_name: STRING_32; a_type: detachable CLS_TYPE)
		do
			name := a_name
			type := a_type
		end

feature -- Access

	name: STRING_32

	type: detachable CLS_TYPE
		-- type of value.
		-- TODO check if it's better to use NULL pattern.

feature -- Change Element

	set_name (a_name: STRING_32)
			-- Set name.
		do
			name := a_name
		end

	set_type (a_type: CLS_TYPE)
			-- Set type of value.
		do
			type := a_type
		end
end
