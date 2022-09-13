note
	description: "[
		Object Representing a method with code
		CIL instructions are added with the 'Add' feature of code container.
	]"
	date: "$Date$"
	revision: "$Revision$"

class
	METHOD

inherit

	CODE_CONTAINER
		rename
			make as make_code
		end

create
	make

feature {NONE} --Initialization

	make (a_prototype: METHOD_SIGNATURE; a_flags: QUALIFIERS; a_entry: BOOLEAN)
		do
			make_code(a_flags)
			prototype := a_prototype
			max_stack := 100
			invoke_mode := {INVOKE_MODE}.CIL
			pinvoke_type := {INVOKE_TYPE}.Stdcall
			create {ARRAYED_LIST [CLS_LOCAL]} var_list.make (0)
			create pinvoke_name.make_empty
			if not (flags.flags & {METHOD_ATTRIBUTES}.Static /= 0) then
				prototype.instance(True)
			end
		end

feature -- Access

	prototype: METHOD_SIGNATURE

	var_list: LIST [CLS_LOCAL]

	pinvoke_name: STRING_32

	invoke_mode: INVOKE_MODE

	pinvoke_type: INVOKE_TYPE

	max_stack: INTEGER

	entry_point: BOOLEAN

	rendering: detachable PE_METHOD

feature -- Change Element

	set_pinvoke(a_name: STRING_32; a_type: INVOKE_TYPE)
			--  Set Pinvoke DLL name
		do
			invoke_mode := {INVOKE_MODE}.PInvoke
			pinvoke_name := a_name
			pinvoke_type := a_type
		end


end
