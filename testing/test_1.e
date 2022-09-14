note
	description: "Summary description for {TEST_1}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TEST_1

feature -- Access

	test
		local
			lib_entry: PE_LIB
			working: DATA_CONTAINER
			signature_rep: METHOD_SIGNATURE
			signature_m: METHOD_SIGNATURE
			start: METHOD
			op: OPERAND
		do
			create lib_entry.make ("test1", {PE_LIB}.bits32)
			working := lib_entry.working_assembly

			create signature_rep.make("putchar", 0, Void)
			signature_rep.set_return_type(create {CLS_TYPE}.make ({BASIC_TYPE}.Void_, 0))
			signature_rep.add_parameter (create {PARAM}.make ("ch", create {CLS_TYPE}.make ({BASIC_TYPE}.i32, 0)))
			lib_entry.add_pinvoke_reference (signature_rep, "msvcrt.dll", true)

			create signature_m.make ("$Main", {METHOD_ATTRIBUTES}.managed, working)
			signature_m.set_return_type(create {CLS_TYPE}.make ({BASIC_TYPE}.Void_, 0))

			create start.make (signature_m, create {QUALIFIERS}.make_with_flags ({METHOD_ATTRIBUTES}.private | {METHOD_ATTRIBUTES}.Static | {METHOD_ATTRIBUTES}.hidebysig | {METHOD_ATTRIBUTES}.Cil | {METHOD_ATTRIBUTES}.managed), True)

			working.add_code_container (start)

			op := {OPERAND_FACTORY}.character_operand ('A', {OPERAND_SIZE}.i32)

		end
end
