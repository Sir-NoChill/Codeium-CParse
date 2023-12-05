
;;TODO make each of these sections into one query
;;     and extract all of the data into codeium flags
;; --------- FUNCTIONS --------- ;;
;; docstring functions
(translation_unit
  (comment)* @doc
   .
  (function_definition
   ))

;; function parameters
(function_declarator
  (parameter_list
    (parameter_declaration
      (identifier)* @params)))

;; function names
(function_declarator
  declarator: (identifier) @name)

;; returns  ;; note that this fails to capture the dereference and address operators
(function_definition
  (primitive_type) @returns)

(function_definition
  (sized_type_specifier) @returns)

;; no classes in C99, so I ignore parentage

;; --------- STRUCTS --------- ;;

;; docstring
(translation_unit
 (comment) @docstring
 .
 (struct_specifier))

;; names
(struct_specifier
  (type_identifier) @name)

;; struct members (fields)
(struct_specifier
  (field_declaration_list
    (field_declaration
      (field_identifier) @fields
      )*))

;; --------- IMPORT STATEMENTS --------- ;;

;; import statements
(translation_unit
 (preproc_include)* @import)

;; import paths
(preproc_include
 (string_literal) @import_path)

(preproc_include
 (system_lib_string) @import_path)

;; no aliases in C

;; --------- FUNCTION REFERENCES --------- ;;

;; function calls
(call_expression
 (identifier) @name
 (argument_list
  (identifier) @arguments))

;; --------- CLASS REFERENCE --------- ;;

;; name
(struct_specifier
 (type_identifier) @capture.names)

;; arguments
(initializer_list
 (identifier) @struct_param
 (number_literal) @struct_param
 (char_literal) @struct_param
 (pointer_expression) @struct_param
)
