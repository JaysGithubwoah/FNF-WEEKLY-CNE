import hxvlc.flixel.FlxVideoSprite;
import flixel.FlxCamera;
import flixel.util.FlxAxes;
import funkin.backend.MusicBeatState;

var gameoverVid:FlxVideoSprite = new FlxVideoSprite(0, 0);

var camDie:FlxCamera;

var sus:Bool = false;

function postCreate() {
	camDie = new FlxCamera();
	camDie.bgColor = FlxColor.TRANSPARENT;
	FlxG.cameras.add(camDie, false);
	
	gameoverVid = new FlxVideoSprite(0, 0);
	gameoverVid.load(Assets.getPath(Paths.file("videos/" + PlayState.SONG.meta.displayName + "_gameover.mp4")));
	gameoverVid.cameras = [camDie];
	gameoverVid.bitmap.onEndReached.add(
	function(){MusicBeatState.skipTransOut = true; new FlxTimer().start(0.1, ()->{FlxG.switchState(new PlayState());});} );
	add(gameoverVid);
	gameoverVid.play();
}

function onGameOver(e){
e.cancel();
FlxTween.globalManager.clear();

persistentUpdate = false;
persistentDraw = false;
paused = true;
canPause = false;

vocals.stop();

camGame.visible = camHUD.visible = false;
}

function update(){
	lossSFX.volume = 0;
	if (FlxG.sound.music != null) {
		FlxG.sound.music.stop();
	}
	if (controls.BACK || controls.ACCEPT){
		if (!sus){
			MusicBeatState.skipTransOut = true;
			FlxG.switchState(new PlayState());
			sus = true;
			gameoverVid.destroy();
		}
	}
	if (sus) {
		FlxG.camera.visible = false;
	}
}