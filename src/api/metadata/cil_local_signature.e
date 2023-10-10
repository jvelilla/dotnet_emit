note
	description: "Object representing CIL Local variables."
	date: "$Date: 2023-02-06 08:44:54 -0300 (Mon, 06 Feb 2023) $"
	revision: "$Revision: 106535 $"

class
	CIL_LOCAL_SIGNATURE

create
	make

feature {NONE} -- Initlization

	make
		do
			create locals.make (2)
		end

	locals: ARRAYED_LIST [CIL_LOCAL]
			-- loval variables


feature -- Element Change

	put (a_local: CIL_LOCAL)
			-- Add `local' to end of locals variables.
		do
			locals.force (a_local)
		end

feature -- Removal

	wipe_out
			-- Remove all elements
		do
			locals.wipe_out
		end

feature -- Access

	i_th (i: INTEGER): CIL_LOCAL
			-- Item at `i'-th position
		require
			valid_index: i > 0 and then i <= count
		do
			Result := locals.i_th (i)
		end

feature -- Status Report

	count: INTEGER
			-- Number of local variables.

end
