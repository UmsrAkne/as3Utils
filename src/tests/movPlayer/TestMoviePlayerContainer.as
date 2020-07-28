package tests.movPlayer {

    import app.movPlayer.MoviePlayerContainer;
    import app.movPlayer.ExMoviePlayer;

    public class TestMoviePlayerContainer {
        public function TestMoviePlayerContainer() {
            test();
        }

        private function test():void {
            var mpc:MoviePlayerContainer = new MoviePlayerContainer(new ExMoviePlayer(), new ExMoviePlayer());
        }
    }
}
