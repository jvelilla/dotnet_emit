note
	description: "[
		A class, note that it cannot contain namespaces which is enforced at compile time
    	note that all classes have to eventually derive from one of the System base classes
     	but that is handled internally 
     	Enums derive from this
	]"
	date: "$Date$"
	revision: "$Revision$"

class
	CLS_CLASS

inherit

	DATA_CONTAINER
		rename
			make as make_container
		end

create
	make

feature {NONE} -- Initialization

	make (a_name: STRING_32; a_flags: QUALIFIERS; a_pack: INTEGER; a_size: INTEGER)
		do
			make_container (a_name, a_flags)
			create extends_name.make_empty
			create {ARRAYED_LIST [CLS_TYPE]} generics.make (0)
			create {ARRAYED_LIST [PROPERTY]} properties.make (0)
		end

feature -- Access

	generic_parent: detachable CLS_CLASS assign set_generic_parent
			-- `generic_parent'

	is_external: BOOLEAN assign set_is_external
			-- `is_external'

	extend_from: detachable CLS_CLASS assign set_extend_from
			-- `extend_from'

	size: INTEGER assign set_size
			-- `size'

	pack: INTEGER assign set_pack
			-- `pack'

	generics: LIST [CLS_TYPE]
		-- The list of generics.

	extends_name: STRING_32

	properties: LIST [PROPERTY]
			-- The list of properties.

feature -- Element change

	set_generic_parent (a_generic_parent: like generic_parent)
			-- Assign `generic_parent' with `a_generic_parent'.
		do
			generic_parent := a_generic_parent
		ensure
			generic_parent_assigned: generic_parent = a_generic_parent
		end

	set_is_external (an_is_external: like is_external)
			-- Assign `is_external' with `an_is_external'.
		do
			is_external := an_is_external
		ensure
			is_external_assigned: is_external = an_is_external
		end

	set_extend_from (an_extend_from: like extend_from)
			-- Assign `extend_from' with `an_extend_from'.
		do
			extend_from := an_extend_from
		ensure
			extend_from_assigned: extend_from = an_extend_from
		end

	set_size (a_size: like size)
			-- Assign `size' with `a_size'.
		do
			size := a_size
		ensure
			size_assigned: size = a_size
		end

	set_pack (a_pack: like pack)
			-- Assign `pack' with `a_pack'.
		do
			pack := a_pack
		ensure
			pack_assigned: pack = a_pack
		end


feature -- Output

	adorn_generics (a_names: BOOLEAN): STRING_32
		local
			l_count: INTEGER
			l_type: CLS_TYPE
			l_file: FILE
		do
			create {RAW_FILE} l_file.make_open_temporary
			create Result.make_empty
			if not generics.is_empty then
				Result.append ("<")
				across generics as it loop
					if a_names and then it.tp = {BASIC_TYPE}.var then
						Result.append_character ('A' + (it.var_num // 26))
						Result.append_character ('A' + (it.var_num \\ 26))
					else
						l_type := it
						l_type.show_type := True
					end
				end
			end
		end

end
