CC = gcc
CFLAGS = -Wall -Wextra -g
LDFLAGS = -lcurl -lpthread -lm

SRC_DIR = src
OBJ_DIR = obj
BIN_DIR = bin

# Core sources (excluding test files)
CORE_SRCS = $(SRC_DIR)/cshell.c \
            $(SRC_DIR)/commands_basic.c \
            $(SRC_DIR)/commands_features_1.c \
            $(SRC_DIR)/commands_features_2.c \
            $(SRC_DIR)/commands_features_3.c \
            $(SRC_DIR)/commands_features_4.c \
            $(SRC_DIR)/utility.c

CORE_OBJS = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(CORE_SRCS))
EXECUTABLE = custom-cshell

# Test sources
TEST_SRCS = $(SRC_DIR)/test_mathquiz.c
TEST_OBJS = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(TEST_SRCS))
TEST_EXECUTABLE = test_mathquiz

# Unix commands
MKDIR = mkdir -p
RM = rm -rf

all: dirs $(EXECUTABLE)

dirs:
	$(MKDIR) $(OBJ_DIR)
	$(MKDIR) $(BIN_DIR)
	$(MKDIR) data

$(EXECUTABLE): $(CORE_OBJS)
	$(CC) $(CORE_OBJS) -o $@ $(LDFLAGS)

test: dirs $(TEST_OBJS) $(OBJ_DIR)/commands_features_4.o
	$(CC) $(TEST_OBJS) $(OBJ_DIR)/commands_features_4.o -o $(TEST_EXECUTABLE) $(LDFLAGS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	$(RM) $(OBJ_DIR) 
	$(RM) $(BIN_DIR)
	$(RM) $(EXECUTABLE)
	$(RM) $(TEST_EXECUTABLE)

.PHONY: all clean dirs test 