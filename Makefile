CEU_DIR   = $(error set absolute path to "<ceu>" repository)
CEU_MEDIA = $(error set absolute path to "<ceu-media>" repository)
CEU_UV		= $(error set absolute path to "<ceu-libuv>" repository)

override CFLAGS += `pkg-config play lua5.3 libuv --libs --cflags` -l pthread

SRC_NAME= $(notdir $(SRC))
BIN = $(SRC_NAME:%.ceu=%)

BUILD_PATH = build

all:
	mkdir -p $(BUILD_PATH)
	ceu --pre --pre-args="-I$(CEU_DIR)/include -I$(CEU_MEDIA)/include 	\
						 -I$(CEU_UV)/include -I./include" 												\
	          --pre-input=$(SRC)                                  			\
	    --ceu --ceu-err-unused=pass --ceu-err-uninitialized=pass        \
	    --env --env-types=$(CEU_DIR)/env/types.h                        \
	          --env-threads=$(CEU_DIR)/env/threads.h                    \
	          --env-main=$(CEU_DIR)/env/main.c                          \
	          --env-output=/tmp/x.c                                     \
	    --cc --cc-args="$(CFLAGS)" 																			\
	         --cc-output=build/$(BIN)																	  \
					 --ceu --ceu-features-lua=true --ceu-features-thread=true
	$(BUILD_PATH)/$(BIN)

clean:
	rm -rf $(BUILD_PATH) 
