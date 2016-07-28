DEBUG = 0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = NoLinesNC
NoLinesNC_FILES = Tweak.xm


include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += nolinesnc
include $(THEOS_MAKE_PATH)/aggregate.mk
