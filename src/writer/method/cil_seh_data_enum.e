note
	description: "CIL_SEH_DATA flags"
	date: "$Date: 2022-10-28 11:07:55 -0300 (Fri, 28 Oct 2022) $"
	revision: "$Revision: 106390 $"

once class
	CIL_SEH_DATA_ENUM

create
	 Exception,
     Filter,
     Finally,
     Fault

feature {NONE}-- Creation procedures

	Exception
		once
			value := 0
		end

    Filter
    	once
    		value := 1
    	end

    Finally
    	once
		    value := 2
		end

    Fault
    	once
    		value := 4
    	end

feature -- Access

	value: INTEGER

feature -- Instances

	instances: ITERABLE [CIL_SEH_DATA_ENUM]
		do
			Result := <<{CIL_SEH_DATA_ENUM}.Exception, {CIL_SEH_DATA_ENUM}.Filter, {CIL_SEH_DATA_ENUM}.Finally, {CIL_SEH_DATA_ENUM}.Fault >>
		ensure
			is_class: class
		end
end
