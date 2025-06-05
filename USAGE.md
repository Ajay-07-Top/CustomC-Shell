# Custom-CShell Usage Guide

This document provides detailed information about all the commands available in Custom-CShell and how to use them.

## Basic Shell Commands

### help
Display a list of all available commands.
```
help
```

### exit / quit
Exit the shell.
```
exit
```

### cd
Change the current directory.
```
cd [directory]
```

### pwd
Display the current working directory.
```
pwd
```

### clear
Clear the terminal screen.
```
clear
```

### echo
Display text.
```
echo [text]
```

### ls
List files and directories in the specified or current directory.
```
ls [directory]
```

### mkdir
Create a new directory.
```
mkdir [directory_name]
```

### rm
Remove a file or directory.
```
rm [file/directory]
```

### cat
Display the contents of a file.
```
cat [file]
```

## To-Do List Management

### todo
Manage your to-do list with the following subcommands:

#### Add a new item
```
todo add [item text]
```

#### List all items
```
todo list
```

#### Mark an item as done
```
todo done [item number]
```

#### Mark an item as not done
```
todo undone [item number]
```

#### Delete an item
```
todo delete [item number]
```

#### Clear all items
```
todo clear
```

## Note Management

### note
Create and manage notes with the following subcommands:

#### Create a new note
```
note new [title]
```
After entering this command, you'll be prompted to enter the note content. Type 'END' on a new line to finish.

#### List all notes
```
note list
```

#### View a specific note
```
note view [note number]
```

#### Edit a note
```
note edit [note number]
```

#### Delete a note
```
note delete [note number]
```

## Weather Information

### weather
Display weather information for a location.
```
weather [location]
```
Example:
```
weather New York
```

## Timer and Reminders

### timer
Set a countdown timer for a specified number of seconds.
```
timer [seconds]
```
Example:
```
timer 60
```

### reminder
Set and manage reminders with the following subcommands:

#### Add a new reminder
```
reminder add [minutes] [message]
```
Example:
```
reminder add 30 Take a break
```

#### List all active reminders
```
reminder list
```

#### Delete a reminder
```
reminder delete [reminder number]
```

## Web and Information

### quote
Display a random inspirational quote.
```
quote
```

### search
Search the web for a query.
```
search [query]
```
Example:
```
search how to learn C programming
```

### news
Display news headlines. You can specify a category.
```
news [category]
```
Available categories: technology, business, science, health
Example:
```
news technology
```

### joke
Display a random programming joke.
```
joke
```

### meme
Fetch a random meme from a category.
```
meme [category]
```
Available categories: programming, cat, dog, wholesome
Example:
```
meme programming
```

## System and Info

### sysinfo
Display system information including OS, CPU, memory, etc.
```
sysinfo
```

### ascii
Generate ASCII art. You can specify the art name or get a random one.
```
ascii [name]
```
Available art: cat, dog, heart, house, flower, computer, rocket
Example:
```
ascii cat
```

### wordcount
Count characters, words, and lines in text or a file.
```
wordcount [text]
wordcount -f [filename]
```
Examples:
```
wordcount Hello world
wordcount -f document.txt
```

### mathquiz
Take a math quiz to test your skills.
```
mathquiz [difficulty]
```
Difficulty levels: easy, medium, hard
Example:
```
mathquiz medium
```

### dayfact
Display a fact about today's date.
```
dayfact
```

### colorize
Display text in a specified color.
```
colorize [color] [text]
```
Available colors: red, green, yellow, blue, magenta, cyan, white, bold
Example:
```
colorize red This is important text
```

## Getting Help with Commands

Most commands support the `--help` flag to display specific help information:
```
[command] --help
```
Example:
```
weather --help
```

## Tips

1. Use the up arrow key to recall previous commands
2. Use tab completion to autocomplete filenames (when supported by your terminal)
3. Try running the shell in full-screen mode for the best experience 