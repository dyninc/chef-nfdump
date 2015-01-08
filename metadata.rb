# rubocop:disable SingleSpaceBeforeFirstArg
name               'nfdump'
maintainer         'Paul Thomas'
maintainer_email   'pthomas@dyn.com'
license            'Apache 2.0'
description        'Installs and configures nfdump tools'
long_description   IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version            '0.1.0'

recipe 'nfdump', 'Main recipe, installs nfdump package'
recipe 'nfdump::nfcapd', 'Configures nfcapd to run using runit'

depends 'runit'
depends 'chef-sugar'

supports 'ubuntu'
