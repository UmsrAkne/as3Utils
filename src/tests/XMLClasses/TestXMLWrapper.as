package tests.XMLClasses {

    import app.xmlClasses.XMLWrapper;
    import flash.html.__HTMLScriptArray;

    public class TestXMLWrapper {
        public function TestXMLWrapper() {
            test();
        }

        private function test():void {

            var xmlString:String = "";
            xmlString += "<root>\n"
            xmlString += "  <tag1>\n"
            xmlString += "      <tag2>\n"
            xmlString += "          contentsText \n"
            xmlString += "          <singleTag attA=\"a\" attB=\"b\" />\n"
            xmlString += "          <singleTag2 attA=\"a2\" attB=\"b2\" />\n"
            xmlString += "      </tag2>\n"
            xmlString += "  </tag1>\n"
            xmlString += "</root>\n"


            var wrapper:XMLWrapper = new XMLWrapper(new XML(xmlString));
        }
    }
}
