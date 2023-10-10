note
	description: "Summary description for {CIL_CUSTOM_ATTRIBUTE_DESCRIPTOR}."
	date: "$Date: 2023-06-08 13:48:21 -0300 (Thu, 08 Jun 2023) $"
	revision: "$Revision: 106947 $"

class
	CIL_CUSTOM_ATTRIBUTE_DESCRIPTOR


create
	make

feature {NONE} -- Initialization

	make
		do
			create name.make_empty
			size := 0
		ensure
			name_empty: name.is_empty
			size_zero: size = 0
		end
feature -- Access

	name: STRING_32
		-- the name.

	size: NATURAL_32

	data: detachable ARRAY [NATURAL_8]

feature -- Operations

	-- bool operator() (const CustomAttributeDescriptor *left, const CustomAttributeDescriptor *right) const;



end
