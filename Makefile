INC_DIRS = E:\Makefile\1.FirstLesson/include
SRC_DIRS = E:\Makefile\1.FirstLesson/source
OUT_DIRS = E:\Makefile\1.FirstLesson/output

PATH_OUTPUT = output

# result SRC_FILES
# SRC_DIRS = E:/Makefile/1.FirstLesson/source/main.c
# SRC_DIRS = E:/Makefile/1.FirstLesson/source/sum.c
SRC_FILES := $(foreach SRC_DIRS,$(SRC_DIRS),$(wildcard $(SRC_DIRS)/*))
INC_FILES := $(foreach INC_DIRS,$(INC_DIRS),$(wildcard $(INC_DIRS)/*))

#result OJB_FILES
#main.c sum.c
OJB_FILES := $(notdir $(SRC_FILES))

# replace all .c files by .o files
OJB_FILES := $(subst .c,.o,$(OJB_FILES))

#output/sum.o output/main.o 
PATH_OJB := $(foreach OJB_FILES,$(OJB_FILES),$(PATH_OUTPUT)/$(OJB_FILES)) 

#search path .c and .h files
vpath %.c $(SRC_DIRS)
vpath %.h $(INC_DIRS)

all: $(OJB_FILES) build run

#main.o: $(SRC_DIRS)/main.c $(INC_DIRS)/sum.h
#	gcc -I $(INC_DIRS) -c $< -o $(OUT_DIRS)/$@

#sum.o: $(SRC_DIRS)/sum.c $(INC_DIRS)/sum.h
#	gcc -I $(INC_DIRS) -c $< -o $(OUT_DIRS)/$@ 

%.o: %.c $(INC_FILES)
	@gcc -I $(INC_DIRS) -c $< -o $(OUT_DIRS)/$@ 

build: $(PATH_OJB)
	@gcc $^ -o $(OUT_DIRS)/main.exe
	
run:
	@$(OUT_DIRS)/main.exe

clean:
	@rm ./output/*.o
	
delete:
	@rm ./output/*
	