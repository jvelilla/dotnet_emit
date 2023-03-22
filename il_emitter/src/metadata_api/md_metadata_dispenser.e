note
	description: "Summary description for {CIL_METADATA_DISPENSER}."
	date: "$Date: 2023-03-21 07:56:39 -0300 (Tue, 21 Mar 2023) $"
	revision: "$Revision: 106694 $"

class
	MD_METADATA_DISPENSER


create
	make

feature -- Scope Definition

	make
			-- Create a new instance of METADATA_DISPENSER
		do
			create emit.make
		end



	emit: MD_METADATA_EMIT
		-- Emit metadata
end
