#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <math.h>
#include <ctype.h>

// Define necessary constants and types needed for mathquiz
#define MAX_LINE_LENGTH 1024
#define COLOR_RED "\033[31m"
#define COLOR_GREEN "\033[32m"
#define COLOR_RESET "\033[0m"

// Forward declaration of the function we want to test
int cmd_mathquiz(char **args);

// Basic trim_whitespace implementation
void trim_whitespace(char *str) {
    if (str == NULL) return;
    
    // Trim leading whitespace
    char *p = str;
    while (isspace((unsigned char)*p)) p++;
    
    if (p != str) {
        memmove(str, p, strlen(p) + 1);
    }
    
    // Trim trailing whitespace
    char *end = str + strlen(str) - 1;
    while (end > str && isspace((unsigned char)*end)) {
        *end = '\0';
        end--;
    }
}

int main(int argc, char **argv) {
    printf("Direct Test of mathquiz command\n");
    
    // Create args array with command name and arguments
    char *args[4] = {NULL};
    args[0] = "mathquiz";
    
    // Add command line arguments if provided
    for (int i = 1; i < argc && i < 4; i++) {
        args[i] = argv[i];
    }
    
    // Call the mathquiz function directly
    return cmd_mathquiz(args);
} 