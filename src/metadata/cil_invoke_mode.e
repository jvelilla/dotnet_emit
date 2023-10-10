note
	description: "A call to either managed or unmanaged code"
	date: "$Date: 2022-10-12 15:49:49 -0300 (Wed, 12 Oct 2022) $"
	revision: "$Revision: 106380 $"

once class
	CIL_INVOKE_MODE

create
	CIL,
	PInvoke

feature {NONE} -- Creation

	CIL once  end

	PInvoke once  end

feature -- Access

	instances: ITERABLE [CIL_INVOKE_MODE]
			-- All known Invoke Modes
		once
			Result := << {CIL_INVOKE_MODE}.CIL, {CIL_INVOKE_MODE}.PInvoke >>
		ensure
			instance_free: class
		end

end
