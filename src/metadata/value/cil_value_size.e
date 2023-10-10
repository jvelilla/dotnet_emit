note
	description: "Size for enumerated values"
	date: "$Date: 2022-10-12 15:49:49 -0300 (Wed, 12 Oct 2022) $"
	revision: "$Revision: 106380 $"

once class
	CIL_VALUE_SIZE
create
	i8, i16, i32, i64

feature {NONE} -- Creation

	i8 once end
	i16 once  end
	i32 once  end
	i64 once  end

feature -- Instances

	instances: ITERABLE[CIL_VALUE_SIZE]
			-- All known value sizes.
		do
			Result :=<<
				{CIL_VALUE_SIZE}.i8,
				{CIL_VALUE_SIZE}.i16,
				{CIL_VALUE_SIZE}.i32,
				{CIL_VALUE_SIZE}.i64
			>>
		ensure
			is_class: class
		end
end
