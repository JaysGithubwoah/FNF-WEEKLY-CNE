
import funkin.menus.MainMenuState;

var titleText:FlxSprite;
var logo:FlxSprite;
public var blackScreen:FlxSprite;

function create(){

    blackScreen = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
    add(blackScreen);
    
    titleText = new FlxSprite(100, 550);
    titleText.frames = Paths.getFrames('menus/titlescreen/titleEnter');
    titleText.animation.addByPrefix('idle', "Press Enter to Begin", 24);
    titleText.animation.addByPrefix('press', "ENTER PRESSED", 24);
    titleText.animation.play('idle');
    add(titleText);

    logo = new FlxSprite(100, titleText.y);
    logo.frames = Paths.getFrames('menus/titlescreen/logoBumpin');
    logo.animation.addByPrefix('idle', "logobumpin", 24);
    logo.antialiasing = true;
    logo.animation.play('idle');
    add(titleText);

}

function update() {

    if (controls.ACCEPT) {
        timer = new FlxTimer().start(1, function(){FlxG.switchState(new MainMenuState());});
        titleText.animation.play('press');
        FlxG.camera.flash(FlxColor.WHITE);
        timer = 1.5;
   
    }

}
