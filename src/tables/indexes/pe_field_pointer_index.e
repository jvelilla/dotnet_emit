note
	description: "Summary description for {PE_FIELD_POINTER_INDEX}."
	date: "$Date: 2023-07-20 13:39:59 -0300 (Thu, 20 Jul 2023) $"
	revision: "$Revision: 107165 $"

class
	PE_FIELD_POINTER_INDEX

inherit
	PE_POINTER_INDEX

create
	make_with_index

feature -- Access

	associated_table_index: NATURAL_32
		do
			Result := {PE_TABLES}.tFieldPtr
		end

end
