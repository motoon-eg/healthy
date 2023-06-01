# Makefile

# Define color codes
GREEN = \033[0;32m
CRIMSON = \033[0;31m
RESET = \033[0m

install:
	@$(MAKE) install_templates

XCODE_USER_TEMPLATES_DIR=~/Library/Developer/Xcode/Templates/File\ Templates
TEMPLATES_DIR=Templates

install_templates:
	@mkdir -p $(XCODE_USER_TEMPLATES_DIR)
	@rm -fR $(XCODE_USER_TEMPLATES_DIR)/$(TEMPLATES_DIR)
	@cp -R $(TEMPLATES_DIR) $(XCODE_USER_TEMPLATES_DIR)
	@printf "\r$(GREEN)Template is installed successfully ✅\n"


uninstall:
	@rm -fR $(XCODE_USER_TEMPLATES_DIR)/$(TEMPLATES_DIR)
	@echo "$(CRIMSON)Uninstalling is done 😢"

