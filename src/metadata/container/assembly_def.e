note
	description: "[
		    Base class for assembly definitions
    		this holds the main assembly ( as a non-external assembly)
    		or can hold an external assembly
	]"
	date: "$Date$"
	revision: "$Revision$"

class
	ASSEMBLY_DEF

inherit

	DATA_CONTAINER
	 	rename
	 		make as make_data_container
	 	end

create
	make

feature {NONE} -- Initialization

	make (a_name: STRING_32; a_external: BOOLEAN; a_byte: INTEGER_8)
		do
			make_data_container (a_name, create {QUALIFIERS}.make)
				 -- TODO check how to represent a Byte * in Eiffel
				 -- NATURAL_8 is another option.
--			public_key_token := a_byte
		end

feature -- Access

	revision: INTEGER assign set_revision
			-- `revision'

	build: INTEGER assign set_build
			-- `build'

	minor: INTEGER assign set_minor
			-- `minor'

	major: INTEGER assign set_major
			-- `major'

	is_external: BOOLEAN assign set_is_external
			-- `is_external'


feature -- Element change

	set_revision (a_revision: like revision)
			-- Assign `revision' with `a_revision'.
		do
			revision := a_revision
		ensure
			revision_assigned: revision = a_revision
		end

	set_build (a_build: like build)
			-- Assign `build' with `a_build'.
		do
			build := a_build
		ensure
			build_assigned: build = a_build
		end

	set_minor (a_minor: like minor)
			-- Assign `minor' with `a_minor'.
		do
			minor := a_minor
		ensure
			minor_assigned: minor = a_minor
		end

	set_major (a_major: like major)
			-- Assign `major' with `a_major'.
		do
			major := a_major
		ensure
			major_assigned: major = a_major
		end

	set_is_external (an_is_external: like is_external)
			-- Assign `is_external' with `an_is_external'.
		do
			is_external := an_is_external
		ensure
			is_external_assigned: is_external = an_is_external
		end

feature -- Output

	il_header_dump (a_file: FILE): BOOLEAN
		do
			a_file.put_string (".assembly ")
			if is_external then
				a_file.put_string ("extern ")
			end
			a_file.put_string (name)
			a_file.put_string ("{")
			a_file.put_new_line
			a_file.flush

		end
end
