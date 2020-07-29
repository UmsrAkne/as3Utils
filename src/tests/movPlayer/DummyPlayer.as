package tests.movPlayer {

    import flash.display.Sprite;
    import app.movPlayer.IMoviePlayer;

    public class DummyPlayer extends Sprite implements IMoviePlayer {

        public var playing:Boolean = false;
        public var currentPlayURL:String = "";
        private var url:String = "";
        public var duration:int = 0;
        private var position:Number = 0;

        public function DummyPlayer() {
        }

        public function play():void {
            position = 0;
            playing = true;
            currentPlayURL = URL;
            duration = 5;
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
            return Position;
        }

        public function set Position(pos:Number):void {
            position = pos;
        }

        public function get Duration():Number {
            return duration;
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
    }
}
