import hxvlc.flixel.FlxVideoSprite;

public static var gameoverVid = new FlxVideoSprite(0, 0);

var black:FlxSprite;

var sus:Bool = false;

public var vidScale:Int = 1;

function postCreate() {
		black = new FlxSprite(0, 0).makeGraphic(FlxG.width * 10, FlxG.height * 10, FlxColor.BLACK);
		black.scrollFactor.set();
		black.screenCenter(FlxAxes.XY);
		add(black);
	
		gameoverVid.load(Assets.getPath(Paths.file("videos/" + PlayState.SONG.meta.displayName + "_gameover.mp4")));  
		gameoverVid.x = 0;
		add(gameoverVid);
		gameoverVid.scale.set(vidScale, vidScale);
		gameoverVid.updateHitbox();
		gameoverVid.scrollFactor.set();
		gameoverVid.play();
		gameoverVid.antialiasing = true;
}

function update(){
		    //FlxG.camera.zoom = 0.1;
	lossSFX.volume = 0;
	if (FlxG.sound.music != null) {
		FlxG.sound.music.stop();
	}
	if (controls.BACK || controls.ACCEPT){
		if (!sus){
			FlxG.switchState(new PlayState());
			sus = true;
			gameoverVid.destroy();
		}
	}
	if (sus) {
		FlxG.camera.alpha = 0;
	}
}