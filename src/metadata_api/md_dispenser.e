note
	description: "Summary description for {CIL_METADATA_DISPENSER}."
	date: "$Date: 2023-06-01 17:00:08 -0300 (Thu, 01 Jun 2023) $"
	revision: "$Revision: 106906 $"

class
	MD_DISPENSER

inherit
	MD_DISPENSER_I
		rename
			emitter as emit
		end
		
create
	make

feature -- Scope Definition

	make
			-- Create a new instance of METADATA_DISPENSER
		do
			-- create emit.make
		end

	emit: MD_EMIT
			-- Emit metadata
		do
			create Result.make
		end

end
