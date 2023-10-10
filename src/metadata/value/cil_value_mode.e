note
	description: "Mode for the initialized value"
	date: "$Date: 2022-10-12 15:49:49 -0300 (Wed, 12 Oct 2022) $"
	revision: "$Revision: 106380 $"

once class
	CIL_VALUE_MODE
create
	None,
	Enum,
	Bytes

feature {NONE} -- Creation

	None
			-- No initialized value
		once end

	Enum
			--  Enumerated value, goes into the constant table
		once end

	Bytes
			-- Byte stream, goes into the sdata
		once end

feature -- Instances

	instances: ITERABLE [CIL_VALUE_MODE]
			-- All known value modes.
		do
			Result := <<
					{CIL_VALUE_MODE}.None,
					{CIL_VALUE_MODE}.Enum,
					{CIL_VALUE_MODE}.Bytes
				>>
		ensure
			is_class: class
		end

end
