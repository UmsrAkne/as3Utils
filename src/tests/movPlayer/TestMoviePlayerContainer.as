package tests.movPlayer {

    import app.movPlayer.MoviePlayerContainer;
    import app.movPlayer.ExMoviePlayer;
    import tests.Assert;

    public class TestMoviePlayerContainer {
        public function TestMoviePlayerContainer() {
            test();
            testPlay();
        }

        private function test():void {
            var mpc:MoviePlayerContainer = new MoviePlayerContainer(new ExMoviePlayer(), new ExMoviePlayer());
        }

        private function testPlay():void {
            var p1:DummyPlayer = new DummyPlayer();
            var p2:DummyPlayer = new DummyPlayer();
            var mpc:MoviePlayerContainer = new MoviePlayerContainer(p1, p2);
            var urls:Vector.<String> = new Vector.<String>();
            urls.push("address1");
            urls.push("address2");
            urls.push("address3");
            mpc.setURLs(urls);

            function forwardLoop(loopCount:int):void {
                for (var i:int = 0; i < loopCount; i++) {
                    p1.forward();
                    p2.forward();
                }
            }

            mpc.play();

            // 再生時間に応じて順番の入れ替わりが行われているか、また再生が行われているかのテスト
            Assert.areEqual(mpc.getChildIndex(p1), 1); // 手前
            Assert.areEqual(mpc.getChildIndex(p2), 0);

            forwardLoop(10);
            Assert.areEqual(p1.Position, 0.5);
            Assert.areEqual(p2.Position, 0);

            // 90回のループ終了で動画が切り替わる
            forwardLoop(90);
            Assert.areEqual(p1.Position, 5.0);
            Assert.areEqual(p2.Position, 0.2);
            Assert.isTrue(mpc.getChildIndex(p1) < mpc.getChildIndex(p2))

            forwardLoop(10);
            Assert.areEqual(p1.Position, 5.0);
            Assert.areEqual(p2.Position, 0.7);

            forwardLoop(87);
            Assert.isTrue(mpc.getChildIndex(p1) > mpc.getChildIndex(p2))
            Assert.areEqual(p1.Position, 0.2);
            Assert.areEqual(p2.Position, 5.0);

            forwardLoop(100);
            Assert.isTrue(mpc.getChildIndex(p1) < mpc.getChildIndex(p2))
            Assert.areEqual(p1.Position, 5.0);
            Assert.isTrue(p2.Position >= 0.05);

            forwardLoop(100);
            Assert.isTrue(mpc.getChildIndex(p1) > mpc.getChildIndex(p2))
            Assert.isTrue(p1.Position >= 0.05);
            Assert.areEqual(p2.Position, 5.0);
        }
    }
}
