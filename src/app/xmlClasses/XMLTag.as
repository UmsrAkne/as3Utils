package app.xmlClasses {

    public class XMLTag {

        private var xml:XML;

        public function XMLTag(xml:XML) {
            this.xml = xml;
        }

        public function get Name():String {
            return String(xml.name());
        }

        public function get HasAttribute():Boolean {
            return (XMLList(this.xml.attributes()).length() > 0)
        }
    }
}
