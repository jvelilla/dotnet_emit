note
	description: "In memory representation of a PE file for CLI."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date: 2020-06-23 17:29:42 -0300 (Tue, 23 Jun 2020) $"
	revision: "$Revision: 104503 $"

class
	CLI_PE_FILE2

inherit
	CLI_PE_FILE_I

	REFACTORING_HELPER
		export {NONE} all end

	MD_UTILITIES
		export
			{NONE} padding, file_alignment
		end

create
	make

feature {NONE} -- Initialization

	make (a_name: like file_name; console_app, dll_app, is_32bits_app: BOOLEAN; e: like emitter)
			-- Create new PE file with name `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
			valid_app_type: dll_app implies console_app
			emitter_attached: attached e
		local
			l_characteristics: INTEGER_16
		do
			is_valid := True
			file_name := a_name
			is_dll := dll_app
			is_console := console_app
			is_32bits := is_32bits_app
			emitter := e

				-- PE file header basic initialization.
			create pe_header.make
			pe_header.set_number_of_sections (2)
			l_characteristics := {CLI_PE_FILE_CONSTANTS}.Image_file_32bit_machine |
				{CLI_PE_FILE_CONSTANTS}.Image_file_executable_image |
				{CLI_PE_FILE_CONSTANTS}.Image_file_line_nums_stripped |
				{CLI_PE_FILE_CONSTANTS}.Image_file_local_syms_stripped
			if is_dll then
				l_characteristics := l_characteristics | {CLI_PE_FILE_CONSTANTS}.Image_file_dll
			end
			pe_header.set_characteristics (l_characteristics)

				-- PE optional header basic initialization.
			create optional_header.make
			if is_console then
				optional_header.set_subsystem (
					{CLI_PE_FILE_CONSTANTS}.Image_subsystem_windows_console)
			else
				optional_header.set_subsystem (
					{CLI_PE_FILE_CONSTANTS}.Image_subsystem_windows_gui)
			end

			create text_section_header.make (".text")
			create reloc_section_header.make (".reloc")

			create iat.make

			create import_table.make (is_dll)

			create cli_header.make (is_32bits)

			create entry_data.make

--			create reloc_section.make
--		ensure
--			file_name_set: file_name = a_name
--			is_valid_set: is_valid
--			is_console_set: is_console = console_app
--			is_dll_set: is_dll = dll_app
		end

feature -- Status

	is_valid: BOOLEAN
			-- Is Current PE file still valid, i.e. not yet saved to disk?

	is_console: BOOLEAN
			-- Is current application a console one?

	is_dll: BOOLEAN
			-- Is current application a DLL?

	is_32bits: BOOLEAN
			-- Is current application a 32bit application?

	file_name: READABLE_STRING_32
			-- Name of current PE file on disk.

	has_strong_name: BOOLEAN
			-- Does current have a strong name signature?

	has_resources: BOOLEAN
			-- Does current have some resources attached?
		do
			Result := resources /= Void
		end

feature -- Access

	debug_directory: detachable CLI_DEBUG_DIRECTORY_I
		do
			to_implement ("Not yet implemented")
		end

	debug_info: detachable MANAGED_POINTER
			-- Data for storing debug information in PE files.
		do
			to_implement ("Not yet implemented")
		end


	text_section_header: CLI_SECTION_HEADER
	reloc_section_header: CLI_SECTION_HEADER
	iat: CLI_IMPORT_ADDRESS_TABLE


		cli_header_has_flag_strong_name_signed: BOOLEAN
			-- Has CLI Header flag "strong_name_signed" ?
		do
			to_implement ("Not yet implemented")
		end

feature -- Access

	pe_header: CLI_PE_FILE_HEADER
			-- PE File header.

	optional_header: CLI_OPTIONAL_HEADER
			-- PE optional header.

	method_writer: detachable MD_METHOD_WRITER
			-- To hold IL code.

	code: detachable MANAGED_POINTER
			-- CLI code instruction stream.

--	debug_directory: detachable CLI_DEBUG_DIRECTORY
--	debug_info: detachable MANAGED_POINTER
--			-- Data for storing debug information in PE files.

	strong_name_directory: detachable CLI_DIRECTORY
	strong_name_info: detachable MANAGED_POINTER
	public_key: detachable MD_PUBLIC_KEY
	signing: detachable MD_STRONG_NAME
--			-- Hold data for strong name signature.

	resources: detachable CLI_RESOURCES
			-- Hold data for resources.

	cli_header: CLI_HEADER
			-- Header for `meta_data'.

