note
	description: "Summary description for {CLI_HEADER}."
	date: "$Date$"
	revision: "$Revision$"
	ECMA_section: "II.25.3.3 CLI header"

class
	CLI_HEADER

create
	make

feature {NONE} -- Initialization

	make (a_32bits: BOOLEAN)
			-- Allocate item
		local
			l_flags: INTEGER
		do
			set_cb (size_of)
			set_major_runtime_version (2)
			set_minor_runtime_version (5)

			l_flags := il_only
			if a_32bits then
				l_flags := l_flags | il_32bits
			end
			set_flags (l_flags)
			set_managed_native_header (create {CLI_DIRECTORY})
			set_export_address_table_jumps (create {CLI_DIRECTORY})
			set_vtable_fixups (create {CLI_DIRECTORY})
			set_code_manager_table (create {CLI_DIRECTORY})
			set_strong_name_signature (create {CLI_DIRECTORY})
			set_resources (create {CLI_DIRECTORY})
			set_meta_data (create {CLI_DIRECTORY})
		end

feature -- Access: Header versioning

	cb: INTEGER_32
			-- The size of the structure.

	major_runtime_version: INTEGER_16
			-- The major version number of the .NET runtime.

	minor_runtime_version: INTEGER_16
			-- The minor version number of the .NET runtime.

feature -- Access: 	Symbol table and startup information

	meta_data: CLI_DIRECTORY
			-- A data directory that points to the .NET metadata.

	flags: INTEGER_32
			-- Flags that indicate how to load the .NET module.

	entry_point_token: INTEGER_32
			-- The token for the method that is the entry point for the .NET module.

feature -- Access: Binding information

	resources: CLI_DIRECTORY
			-- A data directory that points to the resources used by the .NET module.

	strong_name_signature: CLI_DIRECTORY
			-- A data directory that points to the strong name signature of the .NET module.

feature -- Access: Regular fixup and binding information

	code_manager_table: CLI_DIRECTORY
			-- A data directory that points to the code manager table of the .NET module.

	vtable_fixups: CLI_DIRECTORY
			-- A data directory that points to the virtual table (VTable) fixups used by the .NET module.

	export_address_table_jumps: CLI_DIRECTORY
			-- A data directory that points to the export address table (EAT) jumps used by the .NET module.

feature --Access:  Precompiled image info (internal use only - set to zero)
	managed_native_header: CLI_DIRECTORY
			-- A data directory that contains precompiled image info used by the .NET module.

feature -- Constants

	il_only: INTEGER = 0x00000001
			-- Should always be set.

	il_32bits: INTEGER = 0x00000002
			-- Should be set for 32bit generated assemblies

	strong_name_signed: INTEGER = 0x00000008
			-- Image has strong name signature.

feature -- Element Change

	set_cb (a_cb: INTEGER_32)
			-- Set `cb` with `a_cb`.
		do
			cb := a_cb
		end

	set_major_runtime_version (a_major_runtime_version: INTEGER_16)
			-- Set `major_runtime_version` with `a_major_runtime_version`.
		do
			major_runtime_version := a_major_runtime_version
		end

	set_minor_runtime_version (a_minor_runtime_version: INTEGER_16)
			-- Set `minor_runtime_version` with `a_minor_runtime_version`.
		do
			minor_runtime_version := a_minor_runtime_version
		end

	set_meta_data (a_meta_data: CLI_DIRECTORY)
			-- Set `meta_data` with `a_meta_data`.
		do
			meta_data := a_meta_data
		end

	set_flags (a_flags: INTEGER_32)
			-- Set `flags` with `a_flags`.
		do
			flags := a_flags
		end

	set_entry_point_token (an_entry_point_token: INTEGER_32)
			-- Set `entry_point_token` with `an_entry_point_token`.
		do
			entry_point_token := an_entry_point_token
		end

	set_resources (a_resources: CLI_DIRECTORY)
			-- Set `resources` with `a_resources`.
		do
			resources := a_resources
		end

	set_strong_name_signature (a_strong_name_signature: CLI_DIRECTORY)
			-- Set `strong_name_signature` with `a_strong_name_signature`.
		do
			strong_name_signature := a_strong_name_signature
		end

	set_code_manager_table (a_code_manager_table: CLI_DIRECTORY)
			-- Set `code_manager_table` with `a_code_manager_table`.
		do
			code_manager_table := a_code_manager_table
		end

	set_vtable_fixups (a_vtable_fixups: CLI_DIRECTORY)
			-- Set `vtable_fixups` with `a_vtable_fixups`.
		do
			vtable_fixups := a_vtable_fixups
		end

	set_export_address_table_jumps (an_export_address_table_jumps: CLI_DIRECTORY)
			-- Set `export_address_table_jumps` with `an_export_address_table_jumps`.
		do
			export_address_table_jumps := an_export_address_table_jumps
		end

	set_managed_native_header (a_managed_native_header: CLI_DIRECTORY)
			-- Set `managed_native_header` with `a_managed_native_header`.
		do
			managed_native_header := a_managed_native_header
		end

