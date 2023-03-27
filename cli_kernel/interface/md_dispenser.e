note
	description: "Summary description for {MD_DISPENSER}."
	author: ""
	date: "$Date: 2023-03-24 08:36:16 -0300 (Fri, 24 Mar 2023) $"
	revision: "$Revision: 106707 $"

deferred class
	MD_DISPENSER

feature -- Definition

	emitter: MD_EMIT
			-- Create new scope and returns an emitter.	
		deferred
		end

end
