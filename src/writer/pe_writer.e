note
	description: "This is the main class for generating a PE file"
	date: "$Date$"
	revision: "$Revision$"

class
	PE_WRITER

inherit

	REFACTORING_HELPER

create
	make

feature {NONE} -- Initialization

		--  the maximum number of PE objects we will generate
		--  this includes the following:
		--  	.text / cildata
		--   	.reloc (for the single necessary reloc entry)
		--    	.rsrc (not implemented yet, will hold version info record)

	make (is_exe: BOOLEAN; is_gui: BOOLEAN; a_snk_file: STRING_32)
			--
		do
			dll := not is_exe
			gui := is_gui
			file_align := 0x200
			object_align := 0x2000
			image_base := 0x400000
			language := 0x4b0
			create snk_file.make_from_string (a_snk_file)
		ensure
			dll_set: dll = not is_exe
			gui_set: gui = is_gui
			object_base_zero: object_base = 0
			value_base_zero: value_base = 0
			enum_base_zero: enum_base = 0
			system_index_zero: system_index = 0
			entry_point_zero: entry_point = 0
			param_attribute_type_zero: param_attribute_type = 0
			param_attribute_data_zero: param_attribute_data = 0
			file_align_set: file_align = 0x200
			object_align_set: object_align = 0x2000
			image_base_set: image_base = 0x400000
			language_set: language = 0x4b0
			pe_header_void: pe_header = Void
			pe_object_void: pe_object = Void
			cor20_header_void: cor20_header = Void
			tables_header_void: tables_header = Void
			snk_file_set: snk_file.same_string_general (a_snk_file)
			snk_len_zero: snk_len = 0
			output_file_vooid: output_file = Void
			pe_base_zero: pe_base = 0
			cor_base_zero: cor_base = 0
			snk_base = 0
		end

feature -- Access

	snk_base: NATURAL assign set_snk_base
			-- `snk_base'
		attribute check False then end end --| Remove line when `snk_base' is initialized in creation procedure.

	cor_base: NATURAL assign set_cor_base
			-- `cor_base'
		attribute check False then end end --| Remove line when `cor_base' is initialized in creation procedure.

	pe_base: NATURAL assign set_pe_base
			-- `pe_base'
		attribute check False then end end --| Remove line when `pe_base' is initialized in creation procedure.

	snk_len: NATURAL assign set_snk_len
			-- `snk_len'
		attribute check False then end end --| Remove line when `snk_len' is initialized in creation procedure.

	snk_file: STRING_32
			-- `snk_file'
		attribute check False then end end --| Remove line when `snk_file' is initialized in creation procedure.

	tables_header: detachable DOTNET_META_TABLES_HEADER
			-- `tables_header'

	cor20_header: detachable DOTNET_COR20_HEADER
			-- `cor20_header'

	pe_object: detachable PE_OBJECT
			-- `pe_object'

	pe_header: detachable PE_HEADER
			-- `pe_header'

	language: NATURAL
			-- `language'
		attribute check False then end end --| Remove line when `language' is initialized in creation procedure.

	image_base: NATURAL assign set_image_base
			-- `image_base'
		attribute check False then end end --| Remove line when `image_base' is initialized in creation procedure.

	object_align: NATURAL assign set_object_align
			-- `object_align'
		attribute check False then end end --| Remove line when `object_align' is initialized in creation procedure.

	file_align: NATURAL assign set_file_align
			-- `file_align'
		attribute check False then end end --| Remove line when `file_align' is initialized in creation procedure.

	param_attribute_data: NATURAL assign set_param_attribute_data
			-- `param_attribute_data'
		attribute check False then end end --| Remove line when `param_attribute_data' is initialized in creation procedure.

	param_attribute_type: NATURAL assign set_param_attribute_type
			-- `param_attribute_type'
		attribute check False then end end --| Remove line when `param_attribute_type' is initialized in creation procedure.

	entry_point: NATURAL assign set_entry_point
			-- `entry_point'
		attribute check False then end end --| Remove line when `entry_point' is initialized in creation procedure.

	system_index: NATURAL assign set_system_index
			-- `system_index'
		attribute check False then end end --| Remove line when `system_index' is initialized in creation procedure.

	enum_base: NATURAL assign set_enum_base
			-- `enum_base'
		attribute check False then end end --| Remove line when `enum_base' is initialized in creation procedure.

	value_base: NATURAL assign set_value_base
			-- `value_base'
		attribute check False then end end --| Remove line when `value_base' is initialized in creation procedure.

	object_base: NATURAL assign set_object_base
			-- `object_base'
		attribute check False then end end --| Remove line when `object_base' is initialized in creation procedure.

	gui: BOOLEAN assign set_gui
			-- `gui'

	dll: BOOLEAN assign set_dll
			-- `dll'

	output_file: detachable FILE_STREAM

