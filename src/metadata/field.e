note
	description: "A field, could be either static or non-static"
	date: "$Date$"
	revision: "$Revision$"

class
	FIELD

create
	make

feature {NONE} -- Initialization

	make (a_name: STRING_32; a_type: CLS_TYPE; a_flags: QUALIFIERS)
		do
			name := a_name
			type := a_type
			flags := a_flags
		end

feature -- Access

	definitions: INTEGER
			-- `definitions' count.

	is_external: BOOLEAN assign set_is_external
			-- Not locally defined.

	explicit_offset: NATURAL assign set_explicit_offset
			-- `explicit_offset'
		attribute check False then end end --| Remove line when `explicit_offset' is initialized in creation procedure.

	pe_index: NATURAL assign set_pe_index
			-- `pe_index'
		attribute check False then end end --| Remove line when `pe_index' is initialized in creation procedure.

	ref: BOOLEAN assign set_ref
			-- Is field referenced?

	byte_length: INTEGER assign set_byte_length
			-- `byte_length'
		attribute check False then end end --| Remove line when `byte_length' is initialized in creation procedure.

	type: CLS_TYPE assign set_type
			-- The `type' of field.

	size: VALUE_SIZE assign set_size
			-- `size'
		attribute check False then end end --| Remove line when `size' is initialized in creation procedure.

	parent: detachable DATA_CONTAINER
			-- `parent'

	flags: QUALIFIERS assign set_flags
			-- The field Qualifiers.

	name: STRING_32 assign set_name
			-- Field `name'

	mode: VALUE_MODE assign set_mode
			-- `mode'
		attribute check False then end end --| Remove line when `mode' is initialized in creation procedure.



feature -- Element change

	increment_definitions
			-- Increment `definitions` count.
		do
			definitions := definitions + 1
		ensure
			definitions_assigned: old definitions + 1 = definitions
		end

	set_is_external (an_is_external: like is_external)
			-- Assign `is_external' with `an_is_external'.
		do
			is_external := an_is_external
		ensure
			is_external_assigned: is_external = an_is_external
		end

	set_explicit_offset (an_explicit_offset: like explicit_offset)
			-- Assign `explicit_offset' with `an_explicit_offset'.
		do
			explicit_offset := an_explicit_offset
		ensure
			explicit_offset_assigned: explicit_offset = an_explicit_offset
		end

	set_pe_index (a_pe_index: like pe_index)
			-- Assign `pe_index' with `a_pe_index'.
		do
			pe_index := a_pe_index
		ensure
			pe_index_assigned: pe_index = a_pe_index
		end

	set_ref (a_ref: like ref)
			-- Assign `ref' with `a_ref'.
		do
			ref := a_ref
		ensure
			ref_assigned: ref = a_ref
		end

	set_byte_length (a_byte_length: like byte_length)
			-- Assign `byte_length' with `a_byte_length'.
		do
			byte_length := a_byte_length
		ensure
			byte_length_assigned: byte_length = a_byte_length
		end

	set_type (a_type: like type)
			-- Assign `type' with `a_type'.
		do
			type := a_type
		ensure
			type_assigned: type = a_type
		end

	set_size (a_size: like size)
			-- Assign `size' with `a_size'.
		do
			size := a_size
		ensure
			size_assigned: size = a_size
		end

	set_parent, set_container (a_parent: like parent)
			-- Assign `parent' with `a_parent'.
			--|Set the field's container
		do
			parent := a_parent
		ensure
			parent_assigned: parent = a_parent
		end

	set_flags (a_flags: like flags)
			-- Assign `flags' with `a_flags'.
		do
			flags := a_flags
		ensure
			flags_assigned: flags = a_flags
		end

	set_name (a_name: like name)
			-- Assign `name' with `a_name'.
		do
			name := a_name
		ensure
			name_assigned: name = a_name
		end

	set_mode (a_mode: like mode)
			-- Assign `mode' with `a_mode'.
		do
			mode := a_mode
		ensure
			mode_assigned: mode = a_mode
		end

end
