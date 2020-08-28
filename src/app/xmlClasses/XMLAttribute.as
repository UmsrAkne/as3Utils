package app.xmlClasses {

    public class XMLAttribute {

        private var xml:XML;

        public function XMLAttribute(xml:XML) {
            if (xml.nodeKind() != "attribute") {
                throw new ArgumentError("入力されたXMLはAttributeではありません");
            }
            this.xml = xml;
        }

        public function get Name():String {
            return String(xml.name());
        }

        public function get Content():String {
            return xml.valueOf();
        }

        public function set Content(content:String):void {
            var n:String = this.Name;
            xml = new XML("<tempTag " + n + "=\"" + content + "\" />")["@" + n][0];
            // xml の属性値を直接書き換える方法が不明なので、内包しているXMLオブジェクトを作り直して対応
        }
    }
}
