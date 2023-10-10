note
	description: "Summary description for {PE_META_BASE}."
	date: "$Date: 2022-12-06 15:13:49 -0300 (Tue, 06 Dec 2022) $"
	revision: "$Revision: 106423 $"

class
	PE_META_BASE

inherit

	REFACTORING_HELPER

feature -- Dump

	dump
		do
			-- empty implementation
		ensure
			is_class: class
		end
end
