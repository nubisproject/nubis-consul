all: 

build: install-puppet-modules

install-puppet-modules:
	# Should be converted to puppet librarian (and not fail when its already there)
	puppet module install KyleAnderson-consul --version 0.4.2 --target-dir puppet-modules || true
	# module bug : Warning: Symlinks in modules are unsupported.
	rm -f ./puppet-modules/consul/spec/fixtures/modules/consul || true
