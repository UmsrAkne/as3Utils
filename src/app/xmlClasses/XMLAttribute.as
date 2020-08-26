package app.xmlClasses {

    public class XMLAttribute {

        private var xmlList:XMLList;

        public function XMLAttribute(xmlList:XMLList) {
            if (xmlList.nodeKind() != "attribute") {
                throw new ArgumentError("入力されたXMLはAttributeではありません");
            }
            this.xmlList = xmlList;
        }

        public function get Name():String {
            return String(xmlList.name());
        }

        public function get Content():String {
            return xmlList.valueOf();
        }
    }
}
