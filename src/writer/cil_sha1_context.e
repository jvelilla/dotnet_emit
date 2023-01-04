note
	description: "[
			Object that will hold context information for the hashing operation
		]"
	date: "$Date$"
	revision: "$Revision$"

class
	CIL_SHA1_CONTEXT

inherit

	REFACTORING_HELPER

create
	make

feature {NONE} -- Initialization

	make
		do
			create message_digest.make_filled (0, 1, 5)
			create message_block.make_filled (0, 1, 64)
		ensure
			message_block_set: message_block.capacity = 64
			message_digest_set: message_digest.capacity = 5
		end

feature -- Access

	message_digest: ARRAY [NATURAL]
			-- Message Digest (output)
			--| defined as unsigned Message_Digest[5].

	length_low: NATURAL
			-- Message length in bits

	length_high: NATURAL
			-- Message length in bits

	message_block: ARRAY [NATURAL_8]
			-- 512-bit message blocks
			--| defined as unsigned char Message_Block[64]

	message_block_index: INTEGER
			-- Index into message block array.		

	computed: INTEGER
			--Is the digest computed?

	corrupted: INTEGER
			-- Is the message digest corruped?

feature -- Operations

	sha1_reset
			-- initialize the CIL_SHA1_Context in preparation
			-- in preparation for computing a new message digest.
		do
			length_low := 0
			length_high := 0
			message_block_index := 0

			message_digest[1] := 0x67452301
    		message_digest[2] := 0xEFCDAB89
    		message_digest[3] := 0x98BADCFE
    		message_digest[4] := 0x10325476
    		message_digest[5] := 0xC3D2E1F0

			computed := 0
			corrupted := 0
		end

	sha1_result: INTEGER
			-- Set 160-bit message digest into the  Message_Digest array within the CIL_SHA1_CONTEXT.
			-- Return 1 true, 0 false.
			--| TODO use BOOLEAN.
		local
			n, n1: NATURAL
		do
			if corrupted /=0 then
				Result := 0
			else
				if computed = 0 then
					sha1_pad_message
					computed := 1
						--rearrange for littleendian processors
					across 1 |..| 5 as i loop
						n := message_digest [i]
						n1 := 0
						n1 := (n |>> 24) + ((n |>> 8) & 0xff00) + ((n |<< 8) & 0xff0000) + (n |<< 24)
						message_digest[i] := n1
					end
				end
				Result := 1
			end
		end

	sha1_input (a_string: STRING_32; a_length: NATURAL)
		local
			l_exit: BOOLEAN
			l_length: NATURAL
			i: INTEGER
		do
			if a_length = 0 then
				l_exit := True
			end

			if not l_exit and then (computed /= 0 or else corrupted /= 0) then
				l_exit := True
			end

			if not l_exit then
				from
					i := 1
					l_length := a_length
				until
					l_length = 0 or corrupted /= 0
				loop
					message_block [message_block_index] := (a_string.at (i).code & 0xff).to_natural_8
					length_low := length_low + 8

						-- Force it to 32 bits
					length_low := length_low & 0xFFFFFFFF
					if length_low = 0 then
						length_high := length_high + 1
							-- Force it to 32 bits
						length_high := length_high & 0xFFFFFFFF
						if length_high = 0 then
								-- Message too long
							corrupted := 1
						end
					end
					if message_block_index = 64 then
						sha1_process_message_block
					end
					i := i +1
				end

			end
		end


feature -- Convertion

	message_digest_byte: ARRAY [NATURAL_8]
		do
			create Result.make_filled (0, 1, message_digest.count)
			across 1 |..| message_digest.count as i loop
				Result [i] := message_digest [i].to_natural_8
			end
		end

feature {NONE} -- implementation

	sha1_process_message_block
			-- *  Description:
			-- *      This function will process the next 512 bits of the message
			-- *      stored in the Message_Block array.
			-- *
			-- *  Parameters:
			-- *      None.
			-- *
			-- *  Returns:
			-- *      Nothing.
			-- *
			-- *  Comments:
			-- *      Many of the variable names in the SHAContext, especially the
			-- *      single character names, were used because those were the names
			-- *      used in the publication.
		do
			to_implement ("Add implementation")
		end

	sha1_pad_message
				--  Pad the current context.
				-- Description:
				--     According to the standard, the message must be padded to an even
				--     512 bits.  The first padding bit must be a '1'.  The last 64
				--     bits represent the length of the original message.  All bits in
				--     between should be 0.  This function will pad the message
				--     according to those rules by filling the Message_Block array
				--     accordingly.  It will also call `sha1_process_message_block`
				--     appropriately.  When it returns, it can be assumed that the
				--     message digest has been computed.
		do
			to_implement ("Add implementation")
		end

end

