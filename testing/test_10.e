note
	description: "[
			This code is the mapping of the existing CLI_WRITER.sample (COM interface using Emit API),
			using the new IL_EMITTER library.
		]"
	date: "$Date$"
	revision: "$Revision$"

class
	TEST_10

feature -- Test

	test
		local
			pe_file: PE_LIB

			cil_dispenser: CIL_DISPENSER
			cil_emit: CIL_EMIT

			cil_assembly_info: CIL_ASSEMBLY_INFO
			working_assembly: CIL_ASSEMBLY_DEF
			cil_type: CIL_CLASS
			cil_method: CIL_METHOD

			assembly: CIL_ASSEMBLY_DEF
			sig_main: CIL_METHOD_SIGNATURE
			method_main: CIL_METHOD
			mscorlib: CIL_ASSEMBLY_DEF
			l_result: TUPLE [type: CIL_FIND_TYPE; resource: detachable ANY]
			l_system: CIL_NAMESPACE
			l_console: CIL_CLASS
			l_exception: CIL_CLASS
			l_object: CIL_CLASS
			l_sig_write_line: CIL_METHOD_SIGNATURE

			l_method_sig: CIL_METHOD_SIGNATURE
			l_method: CIL_METHOD
			l_field: CIL_FIELD
			l_locals: CIL_LOCAL
			l_sig_ctor: CIL_METHOD_SIGNATURE

			l_type: CIL_CLASS
			l_label, l_id2: CIL_OPERAND
			l_leave_label: CIL_OPERAND
		do
			create cil_dispenser.make
			cil_emit := cil_dispenser.emit

			create cil_assembly_info.make
			cil_assembly_info.set_major (5)
			cil_assembly_info.set_minor (2)

			working_assembly := cil_emit.define_assembly ("manus_assembly", cil_assembly_info, "")

			cil_assembly_info.set_major (1)
			cil_assembly_info.set_minor (0)
			cil_assembly_info.set_build (3300)

			cil_emit.define_mscorlib_assembly_ref (cil_assembly_info, {ARRAY [NATURAL_8]} <<0xB7, 0x7A, 0x5C, 0x56, 0x19, 0x34, 0xE0, 0x89>>)

			cil_type := cil_emit.define_type ("TEST", create {CIL_QUALIFIERS}.make_with_flags ({CIL_QUALIFIERS_ENUM}.auto | {CIL_QUALIFIERS_ENUM}.ansi | {CIL_QUALIFIERS_ENUM}.public), cil_emit.define_type_ref_mscorlib ("Object"))

				-- Method signature for System.object::.ctor()
			create l_sig_ctor.make_default
			l_sig_ctor.set_flags ({CIL_METHOD_SIGNATURE_ATTRIBUTES}.managed | {CIL_METHOD_SIGNATURE_ATTRIBUTES}.instance_flag)
			l_sig_ctor.set_return_type (create {CIL_TYPE}.make ({CIL_BASIC_TYPE}.Void_))
			cil_emit.define_method_ref (".ctor", cil_emit.define_type_ref_mscorlib ("Object"), l_sig_ctor)

				-- Method .ctor
			cil_method := cil_emit.define_method (".ctor", create {CIL_QUALIFIERS}.make_with_flags ({CIL_QUALIFIERS_ENUM}.public |
							{CIL_QUALIFIERS_ENUM}.specialname |
							{CIL_QUALIFIERS_ENUM}.rtspecialname |
							{CIL_QUALIFIERS_ENUM}.cil |
							{CIL_QUALIFIERS_ENUM}.Managed
						), cil_type, False)

			l_field := cil_emit.define_field ("item", create {CIL_TYPE}.make (create {CIL_BASIC_TYPE}.object), create {CIL_QUALIFIERS}.make_with_flags ({CIL_QUALIFIERS_ENUM}.public), cil_type)

				-- Locals
			l_locals := cil_emit.define_local_from_basic_type ("l_obj", create {CIL_BASIC_TYPE}.object)
			cil_method.add_local (l_locals)
			l_locals := cil_emit.define_local_from_container ("l_type", cil_type)
			cil_method.add_local (l_locals)

				--Write  Method body

				-- Define labels
			l_label := cil_emit.define_label ("label1")
			l_id2 := cil_emit.define_label ("label2")

			cil_method.mark_label (l_id2)
			cil_method.put_opcode ({CIL_INSTRUCTION_OPCODES}.i_ldarg)
			cil_method.put_call (l_sig_ctor)

			cil_method.put_opcode_label ({CIL_INSTRUCTION_OPCODES}.i_br, l_label)
			cil_method.put_opcode ({CIL_INSTRUCTION_OPCODES}.i_ldc_i4_1)
			cil_method.put_opcode ({CIL_INSTRUCTION_OPCODES}.i_pop)
			cil_method.put_opcode_label ({CIL_INSTRUCTION_OPCODES}.i_br, l_id2)
			cil_method.mark_label (l_label)
			cil_method.put_return

