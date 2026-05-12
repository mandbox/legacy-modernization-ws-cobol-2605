入力文字列 LS-PARAMETER-1 のうち
先頭 1〜2 文字が ALPHABETIC（英字）であり、
3〜6 文字が NUMERIC（数字）であること
これが両方とも満たされると:
LS-RESULT に "科目コード有効" を設定
LS-RETURN-CODE に 0 を設定
そうでない場合は:
LS-RESULT に「先頭2文字はアルファベット、残り4文字は数字である必要があります。」というエラーメッセージを作成
LS-RETURN-CODE に 1 を設定