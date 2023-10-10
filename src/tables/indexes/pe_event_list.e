note
	description: "Define a type of possible index type that occur in the tables we are interested in."
	date: "$Date: 2023-06-15 02:55:57 -0300 (Thu, 15 Jun 2023) $"
	revision: "$Revision: 106987 $"

class
	PE_EVENT_LIST

inherit
	PE_LIST

create
	make_with_index

feature -- Access

	associated_table_index: NATURAL_32
		do
			Result := {PE_TABLES}.tEvent
		end

end
