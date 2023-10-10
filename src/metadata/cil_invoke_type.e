note
	description: "Linkage type for unmanaged call"
	date: "$Date: 2022-10-12 15:49:49 -0300 (Wed, 12 Oct 2022) $"
	revision: "$Revision: 106380 $"

once class
	CIL_INVOKE_TYPE
create
	Cdecl,
	Stdcall

feature {NONE} -- Creation

	Cdecl once  end

	Stdcall once end

feature -- Access

	instances: ITERABLE [CIL_INVOKE_TYPE]
			-- All known invoke types
		do
			Result := << {CIL_INVOKE_TYPE}.Cdecl, {CIL_INVOKE_TYPE}.Stdcall >>
		ensure
			instance_free: class
		end
end
