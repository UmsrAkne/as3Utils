package app.xmlClasses {

    public class XMLTag {

        private var xml:XML;

        public function XMLTag(xml:XML) {
            this.xml = xml;
        }

        public function get Name():String {
            return String(xml.name());
        }
    }
}
