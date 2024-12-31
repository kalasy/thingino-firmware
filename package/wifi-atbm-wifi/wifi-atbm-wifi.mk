WIFI_ATBM_WIFI_SITE_METHOD = git
WIFI_ATBM_WIFI_SITE = https://github.com/gtxaspec/atbm-wifi
WIFI_ATBM_WIFI_SITE_BRANCH = master
WIFI_ATBM_WIFI_VERSION = 6967d7a74d3518edde37f992a9a2d8487cd8ab12
# $(shell git ls-remote $(WIFI_ATBM_WIFI_SITE) $(WIFI_ATBM_WIFI_SITE_BRANCH) | head -1 | cut -f1)

WIFI_ATBM_WIFI_LICENSE = GPL-2.0

LINUX_CONFIG_LOCALVERSION = $(shell awk -F "=" '/^CONFIG_LOCALVERSION=/ {print $$2}' $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE))
define WIFI_ATBM_WIFI_INSTALL_TARGET_CMDS
	$(INSTALL) -m 755 -d $(TARGET_DIR)/lib/modules/3.10.14$(LINUX_CONFIG_LOCALVERSION)
	touch $(TARGET_DIR)/lib/modules/3.10.14$(LINUX_CONFIG_LOCALVERSION)/modules.builtin.modinfo
	$(INSTALL) -m 755 -d $(TARGET_DIR)/etc
	$(INSTALL) -m 644 -t $(TARGET_DIR)/etc $(WIFI_ATBM_WIFI_PKGDIR)/files/*.txt
endef

$(eval $(generic-package))
