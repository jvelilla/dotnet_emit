note
	description: "Object representing in Memory Database tables"
	date: "$Date: 2023-03-21 07:56:39 -0300 (Tue, 21 Mar 2023) $"
	revision: "$Revision: 106694 $"

class
	MD_METADATA_TABLES

create
	make

feature {NONE} -- Initialization

	make
		do
			create {ARRAYED_LIST [PE_TABLE_ENTRY_BASE]} table.make (0)
		end

feature -- Access

	table: LIST [PE_TABLE_ENTRY_BASE]
			-- vector of tables that can appear in a PE file
			-- empty tables are elided / pass over?


feature -- Status Report

	size: INTEGER
			-- Table size
		do
			Result := table.count
		end

	is_empty: BOOLEAN
			-- Is the table empty?
		do
			Result := table.is_empty
		end



end
