package app.movPlayer {

    import flash.media.Video;
    import flash.net.NetStream;
    import flash.net.NetConnection;
    import flash.display.Sprite;
    import flash.filesystem.File;

    public class ExMoviePlayer extends Sprite implements IMoviePlayer {

        private var video:Video;
        private var netStream:NetStream;
        private var url:String;

        public function ExMoviePlayer(w:int = 320, h:int = 240) {
            video = new Video(w, h);
            addChild(video);
            var nc:NetConnection = new NetConnection();
            nc.connect(null);
            netStream = new NetStream(nc);
            netStream.client = {onMetaData: function():void {
            }};

            video.attachNetStream(netStream);
        }

        public function play():void {
            netStream.play(url);
        }

        public function resume():void {
            throw new Error("Method not implemented.");
        }

        public function stop():void {
            throw new Error("Method not implemented.");
        }

        public function load():void {
            throw new Error("Method not implemented.");
        }

        public function get Position():Number {
            throw new Error("Method not implemented.");
        }

        public function set Position(pos:Number):void {
            throw new Error("Method not implemented.");
        }

        public function loadAndPlay():void {
            throw new Error("Method not implemented.");
        }

        public function pause():void {
            throw new Error("Method not implemented.");
        }

        public function set URL(value:String):void {
            var f:File = new File(value);
            if (!f.exists) {
                throw ArgumentError("指定されたファイルが存在しない");
            }
            url = value;
        }

        public function get URL():String {
            return url;
        }
    }
}
