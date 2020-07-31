package tests.movPlayer {

    import app.movPlayer.MoviePlayerContainer;
    import app.movPlayer.ExMoviePlayer;
    import tests.Assert;
    import app.movPlayer.MovieEvent;
    import flash.events.Event;
    import flash.display.DisplayObject;

    public class TestMoviePlayerContainer {
        public function TestMoviePlayerContainer() {
            test();
            testPlay();
            連続動画挿入テスト();
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

        private function 連続動画挿入テスト():void {
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

            Assert.isFalse(mpc.switching());
            mpc.play();

            forwardLoop(98);
            Assert.isTrue(mpc.switching());
            p2.addEventListener(MovieEvent.APPEARING, appearing);
            var appearingFlag:Boolean = false;
            forwardLoop(10);

            function appearing(e:Event):void {
                appearingFlag = true;
            }

            Assert.isTrue(appearingFlag);

            forwardLoop(90);
            Assert.isTrue(mpc.switching());
            Assert.areEqual(mpc.getChildIndex(p1), 1); // この時点まではp1が先頭

            // urls を挿入することにより、beforeEndEvent が飛んでバックの p2 に url がセットされる
            mpc.setURLs(new <String>["address4", "address5", "address6"]);
            forwardLoop(30);

            // switching = true の状態で url をセット 1.5 sec 時間を送った結果、
            // p2 が最前面、完全不透明状態で address4 を再生している状態になる。
            Assert.isTrue(p2.alpha >= 1);
            Assert.areEqual(mpc.getChildIndex(p2), 1);
            Assert.areEqual(p2.currentPlayURL, "address4");

            forwardLoop(100);
            Assert.isTrue(p1.alpha >= 1);
            Assert.areEqual(mpc.getChildIndex(p1), 1);
            Assert.areEqual(p1.currentPlayURL, "address5");

            forwardLoop(100)
            Assert.isTrue(p2.alpha >= 1);
            Assert.areEqual(mpc.getChildIndex(p2), 1);
            Assert.areEqual(p2.currentPlayURL, "address6");

            // ここからもう少し動画挿入のパターンを増やして確認する
            // 再生中、前面にあるプレイヤーのアルファが１以上で尚且想定通りのURLが返ってくればOKというチェックを繰り返す。
            // 動画入れ替え中にセットを行うのが一番危なそうなので、そこを中心にテストする。
            p1 = new DummyPlayer();
            p2 = new DummyPlayer();
            mpc = new MoviePlayerContainer(p1, p2);
            mpc.setURLs(new <String>["address7", "address8", "address9"]);
            mpc.play();
            forwardLoop(97);

            // 動画の入れ替わり中に立て続けに動画を入力する
            Assert.isTrue(mpc.switching());
            forwardLoop(1)
            mpc.setURLs(new <String>["address7", "address8", "address9"]);
            forwardLoop(1)
            mpc.setURLs(new <String>["address10", "address11", "address12"]);
            mpc.setURLs(new <String>["address13", "address14", "address15"]);

            forwardLoop(1)
            mpc.setURLs(new <String>["address16", "address17", "address18"]);
            forwardLoop(1)
            mpc.setURLs(new <String>["address19", "address20", "address21"]);
            forwardLoop(20);

            // 連続での挿入が済んだら、その後問題なく再生され続けるかチェックする
            Assert.isTrue(p2.alpha >= 1);
            Assert.areEqual(mpc.getChildIndex(p2), 1);
            Assert.areEqual(p2.currentPlayURL, "address19");

            forwardLoop(100);
            Assert.isTrue(p1.alpha >= 1);
            Assert.areEqual(mpc.getChildIndex(p1), 1);
            Assert.areEqual(p1.currentPlayURL, "address20");

            forwardLoop(100);
            Assert.isTrue(p2.alpha >= 1);
            Assert.areEqual(mpc.getChildIndex(p2), 1);
            Assert.areEqual(p2.currentPlayURL, "address21");

            // 動画の切り替え中ではないタイミングで連続で挿入しても問題がないかチェック
            Assert.isFalse(mpc.switching());
            mpc.setURLs(new <String>["address22", "address23", "address24"]);
            mpc.setURLs(new <String>["address22", "address23", "address24"]);
            mpc.setURLs(new <String>["address25", "address26", "address27"]);
            forwardLoop(20);
            Assert.isTrue(p2.alpha >= 1);
            Assert.areEqual(mpc.getChildIndex(p2), 1);
            Assert.areEqual(p2.currentPlayURL, "address25");

            forwardLoop(100);
            Assert.isTrue(p1.alpha >= 1);
            Assert.areEqual(mpc.getChildIndex(p1), 1);
            Assert.areEqual(p1.currentPlayURL, "address26");
        }
    }
}
