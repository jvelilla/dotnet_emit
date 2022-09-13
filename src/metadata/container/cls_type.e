note
	description: "[
			the type of a field or value
		]"
	date: "$Date$"
	revision: "$Revision$"

class
	CLS_TYPE

create
	make

feature {NONE} --Initialization

	make (a_type: BASIC_TYPE; a_pointer_level: INTEGER)
		do
			tp := a_type
			if tp = {BASIC_TYPE}.var or else tp = {BASIC_TYPE}.mvar then
				var_num := a_pointer_level
			else
				pointer_level := a_pointer_level
			end
		end


feature -- Access

	pinned: BOOLEAN

	pointer_level: INTEGER

	var_num: INTEGER

	by_ref: BOOLEAN

	array_level: INTEGER

	tp: BASIC_TYPE

	type_ref: detachable DATA_CONTAINER

	method_ref: detachable METHOD_SIGNATURE

	pe_index: NATURAL

	show_type: BOOLEAN


feature --Access Instance Free

	type_names: ARRAYED_LIST[STRING]
		once
			create Result.make(0)
		ensure
			instance_free: class
		end

end
