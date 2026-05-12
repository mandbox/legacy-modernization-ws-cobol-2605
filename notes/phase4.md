
このファイル SYLABUS.cbl には、以下の規約が適用されます：

規約ファイル： syllabus.instructions.md（src/SYL*.cbl パターンに適用）

主要な規約：

アーキテクチャ — SYLABUS.cbl はメインドライバで、SYLREG、SYLUPD、SYLDEL、SYLQRY、SYLLST、SYLRPT の6つのハンドラを直接 CALL します。SYLCOM は SYLREG からのみ間接的に呼び出されます。

コーディング規約

88レベルの条件名を全てのブール チェックに使用（インライン比較は禁止）
部門コードは4文字固定
コース ID は6文字固定（2文字のアルファベット接頭辞 + 4文字の数字サフィックス）
コピーブック名は <DOMAIN>FILE.cpy パターン
ハード制約

SQL を絶対に提案しない — ファイル アクセスは RECORD KEY ベースの索引ファイル I/O
SYLABUS からの CALL チェーンは深さ 2 を超えない


HRMENU.cbl には、以下の規約が適用されます：

hr-cobol.instructions.md の applyTo: "hr-cobol/**" が該当
hr-cobol 以下では HR-COBOL Modern Conventions を適用
特に：
hr-cobol では SYLABUS 系のレガシースタイルを使わない
サービス層パターンに従う（リクエスト/レスポンス構造体、サービスと DAO の分離）
コピー帳は *-req.cpy / *-res.cpy パターンを使う
ステータスコードは status-codes.cpy から取る
hr-cobol で新コードを作る場合、モノリシックな SYLABUS.cbl 風の設計は避ける
Created memory file last_file_context.md

HRMENU.cbl には、hr-cobol.instructions.md の規約が適用されます。

主なルール:

hr-cobol は HR-COBOL Modern Conventions
サービス層パターンを使う
コピー帳は *-req.cpy / *-res.cpy
ステータスコードは status-codes.cpy
hr-cobol で新規コードを書くときは SYLABUS.cbl 風の単一呼び出し大規模構造を作らない

