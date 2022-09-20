note
	description: "[
		Qualifiers is a generic class that holds all the 'tags' you would see on various objects in
		the assembly file.   Where possible things are handled impicitly for example 'nested'
		will automatically be added when a class is nested in another class.
	]"
	date: "$Date$"
	revision: "$Revision$"

class
	QUALIFIERS

create
	make,
	make_with_flags,
	make_from_other

feature {NONE} -- Initialization

	make
		do
			flags := 0
		end

	make_with_flags (a_flags: INTEGER)
		do
			flags := a_flags
		end

	make_from_other (other: QUALIFIERS)
		do
			flags := other.flags
		end

feature -- Access

	flags: INTEGER;

	after_flags : INTEGER
		do
			Result := {METHOD_ATTRIBUTES}.preservesig | {METHOD_ATTRIBUTES}.cil | {METHOD_ATTRIBUTES}.managed | {METHOD_ATTRIBUTES}.runtime
		ensure
			instance_free: class
		end


feature -- Change Element

	set_flags (a_flag: INTEGER)
			-- Set `flags` with `a_flag`.
		do
			flags := a_flag
		end


feature -- Static features

	qualifier_names: ARRAYED_LIST [STRING]
			-- TODO check if this is a good way to represent and
			-- equivalent static field in C++
			-- see QUALIFIERS class.
		once
			create Result.make_from_array (<<
										  	"public",
                                             "private",
                                             "static",
                                             "instance",
                                             "explicit",
                                             "ansi",
                                             "sealed",
                                             "enum",
                                             "value",
                                             "sequential",
                                             "auto",
                                             "literal",
                                             "hidebysig",
                                             "preservesig",
                                             "specialname",
                                             "rtspecialname",
                                             "cil",
                                             "managed",
                                             "runtime",
                                             "",
                                             "virtual",
                                             "newslot",
                                             "",
                                             "",
                                             "",
                                             "",
                                             "",
                                             "",
                                             "",
                                             "",
                                             "",
                                             ""
			>>)
		ensure
			instance_free: class
		end

	reverse_name_prefix (a_rv: STRING_32; a_parent: DATA_CONTAINER; a_pos: INTEGER; a_type: BOOLEAN)
		do
			-- TODO implement
		ensure
			instance_free: class
		end

	name_prefix (a_parent: DATA_CONTAINER; a_type: BOOLEAN): STRING_32
		do
			-- TODO implement
			create Result.make_empty
		ensure
			instance_free: class
		end

	name (a_root: STRING_32; a_parent: detachable DATA_CONTAINER; a_type: BOOLEAN): STRING_32
		do
			-- TODO implement
			create Result.make_empty
		ensure
			instance_free: class
		end

feature -- Output

	il_src_dump_before_flags (a_file: FILE_STREAM)
		local
			n: INTEGER
		do
			n := after_flags.bit_not & flags
			across 0 |..| 31 as i loop
					if n & (1 |<< i) /= 0 then
					a_file.put_string (" ")
					a_file.put_string (qualifier_names[i+1])
				end
			end
		end

	il_src_dump_after_flags (a_file: FILE_STREAM)
		local
			n: INTEGER
		do
			n := after_flags & flags
			across 0 |..| 31 as i loop
					if n & (1 |<< i) /= 0 then
					a_file.put_string (" ")
					a_file.put_string (qualifier_names[i+1])
				end
			end
		end
end
