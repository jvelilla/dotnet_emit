note
	description: "[
		Base class that contains instructions / labels
    	will be further overridden later to make a 'method'
    	definition
	]"
	date: "$Date$"
	revision: "$Revision$"

class
	CODE_CONTAINER

create
	make

feature {NONE} --Initialization

	make (a_flags: QUALIFIERS)
		do
			flags := a_flags
			create labels.make (0)
			create {ARRAYED_LIST [INSTRUCTION]} instructions.make (0)
		end


feature -- Access

	labels: STRING_TABLE [INSTRUCTION]

	instructions: LIST[INSTRUCTION]

	flags: QUALIFIERS

	parent: detachable DATA_CONTAINER

	has_seh: BOOLEAN

feature -- Change Element

	set_container (a_item: DATA_CONTAINER)
			-- Set `parent` container with `a_item`.
		do
			parent := a_item
		end



end
