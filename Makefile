CXX       = g++
CXXFLAGS  = -std=c++11 -Wall -Wextra -pthread -fPIC

TARGET_LIB = libMapReduceFramework.so

SRC        = MapReduceFramework.cpp Barrier.cpp
HDR        = MapReduceFramework.h MapReduceClient.h Barrier.h
EXTRA      = Makefile README

OBJ        = $(SRC:.cpp=.o)

all: $(TARGET_LIB)

$(TARGET_LIB): $(OBJ)
	$(CXX) -shared -o $@ $^

%.o: %.cpp $(HDR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -f $(OBJ) $(TARGET_LIB) ex3.tar

TAR_NAME = ex3.tar

tar: $(SRC) $(HDR) $(EXTRA)
	@echo "=> building $(TAR_NAME)"
	@export COPYFILE_DISABLE=1; \
	tar -cf $(TAR_NAME) $(SRC) $(HDR) $(EXTRA)
	@echo "=> done"

.PHONY: all clean tar
