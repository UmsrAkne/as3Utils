package app {

    import flash.display.Bitmap;
    import flash.geom.Point;

    public class PositioningBitmap extends Bitmap {
        public function PositioningBitmap() {

        }

        /**
         * ステージ上のある一点から、等倍時のローカル上のある一点の座標を取得します
         * @param posOnStage
         * @return
         */
        public function getOriginallyLocalPoint(posOnStage:Point):Point {
            var currentPos:Point = globalToLocal(posOnStage);

            currentPos.x = Math.round(currentPos.x * scaleX);
            currentPos.y = Math.round(currentPos.y * scaleY);

            return currentPos;
        }
    }
}
