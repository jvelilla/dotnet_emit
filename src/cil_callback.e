note
	description: "The callback structure is passed to 'traverse'... it holds callbacks"
	date: "$Date: 2022-10-17 15:31:32 -0300 (Mon, 17 Oct 2022) $"
	revision: "$Revision: 106386 $"

class
	CIL_CALLBACK

feature -- Callbacks

	enter_assembly (a_val: CIL_ASSEMBLY_DEF): BOOLEAN
		do
			Result := True
		end

	exit_assembly (a_val: CIL_ASSEMBLY_DEF): BOOLEAN
		do
			Result := True
		end

	enter_Namespace (a_val: CIL_NAMESPACE): BOOLEAN
		do
			Result := True
		end

	exit_Namespace (a_val: CIL_NAMESPACE): BOOLEAN
		do
			Result := True
		end

	enter_class (a_val: CIL_CLASS): BOOLEAN
		do
			Result := True
		end

	exit_class (a_val: CIL_CLASS): BOOLEAN
		do
			Result := True
		end

	enter_enum (a_val: CIL_ENUM): BOOLEAN
		do
			Result := True
		end

	exit_enum (a_val: CIL_ENUM): BOOLEAN
		do
			Result := True
		end

	enter_method (a_val: CIL_METHOD): BOOLEAN
		do
			Result := True
		end

	enter_field (a_val: CIL_FIELD): BOOLEAN
		do
			Result := True
		end

	enter_property (a_val: CIL_PROPERTY): BOOLEAN
		do
			Result := True
		end

end
