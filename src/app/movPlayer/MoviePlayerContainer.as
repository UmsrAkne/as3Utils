package app.movPlayer {

    import flash.display.Sprite;
    import flash.display.DisplayObject;
    import flash.events.Event;

    public class MoviePlayerContainer extends Sprite {

        private var urls:Vector.<String>;
        private var currentMovieIndex:int = 0;
        private var firstMoviewPlayed:Boolean = false;
        private var cursorDirection:int = 1;

        public function MoviePlayerContainer(playerA:IMoviePlayer, playerB:IMoviePlayer) {
            addChild(DisplayObject(playerB));
            addChild(DisplayObject(playerA));
        }

        public function setURLs(URLs:Vector.<String>):void {
            urls = URLs;
            currentMovieIndex = 0;
            firstMoviewPlayed = false;
        }

        public function play():void {
            frontPlayer.URL = urls[currentMovieIndex];
            frontPlayer.play();
            DisplayObject(frontPlayer).alpha = 0;
            reattachBeforeEndEvent(frontPlayer);
            firstMoviewPlayed = true;
        }

        private function get frontPlayer():IMoviePlayer {
            return IMoviePlayer(getChildAt(numChildren - 1));
        }

        private function get backPlayer():IMoviePlayer {
            return IMoviePlayer(getChildAt(0));
        }

        private function reattachBeforeEndEvent(targetPlayer:IMoviePlayer):void {
            for (var i:int = 0; i < numChildren; i++) {
                getChildAt(i).removeEventListener(MovieEvent.BEFORE_END, nextPlay);
            }

            targetPlayer.addEventListener(MovieEvent.BEFORE_END, nextPlay);
        }

        private function nextPlay(e:Event):void {
            currentMovieIndex = getNextIndex();
            var bp:IMoviePlayer = backPlayer;
            bp.URL = urls[currentMovieIndex];
            bp.play()
            reattachBeforeEndEvent(bp);
            DisplayObject(bp).alpha = 0;
            addChild(DisplayObject(bp));

            trace(currentMovieIndex);
        }

        /**
         * 次に再生すべき動画のインデックスを取得します
         */
        private function getNextIndex():int {
            if (urls.length == 1 || !firstMoviewPlayed) {
                return 0;
            }

            if (urls.length == 2) {
                return 1;
            }

            var tempIndex:int = currentMovieIndex + cursorDirection;
            if (tempIndex >= urls.length || tempIndex <= 0) {
                cursorDirection *= -1;
            }

            return currentMovieIndex + cursorDirection;
        }
    }
}
