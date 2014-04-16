package MT::Plugin::BuildAllCategoryArchive;

use strict;
use warnings;
no warnings 'redefine'; 

use MT;
use MT::Plugin;
my $plugin = MT::Plugin->new({
    name => 'BuildAllCategoryArchive',
    version => '1.0.1',
    description => "空のカテゴリのアーカイブも再構築するようにします。（MT 5.2専用）",
    author_name => 'Yuichi Takeuchi',
    author_link => 'http://takeyu-web.com/',
});

MT->add_plugin($plugin);

use MT::ArchiveType::Category;

package MT::ArchiveType::Category;

my $does_publish_file_with_all = defined &does_publish_file_with_all;

unless ( $does_publish_file_with_all ) {

    my $does_publish_file_without_all = *does_publish_file{CODE};

    *does_publish_file_with_all = sub {
        my $obj    = shift;
        my %params = %{ shift() };
        if ( MT->version_number eq '5.2' && $params{Blog} ) {
            if ( !$params{Category} && $params{Entry} ) {
                $params{Category} = $params{Entry}->category;
            }
            return 0 unless $params{Category};
            return 1;
        } else {
            $does_publish_file_without_all->( $obj, \%params );
        }
    };

    *does_publish_file = *does_publish_file_with_all;
}

1;
