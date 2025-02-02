
import hxvlc.flixel.FlxVideoSprite;
import funkin.menus.MainMenuState;

var intro:FlxVideoSprite;

function preUpdate(elapsed){

    if (controls.ACCEPT) controls.ACCEPT = true;

}

function create() {
    add(intro = new FlxVideoSprite(0, 0)).load(Assets.getPath(Paths.video('intro')));
    intro.scale.set(1, 1);
    intro.antialiasing = false;
    intro.play();

    new FlxTimer().start(13, () -> {
        FlxG.switchState(new ModState('WeeklyTitleMenu'));
    });
}

function update() {

    if (controls.ACCEPT) {
        timer = new FlxTimer().start(1, function(){FlxG.switchState(new ModState('WeeklyTitleMenu'));});
        titleText.animation.play('press');
        FlxG.camera.flash(FlxColor.WHITE);
        timer = 1.5;
   
    }

}