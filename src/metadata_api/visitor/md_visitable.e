note
	description: "Summary description for {MD_VISITABLE}."
	author: ""
	date: "$Date: 2023-07-07 14:45:35 -0300 (Fri, 07 Jul 2023) $"
	revision: "$Revision: 107107 $"

deferred class
	MD_VISITABLE

feature -- Visitor

	accepts (vis: MD_VISITOR)
		deferred
		end

end
