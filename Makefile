# Makefile

CXX = g++
CXXFLAGS = -Wall -O2 -std=c++11
LDFLAGS = -lGL -lGLU -lglut -lm

# Source files
SOURCES = main.cpp game.cpp player.cpp platform.cpp collectible.cpp \
          particle.cpp graphics.cpp renderer.cpp

# Object file directory
OBJDIR = dest

# Object files (placed inside dest/)
OBJECTS = $(addprefix $(OBJDIR)/, $(SOURCES:.cpp=.o))

# Executable name
TARGET = pixel_hero

# Default target
all: $(TARGET)

# Link object files to create executable
$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $(TARGET) $(LDFLAGS)

# Ensure dest directory exists, then compile
$(OBJDIR)/%.o: %.cpp | $(OBJDIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Create object directory if missing
$(OBJDIR):
	mkdir -p $(OBJDIR)

# Clean build files
clean:
	rm -rf $(OBJDIR) $(TARGET)

# Run the game
run: $(TARGET)
	./$(TARGET)

# Rebuild everything
rebuild: clean all

.PHONY: all clean run rebuild