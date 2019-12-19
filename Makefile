# require pyglossary

# require python-jinja2
.PHONY : prepare build clean
SRC = source
BUILD = build
DIST = dic

all: cc-cedict

update-source:
	cd $(SRC); \
	wget -c https://www.mdbg.net/chinese/export/cedict/cedict_1_0_ts_utf-8_mdbg.txt.gz

cc-cedict: dic/cc-cedict.ifo
dic/cc-cedict.ifo:
	gunzip -c $(SRC)/cedict_1_0_ts_utf-8_mdbg.txt.gz > $(BUILD)/cedict.txt
	pyglossary --read-format=CC-CEDICT --write-format=Stardict \
	    $(BUILD)/cedict.txt $(DIST)/cc-cedict

clean:
	rm -f $(BUILD)/* $(DIST)/*
