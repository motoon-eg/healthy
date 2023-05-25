# Makefile

# Define color codes
ORANGE = \033[0;33m
GREEN = \033[0;32m
CRIMSON = \033[0;31m
BLUE = \033[0;34m
CYAN = \033[0;36m
YELLOW = \033[0;33m
RESET = \033[0m

install:
	@printf "$(BLUE)+----------------------------------------------------------+\n"
	@printf "$(BLUE)| $(CRIMSON)MMMMM       MMMMM  $(ORANGE)OOOOO  $(GREEN)TTTTT $(ORANGE) OOOOO  $(ORANGE) OOOOO  $(CRIMSON)NN    NN$(BLUE) |\n"
	@printf "$(BLUE)| $(CRIMSON)M    M     M    M $(ORANGE)O     O $(GREEN)  T   $(ORANGE)O     O $(ORANGE)O     O $(CRIMSON)NNN   NN$(BLUE) |\n"
	@printf "$(BLUE)| $(CRIMSON)M     M   M     M $(ORANGE)O     O $(GREEN)  T   $(ORANGE)O     O $(ORANGE)O     O $(CRIMSON)NNNN  NN$(BLUE) |\n"
	@printf "$(BLUE)| $(CRIMSON)M      M M      M $(ORANGE)O     O $(GREEN)  T   $(ORANGE)O     O $(ORANGE)O     O $(CRIMSON)NN NN NN$(BLUE) |\n"
	@printf "$(BLUE)| $(CRIMSON)M       M       M $(ORANGE)O     O $(GREEN)  T   $(ORANGE)O     O $(ORANGE)O     O $(CRIMSON)NN  NNNN$(BLUE) |\n"
	@printf "$(BLUE)| $(CRIMSON)M               M $(ORANGE)O     O $(GREEN)  T   $(ORANGE)O     O $(ORANGE)O     O $(CRIMSON)NN   NNN$(BLUE) |\n"
	@printf "$(BLUE)| $(CRIMSON)M               M $(ORANGE)O     O $(GREEN)  T   $(ORANGE)O     O $(ORANGE)O     O $(CRIMSON)NN    NN$(BLUE) |\n"
	@printf "$(BLUE)| $(CRIMSON)M               M  $(ORANGE)OOOOO   $(GREEN) T    $(ORANGE)OOOOO   $(ORANGE)OOOOO  $(CRIMSON)NN    NN$(BLUE) |\n"
	@printf "$(BLUE)+----------------------------------------------------------+\n"
	@$(MAKE) installing


installing:
	@printf "$(GREEN)Installing template."
	@sleep 0.4
	@printf "\r$(GREEN)Installing template.."
	@sleep 0.4
	@printf "\r$(CYAN)Installing template..."
	@sleep 0.4
	@printf "\r$(RESET)Installing template...."
	@sleep 0.4
	@printf "\r$(GREEN)Installing template....."
	@sleep 0.4
	@printf "\r$(CYAN)Installing template......"
	@sleep 0.4
	@printf "\r$(RESET)Installing template......."
	@sleep 0.4
	@printf "\r$(GREEN)Installing template........\n"
	@$(MAKE) install_templates


XCODE_USER_TEMPLATES_DIR=~/Library/Developer/Xcode/Templates/File\ Templates
TEMPLATES_DIR=MVVM

install_templates:
	@mkdir -p $(XCODE_USER_TEMPLATES_DIR)
	@rm -fR $(XCODE_USER_TEMPLATES_DIR)/$(TEMPLATES_DIR)
	@cp -R $(TEMPLATES_DIR) $(XCODE_USER_TEMPLATES_DIR)
	@printf "\r$(GREEN)Template is installed successfully ✅\n"


uninstall:
	@rm -fR $(XCODE_USER_TEMPLATES_DIR)/$(TEMPLATES_DIR)
	@echo "$(CRIMSON)Uninstalling is done 😢"

