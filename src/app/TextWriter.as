package app {

    import flash.text.TextField;

    public class TextWriter {

        private var textField:TextField = new TextField();
        private var characterCount:int = 0;
        private var textBuffer:String = "";

        public function TextWriter(textField:TextField) {
            this.textField = textField;
        }

        public function get Text():String {
            return textField.text;
        }

        /**
         * 内部のテキストフィールドに対して直接文字列をセットします。
         * @param value
         */
        public function set Text(value:String):void {
            textField.text = value;
        }

        /**
         * @return 内部で保持しているテキストフィールドを取得します
         */
        public function getTextField():TextField {
            return textField;
        }

        public function get TextBuffer():String {
            return textBuffer;
        }

        public function set TextBuffer(value:String):void {
            textBuffer = value;
            characterCount = 0;
        }

        /**
         * 内部で保持しているテキストフィールドのテキストと、TextBuffer に空文字を挿入します。
         */
        public function clear():void {
            TextBuffer = "";
            textField.text = "";
        }

        /**
         * このメソッドを一度呼び出す度に、テキストフィールドに文字を追加します。
         * 文字列はフィールドから参照されます。全ての文字を書いた後に呼び出した場合はこのメソッドは動作せずに終了します。
         */
        public function write():void {
            if (characterCount >= textBuffer.length) {
                return
            }

            textField.appendText(textBuffer.charAt(characterCount));
            characterCount++;
        }
    }
}
