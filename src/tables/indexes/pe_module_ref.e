note
	description: "Define a type of possible index type that occur in the tables we are interested in."
	date: "$Date: 2023-07-10 11:24:14 -0300 (Mon, 10 Jul 2023) $"
	revision: "$Revision: 107116 $"

class
	PE_MODULE_REF

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
			Result := large(a_sizes[{PE_TABLES}.tModuleRef.to_integer_32 + 1])
		end

end
