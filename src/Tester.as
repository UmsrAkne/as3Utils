package {


    import flash.display.Sprite;
    import tests.TestPositioningBitmap;
    import tests.Assert;
    import tests.TestTextWriter;

    public class Tester extends Sprite {
        public function Tester() {
            new TestPositioningBitmap();
            new TestTextWriter();
            trace("[Tester]" + " " + Assert.TestCounter + " 回のテストを完了しました");
        }
    }
}
