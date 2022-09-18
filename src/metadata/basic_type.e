note
	description: "Enumeration Representing CIL Basic TYpes"
	date: "$Date$"
	revision: "$Revision$"

once class
	BASIC_TYPE

create
	cls, -- type is a reference to a class
	method, -- type is a reference to a method signature
	var, -- type is a generic variable
	mvar, -- type is a generic method param
	Void_, Bool, Char, i8, u8, i16, u16, i32, u32, i64, u64, inative, unative, r32, r64, object, string -- various CIL types

feature {NONE} -- Creation

	cls once end
	method once end
	var once end
	mvar once end
	Void_ once end
	Bool once end
	Char once end
	i8 once end
	u8 once end
	i16 once end
	u16 once end
	i32 once end
	u32 once end
	i64 once end
	u64 once end
	inative once end
	unative once end
	r32 once end
	r64 once end
	object once end
	string once end

feature -- Access

	instances: ITERABLE [BASIC_TYPE]
			-- All known Basic Types
		once
			Result := <<
					{BASIC_TYPE}.cls,
					{BASIC_TYPE}.method,
					{BASIC_TYPE}.var,
					{BASIC_TYPE}.mvar,
					{BASIC_TYPE}.Void_,
					{BASIC_TYPE}.Bool,
					{BASIC_TYPE}.Char,
					{BASIC_TYPE}.i8,
					{BASIC_TYPE}.u8,
					{BASIC_TYPE}.i16,
					{BASIC_TYPE}.u16,
					{BASIC_TYPE}.i32,
					{BASIC_TYPE}.u32,
					{BASIC_TYPE}.i64,
					{BASIC_TYPE}.u64,
					{BASIC_TYPE}.inative,
					{BASIC_TYPE}.unative,
					{BASIC_TYPE}.r32,
					{BASIC_TYPE}.r64,
					{BASIC_TYPE}.object,
					{BASIC_TYPE}.string
				>>
		ensure
			instance_free: class
		end

end