--	method_writer: detachable MD_METHOD_WRITER
--			-- To hold IL code.

	emitter: MD_EMIT
		-- Meta data emitter, needed for RVA update.

	import_table: CLI_IMPORT_TABLE

	entry_data: CLI_ENTRY
			-- Data about entry point.

--	reloc_section: CLI_IMAGE_RELOCATION
--			-- Relocation section.


feature -- Settings

	set_method_writer (m: like method_writer)
			-- Set `method_writer' to `m'.
		do
			to_implement ("Not yet implemented")
		end

	set_entry_point_token (token: INTEGER)
			-- Set `token' as entry point of current CLI image.
		do
			to_implement ("Not yet implemented")
		end

	set_debug_information (a_cli_debug_directory: CLI_DEBUG_DIRECTORY_I;
			a_debug_info: MANAGED_POINTER)
			-- Set `debug_directory' to `a_cli_debug_directory' and `debug_info'
			-- to `a_debug_info'.
		do
			to_implement ("Not yet implemented")
		end

	set_public_key (a_key: like public_key; a_signing: like signing)
			-- Set `public_key' to `a_key'.
		do
			to_implement ("Not yet implemented")
		end

	set_resources (r: like resources)
			-- Set `resources' with `r'
		do
			to_implement ("Not yet implemented")
		end

feature -- Saving

	save
		do
			to_implement ("Not yet implemented")
		end

feature {NONE} -- Implementation

	dos_header: MANAGED_POINTER
			-- DOS header.
		once
			create Result.make_from_array ({ARRAY [NATURAL_8]} <<
				0x4D, 0x5A, 0x90, 0x0, 0x3, 0x0, 0x0, 0x0,
				0x4, 0x0, 0x0, 0x0, 0xFF, 0xFF, 0x0, 0x0,
				0xB8, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
				0x40, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
				0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
				0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
				0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
				0x0, 0x0, 0x0, 0x0, 0x80, 0x0, 0x0, 0x0,
				0xE, 0x1F, 0xBA, 0xE, 0x0, 0xB4, 0x9, 0xCD,
				0x21, 0xB8, 0x1, 0x4C, 0xCD, 0x21, 0x54, 0x68,
				0x69, 0x73, 0x20, 0x70, 0x72, 0x6F, 0x67, 0x72,
				0x61, 0x6D, 0x20, 0x63, 0x61, 0x6E, 0x6E, 0x6F,
				0x74, 0x20, 0x62, 0x65, 0x20, 0x72, 0x75, 0x6E,
				0x20, 0x69, 0x6E, 0x20, 0x44, 0x4F, 0x53, 0x20,
				0x6D, 0x6F, 0x64, 0x65, 0x2E, 0xD, 0xD, 0xA,
				0x24, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
				0x50, 0x45, 0x0, 0x0
			>>)
		ensure
			valid_size: dos_header.count = 132
		end

	headers_size, text_size, reloc_size: INTEGER
	headers_size_on_disk, text_size_on_disk, reloc_size_on_disk: INTEGER
	text_rva, code_rva, reloc_rva: INTEGER
			-- Size information about current PE.

	debug_size, strong_name_size, meta_data_size, code_size: INTEGER
	resources_size: INTEGER

	import_table_padding: INTEGER
			-- Padding added before `import_table' so that it is aligned on 16 bytes boundaries.

	import_directory_rva: INTEGER
			-- RVA of import table.

invariant
	file_name_not_void: is_valid implies file_name /= Void
	file_name_not_empty: is_valid implies not file_name.is_empty
	dos_header_not_void: is_valid implies dos_header /= Void

note
	copyright:	"Copyright (c) 1984-2020, Eiffel Software"
	license:	"GPL version 2 (see http://www.eiffel.com/licensing/gpl.txt)"
	licensing_options:	"http://www.eiffel.com/licensing"
	copying: "[
			This file is part of Eiffel Software's Eiffel Development Environment.
			
			Eiffel Software's Eiffel Development Environment is free
			software; you can redistribute it and/or modify it under
			the terms of the GNU General Public License as published
			by the Free Software Foundation, version 2 of the License
			(available at the URL listed under "license" above).
			
			Eiffel Software's Eiffel Development Environment is
			distributed in the hope that it will be useful, but
			WITHOUT ANY WARRANTY; without even the implied warranty
			of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
			See the GNU General Public License for more details.
			
			You should have received a copy of the GNU General Public
			License along with Eiffel Software's Eiffel Development
			Environment; if not, write to the Free Software Foundation,
			Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
		]"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
