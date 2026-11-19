# SPL Assignment 1 - Simulation
# Targets:  all (default) | compile | link | clean

CXX      := g++
CXXFLAGS := -g -Wall -Weffc++ -std=c++11 -Iinclude
SRC_DIR  := src
BIN_DIR  := bin
TARGET   := $(BIN_DIR)/simulation

OBJS := $(BIN_DIR)/main.o \
        $(BIN_DIR)/Settlement.o \
        $(BIN_DIR)/Facility.o \
        $(BIN_DIR)/SelectionPolicy.o \
        $(BIN_DIR)/Plan.o \
        $(BIN_DIR)/Simulation.o \
        $(BIN_DIR)/Action.o \
        $(BIN_DIR)/Auxiliary.o

all: clean link

link: compile
	@echo "linking executable"
	$(CXX) -o $(TARGET) $(OBJS)

compile: $(OBJS)

$(BIN_DIR)/%.o: $(SRC_DIR)/%.cpp | $(BIN_DIR)
	@echo "compiling $<"
	$(CXX) $(CXXFLAGS) -c -o $@ $<

$(BIN_DIR):
	@mkdir -p $(BIN_DIR)

clean:
	@echo "cleaning bin directory"
	@rm -rf $(BIN_DIR)

.PHONY: all link compile clean
