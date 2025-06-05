#!/bin/bash

# Build script for custom-cshell in WSL environment

echo "Building custom-cshell for WSL..."

# Check for required tools and libraries
if ! command -v gcc &> /dev/null; then
    echo "Error: GCC compiler not found. Please install using:"
    echo "sudo apt update && sudo apt install build-essential"
    exit 1
fi

if ! command -v make &> /dev/null; then
    echo "Error: Make not found. Please install using:"
    echo "sudo apt update && sudo apt install make"
    exit 1
fi

# Check for required libraries
if ! dpkg -s libcurl4-openssl-dev &> /dev/null; then
    echo "Installing libcurl development files..."
    sudo apt update && sudo apt install -y libcurl4-openssl-dev
fi

if ! dpkg -s libpthread-stubs0-dev &> /dev/null; then
    echo "Installing pthread development files..."
    sudo apt update && sudo apt install -y libpthread-stubs0-dev
fi

# Create essential directories
echo "Creating data directory..."
mkdir -p data
chmod 755 data

# Check for WSL-specific utilities
if ! command -v wslview &> /dev/null; then
    echo "WSL tools not found. Installing wslu package for WSL-Windows integration..."
    # Check if we're in WSL
    if grep -q Microsoft /proc/version || grep -q WSL /proc/version; then
        echo "WSL environment detected."
        echo "Installing wslu package to enable opening URLs in Windows browsers..."
        sudo apt update && sudo apt install -y wslu
        
        # Verify installation
        if command -v wslview &> /dev/null; then
            echo "wslu installed successfully! You can now open URLs in your Windows browser from WSL."
        else
            echo "Warning: wslu installation might have failed. URLs may not open automatically in your browser."
            echo "You can manually install it with: sudo apt install wslu"
        fi
    else
        echo "Not running in WSL environment, skipping wslu installation."
    fi
fi

# Verify Windows interop capabilities
echo "Verifying Windows interoperability..."

# Test cmd.exe access
if command -v cmd.exe &> /dev/null; then
    echo "✓ cmd.exe is accessible from WSL"
else
    echo "⚠ Warning: cmd.exe is not accessible from WSL. You may have issues opening URLs."
    echo "  This may be due to WSL configuration or Windows path issues."
fi

# Test explorer.exe access
if command -v explorer.exe &> /dev/null; then
    echo "✓ explorer.exe is accessible from WSL"
else
    echo "⚠ Warning: explorer.exe is not accessible from WSL. You may have issues opening URLs."
fi

# Test PowerShell access
if command -v powershell.exe &> /dev/null; then
    echo "✓ powershell.exe is accessible from WSL"
else
    echo "⚠ Warning: powershell.exe is not accessible from WSL. You may have issues opening URLs."
fi

# Create test HTML file to check URL handling
echo "Creating test files for URL handling..."
mkdir -p data
cat > data/browser_test.html << EOF
<!DOCTYPE html>
<html>
<head>
  <title>Browser Test</title>
  <meta charset="UTF-8">
</head>
<body>
  <h1>Browser Test</h1>
  <p>If you can see this, browser integration is working correctly!</p>
</body>
</html>
EOF

echo "Test file created at data/browser_test.html"
echo "If you encounter URL opening issues, you can test with:"
echo "  explorer.exe \$(wslpath -w \$(pwd)/data/browser_test.html)"
echo "  cmd.exe /c start \"\" \"\$(wslpath -w \$(pwd)/data/browser_test.html)\""
echo "  wslview \$(pwd)/data/browser_test.html"

# Running make to build the project
echo -e "\nCompiling the project using make..."
make clean
make

if [ $? -eq 0 ]; then
    echo ""
    echo "Build successful!"
    echo ""
    echo "To run the shell, type: ./custom-cshell"
    echo ""
    
    # Ask if the user wants to run the shell
    read -p "Run the shell now? (Y/N): " run_shell
    if [[ $run_shell == "Y" || $run_shell == "y" ]]; then
        echo "Starting custom-cshell..."
        ./custom-cshell
    fi
else
    echo "Build failed. Please check the error messages above."
    exit 1
fi 