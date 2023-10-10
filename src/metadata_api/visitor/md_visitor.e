note
	description: "Summary description for {MD_VISITOR}."
	author: ""
	date: "$Date: 2023-07-14 14:46:15 -0300 (Fri, 14 Jul 2023) $"
	revision: "$Revision: 107152 $"

class
	MD_VISITOR

feature -- Access

	visit_emitter (o: MD_EMIT)
		do
		end

	visit_table (o: MD_TABLE)
		do
		end

	visit_table_entry (o: PE_TABLE_ENTRY_BASE)
		do
		end

	visit_index (o: PE_INDEX_BASE)
		do
		end

	visit_coded_index (o: PE_CODED_INDEX_BASE)
		do
		end

	visit_pointer_index (o: PE_POINTER_INDEX)
		do
		end

end
