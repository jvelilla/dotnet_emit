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
--        DNLTable tables_[MaxTables];
--        size_t sizes_[MaxTables + ExtraIndexes];
--        std::string libPath_;



feature -- Constants

	ERR_FILE_NOT_FOUND: INTEGER = 1
	ERR_NOT_PE: INTEGER = 2
	ERR_NOT_ASSEMBLY: INTEGER = 3
	ERR_INVALID_ASSEMBLY: INTEGER = 3
	ERR_UNKNOWN_TABLE: INTEGER = 5

end
