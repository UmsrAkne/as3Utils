package {


    import flash.display.Sprite;
    import tests.TestPositioningBitmap;
    import tests.Assert;
    import tests.TestTextWriter;
    import tests.movPlayer.TestExMoviePlayer;
    import tests.movPlayer.TestMoviePlayerContainer;

    public class Tester extends Sprite {
        public function Tester() {
            new TestPositioningBitmap();
            new TestTextWriter();
            new TestExMoviePlayer();
            new TestMoviePlayerContainer();
            trace("[Tester]" + " " + Assert.TestCounter + " 回のテストを完了しました");
        }
    }
}
