note
	description: "[
				   A property, note we are only supporting classic properties here, not any
			     * extensions that are allowed in the image file format
		]"
	date: "$Date$"
	revision: "$Revision$"

class
	CIL_PROPERTY

inherit

	REFACTORING_HELPER


create
	make

feature {NONE} -- Intialization

	make
		do
			create name.make_empty
			flags := Special_name
			instance := True
		ensure
			name_empty: name.is_empty
			parent_void: parent = Void
			type_void: type = Void
			setter_void: setter = Void
			getter_void: getter = Void
			flags_set: flags = special_name
		end

feature -- Access

	parent: detachable CIL_DATA_CONTAINER
			-- The parent container (always a class).
			-- Add an invariant.

	instance: BOOLEAN
			-- It is an instance member or an static property.

	name: STRING_32
			-- the name.

	type: detachable CIL_TYPE
		-- the type.

	getter: detachable CIL_METHOD
			-- the getter

	setter: detachable CIL_METHOD
			-- the setter.

	flags: INTEGER

feature -- Enums

	Special_name: INTEGER = 0x200

	RT_special_name: INTEGER = 0x400

	Has_default: INTEGER = 0x1000

feature -- Element Change

	set_name (a_name: STRING_32)
			-- Set `name` with `a_name`.
		do
			name := a_name
		ensure
			name_set: name = a_name
		end

	set_instance (a_val: BOOLEAN)
			-- Set `instance` with `a_val`.
		do
			instance := a_val
		ensure
			instance_set: instance = a_val
		end

	set_type (a_type: like type)
			-- Set `type` with `a_type`. 	
		do
			type := a_type
		ensure
			type_set: type = a_type
		end

	call_get (a_lib: PE_LIB; a_code: CIL_CODE_CONTAINER)
			-- Call the getter, leaving property on stack
			-- If you had other arguments you should push them before the call.
		do
			to_implement("Add implementation")
		end

	call_set (a_lib: PE_LIB; a_code: CIL_CODE_CONTAINER)
			-- Call the setter
			-- If you had other arguments you should push them before the call
			-- then push the value you want to set
		do
			to_implement ("Add implementation")
		end

	set_getter (a_getter: like getter)
			-- Set `getter` with `a_getter`.
		do
			getter := a_getter
		ensure
			getter_set: getter = a_getter
		end

	set_setter (a_setter: like setter)
			-- Set `setter` with `a_setter`.
		do
			setter := a_setter
		ensure
			setter_set: setter = a_setter
		end

	set_container (a_parent: CIL_DATA_CONTAINER; a_add: BOOLEAN)
			-- Set the parent container
			--| always a class.
		require
			is_class: attached {CIL_CLASS} a_parent
		local
			l_parent: like parent
		do
			l_parent := a_parent
			if a_add then
				if attached getter as l_getter then
					l_parent.add (l_getter)
					l_getter.prototype.set_container (a_parent)
				end
				if attached setter as l_setter then
					l_parent.add (l_setter)
					l_setter.prototype.set_container (a_parent)
				end
			end
			parent := l_parent
		end

feature -- Output

	il_src_dump (a_file: FILE_STREAM): BOOLEAN
		do

		end

end
