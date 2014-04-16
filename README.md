# BuildAllCategoryArchive

カテゴリに属するエントリーがない場合のアーカイブの生成
http://communities.movabletype.jp/2012/12/post-718.html

ブログ記事がないカテゴリアーカイブが出力されない(MT5.2.2)
http://www.h-fj.com/blog/archives/2012/12/23-152551.php

の

> 3.ソースコードの書き換えによる回避
> 
> Movable Type 5.2.2のlib/MT/ArchiveType/Category.pmで、166行目を以下のように書き換えると、記事がないカテゴリのアーカイブページは出力され、カテゴリ自体を削除したときにはそのアーカイブページが削除されるようになりました。

をプラグイン化してみました。

## インストール

`plugins/build_all_category_archive.pl`を`MT_DIR/plugins`にコピーしてください。

以上でMT5.2の場合にMTコアの動作を上書きして「3.ソースコードの書き換えによる回避」と同様の挙動になるはずです。

