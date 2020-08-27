package tests.XMLClasses {

    import app.xmlClasses.XMLAttribute;
    import tests.Assert;

    public class TestXMLAttribute {
        public function TestXMLAttribute() {
            test();
        }

        private function test():void {
            var xml:XML = new XML("<singleTag attA=\"a\" attB=\"b\" />\n");
            var xmlatt:XMLAttribute = new XMLAttribute(xml["@attA"][0]);
            Assert.areEqual(xmlatt.Name, "attA");
            Assert.areEqual(xmlatt.Content, "a");
        }
    }
}
