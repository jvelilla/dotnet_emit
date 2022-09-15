note
	description: "[
		Base class that contains instructions / labels
    	will be further overridden later to make a 'method'
    	definition
	]"
	date: "$Date$"
	revision: "$Revision$"

class
	CODE_CONTAINER

create
	make

feature {NONE} --Initialization

	make (a_flags: QUALIFIERS)
		do
			flags := a_flags
			create labels.make (0)
			create {ARRAYED_LIST [INSTRUCTION]} instructions.make (0)
		end


feature -- Access

	labels: STRING_TABLE [INSTRUCTION]

	instructions: LIST[INSTRUCTION]

	flags: QUALIFIERS

	parent: detachable DATA_CONTAINER

	has_seh: BOOLEAN

feature -- Element Change

	set_container (a_item: DATA_CONTAINER)
			-- Set `parent` container with `a_item`.
		do
			parent := a_item
		end


feature -- Optimization

	optimize_code (a_pe: PE_LIB)
		do
			load_labels
			optimize_ldc(a_pe)
			optimize_ldloc(a_pe)
			optimize_ldarg(a_pe)
			optimize_branch(a_pe)
			labels.wipe_out
		end

feature {NONE} -- Implementation

	load_labels
		do
			across instructions as ins loop
				if ins.opcode = {CIL_OPCODES}.i_label then
					if labels.has (ins.label)then
						-- TODO reimplement
						(create {EXCEPTION}.make_with_tag_and_trace(generator + "load_labels", "Duplicate label " + ins.label)).raise
					else
						labels.force (ins, ins.label)
					end
				end
			end
		end


	optimize_ldc (a_pe: PE_LIB)
		local
			done: BOOLEAN
			n: INTEGER_64
			ops: ARRAY[CIL_OPCODES]
		do
			ops := <<{CIL_OPCODES}.i_ldc_i4_M1_, {CIL_OPCODES}.i_ldc_i4_0, {CIL_OPCODES}.i_ldc_i4_1,
                     {CIL_OPCODES}.i_ldc_i4_2,  {CIL_OPCODES}.i_ldc_i4_3, {CIL_OPCODES}.i_ldc_i4_4,
                     {CIL_OPCODES}.i_ldc_i4_5,  {CIL_OPCODES}.i_ldc_i4_6, {CIL_OPCODES}.i_ldc_i4_7,
                     {CIL_OPCODES}.i_ldc_i4_8 >>

			across instructions as ins loop
				inspect ins.opcode
				when
					{CIL_OPCODES}.i_ldc_i4
				then
					if attached ins.operand as l_op and then l_op.type = {OPERAND_TYPE}.t_int  then
						done := True


					end
				else

				end
			end
		end

	optimize_ldloc (a_pe: PE_LIB)
		do
			-- TODO implement
		end

	optimize_ldarg (a_pe: PE_LIB)
		do
			-- TODO implement
		end

	optimize_branch (a_pe: PE_LIB)
		do
			-- TODO implement
		end


end
