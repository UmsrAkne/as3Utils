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
    }
}
