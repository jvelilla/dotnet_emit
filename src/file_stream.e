note
	description: "Wrapper around FILE interface to enable in memory streamd for debugging"
	date: "$Date$"
	revision: "$Revision$"

class
	FILE_STREAM

create
	make_binary

feature {NONE} -- Initialiation

	make_binary (a_file_name: STRING_32)
		do
			create {RAW_FILE} output_stream.make_create_read_write (a_file_name)
			create debug_output.make_empty
			on_debug := False
		end

	output_stream: FILE
			-- Stream to write the content.

feature -- Access

	on_debug: BOOLEAN
			-- Genereate in memory stream.
			-- by default false.
			-- call enable_debug

	debug_output: STRING_32
			-- In memory string
			-- iff debug is enabled.

feature -- Element change

	enable_debug
		do
			on_debug := True
		ensure
			on_debug_enabled:  on_debug = True
		end

	disable_debug
		do
			on_debug := False
		ensure
			on_debug_disabled: on_debug = False
		end

	put_integer (i: INTEGER)
		do
			output_stream.put_integer (i)
			if on_debug then
				debug_output.append_integer (i)
			end
		end

	put_integer_64 (i: INTEGER_64)
		do
			output_stream.put_integer_64 (i)
			if on_debug then
				debug_output.append_integer_64 (i)
			end
		end

	put_string (s: READABLE_STRING_8)
		do
			output_stream.put_string (s)
			if on_debug then
				debug_output.append_string (s)
			end
		end

	put_new_line
		do
			output_stream.put_new_line
			if on_debug then
				debug_output.append ("%N")
			end
		end

	flush
		do
			output_stream.put_new_line
		end

	close
		do
			output_stream.close
		end
end
