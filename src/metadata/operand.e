note
	description: "[
		The operand to an instruction 
    	This can contain a number, a string, or a reference to value
   		A value can be a field, methodsignature, local, or param reference
   	]"
	date: "$Date$"
	revision: "$Revision$"

class
	OPERAND
create
	make

feature {NONE} -- Initialization

	make
			-- no operand
		do
			type := {OPERAND_TYPE}.t_none
			size := {OPERAND_SIZE}.i8
			create string_value.make_empty
		end

feature -- Access

	type: OPERAND_TYPE assign set_type
			-- `type'

	size: OPERAND_SIZE assign set_size
			-- `size'

	ref_value: detachable VALUE assign set_ref_value
			-- `ref_value'

	string_value: STRING_32 assign set_string_value
			-- `string_value'

	int_value: INTEGER_64 assign set_int_value
			-- `int_value'

	float_value: REAL_64 assign set_float_value
			-- `float_value'

	property: BOOLEAN assign set_property
			-- `property'

feature -- Element change

	set_type (a_type: like type)
			-- Assign `type' with `a_type'.
		do
			type := a_type
		ensure
			type_assigned: type = a_type
		end

	set_size (a_size: like size)
			-- Assign `size' with `a_size'.
		do
			size := a_size
		ensure
			size_assigned: size = a_size
		end

	set_ref_value (a_ref_value: like ref_value)
			-- Assign `ref_value' with `a_ref_value'.
		do
			ref_value := a_ref_value
		ensure
			ref_value_assigned: ref_value = a_ref_value
		end

	set_string_value (a_string_value: like string_value)
			-- Assign `string_value' with `a_string_value'.
		do
			string_value := a_string_value
		ensure
			string_value_assigned: string_value = a_string_value
		end

	set_int_value (an_int_value: like int_value)
			-- Assign `int_value' with `an_int_value'.
		do
			int_value := an_int_value
		ensure
			int_value_assigned: int_value = an_int_value
		end

	set_float_value (a_float_value: like float_value)
			-- Assign `float_value' with `a_float_value'.
		do
			float_value := a_float_value
		ensure
			float_value_assigned: float_value = a_float_value
		end

	set_property (a_property: like property)
			-- Assign `property' with `a_property'.
		do
			property := a_property
		ensure
			property_assigned: property = a_property
		end


feature --Access

end
