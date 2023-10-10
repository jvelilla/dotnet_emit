note
	description: "Define a type of possible index type that occur in the tables we are interested in."
	date: "$Date: 2023-06-14 05:57:26 -0300 (Wed, 14 Jun 2023) $"
	revision: "$Revision: 106978 $"

class
	PE_FIELD_LIST

inherit
	PE_LIST

create
	make_default,
	make_with_index

feature -- Access

	associated_table_index: NATURAL_32
		do
			Result := {PE_TABLES}.tField
		end


end
