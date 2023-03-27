note
	description: "Summary description for {MD_STRONG_NAME}."
	author: ""
	date: "$Date: 2023-03-24 08:36:16 -0300 (Fri, 24 Mar 2023) $"
	revision: "$Revision: 106707 $"

deferred class
	MD_STRONG_NAME

feature -- Access

	public_key (a_key_blob: MANAGED_POINTER): detachable MANAGED_POINTER
			-- Retrieve public portion of key pair `a_key_blob`.
		require
			a_key_blob_not_void: a_key_blob /= Void
		deferred
		end

	public_key_token (a_public_key_blob: MANAGED_POINTER): MANAGED_POINTER
			-- Retrieve public key token associated with `a_public_key_blob'.
		require
			a_public_key_blob_not_void: a_public_key_blob /= Void
		deferred
		ensure
			public_key_token_not_void: Result /= Void
		end

	hash_of_file (a_file_path: NATIVE_STRING): MANAGED_POINTER
			-- Compute hash of `a_file_path' using default algorithm.
		require
			a_file_path_not_void: a_file_path /= Void
		deferred
		end

feature -- Status report		

	exists: BOOLEAN
			-- Is `mscorsn.dll' available?		
		deferred
		end

end
