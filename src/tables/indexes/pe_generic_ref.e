note
	description: "Define a type of possible index type that occur in the tables we are interested in."
	date: "$Date: 2023-07-11 02:44:09 -0300 (Tue, 11 Jul 2023) $"
	revision: "$Revision: 107125 $"

class
	PE_GENERIC_REF

inherit

	PE_INDEX_BASE
		redefine
			has_index_overflow
		end

create
	make_with_index

feature -- Operations

	has_index_overflow (a_sizes: ARRAY [NATURAL_32]): BOOLEAN
		do
			Result := large (a_sizes [{PE_TABLES}.tGenericParam.to_integer_32 + 1].to_natural_32)
		end

end
