note
	description: "A Cil Instruction"
	date: "$Date$"
	revision: "$Revision$"

class
	INSTRUCTION

create
	make

feature {NONE} -- Initialization

	make (a_op: CIL_OPCODES; a_operand: OPERAND)
		do
			create {ARRAYED_LIST [STRING_32]} switches.make (0)
			opcode := a_op
			operand := a_operand
			create text.make_empty
		end

feature -- Access

	switches: LIST [STRING_32]

	opcode: CIL_OPCODES

	offset: INTEGER

	seh_type: INTEGER

	seh_begin: BOOLEAN

	text: STRING_32

	live: BOOLEAN

		-- The following to fields are
		-- used as a union
	operand: detachable OPERAND	-- for non-labels.

	seh_catch_type: detachable CLS_TYPE

	instructions: LIST [INSTRUCTION_NAME]
		once
			create {ARRAYED_LIST[INSTRUCTION_NAME]}Result.make(0)
		ensure
			instance_free: class
		end


end
