note
	description: "[
			The program calls printf("%s", "hi")
			It only uses the unnamed namespace
		]"
	date: "$Date$"
	revision: "$Revision$"

class
	TEST_2

feature -- Access

	test
		local
			lib_entry: PE_LIB
			working: DATA_CONTAINER
			i8_cls: CLS_CLASS
			ps: FIELD
			str: FIELD

			signature_rep: METHOD_SIGNATURE
			signature_m: METHOD_SIGNATURE
			start: METHOD
			op: OPERAND
			ins: INSTRUCTION
			method_name: METHOD_NAME
		do
			create lib_entry.make ("test1", {PE_LIB}.il_only | {PE_LIB}.bits32)
			working := lib_entry.working_assembly

			create i8_cls.make ("int8[]", create {QUALIFIERS}.make_with_flags (
					{METHOD_ATTRIBUTES}.private |
					{METHOD_ATTRIBUTES}.explicit |
					{METHOD_ATTRIBUTES}.ansi |
					{METHOD_ATTRIBUTES}.sealed |
					{METHOD_ATTRIBUTES}.value)
				, 1, 1)

			create ps.make ("pS", create {CLS_TYPE}.make_with_container (i8_cls), create {QUALIFIERS}.make_with_flags ({METHOD_ATTRIBUTES}.private | {METHOD_ATTRIBUTES}.static))
			create str.make ("pS", create {CLS_TYPE}.make_with_container (i8_cls), create {QUALIFIERS}.make_with_flags ({METHOD_ATTRIBUTES}.private | {METHOD_ATTRIBUTES}.static))

			working.add_data_container (i8_cls)



			create signature_rep.make ("putchar", 0, Void)
			signature_rep.set_return_type (create {CLS_TYPE}.make ({BASIC_TYPE}.Void_, 0))
			signature_rep.add_parameter (create {PARAM}.make ("ch", create {CLS_TYPE}.make ({BASIC_TYPE}.i32, 0)))
			lib_entry.add_pinvoke_reference (signature_rep, "msvcrt.dll", true)

			create signature_m.make ("$Main", {METHOD_ATTRIBUTES}.managed, working)
			signature_m.set_return_type (create {CLS_TYPE}.make ({BASIC_TYPE}.Void_, 0))

			create start.make (signature_m, create {QUALIFIERS}.make_with_flags ({METHOD_ATTRIBUTES}.private | {METHOD_ATTRIBUTES}.Static | {METHOD_ATTRIBUTES}.hidebysig | {METHOD_ATTRIBUTES}.Cil | {METHOD_ATTRIBUTES}.managed), True)

			working.add_code_container (start)

			op := {OPERAND_FACTORY}.character_operand ('A', {OPERAND_SIZE}.i32)
			create ins.make ({CIL_OPCODES}.i_ldc_i4, op)
			start.add_instruction (ins)

			create method_name.make (signature_rep)

			op := {OPERAND_FACTORY}.complex_operand (method_name)
			create ins.make ({CIL_OPCODES}.i_call, op)
			start.add_instruction (ins)

			create ins.make ({CIL_OPCODES}.i_ret, Void)
			start.add_instruction (ins)

			start.optimize (lib_entry)

			lib_entry.dump_output_file ("test1.il", {OUTPUT_MODE}.ilasm, False)
			lib_entry.dump_output_file ("test1.exe", {OUTPUT_MODE}.peexe, False)

		end

end
