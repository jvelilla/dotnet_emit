note
	description: "Summary description for {CIL_METADATA_DISPENSER}."
	date: "$Date: 2023-03-24 08:26:50 -0300 (Fri, 24 Mar 2023) $"
	revision: "$Revision: 106705 $"

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
			create emit.make
		end

	emit: MD_EMIT
		-- Emit metadata
end
