SRC_DIR     := source
OBJ_DIR     := objects
ENTRYPOINT  := mylib

CPP_SRC_FILES = $(shell find $(SRC_DIR) -name '*.cpp' -type f)
CPP_OBJ_FILES = $(patsubst $(SRC_DIR)/%.cpp,$(OBJ_DIR)/%.o,$(CPP_SRC_FILES))

_$(ENTRYPOINT).so : $(OBJ_DIR)/$(ENTRYPOINT)_wrap.o $(CPP_OBJ_FILES)
	g++ -shared \
		$^ -o $@

$(OBJ_DIR)/%.o : $(SRC_DIR)/%.cpp
	@mkdir -p $(@D)
	g++ -O3 \
		-c -o $@ $< \
		-I /usr/include/python3.7 \
		-fPIC

$(SRC_DIR)/$(ENTRYPOINT)_wrap.cpp : $(SRC_DIR)/$(ENTRYPOINT).i $(SRC_DIR)/$(ENTRYPOINT).h
	swig -python -c++ -outdir . -o $@ $<

clean :
	@echo 'Cleaning...'
	@rm -rf _$(ENTRYPOINT).so $(OBJ_DIR) $(SRC_DIR)/$(ENTRYPOINT)_wrap.cpp $(ENTRYPOINT).py __pycache__/

.PHONY : clean

