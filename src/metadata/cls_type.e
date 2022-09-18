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
		--The type of the CLS_TYPE object
		-- TODO refactor this tp name to basic_type.

	type_ref: detachable DATA_CONTAINER
		-- The class reference for class type objects.

	method_ref: detachable METHOD_SIGNATURE
		-- The signature reference for method type objects

	pe_index: NATURAL

	show_type: BOOLEAN assign set_show_type



feature -- Element Change

	set_show_type (a_val: BOOLEAN)
		do
			show_type := a_val
		ensure
			show_type_set: show_type = a_val
		end

feature -- Status Report

	is_void: BOOLEAN
		do
			Result := tp = {BASIC_TYPE}.Void_ and then pointer_level = 0
		end

feature --Access Instance Free

	type_names: ARRAYED_LIST[STRING]
		once
			create Result.make_from_array (<<
					"",        "",        "", "", "void",   "bool",       "char",
                    "int8",    "uint8",   "int16",  "uint16",     "int32",
                    "uint32",  "int64",   "uint64", "native int", "native unsigned int",
                    "float32", "float64", "object", "string"
			>>)
		ensure
			instance_free: class
		end

feature -- Output

	il_src_dump (a_file: FILE_STREAM): BOOLEAN
		local
			l_name: STRING_32
		do
			if tp = {BASIC_TYPE}.cls then
				if show_type then
					if attached type_ref as l_type_ref and then
						(l_type_ref.flags.flags & {METHOD_ATTRIBUTES}.value) /= 0
					then
						a_file.put_string (" valuetype ")
					else
						a_file.put_string (" class ")
					end
				end
				if attached type_ref as l_type_ref then
					l_name := {QUALIFIERS}.name ("", l_type_ref, True)
				end

				--TODO to be completed.
			elseif tp = {BASIC_TYPE}.var then
				a_file.put_string ("!")
				a_file.put_integer (var_num)
			elseif tp = {BASIC_TYPE}.mvar then
				a_file.put_string ("!!")
				a_file.put_integer (var_num)
			elseif tp = {BASIC_TYPE}.method then
				a_file.put_string ("method ")
				if attached method_ref as l_method_ref then
					Result := l_method_ref.il_src_dump (a_file, false, true, true)
				end
			else
				a_file.put_string (type_names.at (tp.index + 1))
			end
		end

end
