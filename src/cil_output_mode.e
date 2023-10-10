note
	description: "Object representing output modes."
	date: "$Date: 2022-10-17 15:31:32 -0300 (Mon, 17 Oct 2022) $"
	revision: "$Revision: 106386 $"

once class
	CIL_OUTPUT_MODE
create
	ilasm, peexe, pedll, object

feature {NONE} -- Creation

	ilasm once  end
	peexe once  end
	pedll once  end
	object once  end

feature -- Access

	instances: ITERABLE [CIL_OUTPUT_MODE]
			-- All known Output moes
		once
			Result := <<
					{CIL_OUTPUT_MODE}.ilasm,
					{CIL_OUTPUT_MODE}.peexe,
					{CIL_OUTPUT_MODE}.pedll,
					{CIL_OUTPUT_MODE}.object	>>
		ensure
			instance_free: class
		end

end
