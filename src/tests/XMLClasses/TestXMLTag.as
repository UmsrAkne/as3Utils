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

            var xmlTag2:XMLTag = new XMLTag(new XML("<root> <singleTag attA=\"a\" attB=\"b\" /> </root>"));
            Assert.areEqual(xmlTag2.Name, "root");
            Assert.areEqual(xmlTag2.getChildTags("singleTag")[0].Name, "singleTag");

            // 存在しないタグの場合は空のベクターが返ってくる
            Assert.areEqual(xmlTag2.getChildTags("notExistTag").length, 0);

            Assert.areEqual(xmlTag2.getChildTags("singleTag")[0].HasAttribute, true);
        }
    }
}
