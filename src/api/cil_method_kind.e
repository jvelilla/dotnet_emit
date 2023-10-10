note
	description: "Summary description for {CIL_METHOD_KIND}."
	date: "$Date: 2023-02-09 11:34:44 -0300 (Thu, 09 Feb 2023) $"
	revision: "$Revision: 106545 $"

once class
	CIL_METHOD_KIND

create
	Static, Primary, Instance, Virtual

feature {NONE} -- Initialization

	Static once end
	Primary once end
	Instance once end
	Virtual once end

feature -- Instances

	instances: ITERABLE [CIL_METHOD_KIND]
			-- All known method kinds
		do
			Result := <<{CIL_METHOD_KIND}.Static, {CIL_METHOD_KIND}.Primary, {CIL_METHOD_KIND}.Instance, {CIL_METHOD_KIND}.Virtual>>
		ensure
			instance_free: class
		end

end
