use strict;
use Test::More tests => 4;
use IO::File;
BEGIN { use_ok 'Plagger::Plugin::Filter::TinyURL' }


{
	my $input_data = <<"END_OF_DATA";
<div class="enclosure-image">
<a href="http://taikimen.vox.com/library/photo/6a0123dda1c838860b0123ddcfa161860c.html"><img src="http://a1.vox.com/6a0123dda1c838860b0123ddcfa161860c-320pi" alt="" title="" /></a>
</div>
<div class="enclosure-asset-name"><a href="http://taikimen.vox.com/library/photo/6a0123dda1c838860b0123ddcfa161860c.html" title=""></a></div>
<div>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation </div><div>ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillu
m dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</div><div><a href="http://cookpad.com/recipe/296647">http://cookpad.com/recipe/296647</a></div>
END_OF_DATA

	my ($count,$body) = Plagger::Plugin::Filter::TinyURL::filter("hoge",$input_data);
	ok($count == 5, "Replace num.");
	ok($body,"Body defined");
	my $validate = <<"END_OF_DATA";
<div class="enclosure-image">
<a href="http://tinyurl.com/yzws2md"><img src="http://tinyurl.com/ye5hhq4" alt="" title="" /></a>
</div>
<div class="enclosure-asset-name"><a href="http://tinyurl.com/yzws2md" title=""></a></div>
<div>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation </div><div>ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillu
m dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</div><div><a href="http://tinyurl.com/ye259qr">http://tinyurl.com/ye259qr</a></div>
END_OF_DATA
	
	ok($body =~ /$validate/,"Filter Assert");
}