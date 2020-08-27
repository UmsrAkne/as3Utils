package tests.XMLClasses {

    import app.xmlClasses.XMLTag;
    import tests.Assert;

    public class TestXMLTag {
        public function TestXMLTag() {
            test();
            getAtteributesTest();
        }

        private function test():void {
            var xmlTag:XMLTag = new XMLTag(new XML("<singleTag attA=\"a\" attB=\"b\" />"));
            Assert.isTrue(xmlTag.HasAttribute);

            var xmlTag2:XMLTag = new XMLTag(new XML("<root> <singleTag attA=\"a\" attB=\"b\" /> </root>"));
            Assert.areEqual(xmlTag2.Name, "root");
            Assert.areEqual(xmlTag2.getChildTags("singleTag")[0].Name, "singleTag");

            // 存在しないタグの場合は空のベクターが返ってくる
            Assert.areEqual(xmlTag2.getChildTags("notExistTag").length, 0);

            Assert.areEqual(xmlTag2.getChildTags("singleTag")[0].HasAttribute, true);
        }

        private function getAtteributesTest():void {
            var xmlString:String = "<root>\n";

            xmlString += "<r>";
            xmlString += "<singleTag1 attA=\"aa\" attB=\"bb\" /> \n";
            xmlString += "<singleTag1 attA=\"cc\" attB=\"dd\" /> \n";
            xmlString += "</r>";

            xmlString += "<r>";
            xmlString += "<singleTag1 attA=\"aa\" attB=\"bb\" /> \n";
            xmlString += "<singleTag1 attA=\"cc\" attB=\"dd\" /> \n";
            xmlString += "</r>";

            xmlString += "</root>";

            var xmlTag:XMLTag = new XMLTag(new XML(xmlString));
            var rTag:XMLTag = xmlTag.getChildTags("r")[0];
            var singleTag:XMLTag = rTag.getChildTags("singleTag1")[0];

            Assert.areEqual(singleTag.getAttribute("attA").Name, "attA");
            Assert.areEqual(singleTag.getAttribute("attA").Content, "aa");
            Assert.areEqual(singleTag.getAttribute("notExistAttribute"), null);

            Assert.areEqual(singleTag.getAttributes()[0].Content, "aa");
            Assert.areEqual(singleTag.getAttributes()[1].Content, "bb");
        }
    }
}
