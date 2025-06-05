# Installation Guide for Custom-CShell

This guide provides step-by-step instructions for installing and running the Custom-CShell on WSL (Windows Subsystem for Linux).

## Prerequisites

You need the following software installed:

1. **GCC Compiler**
2. **libcurl** for HTTP requests
3. **pthread** for threading support

## Step 1: Install WSL (If not already installed)

1. Open PowerShell as Administrator and run:
   ```
   wsl --install
   ```
2. Restart your computer if prompted
3. Set up your WSL user account when the Linux distribution starts

## Step 2: Install Required Tools and Libraries

Open your WSL terminal and run:

```bash
sudo apt update
sudo apt install -y build-essential make libcurl4-openssl-dev libpthread-stubs0-dev
```

This command installs:
- GCC compiler and build tools
- Make utility
- libcurl development files
- pthread development files

## Step 3: Build the Project

### Option 1: Using the Build Script

1. Navigate to the project directory in your WSL terminal
2. Run the build script:
   ```
   ./wsl_build.sh
   ```
3. If prompted to install any missing dependencies, enter your password
4. If the build is successful, it will create a `custom-cshell` executable

### Option 2: Manual Build

1. Navigate to the project directory in your WSL terminal
2. Run:
   ```
   make clean
   make
   ```

## Step 4: Run the Shell

1. From the WSL terminal in the project directory, run:
   ```
   ./custom-cshell
   ```
2. The shell should start and display a welcome message

## Troubleshooting

### Compilation Errors

If you get compilation errors:
1. Ensure that GCC is correctly installed: `gcc --version`
2. Check that you've properly installed the required libraries: `apt list --installed | grep -E 'libcurl|pthread'`
3. Verify that the source files are accessible and not corrupted

### Linking Errors

If you get errors during linking:
1. Ensure the library files are properly installed
2. Check if there are any version conflicts between libraries

### Permission Denied

If you get "permission denied" when trying to run the shell:
1. Make sure the executable has execute permissions: `chmod +x custom-cshell`

For further assistance, please open an issue in the project repository. 