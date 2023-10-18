

From dotnet runtime

//*****************************************************************************
// Define a formal type parameter for the given TypeDef or MethodDef token.
//*****************************************************************************
STDMETHODIMP RegMeta::DefineGenericParam(   // S_OK or error.
        mdToken      tkOwner,               // [IN] TypeDef or MethodDef
        ULONG        ulParamSeq,            // [IN] Index of the type parameter
        DWORD        dwParamFlags,          // [IN] Flags, for future use (e.g. variance)
        LPCWSTR      szName,                // [IN] Name
        DWORD        reserved,              // [IN] For future use
        mdToken      rtkConstraints[],      // [IN] Array of type constraints (TypeDef,TypeRef,TypeSpec)
        mdGenericParam *pgp)                // [OUT] Put GenericParam token here


-- PE_GENERIC_PARAM_TABLE_ENTRY


/*****************************************************************************
// Set props of a formal type parameter.
//*****************************************************************************
STDMETHODIMP RegMeta::SetGenericParamProps(      // S_OK or error.
        mdGenericParam gp,                  // [IN] GenericParam
        DWORD        dwParamFlags,          // [IN] Flags, for future use (e.g. variance)
        LPCWSTR      szName,                // [IN] Optional name
        DWORD        reserved,              // [IN] For future use (e.g. non-type parameters)
        mdToken      rtkConstraints[])     // [IN] Array of type constraints (TypeDef,TypeRef,TypeSpec)

-- PE_GENERIC_PARAM_CONSTRAINTS_TABLE_ENTRY