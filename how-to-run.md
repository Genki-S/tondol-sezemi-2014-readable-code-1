実行方法
====

環境
----

ruby 2.0.0p451 (2014-02-24 revision 45167) [universal.x86_64-darwin13]

spec1
----

```sh
$ ruby cookpad.rb
オムライス
```

spec3
----

```sh
$ cat recipe-data.txt
オムライス
$ ruby cookpad.rb recipe-data.txt
オムライス
```

spec4
----

実行方法はspec3と同様。

入力ファイルの書式: 各レシピを改行文字区切りで記述する。

```sh
$ cat recipe-data.txt
カレーライス
寿司
焼肉
```

spec6
----

入力ファイルはspec4と同様。

```sh
$ ruby cookpad.rb recipe-data.txt 1
寿司
```

spec7
----

入力ファイルの書式:

- 各レシピを改行文字区切りで記述する
- 各レシピには、レシピ名とレシピURLを空白区切りで記述する

```sh
$ ruby cookpad.rb recipe-data.txt 1
寿司 http://cookpad.com/recipe/1858524
```

spec8
----

入力ファイルはspec7と同様。

```sh
$ ruby cookpad.rb Genki-S recipe-data.txt
ユーザー名: Genki-S
0: カレーライス http://cookpad.com/recipe/1380278
1: 寿司 http://cookpad.com/recipe/1858524
2: 焼肉 http://cookpad.com/recipe/2194829
```

```sh
$ ruby cookpad.rb Genki-S recipe-data.txt 1
ユーザー名: Genki-S
1: 寿司 http://cookpad.com/recipe/1858524
```
