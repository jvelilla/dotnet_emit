note
	description: "Representation of an IMAGE_DATA_DIRECTORY for CLI."
	date: "$Date$"
	revision: "$Revision$"
	EIS: "name=image_data_directory", "src=https://learn.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-image_data_directory", "protocol=uri"

class
    CLI_DIRECTORY


feature -- Access

    virtual_address: INTEGER_32
            -- RVA of the directory.

    size: INTEGER_32
            -- Size of the directory in bytes.


feature -- Setter

    set_virtual_address (a_virtual_address: INTEGER_32)
    		-- Set `virtual_address` to `a_virtual_address'.
        do
            virtual_address := a_virtual_address
        end

    set_size (a_size: INTEGER_32)
    		-- Set `size` with `a_size'.
        do
            size := a_size
        end

feature -- Managed Pointer

	item: MANAGED_POINTER
			-- write the items to the buffer in  little-endian format.
		local
			l_pos: INTEGER
		do
			create Result.make(size_of)
			l_pos := 0

				-- virtual_address
			Result.put_integer_32_le(virtual_address, l_pos)
			l_pos := l_pos + {PLATFORM}.integer_32_bytes

				-- size
			Result.put_integer_32_le(size, l_pos)
		end

feature -- Size

    size_of: INTEGER_32
    		-- Size of the structure.
        do
        		-- virtual address
            Result := {PLATFORM}.integer_32_bytes
            	-- size
            Result := Result + {PLATFORM}.integer_32_bytes
        ensure
        	is_class: class
        end

end -- class CLI_DIRECTORY
