package tests.movPlayer {

    import flash.display.Sprite;
    import app.movPlayer.IMoviePlayer;
    import flash.events.Event;
    import app.movPlayer.MovieEvent;

    public class DummyPlayer extends Sprite implements IMoviePlayer {

        public var playing:Boolean = false;
        public var currentPlayURL:String = "";
        private var url:String = "";
        public var duration:int = 0;
        private var position:int = 0;
        private var beforeEndEventDispatched:Boolean = false;

        public function DummyPlayer() {
        }

        public function play():void {
            position = 0;
            playing = true;
            currentPlayURL = URL;
            duration = 5000;
            beforeEndEventDispatched = false;
        }

        public function resume():void {
            throw new Error("Method not implemented.");
        }

        public function stop():void {
            throw new Error("Method not implemented.");
        }

        public function load():void {
        }

        public function get Position():Number {
            return position / 1000;
        }

        public function set Position(pos:Number):void {
            position = pos * 1000;
        }

        public function get Duration():Number {
            return duration / 1000;
        }

        public function loadAndPlay():void {
            throw new Error("Method not implemented.");
        }

        public function pause():void {
            throw new Error("Method not implemented.");
        }

        public function set URL(value:String):void {
            url = value;
        }

        public function get URL():String {
            return url;
        }

        /**
         * 動画の時間を 50ms 進めます
         */
        public function forward():void {
            if (position < duration && playing) {
                position += 50;
            }

            if (alpha <= 1) {
                alpha += 0.2;
            }

            if (position >= duration - 150 && !beforeEndEventDispatched) {
                dispatchEvent(new Event(MovieEvent.BEFORE_END));
                beforeEndEventDispatched = true;
            }

            if (position >= duration) {
                playing = false;
            }
        }

        public override function set alpha(value:Number):void {
            var currentAlpha:Number = super.alpha;
            super.alpha = value;
            if (currentAlpha < 1.0 && currentAlpha + value >= 1.0) {
                dispatchEvent(new Event(MovieEvent.APPEARÏNG));
            }
        }

        public override function get alpha():Number {
            return super.alpha;
        }
    }
}
