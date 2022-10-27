note
	description: "Summary description for {PE_MODULE_TABLE_ENTRY}."
	date: "$Date$"
	revision: "$Revision$"

class
	PE_MODULE_TABLE_ENTRY

inherit

	PE_TABLE_ENTRY_BASE

create
	make_with_data

feature {NONE} -- Implementation

	make_with_data (a_name_index: NATURAL; a_guid_index: NATURAL)
		do
			create name_index.make_with_index (a_name_index)
			create guid_index.make_with_index (a_guid_index)
		end

feature -- Access

	name_index: PE_STRING

	guid_index: PE_GUID

end
