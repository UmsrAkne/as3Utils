package app.movPlayer {

    import flash.display.Sprite;
    import flash.display.DisplayObject;
    import flash.events.Event;

    public class MoviePlayerContainer extends Sprite {

        private var urls:Vector.<String>;

        public function MoviePlayerContainer(playerA:IMoviePlayer, playerB:IMoviePlayer) {
            addChild(DisplayObject(playerB));
            addChild(DisplayObject(playerA));
        }

        public function setURLs(urlA:String, urlB:String, urlC:String):void {
            urls = new Vector.<String>();
            urls.push(urlA, urlB, urlC);
        }

        public function play():void {
            frontPlayer.URL = urls[0];
            frontPlayer.play();
            DisplayObject(frontPlayer).alpha = 0;
            reattachBeforeEndEvent(frontPlayer);
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
            var bp:IMoviePlayer = backPlayer;
            bp.URL = urls[1];
            bp.play()
            reattachBeforeEndEvent(bp);
            DisplayObject(bp).alpha = 0;
            addChild(DisplayObject(bp));
        }
    }
}
