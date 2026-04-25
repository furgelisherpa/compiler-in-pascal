PROJECT = Cradle
COMPILER = fpc
FLAGS = -Mobjfpc -Scghi -O2
UNIT_DIR = build/units
BIN_DIR = build/bin
TARGET = $(BIN_DIR)/$(PROJECT)

.PHONY: all clean run debug

all: $(TARGET)

$(TARGET): src/$(PROJECT).pas | $(BIN_DIR) $(UNIT_DIR)
	$(COMPILER) $(FLAGS) -FU$(UNIT_DIR) -FE$(BIN_DIR) -o$@ $<

debug: FLAGS += -gl -gn
debug: $(TARGET)

$(BIN_DIR) $(UNIT_DIR):
	mkdir -p $@

run: $(TARGET)
	$(TARGET)

clean:
	rm -rf build/
