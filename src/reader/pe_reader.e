note
	description: "Summary description for {PE_READER}."
	date: "$Date$"
	revision: "$Revision$"

class
	PE_READER

create
	make

feature {NONE} -- Initialization

	make
		do
			create objects
			create tables.make({PE_TABLE_CONSTANTS}.max_tables)
			create lib_path.make_empty
			create sizes.make_filled (0, 1, {PE_TABLE_CONSTANTS}.max_tables + {PE_TABLE_CONSTANTS}.extra_indexes)
		end


feature {NONE} -- Implemenation

	input_file: detachable FILE

	num_objects: INTEGER

	cor_rva: NATURAL

	blob_pos: NATURAL

	string_pos: NATURAL

	string_data: detachable ARRAY [NATURAL_8]

	blog_data: detachable ARRAY [NATURAL_8]

	guid_pos: NATURAL

	objects: PE_OBJECT

	tables: DNL_TABLE
		-- build with Max_Tables

	sizes: ARRAY [NATURAL_32]
		-- Max_Tables + Extra_Indexes

	lib_path: STRING_32


feature -- Operations

	managed_load (a_name: STRING_32; a_major, a_minor, a_build, a_revision: INTEGER)
		do

		end

feature -- Constants

	ERR_FILE_NOT_FOUND: INTEGER = 1
	ERR_NOT_PE: INTEGER = 2
	ERR_NOT_ASSEMBLY: INTEGER = 3
	ERR_INVALID_ASSEMBLY: INTEGER = 3
	ERR_UNKNOWN_TABLE: INTEGER = 5

end
