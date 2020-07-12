package {


    import flash.display.Sprite;
    import tests.TestPositioningBitmap;
    import tests.Assert;

    public class Tester extends Sprite {
        public function Tester() {
            new TestPositioningBitmap();

            trace("[Tester]" + " " + Assert.TestCounter + " 回のテストを完了しました");
        }
    }
}
