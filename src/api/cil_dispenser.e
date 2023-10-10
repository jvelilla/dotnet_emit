note
	description: "Summary description for {CIL_DISPENSER}."
	date: "$Date: 2023-02-02 11:55:15 -0300 (Thu, 02 Feb 2023) $"
	revision: "$Revision: 106524 $"

class
	CIL_DISPENSER

create
	make

feature {NONE}

	make
		do
		end

feature -- Access

	emit: CIL_EMIT
		do
			create Result.make (Current)
		end
end
