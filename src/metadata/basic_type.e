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

	cls once index := 0 end
	method once index := 1 end
	var once index := 2 end
	mvar once index := 3 end
	Void_ once index := 4 end
	Bool once index := 5 end
	Char once index := 6 end
	i8 once index :=  7 end
	u8 once index := 8 end
	i16 once index := 9 end
	u16 once index := 10 end
	i32 once index := 11 end
	u32 once index := 12 end
	i64 once index := 13 end
	u64 once index := 14 end
	inative once index := 15 end
	unative once index := 16 end
	r32 once index := 17 end
	r64 once index := 18 end
	object once index := 19 end
	string once index :=  20 end

feature -- Access

	index: INTEGER

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
