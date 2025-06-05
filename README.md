# Custom-CShell

A custom command-line shell written in C with various utility commands and features, designed to run on WSL (Windows Subsystem for Linux).

## Features
- Basic shell functionality (command execution, directory navigation)
- Note management
- To-do list
- Weather fetching
- Timer and reminders
- Random quotes
- Web search
- Real-time news
- Jokes
- ASCII art
- System information
- Meme fetching
- Word count
- Math quiz
- Day facts
- Text colorization
- and more!

## Building and Running

### Prerequisites
- WSL (Windows Subsystem for Linux)
- GCC compiler
- libcurl (for HTTP requests)
- pthread libraries

### Quick Setup
Run the provided build script:
```bash
./wsl_build.sh
```

### Manual Compilation
```bash
make clean
make
```

### Running the shell
```bash
./custom-cshell
```

## Installation
See [INSTALL.md](INSTALL.md) for detailed installation instructions.

## Usage
See [USAGE.md](USAGE.md) for command documentation and examples.

## Commands
Run `help` within the shell to see all available commands and their usage. 