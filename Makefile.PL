use inc::Module::Install;
name 'Plagger-Plugin-Filter-TinyURL';
all_from 'lib/Plagger/Plugin/Filter/TinyURL.pm';

# requires '';

tests 't/*.t t/*/*.t t/*/*/*.t t/*/*/*/*.t';
test_requires 'Test::More';
test_requires 'YAML';
author_tests 'xt';
use_test_base;
auto_include;
WriteAll;