--				-- Method test
--			create l_method_sig.make ("test", {CIL_METHOD_SIGNATURE_ATTRIBUTES}.managed, Void)
--			l_method_sig.set_return_type (create {CIL_TYPE}.make ({CIL_BASIC_TYPE}.Void_))

--				-- Define method
--			create l_method.make (l_method_sig,
--				create {CIL_QUALIFIERS}.make_with_flags (
--						{CIL_QUALIFIERS_ENUM}.public |
--						{CIL_QUALIFIERS_ENUM}.cil |
--						{CIL_QUALIFIERS_ENUM}.Managed
--					), False)
--			l_method.optimize

--			l_type.add (l_method)

--				-- Locals
--			create l_locals.make ("l_obj", create {CIL_TYPE}.make (create {CIL_BASIC_TYPE}.object))
--			l_method.add_local (l_locals)
--			create l_locals.make ("l_type", create {CIL_TYPE}.make_with_container (l_type))
--			l_method.add_local (l_locals)

--				-- Method body
--			l_label := {CIL_OPERAND_FACTORY}.label_operand ("label1")
--			l_id2 := {CIL_OPERAND_FACTORY}.label_operand ("label2")
--			l_method.add_instruction (create {CIL_INSTRUCTION}.make ({CIL_INSTRUCTION_OPCODES}.i_label, l_id2))

--			l_method.add_instruction (create {CIL_INSTRUCTION}.make ({CIL_INSTRUCTION_OPCODES}.i_br, l_label))
--			l_method.add_instruction (create {CIL_INSTRUCTION}.make ({CIL_INSTRUCTION_OPCODES}.i_ldc_i4_1, Void))
--			l_method.add_instruction (create {CIL_INSTRUCTION}.make ({CIL_INSTRUCTION_OPCODES}.i_pop, Void))
--			l_method.add_instruction (create {CIL_INSTRUCTION}.make ({CIL_INSTRUCTION_OPCODES}.i_br, l_id2))
--			l_method.add_instruction (create {CIL_INSTRUCTION}.make ({CIL_INSTRUCTION_OPCODES}.i_label, l_label))
--			l_method.add_instruction (create {CIL_INSTRUCTION}.make ({CIL_INSTRUCTION_OPCODES}.i_ret, Void))

--				-- Method test2
--			create l_method_sig.make ("test2", {CIL_METHOD_SIGNATURE_ATTRIBUTES}.managed, Void)
--			l_method_sig.set_return_type (create {CIL_TYPE}.make ({CIL_BASIC_TYPE}.Void_))

--				-- Define method
--			create l_method.make (l_method_sig,
--				create {CIL_QUALIFIERS}.make_with_flags (
--						{CIL_QUALIFIERS_ENUM}.public |
--						{CIL_QUALIFIERS_ENUM}.cil |
--						{CIL_QUALIFIERS_ENUM}.Managed
--					), False)
--			l_method.optimize

--			l_type.add (l_method)

--				-- Locals
--			create l_locals.make ("l_obj", create {CIL_TYPE}.make (create {CIL_BASIC_TYPE}.object))
--			l_method.add_local (l_locals)
--			create l_locals.make ("l_type", create {CIL_TYPE}.make_with_container (l_type))
--			l_method.add_local (l_locals)

--				-- Method body
--				-- Method body
--			l_label := {CIL_OPERAND_FACTORY}.label_operand ("label1")
--			l_id2 := {CIL_OPERAND_FACTORY}.label_operand ("label2")

