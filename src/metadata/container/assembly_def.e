note
	description: "[
		    Base class for assembly definitions
    		this holds the main assembly ( as a non-external assembly)
    		or can hold an external assembly
	]"
	date: "$Date$"
	revision: "$Revision$"

class
	ASSEMBLY_DEF

inherit

	DATA_CONTAINER
	 	rename
	 		make as make_data_container
	 	end

create
	make

feature {NONE} -- Initialization

	make (a_name: STRING_32; a_external: BOOLEAN; a_byte: INTEGER_8)
		do
			make_data_container (a_name, create {QUALIFIERS}.make)
				 -- TODO check how to represent a Byte * in Eiffel
				 -- NATURAL_8 is another option.
			public_key_token := a_byte
		end

feature -- Access

	public_key_token: INTEGER_8

end
