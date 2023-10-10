note
	description: "Summary description for {PE_SHARED_SIGNATURE_GENERATOR}."
	date: "$Date: 2022-11-17 09:20:55 -0300 (Thu, 17 Nov 2022) $"
	revision: "$Revision: 106398 $"

class
	PE_SHARED_SIGNATURE_GENERATOR


feature {NONE} -- Access

	signature_generator: PE_SIGNATURE_GENERATOR
			-- An signature_generator object.
		once
			create Result
		ensure
			instance_free: class
		end


end
