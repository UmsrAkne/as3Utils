package tests.XMLClasses {

    import flash.xml.XMLTag;
    import app.xmlClasses.XMLTag;
    import tests.Assert;

    public class TestXMLTag {
        public function TestXMLTag() {
            test();
        }

        private function test():void {
            var xmlTag:XMLTag = new XMLTag(new XML("<singleTag attA=\"a\" attB=\"b\" />"));
            Assert.isTrue(xmlTag.HasAttribute);
        }
    }
}