--			l_method.add_instruction (create {CIL_INSTRUCTION}.make ({CIL_INSTRUCTION_OPCODES}.i_label, l_id2))
--			l_method.add_instruction (create {CIL_INSTRUCTION}.make ({CIL_INSTRUCTION_OPCODES}.i_br, l_label))
--			l_method.add_instruction (create {CIL_INSTRUCTION}.make ({CIL_INSTRUCTION_OPCODES}.i_ldc_i4_1, Void))
--			l_method.add_instruction (create {CIL_INSTRUCTION}.make ({CIL_INSTRUCTION_OPCODES}.i_pop, Void))
--			l_method.add_instruction (create {CIL_INSTRUCTION}.make ({CIL_INSTRUCTION_OPCODES}.i_br, l_id2))
--			l_method.add_instruction (create {CIL_INSTRUCTION}.make ({CIL_INSTRUCTION_OPCODES}.i_label, l_label))
--			l_method.add_instruction (create {CIL_INSTRUCTION}.make ({CIL_INSTRUCTION_OPCODES}.i_ret, Void))

--				-- Method test_rescue
--			create l_method_sig.make ("test_rescue", {CIL_METHOD_SIGNATURE_ATTRIBUTES}.managed, Void)
--			l_method_sig.set_return_type (create {CIL_TYPE}.make ({CIL_BASIC_TYPE}.Void_))

--				-- Define method
--			create l_method.make (l_method_sig,
--				create {CIL_QUALIFIERS}.make_with_flags (
--						{CIL_QUALIFIERS_ENUM}.public |
--						{CIL_QUALIFIERS_ENUM}.cil |
--						{CIL_QUALIFIERS_ENUM}.Managed
--					), False)
--			l_method.optimize

--			l_type.add (l_method)

--			l_leave_label := {CIL_OPERAND_FACTORY}.label_operand ("leave")

--				-- Try block
--			l_method.add_instruction (create {CIL_INSTRUCTION}.make_seh ({CIL_SEH}.seh_try, True, Void))
--			l_method.add_instruction (create {CIL_INSTRUCTION}.make ({CIL_INSTRUCTION_OPCODES}.i_ldc_i4_1, Void))
--			l_method.add_instruction (create {CIL_INSTRUCTION}.make ({CIL_INSTRUCTION_OPCODES}.i_pop, Void))
--			l_method.add_instruction (create {CIL_INSTRUCTION}.make ({CIL_INSTRUCTION_OPCODES}.i_leave, l_leave_label))
--			l_method.add_instruction (create {CIL_INSTRUCTION}.make_seh ({CIL_SEH}.seh_try, False, Void))

--				-- Catch block
--			l_method.add_instruction (create {CIL_INSTRUCTION}.make_seh ({CIL_SEH}.seh_catch, True, if attached l_exception then create {CIL_TYPE}.make_with_container (l_exception) else Void end))
--			l_method.add_instruction (create {CIL_INSTRUCTION}.make ({CIL_INSTRUCTION_OPCODES}.i_ldstr, {CIL_OPERAND_FACTORY}.string_operand ("Manu is nice")))
--			l_method.add_instruction (create {CIL_INSTRUCTION}.make ({CIL_INSTRUCTION_OPCODES}.i_pop, Void))
--			l_method.add_instruction (create {CIL_INSTRUCTION}.make ({CIL_INSTRUCTION_OPCODES}.i_leave, l_leave_label))
--			l_method.add_instruction (create {CIL_INSTRUCTION}.make_seh ({CIL_SEH}.seh_catch, False, Void))

--			l_method.add_instruction (create {CIL_INSTRUCTION}.make ({CIL_INSTRUCTION_OPCODES}.i_label, l_leave_label))
--			l_method.add_instruction (create {CIL_INSTRUCTION}.make ({CIL_INSTRUCTION_OPCODES}.i_ret, Void))

--			pe_file.dump_output_file ("test_9e.il", {CIL_OUTPUT_MODE}.ilasm, false)
--			pe_file.dump_output_file ("test_9e.dll", {CIL_OUTPUT_MODE}.pedll, false)
			cil_emit.dump_output_file ("emit_test_9e.il", {CIL_OUTPUT_MODE}.ilasm, false)


		end

end
