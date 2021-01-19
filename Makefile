SRC_DIR     := source
OBJ_DIR     := objects
ENTRYPOINT  := mylib

CPP_SRC_FILES = $(shell find $(SRC_DIR) -name '*.cpp' -type f)
CPP_OBJ_FILES = $(patsubst $(SRC_DIR)/%.cpp,$(OBJ_DIR)/%.o,$(CPP_SRC_FILES))

_$(ENTRYPOINT).so : $(OBJ_DIR)/$(ENTRYPOINT)_wrap.o $(CPP_OBJ_FILES)
	g++ -shared \
		$^ -o $@ \
		-lBullet2FileLoader -lBullet3Collision -lBullet3Common -lBullet3Dynamics -lBullet3Geometry \
		-lBullet3OpenCL_clew -lBulletCollision -lBulletDynamics -lBulletInverseDynamics -lBulletSoftBody -lLinearMath

$(OBJ_DIR)/%.o : $(SRC_DIR)/%.cpp
	@mkdir -p $(@D)
	g++ -O3 \
		-DBT_USE_DOUBLE_PRECISION \
		-DBT_USE_EGL \
		-c -o $@ $< \
		-I /usr/local/include/bullet/ \
		-I /usr/include/python3.7 \
		-fPIC

$(SRC_DIR)/$(ENTRYPOINT)_wrap.cpp : $(SRC_DIR)/$(ENTRYPOINT).i
	swig -python -c++ -outdir . -o $@ $<

clean :
	@echo 'Cleaning...'
	@rm -rf _$(ENTRYPOINT).so $(OBJ_DIR) $(SRC_DIR)/$(ENTRYPOINT)_wrap.cpp $(ENTRYPOINT).py __pycache__/

.PHONY : clean

