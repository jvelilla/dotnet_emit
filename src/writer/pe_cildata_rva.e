note
	description: "Summary description for {PE_CILDATA_RVA}."
	date: "$Date: 2023-04-21 15:59:28 -0300 (Fri, 21 Apr 2023) $"
	revision: "$Revision: 106776 $"

class
	PE_CILDATA_RVA


feature -- Access

	value: NATURAL_32 assign set_value

feature -- Element Change

	set_value (a_val: like value)
			-- Set cildata_rva with `a_val`.
		do
			value := a_val
		ensure
			value_set: value = a_val
		end

end