feature -- Element change

	set_snk_base (a_snk_base: like snk_base)
			-- Assign `snk_base' with `a_snk_base'.
		do
			snk_base := a_snk_base
		ensure
			snk_base_assigned: snk_base = a_snk_base
		end

	set_cor_base (a_cor_base: like cor_base)
			-- Assign `cor_base' with `a_cor_base'.
		do
			cor_base := a_cor_base
		ensure
			cor_base_assigned: cor_base = a_cor_base
		end

	set_pe_base (a_pe_base: like pe_base)
			-- Assign `pe_base' with `a_pe_base'.
		do
			pe_base := a_pe_base
		ensure
			pe_base_assigned: pe_base = a_pe_base
		end

	set_snk_len (a_snk_len: like snk_len)
			-- Assign `snk_len' with `a_snk_len'.
		do
			snk_len := a_snk_len
		ensure
			snk_len_assigned: snk_len = a_snk_len
		end

	set_snk_file (a_snk_file: like snk_file)
			-- Assign `snk_file' with `a_snk_file'.
		do
			snk_file := a_snk_file
		ensure
			snk_file_assigned: snk_file = a_snk_file
		end

	set_tables_header (a_tables_header: like tables_header)
			-- Assign `tables_header' with `a_tables_header'.
		do
			tables_header := a_tables_header
		ensure
			tables_header_assigned: tables_header = a_tables_header
		end

	set_cor20_header (a_cor20_header: like cor20_header)
			-- Assign `cor20_header' with `a_cor20_header'.
		do
			cor20_header := a_cor20_header
		ensure
			cor20_header_assigned: cor20_header = a_cor20_header
		end

	set_pe_object (a_pe_object: like pe_object)
			-- Assign `pe_object' with `a_pe_object'.
		do
			pe_object := a_pe_object
		ensure
			pe_object_assigned: pe_object = a_pe_object
		end

	set_pe_header (a_pe_header: like pe_header)
			-- Assign `pe_header' with `a_pe_header'.
		do
			pe_header := a_pe_header
		ensure
			pe_header_assigned: pe_header = a_pe_header
		end

	set_language (a_language: like language)
			-- Assign `language' with `a_language'.
		do
			language := a_language
		ensure
			language_assigned: language = a_language
		end

	set_image_base (an_image_base: like image_base)
			-- Assign `image_base' with `an_image_base'.
		do
			image_base := an_image_base
		ensure
			image_base_assigned: image_base = an_image_base
		end

	set_object_align (an_object_align: like object_align)
			-- Assign `object_align' with `an_object_align'.
		do
			object_align := an_object_align
		ensure
			object_align_assigned: object_align = an_object_align
		end

	set_file_align (a_file_align: like file_align)
			-- Assign `file_align' with `a_file_align'.
		do
			file_align := a_file_align
		ensure
			file_align_assigned: file_align = a_file_align
		end

	set_param_attribute_data (a_param_attribute_data: like param_attribute_data)
			-- Assign `param_attribute_data' with `a_param_attribute_data'.
		do
			param_attribute_data := a_param_attribute_data
		ensure
			param_attribute_data_assigned: param_attribute_data = a_param_attribute_data
		end

	set_param_attribute_type (a_param_attribute_type: like param_attribute_type)
			-- Assign `param_attribute_type' with `a_param_attribute_type'.
		do
			param_attribute_type := a_param_attribute_type
		ensure
			param_attribute_type_assigned: param_attribute_type = a_param_attribute_type
		end

	set_entry_point (an_entry_point: like entry_point)
			-- Assign `entry_point' with `an_entry_point'.
		do
			entry_point := an_entry_point
		ensure
			entry_point_assigned: entry_point = an_entry_point
		end

	set_system_index (a_system_index: like system_index)
			-- Assign `system_index' with `a_system_index'.
		do
			system_index := a_system_index
		ensure
			system_index_assigned: system_index = a_system_index
		end

	set_enum_base (an_enum_base: like enum_base)
			-- Assign `enum_base' with `an_enum_base'.
		do
			enum_base := an_enum_base
		ensure
			enum_base_assigned: enum_base = an_enum_base
		end

	set_value_base (a_value_base: like value_base)
			-- Assign `value_base' with `a_value_base'.
		do
			value_base := a_value_base
		ensure
			value_base_assigned: value_base = a_value_base
		end

	set_object_base (an_object_base: like object_base)
			-- Assign `object_base' with `an_object_base'.
		do
			object_base := an_object_base
		ensure
			object_base_assigned: object_base = an_object_base
		end

	set_gui (a_gui: like gui)
			-- Assign `gui' with `a_gui'.
		do
			gui := a_gui
		ensure
			gui_assigned: gui = a_gui
		end

	set_dll (a_dll: like dll)
			-- Assign `dll' with `a_dll'.
		do
			dll := a_dll
		ensure
			dll_assigned: dll = a_dll
		end

