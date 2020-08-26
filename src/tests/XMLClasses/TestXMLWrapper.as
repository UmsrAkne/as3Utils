package tests.XMLClasses {

    import app.xmlClasses.XMLWrapper;

    public class TestXMLWrapper {
        public function TestXMLWrapper() {
            test();
        }

        private function test():void {
            var wrapper:XMLWrapper = new XMLWrapper(new XML());
        }
    }
}
