package app.movPlayer {

    import flash.display.Sprite;
    import flash.display.DisplayObject;

    public class MoviePlayerContainer extends Sprite {

        private var urls:Vector.<String>;

        public function MoviePlayerContainer(playerA:IMoviePlayer, playerB:IMoviePlayer) {
            addChild(DisplayObject(playerA));
            addChild(DisplayObject(playerB));
        }

        public function setURLs(urlA:String, urlB:String, urlC:String):void {
            urls = new Vector.<String>();
            urls.push(urlA, urlB, urlC);
        }
    }
}
