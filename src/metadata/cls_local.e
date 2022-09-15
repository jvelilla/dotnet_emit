note
	description: "[
		Value is a local variable.
	]"
	date: "$Date$"
	revision: "$Revision$"

class
	CLS_LOCAL

inherit

	VALUE
		rename
			make as make_value
		end

create
	make

feature {NONE}-- Initialization

	make (a_name: STRING_32; a_type: detachable CLS_TYPE)
		do
			make_value(a_name, a_type)
			uses := 0
			index := -1
		end

feature -- Access

	uses: INTEGER

	index: INTEGER
		-- return index of a variable.


feature -- Change Element

	increment_uses
			-- Increment uses of a variable..
		do
			uses := uses + 1
		ensure
			uses_incremented: old uses + 1 = uses
		end

end
