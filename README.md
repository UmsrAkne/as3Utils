# vscode_as3_air_desktop_project_template

Action Script 3.0 (Adobe Air Desktop) のプロジェクトテンプレ。
バイナリファイルを除くための.gitignore, 自前の簡易テスト用クラス付き。

.vscode/launch.json に設定が２種類あり、プログラムのエントリーポイントを Main.as か Tester.as か選べる。
Tester.as の方はテスト用のクラスを記述して使用。asconfig が2つあるのもこのため。

もし使用する AIRSDK のバージョンが変化したらapplication.xml のバージョンナンバーの部分も変更して使う。
現時点ではとりあえず 32.0 で指定してある。適宜変更する。
