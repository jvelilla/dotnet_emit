note
	description: "Summary description for {PE_OBJECT}."
	date: "$Date$"
	revision: "$Revision$"

class
	PE_OBJECT

create
	make

feature {NONE} -- Initialization

	make
		do
			create name.make (8)
			create reserved.make_filled (0, 1, 3)
		end

feature -- Access

	name: STRING
		-- Size 8.

	virtual_size: INTEGER

	virtual_addr: INTEGER

	raw_size: INTEGER

	raw_ptr: INTEGER

	reserved: ARRAY [INTEGER]

	flags: INTEGER
end
