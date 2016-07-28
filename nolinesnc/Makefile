include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = NoLinesNC
NoLinesNC_FILES = NoLinesNCRootListController.mm
NoLinesNC_INSTALL_PATH = /Library/PreferenceBundles
NoLinesNC_FRAMEWORKS = UIKit
NoLinesNC_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/NoLinesNC.plist$(ECHO_END)
