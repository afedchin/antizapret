NAME = script.module.antizapret
GIT = git
GIT_VERSION = $(shell $(GIT) describe --tags --always)
VERSION = $(patsubst v%,%,$(GIT_VERSION))
ZIP_SUFFIX = zip
ZIP_FILE = $(NAME)-$(VERSION).$(ZIP_SUFFIX)

all: clean zip

bootstraper:
	mkdir -p $(NAME)

addon.xml: bootstraper
	sed s/\$$VERSION/$(VERSION)/g < addon.xml.tpl > $(NAME)/$@

$(ZIP_FILE): addon.xml
	git archive --format zip --prefix $(NAME)/ --output $(ZIP_FILE) $(GIT_VERSION)
	zip -9 -r -g $(ZIP_FILE) $(NAME)/addon.xml
	rm -rf $(NAME)

zip: $(ZIP_FILE)

clean:
	rm -rf addon.xml
