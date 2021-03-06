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

        public function getAttribute(attName:String):XMLAttribute {
            if (xml["@" + attName].toString() == "") {
                return null;
            }

            return new XMLAttribute(xml["@" + attName][0]);
        }

        public function getAttributes():Vector.<XMLAttribute> {
            var attributes:Vector.<XMLAttribute> = new Vector.<XMLAttribute>();
            var xmlList:XMLList = xml.attributes();

            for each (var x:XML in xmlList) {
                attributes.push(new XMLAttribute(x));
            }

            return attributes;
        }

        public function setAttribute(attName:String, attribute:String):void {
            xml["@" + attName][0] = attribute;
        }
    }
}
