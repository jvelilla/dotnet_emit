note
	description: "Summary description for {PE_MODULE_DEF}."
	date: "$Date$"
	revision: "$Revision$"

class
	PE_MODULE_DEF

inherit

	PE_INDEX_BASE
		rename
			make as make_base
		redefine
			get_index_shift,
			has_index_overflow
		end

create {PE_INDEX_BASE}
	make_with_index

create
	make

feature {NONE} -- Initialization

	make
		do
		end

feature -- Operations

	get_index_shift: INTEGER
		do
			Result := 0
		end

	has_index_overflow (a_sizes: ARRAY [NATURAL]): BOOLEAN
		do
			to_implement ("Add implementation")
		end

end
