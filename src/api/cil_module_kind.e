note
	description: "Summary description for {CIL_MODULE_KIND}."
	date: "$Date: 2023-02-09 11:34:44 -0300 (Thu, 09 Feb 2023) $"
	revision: "$Revision: 106545 $"

once class
	CIL_MODULE_KIND

create
	Library,
	GuiApp,
	ConsoleApp

feature {NONE} -- Initialization

	Library
			-- no subsystem
		once
			value := 1
		end

	GuiApp
			-- subsystem
		once
			value := 2
		end

	ConsoleApp
			-- subsystem.
		once
			value := 3
		end

feature -- Access

	value: INTEGER
			-- Current associated value for the module kind.

	instances: ITERABLE [CIL_MODULE_KIND]
			-- All known instances of Module Kind.
		do
			Result := <<{CIL_MODULE_KIND}.library,
					{CIL_MODULE_KIND}.guiapp,
					{CIL_MODULE_KIND}.consoleapp
				>>
		ensure
			instance_free: class
		end

end
