note
	description: "[
	 The signature for a method, has a return type and a list of params.  Params can be either named or unnamed
     If the signature is not managed it is PINVOKE
     There are two types of vararg protocols supported.
     When performing a PINVOKE, the native CIL vararg mechanism is used because that is how things are marshalled.
     But if varars are used in the arguments to a managed function, the argument list will end with
     an argument which is an szarray of objects.  It will be tagged appropriately so that other .Net assemblies e.g. 
     C# programs know how to use it as a param list, including the ability to specify an arbitrary number of params.
     When these are passed about in a program you generate you may need to box
     simple values to fit them in the array...

	]"
	date: "$Date$"
	revision: "$Revision$"

class
	METHOD_SIGNATURE

create
	make

feature {NONE} -- Initialization

	make (a_name: STRING_32; a_flags: INTEGER; a_container: detachable DATA_CONTAINER)
		do
			container := a_container
			name := a_name
			flags := a_flags
			create display_name.make_empty
			create {ARRAYED_LIST[PARAM]} params.make(0)
			create {ARRAYED_LIST[PARAM]} vararg_params.make(0)

		end

feature -- Access

	method_parent: detachable METHOD_SIGNATURE

	container: detachable DATA_CONTAINER

	return_type: detachable CLS_TYPE

	array_object: detachable CLS_TYPE

	name: STRING_32

	display_name: STRING_32

	flags: INTEGER

	params: LIST [PARAM]

	vararg_params: LIST [PARAM]

	ref: BOOLEAN

	pe_index: NATURAL

	pe_index_call_site: NATURAL

	pe_index_type: NATURAL

	external_: BOOLEAN

	definitions: NATURAL

	generic: detachable LINKED_LIST [CLS_TYPE]

	generic_parent: detachable METHOD_SIGNATURE

	generic_param_count: INTEGER


feature -- Change Element

	set_return_type (a_type: CLS_TYPE)
			-- Set `return_type` with `a_type`.	
		do
			return_type := a_type
		ensure
			attached return_type as l_type and then l_type = a_type
		end

	add_parameter (a_param: PARAM)
			-- Add a parameter `param` to the list of `params`.
		do
			if vararg_params.count > 0 then
					-- TODO add PELIB_ERROR class.
				{EXCEPTIONS}.raise ("VarargParamsAlreadyDeclared")
			end
			a_param.set_index (params.count)
			params.force (a_param)
		end

	instance (a_instance: BOOLEAN)
			-- Make it an instance member
		do
			if a_instance then
				flags := flags | {METHOD_SIGNATURE_ATTRIBUTES}.instance_flag
			else
				flags := flags & ({METHOD_SIGNATURE_ATTRIBUTES}.instance_flag.bit_not)
			end
		end


feature -- Output

	il_src_dump (a_file: FILE_STREAM; a_names: BOOLEAN; a_type: BOOLEAN; a_pinvoke: BOOLEAN): BOOLEAN
		do
			-- this usage of vararg is for C style varargs
		    -- occil uses C# style varags except in pinvoke and generates
    		-- the associated object array argument
    		if ((flags & {METHOD_SIGNATURE_ATTRIBUTES}.vararg) /= 0) and then
    			not ((flags & {METHOD_SIGNATURE_ATTRIBUTES}.managed) /= 0)
    		then
    			a_file.put_string ("vararg ")
    		end
    		if flags & {METHOD_SIGNATURE_ATTRIBUTES}.instance_flag /= 0 then
    			a_file.put_string ("instance ")
    		end
    		if attached return_type as l_ret_type and then
    			l_ret_type.tp = {BASIC_TYPE}.cls
    		then
    			if attached l_ret_type.type_ref as l_type_ref and then l_type_ref.flags.flags & {METHOD_ATTRIBUTES}.value /= 0  then
    				a_file.put_string ("valuetype ")
    			else
    				a_file.put_string ("class ")
    			end
    		end
    		if attached return_type as l_ret_type then
    			Result := l_ret_Type.il_src_dump (a_file)
    		end
			a_file.put_string (" ")
			if a_type then
				a_file.put_string (" *")
			elseif not name.is_empty then
				if attached array_object as l_array_obj then
					Result := l_array_obj.il_src_dump (a_file)
					a_file.put_string ("::'")
					a_file.put_string (name)
					a_file.put_string ("'")
				elseif a_names then
					a_file.put_string ("'")
					a_file.put_string (name)
					a_file.put_string ("'")
				else
					if attached {CLS_CLASS} container as l_container and then
						not l_container.generics.is_empty
					then
						if l_container.flags.flags & {METHOD_ATTRIBUTES}.value /= 0 then
							a_file.put_string ("valuetype ")
						else
							a_file.put_string ("class ")
						end
							-- TODO implement {QUALIFIERS}.name
						a_file.put_string ({QUALIFIERS}.name ("", l_container, False))
						a_file.put_string (l_container.adorn_generics (False))
					end

				end

			end
		end
end