feature -- Managed Pointer

	item: MANAGED_POINTER
			-- write the items to the buffer in  little-endian format.
		local
			l_pos: INTEGER
		do
			create Result.make (size_of)
			l_pos := 0

				--
				--  Header versioning
				--
				-- cb
			Result.put_integer_32_le (cb, l_pos)
			l_pos := l_pos + {PLATFORM}.integer_32_bytes

				-- major_runtime_version
			Result.put_integer_16_le (major_runtime_version, l_pos)
			l_pos := l_pos + {PLATFORM}.integer_16_bytes

				-- minor_runtime_version
			Result.put_integer_16_le (minor_runtime_version, l_pos)
			l_pos := l_pos + {PLATFORM}.integer_16_bytes

				--
				-- Symbol table and startup information
				--
				-- meta_data
			Result.put_pointer (meta_data.item.item, l_pos)
			l_pos := l_pos + {CLI_DIRECTORY}.size_of

				-- flags
			Result.put_integer_32_le (flags, l_pos)
			l_pos := l_pos + {PLATFORM}.integer_32_bytes

				-- entry_point_token
			Result.put_integer_32_le (entry_point_token, l_pos)
			l_pos := l_pos + {PLATFORM}.integer_32_bytes

				--
				--  Binding information
				--
				-- resources
			Result.put_pointer (resources.item.item, l_pos)
			l_pos := l_pos + {CLI_DIRECTORY}.size_of

				-- strong_name_signature
			Result.put_pointer (strong_name_signature.item.item, l_pos)
			l_pos := l_pos + {CLI_DIRECTORY}.size_of

				--
				--  Regular fixup and binding information
				--
				-- code_manager_table
			Result.put_pointer (code_manager_table.item.item, l_pos)
			l_pos := l_pos + {CLI_DIRECTORY}.size_of

				-- vtable_fixups
			Result.put_pointer (vtable_fixups.item.item, l_pos)
			l_pos := l_pos + {CLI_DIRECTORY}.size_of

				-- export_address_table_jumps
			Result.put_pointer (export_address_table_jumps.item.item, l_pos)
			l_pos := l_pos + {CLI_DIRECTORY}.size_of

				--
				-- Precompiled image info (internal use only - set to zero)
				--
				-- managed_native_header
			Result.put_pointer (managed_native_header.item.item, l_pos)
			l_pos := l_pos + {CLI_DIRECTORY}.size_of
		end

feature -- Size

	size_of: INTEGER_32
			-- Size of the structure.
		do
				-- cb
			Result := {PLATFORM}.integer_32_bytes

				-- major_runtime_version
			Result := Result + {PLATFORM}.integer_16_bytes

				-- minor_runtime_version
			Result := Result + {PLATFORM}.integer_16_bytes

				--
				-- Symbol table and startup information
				--
				-- meta_data
			Result := Result + {CLI_DIRECTORY}.size_of

				-- flags
			Result := Result + {PLATFORM}.integer_32_bytes

				-- entry_point_token
			Result := Result + {PLATFORM}.integer_32_bytes

				--
				--  Binding information
				--
				-- resources
			Result := Result + {CLI_DIRECTORY}.size_of

				-- strong_name_signature
			Result := Result + {CLI_DIRECTORY}.size_of

				--
				--  Regular fixup and binding information
				--
				-- code_manager_table
			Result := Result + {CLI_DIRECTORY}.size_of

				-- vtable_fixups
			Result := Result + {CLI_DIRECTORY}.size_of

				-- export_address_table_jumps
			Result := Result + {CLI_DIRECTORY}.size_of

				--
				-- Precompiled image info (internal use only - set to zero)
				--
				-- managed_native_header
			Result := Result + {CLI_DIRECTORY}.size_of

		ensure
			is_class: class
		end

end
