
MOLECULE=molecule -c molecule/_shared/base.yml

DEFAULT?=debian-11
PLATFORMS?=debian-10 debian-11

CONVERGES=$(patsubst %,converge-%,$(PLATFORMS))

.PHONY: lint
lint:
	$(MOLECULE) lint -s $(DEFAULT)


.PHONY: $(PLATFORMS)
$(PLATFORMS):
	$(MOLECULE) -s $@

.PHONY: converge
converge: $(CONVERGES)


converge-%:
	@echo "asdfasdf $@ $*"
	$(MOLECULE) converge -s $*


destroy: $(patsubst %,destroy-%,$(PLATFORMS))
	

destroy-%:
	$(MOLECULE) destroy -s $*
