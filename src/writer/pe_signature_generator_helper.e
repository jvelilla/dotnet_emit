note
	description: "[
			This class holds functions for generating the various signatures we need
			to put in the blob stream.
		]"
	date: "$Date$"
	revision: "$Revision$"

class
	PE_SIGNATURE_GENERATOR_HELPER

inherit

	PE_SHARED_SIGNATURE_GENERATOR

	REFACTORING_HELPER



feature -- Access: Signature Generators

	method_def_sig (a_signature: CIL_METHOD_SIGNATURE; a_size: CELL [NATURAL_32]): NATURAL_8
		do
			to_implement ("Add implementation")
		end

	method_ref_sig (a_signature: CIL_METHOD_SIGNATURE; a_size: CELL [NATURAL_32]): NATURAL_8
		do
			to_implement ("Add implementation")
		end

	method_spec_sig (a_signature: CIL_METHOD_SIGNATURE; a_size: CELL [NATURAL_32]): NATURAL_8
		do
			to_implement ("Add implementation")
		end

	property_sig (a_property: CIL_PROPERTY; a_size: CELL [NATURAL_32]): NATURAL_8
		do
			to_implement ("Add implementation")
		end

	field_sig (a_field: CIL_FIELD; a_size: CELL [NATURAL_32]): NATURAL_8
		do
			to_implement ("Add implementation")
		end

	local_var_sig (a_method: CIL_METHOD; a_size: CELL [NATURAL_32]): ARRAY [NATURAL_8]
		local
			l_size: INTEGER
		do
			signature_generator.work_area [l_size] := 7
			  -- local sig
			l_size := l_size + 1
			signature_generator.work_area [l_size] := a_method.var_list.count
			create Result.make_empty
			to_implement ("Work in progress")
		ensure
			instance_free: class
		end

	type_var_sig (a_method: CIL_TYPE; a_size: CELL [NATURAL_32]): NATURAL_8
		do
			to_implement ("Add implementation")
		end

	embed_type (a_buf: ARRAY [INTEGER]; a_offset: INTEGER; a_type: CIL_TYPE): NATURAL
			-- this function is a generic function to embed a type
			-- inito a signature
		do
			to_implement ("Add implementation")
		end

feature -- Convert

	convert_to_blob (a_buf: ARRAY [INTEGER]; a_size: INTEGER; a_sz: CELL [NATURAL_32]): NATURAL_8
			-- this function converts a signature buffer to a blob entry, by compressing
			-- the integer values in the signature.
		do
			to_implement ("Add implementation")
		end

	set_object_type (a_object_base: NATURAL_32)
		do
			 signature_generator.object_base := a_object_base.to_integer_32
		ensure
			instance_free: class
		end

feature -- Access

	core_method (a_method: CIL_METHOD_SIGNATURE; a_param_count: INTEGER; a_buf: ARRAY [INTEGER]; a_offset: INTEGER): NATURAL
		do
			to_implement ("Add implementation")
		end

	load_index (a_buf: ARRAY [NATURAL_8]; a_start: CELL [NATURAL_32]; a_len: CELL [NATURAL_32]): NATURAL_32
		do
			to_implement ("Add implementation")
		end


end
