note
	description: "Summary description for {INSTRUCTION_NAME}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	INSTRUCTION_NAME

create
	make

feature {NONE} -- Initialization

	make
		do
			create name.make_empty
		end

feature -- Access

	name: STRING_32 assign set_name
			-- `name'

	op1: NATURAL_8 assign set_op1
			-- `op1'

	op2: NATURAL_8
			-- `op2'

	bytes: NATURAL_8 assign set_bytes
			-- `bytes'

	operand_type: NATURAL_8 assign set_operand_type
			-- `operand_type'

	--char stackUsage; // positive it adds to stack, negative it consumes stack
feature -- Element change

	set_name (a_name: like name)
			-- Assign `name' with `a_name'.
		do
			name := a_name
		ensure
			name_assigned: name = a_name
		end

	set_op1 (an_op1: like op1)
			-- Assign `op1' with `an_op1'.
		do
			op1 := an_op1
		ensure
			op1_assigned: op1 = an_op1
		end

	set_bytes (a_bytes: like bytes)
			-- Assign `bytes' with `a_bytes'.
		do
			bytes := a_bytes
		ensure
			bytes_assigned: bytes = a_bytes
		end

	set_operand_type (an_operand_type: like operand_type)
			-- Assign `operand_type' with `an_operand_type'.
		do
			operand_type := an_operand_type
		ensure
			operand_type_assigned: operand_type = an_operand_type
		end

end
