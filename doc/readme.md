

# CIL Object Model

## Containers

### Data
The base class `CIL_DATA_CONTAINER`  contains other data_containers or code_containers  means it can contain namespaces, classes, methods, or fields.
The main assemblyref which holds everything is one of these,which means it acts as the 'unnamed' namespace.

```
	CIL_DATA_CONTAINER
		- CIL_ASSEMBLY
		- CIL_CLASS
			- CIL_ENUM
		- CIL_NAMESPACE
```

### Code

The base class `CIL_CODE_CONTAINER` contains instructions / labels.


```
	CIL_CODE_CONTAINER
		- CIL_METHOD 
```


## Values
The base class `CIL_VALUE`  represent a value., typically to be used as an operand.
Various other classes derive from this to make specific types of operand values.


```
	CIL_VALUE
		- CIL_LOCAL
		- CIL_METHOD_NAME
		- CIL_PARAM
```

## Operand
The class `CIL_OPERAND` represent an operand to an instruccion.


## Type
The class `CIL_TYPE` represent the type of a field or value

```
	CIL_TYPE
		- CIL_BOXED_TYPE
```	

## Intruction
The class `CIL_INSTRUCTION` represent a cil instruction.



## Property
The class `CIL_PROPERTY` represent classic properties, extensions are not supported.

## Attributes
The class `CIL_CUSTOM_ATTRIBUTE_CONTAINER` hold custom attributes. Used to retrive
attributes from .Net assemblyes. Generation is not supported.


## PE_LIB
This is the main to instantiate
The creation procedure creates a working assembly, you put all your code and data into that. 
Using `PE_LIB` you can dump to either .IL, .EXE, or .DLL format.

This library create an object model representing the assembly elements. (Classes, Types, Methods, Instructions, etc).
When the library dump it traverse the AST and generate .IL, .EXE or .DLL.
This library does not support by default to retrieve the metadata about the assembly in the current defined object modl.









