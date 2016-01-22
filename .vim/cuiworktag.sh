#BUGS: When parsing a C++ member function definition (e.g. "className::function"), ctags cannot determine whether the scope specifier is a class name or a namespace specifier and always lists it as a class name in the scope portion of the extension fields. Also, if a C++ function is defined outside of the class declaration (the usual case), the access specification (i.e. public, protected, or private) and implementation information (e.g. virtual, pure virtual) contained in the function declaration are not known when the tag is generated for the function definition. It will, however be available for prototypes (e.g −−c++−kinds=+p)
#−−extra=[+|−]flags
#Specifies whether to include extra tag entries for certain kinds of information. The parameter flags is a set of one-letter flags, each representing one kind of extra tag entry to include in the tag file. If flags is preceded by by either the ’+’ or ’−’ character, the effect of each flag is added to, or removed from, those currently enabled; otherwise the flags replace any current settings. The meaning of each flag is as follows:
#f Include an entry for the base file name of every source file (e.g. "example.c"), which addresses the first line of the file.
#q Include an extra class-qualified tag entry for each tag which is a member of a class (for languages for which this information is extracted; currently C++, Eiffel, and Java). The actual form of the qualified tag depends upon the language from which the tag was derived (using a form that is most natural for how qualified calls are specified in the language). For C++, it is in the form "class::member"; for Eiffel and Java, it is in the form "class.member". This may allow easier location of a specific tags when multiple occurrences of a tag name occur in the tag file. Note, however, that this could potentially more than double the size of the tag file.

#−−fields=[+|−]flags
#Specifies the available extension fields which are to be included in the entries of the tag file (see TAG FILE FORMAT, below, for more information). The parameter flags is a set of one-letter flags, each representing one type of extension field to include, with the following meanings (disabled by default unless indicated):
#a Access (or export) of class members
#f File-restricted scoping [enabled]
#i Inheritance information
#k Kind of tag as a single letter [enabled]
#K Kind of tag as full name
#l Language of source file containing tag
#m Implementation information
#n Line number of tag definition
#s Scope of tag definition [enabled]
#S Signature of routine (e.g. prototype or parameter list)
#z Include the "kind:" key in kind field
#t Type and name of a variable or typedef as "typeref:" field [enabled]
#--language-kinds
#--c-kinds
#    c  classes
#    d  macro definitions
#    e  enumerators (values inside an enumeration)
#    f  function definitions
#    g  enumeration names
#    l  local variables [off]
#    m  class, struct, and union members
#    n  namespaces
#    p  function prototypes [off]
#    s  structure names
#    t  typedefs
#    u  union names
#    v  variable definitions
#    x  external and forward variable declarations [off]
#--c++-kinds 参数
#    c  classes
#    d  macro definitions
#    e  enumerators (values inside an enumeration)
#    f  function definitions
#    g  enumeration names
#    l  local variables [off]
#    m  class, struct, and union members
#    n  namespaces
#    p  function prototypes [off]
#    s  structure names
#    t  typedefs
#    u  union names
#    v  variable definitions
#    x  external and forward variable declarations [off]

#−−links[=yes|no] Indicates whether symbolic links (if supported) should be followed. When disabled, symbolic links are ignored. This option is on by default.

ctags --sort=yes  --languages=c,c++ --links=no --c-kinds=+lpx --c++-kinds=+lpx --fields=+liaSKz --extra=+q -R -f tags /cui/work/im/trunk/
