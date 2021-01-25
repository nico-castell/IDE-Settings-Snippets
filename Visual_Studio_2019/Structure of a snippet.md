# 1. CodeSnippets
Attributes: `xmlns="https://schemas.microsoft.com/VisualStudio/2005/CodeSnippet"`

Groups many code snippets.

Must include at least one *CodeSnippet*.

## 2. CodeSnippet
Attributes: `Format="1.0.0"`

Represents a single snippet.

Must include at least one *Header* and one *Snippet*.

### 3. Header
Contains vital and required information about the snippet.

It's only required child is *Title*.

#### 4. Author
The author of the snippet, must be plain text.

#### 4. Description
A simple description of the snippet, must be plain text.

#### 4. HelpUrl
This is not used by **Visual Studio**, but it can be used by other
applications. Must be a URL in plain text.

#### 4. Keywords
This contains many childs (*Keyword*) used for categorization.

##### 5. Keyword
This is plain text and is used to put the snippet into a specific category.

#### 4. Shortcut
This is what the user will type to expand the snippet in the text editor. Must
be plain text.

#### 4. SnippetTypes
This is a container for *SnippetType*, they describe how the snippet is
inserted into the text editor. If it's not written, the "Expansion" snippet
type will be used by default.

##### 5. SnippetType
Must be plain text, but the only valid values are:

* *Expansion*: Allows the snippet to be expanded inside the text editor.
* *SurroundsWith*: Allows the user to surround selected text with the snipet
via the context menu.

#### 4. Title
This is a requirement, it is the name of the snippet, in plain text.

### 3. Snippet
This is a required container for the properties that make up the snippet.

It's only required child is *Code*.

#### 4. References

#### 4. Imports
This is a container for the *Import* children.

##### 5. Import
This is only available in **some** languages (like *C#*), it tells Visual
Studio to insert a *using* directive when expanding the snippet.

It must contain 1 child *Namespace*.

##### 6. Namespace
Plain text to indicate wich namespace to import into the file.
`<Namespace>System.Collections.Generic</Namespace>`

#### 4. Declarations
This is where you define parts of the snippet that can vary.

It contains the children *Literal*, and *Object*.

##### 5. Literal
Attributes: `Editable="true/false"`

Container for the children that make up a literal. This represents a part of
the snippet the user is likely to change, like a variable name.

Required children are: *ID*, and *Default*.

###### 6. ID
The ID you'll use to replace part of the snippet with a literal.

###### 6. Tooltip
An explanation of what the user has to define in this literal.

###### 6. Default
The default value of the literal. Suppose the user has to define a return
type in the snippet, you can default it to `void` using this child.

###### 6. Function
In some languages, this tells Visual Studio to run a function when the user
focuses on the Literal.

##### 5. Object
Attribues: `Editable="true/false"`

Container for the children that make up an object. Used when the snippet can
vary but uses an object that is likely to be defined outside of the snippet
itself.

Required children are: *ID*, *Type*, and *Default*.

###### 6. ID
The ID you'll use to replace part of the snippet with a literal.

###### 6. Type
This represents the type of the required object. For example:
`<Type>System.Data.SqlClient.SqlConnection</Type>`

###### 6. Tooltip
An explanation of what the user has to define in this literal.

###### 6. Default
The default value of the literal. Suppose the user has to define a return
type in the snippet, you can default it to `void` using this child.

###### 6. Function
In some languages, this tells Visual Studio to run a function when the user
focuses on the Object.

#### 4. Code
Attributes: `Language="CSharp"`.

This is required in all snippets, it must contain `<!CDATA[]]>`. And,
the actual code for the snippet. Like so:

```xml
<Code Language="CSharp">
<![CDATA[List<int> Kites = new List<int>() { $end$ }]]>
</Code>
```

There are two predefined $literals$:

* `$end$`: Used to tell Visual Studio where to place the cursor after it
finished with the snippet. (Psst... **always** use it.)
* `$selected$`: Used to tell Visual Studio to replace this with the selected
text when surrounding with a snippet.
