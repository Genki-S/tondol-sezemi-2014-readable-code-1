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

spec8
----

入力ファイルはspec7と同様。
複数ユーザーが指定可能で、 <ユーザー名, レシピデータファイル名> のペアを引数として渡すことができる。
引数の最後にIDを指定すると、そのIDを持つレシピのみを表示できる。

```sh
$ ruby cookpad.rb kou recipe-data1.txt piro recipe-data2.txt okkez recipe-data3.txt kou recipe-data4.txt
ユーザー名: kou
0: カレーライス http://cookpad.com/recipe/1380278
1: 寿司 http://cookpad.com/recipe/1858524
2: 焼肉 http://cookpad.com/recipe/2194829

ユーザー名: piro
3: オムライス http://cookpad.com/recipe/2653946
4: 親子丼 http://cookpad.com/recipe/2657882
5: 杏仁豆腐 http://cookpad.com/recipe/2654398

ユーザー名: okkez
6: オムライス http://cookpad.com/recipe/2653779
7: 鶏の唐揚げ http://cookpad.com/recipe/2660337
8: カレー http://cookpad.com/recipe/2661962

ユーザー名: kou
9: トマトサラダ http://cookpad.com/recipe/2662101
10: 生ハムサラダ http://cookpad.com/recipe/2661792
11: 和風サラダ http://cookpad.com/recipe/279208
```

```sh
% ruby cookpad.rb kou recipe-data1.txt piro recipe-data2.txt okkez recipe-data3.txt kou recipe-data4.txt 5
ユーザー名: kou

ユーザー名: piro
5: 杏仁豆腐 http://cookpad.com/recipe/2654398

ユーザー名: okkez

ユーザー名: kou
```
