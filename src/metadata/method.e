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
		redefine
			il_src_dump
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

	add_instruction (a_instruction: INSTRUCTION)
			-- Add an instruction `a_instruction` to the listo of instructions.
		do
			instructions.force (a_instruction)
		end


feature -- Operations

	optimize (a_pe: PE_LIB)
		do
			calculate_live
			calculate_max_stack
			optimize_locals (a_pe)
			optimize_code (a_pe)
		end



feature {NONE} -- Implementation

	calculate_live
		local
			labels_reached: ARRAYED_LIST [STRING_32]
			done, skipping: BOOLEAN
		do
			from
			until
				done
			loop
				done := True
				across instructions as ic loop
					if ic.opcode = {CIL_OPCODES}.i_SEH and then ic.seh_begin then
						ic.set_live(True)
						skipping := False
					elseif not skipping then
						ic.set_live (True)
						if ic.is_branch then
							-- TODO implement
						elseif
							ic.opcode = {CIL_OPCODES}.i_switch
						then
							if not ic.switches.is_empty then
								-- TODO implement
							end
						end
					elseif ic.opcode = {CIL_OPCODES}.i_label then
						-- TODO implement
					end
				end

			end
		end

	calculate_max_stack
		local
			l_labels: STRING_TABLE [INTEGER]
			n, m: INTEGER
			last_branch: BOOLEAN
			skipping: BOOLEAN

		do
			max_stack := 0
			across instructions as ins loop

				if ins.live then
					m := ins.stack_usage
					if m = -127 then
						n := 0
					else
						n := n + m;
					end
					if n > max_stack then
						max_stack := n
					end
					if n < 0 then
							-- TODO reimplement.
						(create {EXCEPTION}.make_with_tag_and_trace(generator + "calculate_max_stack", "Stack Under Flow")).raise
					end
					if ins.is_branch then
						-- TODO implement.
					elseif ins.opcode = {CIL_OPCODES}.i_switch then
						-- TODO implement
					elseif ins.opcode = {CIL_OPCODES}.i_label then
						-- TODO implement
					elseif ins.opcode = {CIL_OPCODES}.i_comment then
						-- Placeholder.
					else
						last_branch := False
					end
				end
			end
			if n /= 0 then
				if n /= 1 or else attached prototype.return_type as l_return_type and then l_return_type.is_void then
					-- TODO reimplement.
					(create {EXCEPTION}.make_with_tag_and_trace(generator + "calculate_max_stack", "Stack Not Empty at the end of function")).raise
				end
			end

		end

	optimize_locals (a_pe: PE_LIB)
		local
			l_sorter: SORTER [CLS_LOCAL]
			comparator: PREDICATE [CLS_LOCAL, CLS_LOCAL]
			l_index: INTEGER
		do

			across instructions as ins loop
				if attached {OPERAND} ins.operand as l_op then
					if attached {CLS_LOCAL} l_op.value as l_val then
						l_val.increment_uses
					end
				end
			end
				-- sort var_list
			comparator := agent (left, right: CLS_LOCAL): BOOLEAN do Result := left.uses > right.uses end
			create {QUICK_SORTER [CLS_LOCAL]} l_sorter.make ((create {AGENT_EQUALITY_TESTER [CLS_LOCAL]}.make (comparator)))
			l_sorter.sort (var_list)

			l_index := 0
			across var_list as l_var loop
				l_var.index := l_index
				l_index := l_index + 1
			end
		end

feature -- Output

	il_src_dump (a_file: FILE): BOOLEAN
		do
			a_file.put_string (".method")
			flags.il_src_dump_before_flags (a_file)
			if invoke_mode = {INVOKE_MODE}.PInvoke then
				a_file.put_string (" pinvokeimpl(%"")
				a_file.put_string (pinvoke_name)
				a_file.put_string ("%"")
				a_file.put_string (if pinvoke_type = {INVOKE_TYPE}.Cdecl then "cdecl)" else "stdcall)" end)
			else
				a_file.put_string (" ")
			end
			Result := prototype.il_src_dump (a_file, invoke_mode /= {INVOKE_MODE}.PInvoke, False,  invoke_mode = {INVOKE_MODE}.PInvoke)
			flags.il_src_dump_after_flags (a_file)
			if invoke_mode /= {INVOKE_MODE}.PInvoke then
				a_file.put_string ("{")
				a_file.put_new_line
				a_file.flush
				if (prototype.flags & {METHOD_SIGNATURE_ATTRIBUTES}.vararg) /= 0 and then
					(prototype.flags & {METHOD_SIGNATURE_ATTRIBUTES}.managed) /= 0
				then
						-- TODO check why we need to include this references Hardcoded.
						-- Allow C# to use
					a_file.put_string ("%T.param%T[")
					a_file.put_integer (prototype.params.count)
					a_file.put_string ("]")
					a_file.put_new_line
					a_file.flush

					a_file.put_string ("%T.custom instance void [mscorlib]System.ParamArrayAttribute::.ctor() = ( 01 00 00 00 )")
					a_file.put_new_line
					a_file.flush
				end
				if not var_list.is_empty then
					a_file.put_string ("%T.locals (")
					a_file.put_new_line
					a_file.flush
					across var_list as it loop
						a_file.put_string ("%T%T[")
						a_file.put_integer (it.index)
						a_file.put_string ("]%T")
						if attached {CLS_TYPE} it.type as l_type and then
						   l_type.tp = {BASIC_TYPE}.cls
						then
							if attached {DATA_CONTAINER} l_type.type_ref as l_class and then
							(l_class.flags.flags & {METHOD_ATTRIBUTES}.value) /= 0
							then
								a_file.put_string ("valuetype ")
							else
								a_file.put_string ("class ")
							end
						end
						if attached {CLS_TYPE} it.type as l_type then
							Result :=l_type.il_src_dump(a_file)
						end
						a_file.put_string (" ")

						if @ it.cursor_index + 1 /= @ it.last_index then
							a_file.put_string (",")
							a_file.put_new_line
							a_file.flush
						else
							a_file.put_new_line
							a_file.flush
						end


					end

				end
			end
		end


end
