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

        public function getChildTags(tag:String):Vector.<XMLTag> {
            var tags:Vector.<XMLTag> = new Vector.<XMLTag>();
            var xmlList:XMLList = xml[tag];

            for each (var x:XML in xmlList) {
                tags.push(new XMLTag(x));
            }

            return tags;
        }
    }
}
