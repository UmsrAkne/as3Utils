package app.movPlayer {

    import flash.media.Video;
    import flash.net.NetStream;
    import flash.net.NetConnection;
    import flash.display.Sprite;
    import flash.filesystem.File;
    import flash.events.Event;

    public class ExMoviePlayer extends Sprite implements IMoviePlayer {

        private var video:Video;
        private var netStream:NetStream;
        private var url:String;
        private var duration:Number;
        private var beforeEndEvendDispatched:Boolean = false;

        public function ExMoviePlayer(w:int = 320, h:int = 240) {
            video = new Video(w, h);
            addChild(video);
            var nc:NetConnection = new NetConnection();
            nc.connect(null);
            netStream = new NetStream(nc);
            netStream.client = {onMetaData: function(videoInfo:Object):void {
                duration = videoInfo.duration;
            }};

            video.attachNetStream(netStream);
            addEventListener(Event.ENTER_FRAME, dispatchBeforeEndEvent);
        }

        public function play():void {
            netStream.play(url);
            beforeEndEvendDispatched = false;
        }

        public function resume():void {
            netStream.resume();
        }

        public function stop():void {
            throw new Error("Method not implemented.");
        }

        public function load():void {
            netStream.play(url);
            netStream.pause();
        }

        public function get Position():Number {
            return netStream.time;
        }

        public function set Position(pos:Number):void {
            netStream.seek(pos);
        }

        public function loadAndPlay():void {
            throw new Error("Method not implemented.");
        }

        public function pause():void {
            netStream.pause();
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

        public function get Duration():Number {
            return duration;
        }

        private function dispatchBeforeEndEvent(event:Event):void {
            if (!beforeEndEvendDispatched) {
                if (Position >= duration - 0.05) {
                    dispatchEvent(new Event(MovieEvent.BEFORE_END));
                    beforeEndEvendDispatched = true;
                }
            }
        }
    }
}
