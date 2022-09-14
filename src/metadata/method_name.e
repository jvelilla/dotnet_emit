note
	description: "[
		Value: a method name (used as an operand)
	]"
	date: "$Date$"
	revision: "$Revision$"

class
	METHOD_NAME

inherit

	VALUE
		rename
			make as make_value
		end
create
	make

feature {NONE} -- Initialization

	make (a_method_sig: METHOD_SIGNATURE)
		do
			make_value("", Void)
			signature := a_method_sig
		end

feature -- Access

	signature: METHOD_SIGNATURE

end
