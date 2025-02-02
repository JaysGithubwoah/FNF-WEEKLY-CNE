import hxvlc.flixel.FlxVideoSprite;
import funkin.menus.MainMenuState;
var intro:FlxVideoSprite;

function create() {
    add(intro = new FlxVideoSprite()).load(Assets.getPath(Paths.video('intro')));
    intro.antialiasing = false;
    intro.play();
    intro.bitmap.onEndReached.add(function() {
        FlxG.switchState(new TitleState());
        remove(intro, true);
        intro.destroy();
    });
}

function update() 
    if (controls.ACCEPT) {
        FlxG.switchState(new TitleState());
        remove(intro, true);
        intro.destroy();
    }