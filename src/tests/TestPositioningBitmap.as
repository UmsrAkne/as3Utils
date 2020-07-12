package tests {

    import app.PositioningBitmap;
    import flash.geom.Point;

    public class TestPositioningBitmap {
        public function TestPositioningBitmap() {
            creationTest();
        }

        private function creationTest():void {
            var positioningBitmap:PositioningBitmap = new PositioningBitmap();
            positioningBitmap.x = 10;
            positioningBitmap.y = 5;
            positioningBitmap.scaleX = 1.4;

            var p:Point = positioningBitmap.getOriginallyLocalPoint(new Point(20, 20));
            Assert.areEqual(p.x, 10);
            Assert.areEqual(p.y, 15);

        }
    }
}
