package tests {

    import flash.text.TextField;
    import app.TextWriter;

    public class TestTextWriter {
        public function TestTextWriter() {
            creationTest();
            writeTest();
            clearTest();
        }

        private function creationTest():void {
            var textField:TextField = new TextField();
            var tw:TextWriter = new TextWriter(textField);
        }

        private function writeTest():void {
            //  TextWriter の write() メソッドは一文字ずつテキストを入力し、
            //  過剰な回数を実行しても Text は変化しないか？
            var tw:TextWriter = new TextWriter(new TextField());
            tw.TextBuffer = "abc";
            tw.write();
            Assert.areEqual(tw.Text, "a");

            tw.write();
            Assert.areEqual(tw.Text, "ab");

            tw.write();
            Assert.areEqual(tw.Text, "abc");

            tw.write();
            Assert.areEqual(tw.Text, "abc");

            for (var i:int = 0; i < 15; i++) {
                tw.write();
                Assert.areEqual(tw.Text, "abc");
            }
        }

        private function clearTest():void {
            var tw:TextWriter = new TextWriter(new TextField());
            tw.TextBuffer = "abc";
            tw.Text = "prefix";

            for (var i:int = 0; i < 5; i++) {
                tw.write();
            }

            Assert.areEqual(tw.Text, "prefixabc");
            tw.clear();

            //  テキストの値を入力した後、クリア実行で全て消えているか確認
            Assert.areEqual(tw.Text, "");
            Assert.areEqual(tw.TextBuffer, "");

            //  一度テキストを消去した後、もう一度同じように文字列を入力した場合、期待した動作をするか
            tw.TextBuffer = "defghij";

            for (i = 0; i < 10; i++) {
                tw.write();
            }

            Assert.areEqual(tw.Text, "defghij");
        }
    }
}