feature -- Element Change

	add_table_entry (a_entry: PE_TABLE_ENTRY_BASE): NATURAL
			-- add an entry to one of the tables
			-- note the data for the table will be a class inherited from TableEntryBase,
			--  and this class will self-report the table index to use
		do
			to_implement ("Add implementation")
		end

	add_method (a_method: PE_METHOD)
			-- add a method entry to the output list.  Note that Index_(D methods won't be added here.
		do
			to_implement ("Add implementation")
		end

feature -- Stream functions

	hash_string (a_utf8: STRING_32): NATURAL
			-- return the stream index
			--| TODO add a precondition to verify a_utf8 is a valid UTF_8
		do
			to_implement ("Add implementation")
		end

	hash_us (a_str: STRING_32; a_len: INTEGER): NATURAL
			-- return the stream index
		do
			to_implement ("Add implementation")
		end

	hash_guid (a_guid: ARRAY [NATURAL_8]): NATURAL
			-- return the stream index
		do
			to_implement ("Add implementation")
		end

	Hash_Blob (a_blob_data: ARRAY [NATURAL_8]; a_blob_len: NATURAL_8): NATURAL
			-- return the stream index
		do
			to_implement ("Add implementation")
		end

feature -- Various Operations

	RVA_bytes (a_bytes: ARRAY [NATURAL_8]; a_data: NATURAL): NATURAL
			--  this is the 'cildata' contents.   Again we emit into the cildata and it returns the offset in
			--  the cildata to use.  It does NOT return the rva immediately, that is calculated later
		do
			to_implement ("Add implementation")
		end

	set_base_classes (a_object_index: NATURAL; a_value_index: NATURAL; a_enum_index: NATURAL; a_system_index: NATURAL)
			--  Set the indexes of the various classes which can be extended to make new classes
			--  these are typically in the typeref table
			--  Also set the index of the System namespace entry which is t

		do
			to_implement ("Add implementation")
		end

	set_param_attribute (a_param_attribute_type: NATURAL; a_param_attribute_data: NATURAL)
			-- this sets the data for the paramater attribute we support
			-- we aren't generally supporting attributes in this version but we do need to be able to
			-- set a single attribute that means a function has a variable length argument list
		do
			param_attribute_data := a_param_attribute_data
			param_attribute_type := a_param_attribute_type
		ensure
			param_attribute_data_set: param_attribute_data = a_param_attribute_data
			param_attribute_type_set: param_attribute_type = a_param_attribute_type
		end

	create_guid (a_Guid: ARRAY [NATURAL_8])
		do
			to_implement ("Add implementation [instance_free]")
		end

	next_table_index (a_table: INTEGER): NATURAL
		do
			to_implement ("Add implementation")
		end

	write_file (a_corFlags: INTEGER; a_out: FILE_STREAM): BOOLEAN
		do
			to_implement ("Add implementation")
		end

	hash_part_of_file (a_context: CIL_SHA1_CONTEXT; a_offset: NATURAL; a_len: NATURAL)
		do
			to_implement ("Add implementation")
		end

	cildata_rva: detachable ARRAY [NATURAL_8]
			-- TODO double check.
			-- another thing that makes this lib not thread safe, the RVA for
			-- the beginning of the .data section gets put here after it is calculated
			--| defined as
			--|  static DWord cildata_rva_;
			--|  DWord =:: four bytes

feature -- Operations

	calculate_objects (a_cor_flags: INTEGER)
			-- this calculates various addresses and offsets that will be used and referenced
			-- when we actually generate the data.   This must be kept in sync with the code to
			-- generate data
		do
			to_implement ("Add implementation")
		end

feature -- Write operations

    	write_mz_data: BOOLEAN
    		do
    			to_implement("Add implementation")
    		end

    	write_pe_header: BOOLEAN
        	do
    			to_implement("Add implementation")
    		end

    	write_pe_objects: BOOLEAN
    		do
    			to_implement("Add implementation")
    		end

    	write_iat: BOOLEAN
    		do
    			to_implement("Add implementation")
    		end

    	write_core_header: BOOLEAN
    		do
    			to_implement("Add implementation")
    		end

    	write_hash_data: BOOLEAN
    		do
    			to_implement("Add implementation")
    		end

    	write_static_data: BOOLEAN
    		do
    			to_implement("Add implementation")
    		end

		write_methods: BOOLEAN
    		do
    			to_implement("Add implementation")
    		end

		write_metadata_headers: BOOLEAN
    		do
    			to_implement("Add implementation")
    		end

		write_tables: BOOLEAN
    		do
    			to_implement("Add implementation")
    		end

		write_strings: BOOLEAN
    		do
    			to_implement("Add implementation")
    		end

		write_us: BOOLEAN
    		do
    			to_implement("Add implementation")
    		end

 		write_guid: BOOLEAN
    		do
    			to_implement("Add implementation")
    		end

		write_blob: BOOLEAN
    		do
    			to_implement("Add implementation")
    		end

 		write_imports: BOOLEAN
    		do
    			to_implement("Add implementation")
    		end

		write_entry_point: BOOLEAN
    		do
    			to_implement("Add implementation")
    		end

 		write_version_info(a_file_name: STRING_32): BOOLEAN
    		do
    			to_implement("Add implementation")
    		end

    	write_relocs: BOOLEAN
    		do
    			to_implement("Add implementation")
    		end


feature -- Constants

	MAX_PE_OBJECTS: INTEGER = 4
			-- the maximum number of PE objects we will generate
			-- this includes the following:
			-- 	.text / cildata
			-- 	.reloc (for the single necessary reloc entry)
			-- 	.rsrc (not implemented yet, will hold version info record)

end
