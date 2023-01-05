note
	description: "Manage SNK file & perform RSA signature"
	date: "$Date$"
	revision: "$Revision$"

class
	CIL_RSA_ENCODER

inherit

	REFACTORING_HELPER

create
	make

feature {NONE} -- Initialization

	make
		do
			create private_exponent.make_empty
			create key_pair.make_empty
			create modulus.make_empty
		end

feature -- Access

	modulus_bits: NATURAL_64

	public_exponent: INTEGER

	private_exponent: ARRAY [NATURAL_8]

	key_pair: ARRAY [NATURAL_8]

	modulus: ARRAY [NATURAL_8]

feature -- Status Report

	load_strong_name_keys (a_file: STRING_32): NATURAL_64
		local
			l_rv: INTEGER
			l_file: RAW_FILE
			l_test: ARRAY [NATURAL_8]
			l_buf: ARRAY [NATURAL_8]
				-- defined Byte buf[0x14]
			l_target: INTEGER
		do
			fixme ("TODO double check this code correspond to C++ RSAEncoder::LoadStrongNameKeys")
			l_rv := 0
			create l_file.make_open_read (a_file)
			if l_file.exists then
				l_test := {ARRAY [NATURAL_8]} <<0x07, 0x02, 0x00, 0x00, 0x00, 0x24, 0x00, 0x00, 0x52, 0x53, 0x41, 0x32>>
				l_file.read_stream (0x14)
				l_buf := (create {BYTE_ARRAY_CONVERTER}.make_from_string (l_file.last_string)).to_natural_8_array
				if l_buf.count = 0x14 and then
					l_test.is_equal (l_buf.subarray (1, l_test.count)) then
					modulus_bits := {BYTE_ARRAY_HELPER}.byte_array_to_natural_64 (l_buf, l_test.count + 1)
					public_exponent := {BYTE_ARRAY_HELPER}.byte_array_to_natural_32 (l_buf, l_test.count + 5).to_integer_32 -- the original code uses + 4.
					l_file.read_stream ((modulus_bits // 8).to_integer_32)
					if l_file.last_string.count = (modulus_bits // 8).to_integer_32 then
						modulus := (create {BYTE_ARRAY_CONVERTER}.make_from_string (l_file.last_string)).to_natural_8_array
							-- Compute the new file pointer position relative to the current file position
						l_target := (5 * modulus_bits // 16).to_integer_32 + l_file.position
						if l_target <= l_file.count then
								-- move the file pointer position.
							l_file.go (l_target)
							l_file.read_stream ((modulus_bits // 8).to_integer_32)
							if l_file.last_string.count = (modulus_bits // 8).to_integer_32 then
								private_exponent := (create {BYTE_ARRAY_CONVERTER}.make_from_string (l_file.last_string)).to_natural_8_array
							end
							l_file.go (0)
							l_file.read_stream ((modulus_bits // 8 + 0x14).to_integer_32)
							if l_file.last_string.count = (modulus_bits // 8 + 0x14).to_integer_32 then
								key_pair := (create {BYTE_ARRAY_CONVERTER}.make_from_string (l_file.last_string)).to_natural_8_array
								l_rv := (modulus_bits // 8).to_integer_32
							end
						end
					end

				end
			end
			Result := l_rv.to_natural_64
			l_file.close
		end

	get_public_key_data (a_key: ARRAY [NATURAL_8]; a_len: CELL [NATURAL_64])
		do
			to_implement ("Add implementation")
		end

	get_strong_name_signature (a_sig: ARRAY [NATURAL_8]; a_sig_len: CELL [NATURAL_64]; a_hash: ARRAY [NATURAL_8]; a_hash_size: NATURAL_64)
			-- Defined as void RSAEncoder::GetStrongNameSignature(Byte* sig, size_t* sigSize, const Byte* hash, size_t hashSize)
		do
			to_implement ("Add implementation")
		end

end
