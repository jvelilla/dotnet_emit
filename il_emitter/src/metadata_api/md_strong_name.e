note
	description: "Summary description for {CIL_STRONG_NAME}."
	date: "$Date: 2023-03-21 07:56:39 -0300 (Tue, 21 Mar 2023) $"
	revision: "$Revision: 106694 $"

class
	MD_STRONG_NAME

create
	make

feature {NONE} -- Initialization

	make
		do
			snk_file := ""
		end

	snk_file: STRING_32

end
