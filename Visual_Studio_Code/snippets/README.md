# Structure of a Visual Studio Code Snippet

VS Code has a very simple sintax for it's snippets. I wll briefly explain it
here. However, I highly recommend you read the documentation
[here](https://code.visualstudio.com/docs/editor/userdefinedsnippets).

## How to write a Snippet
VS Code snippets follow JSON like syntax (and allow for comments).

```json
{
    "shebang": {
        // You can comment if you want.
        "prefix": "shebang",
        "description": "Tell the OS how to interpret the file.",
        "body": "#!/bin/bash"
    }
}
```

You can have as many snippets in a file as you wish.

Each snippet can have 3 elements: **prefix**, **description**, and **body**.
The only obligatory element is **body**.

## The structure of the snippet

Here's a brief description of each element in a snippet.

### prefix

Indicates what you have to type in the text editor to expand the snippet.

### description

An extended description for VS Code to show when you preview the snippet in
the text editor.

### body

The actual text you want the snippet to insert. It can be expressed as a
string, or an array of strings (for multiline snippets).

```json
{
    "Make a List": {
        "body": "List<int> Kites = new List<int>();
    }
}
```

```json
{
    "Define a function": {
        "body": [
            "void GreetWorld()",
            "{",
            "    Console.WriteLine(\"Hello World!\"!);",
            "}"
        ]
    }
}
```

You can use escape characters as you wish.

#### Tab Stops

Sometimes it's useful to have tabstops for parts of the snippet which we may
change after expanding the snippet.

You can define a tab stop by using the `$` character and a number. The
combination `$0` is reserved to indicate where the cursor should be placed
after finishing the snippet.

```json
{
    "Define a function": {
        "body": [
            "$1 $2()",
            "{",
            "    Console.WriteLine(\"Hello World\"!);",
            "    return;$0",
            "}"
        ]
    }
}
```

This will allow you to define a custom return type and name. But what if you
want default values, or a list of options? Now we'll see.

#### Default options

You can expand `$1` with curly braces `{ }` to enrich the tabstop. Using a
colon `:`, you can set a default value. Like so:

```json
{
    "Define a function": {
        "body": [
            "${1:void} ${2:FunctionName}()",
            "{",
            "    Console.WriteLine(\"Hello World\"!);",
            "    return;$0",
            "}"
        ]
    }
}
```

#### List of options

You can use the same curly braces `{ }` and two pipes `|` with commas to
indicate a list of options. Like so:

```json
{
    "Custom for loop": {
        "body": [
            "for (int i = 0; i ${1|<,>,<=,>=,!=|} 10; i++)",
            "{",
            "    Console.WriteLine(\"Hello World!\"!);",
            "}"
        ]
    }
}
```

## The file extension of the snippet

VS Code follows two conventions:

1. *\[Language Name\].json* Snippets for a specific language.
1. *\[Any name\].code-snippets* Global snippets for every language.
