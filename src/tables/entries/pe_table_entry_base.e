note
	description: "Base class for the metadata tables"
	date: "$Date$"
	revision: "$Revision$"

class
	PE_TABLE_ENTRY_BASE

inherit

	PE_META_BASE

feature -- Access

	table_index: INTEGER
		do
			fixme ("Make it deferred")
		end

feature -- Operations

	render (a_sizes: ARRAY [NATURAL_64]; a_bytes: ARRAY [NATURAL_8]): NATURAL_64
		do
			fixme ("Make it deferred")
		end

	get (a_sizes: ARRAY [NATURAL_64]; a_bytes: ARRAY [NATURAL_8]): NATURAL_64
		do
			fixme ("Make it deferred")
		end
end
