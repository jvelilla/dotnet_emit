note
	description: "Summary description for {TEST_METADATA_TABLES}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TEST_METADATA_TABLES_TK

feature -- Test
	test_empty_assembly
			-- New test routine
		local
			l_pe_file: CIL_PE_FILE
			md_dispenser: MD_DISPENSER
			md_emit: MD_EMIT

		do
			create md_dispenser.make
			md_emit := md_dispenser.emit
			create l_pe_file.make ("test_empty_tk.dll", True, True, False, md_emit)
			l_pe_file.save
		end

	test_define_assembly
			-- New test routine
		local
			l_pe_file: CIL_PE_FILE
			md_dispenser: MD_DISPENSER
			md_emit: MD_EMIT
			md_assembly_info: MD_ASSEMBLY_INFO
			my_assembly: INTEGER
		do

			create md_dispenser.make
			md_emit := md_dispenser.emit

			create md_assembly_info.make
			md_assembly_info.set_major (5)
			md_assembly_info.set_minor (2)
			my_assembly := md_emit.define_assembly (create {NATIVE_STRING}.make ("manus_assembly"),
						0, md_assembly_info, Void)

			create l_pe_file.make ({STRING_32}"test_define_assembly_tk.dll", True, True, False, md_emit)
			l_pe_file.save
		end
end
