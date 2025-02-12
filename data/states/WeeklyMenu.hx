import funkin.menus.ModSwitchMenu;
import funkin.editors.EditorPicker;
import flixel.addons.display.FlxBackdrop;

var options:Array<String> = [
    'freeplay',
    'marathon',
    'more',
    'left',
    'right',
    'play',
    'options',
    'fc',
    'reset' 
];
var norbertcanIdle = false;

function create() {
    CoolUtil.playMenuSong(true);

    add(fakestageBG = new FlxSprite(-1357, -739).loadGraphic(Paths.image('menus/mainmenu/newsSet/bg'))).antialiasing = Options.antialiasing;

    add(lights = new FlxSprite(-1345.15, -852.55).loadGraphic(Paths.image('menus/mainmenu/newsSet/lights'))).antialiasing = Options.antialiasing;

    add(bg = new FlxSprite(-7, -9).loadGraphic(Paths.image('menus/mainmenu/bg'))).antialiasing = Options.antialiasing;

    add(txtTracklist = new FlxText(872, 63, 0, 'TRACK LIST: ').setFormat(Paths.font('VCR.ttf'), 25)).antialiasing = Options.antialiasing;

    add(tweakTxt = new FlxText(1110, 63, 0, 'TWEAK 0').setFormat(Paths.font('VCR.ttf'), 25)).antialiasing = Options.antialiasing;

    add(scoreText = new FlxText(872, 63, 0, 'SCORE: ').setFormat(Paths.font('VCR.ttf'), 25)).antialiasing = Options.antialiasing;
    scoreText.y = txtTracklist.height + 60;

    add(weeklogo = new FlxSprite(170, 180).loadGraphic(Paths.image('menus/mainmenu/logos/weeklogo'))).antialiasing = Options.antialiasing;

    add(staticSprite = new FlxSprite(168, 181.2)).frames = Paths.getSparrowAtlas('menus/mainmenu/logos/static');
    staticSprite.antialiasing = Options.antialiasing;
	staticSprite.animation.addByPrefix('static', 'static0', 24, true);
	staticSprite.animation.addByPrefix('change', 'static change0', 24, false);
	staticSprite.animation.addByPrefix('change end', 'static change0', 24, false);
	staticSprite.visible = false;

    add(norbert = new FunkinSprite(-100, 247)).frames = Paths.getSparrowAtlas('menus/mainmenu/norbert');
    norbert.animation.addByPrefix('intro', 'intro', 24, false);
    norbert.animation.addByPrefix('idle', 'idle', 24, false);
    norbert.animation.addByPrefix('idle-alt', 'alt', 24, false);
    norbert.animation.addByPrefix('start', 'start', 24, false);
    norbert.animation.addByPrefix('transition', 'trans', 24, false);
    norbert.antialiasing = Options.antialiasing;
    norbert.visible = false;

    new FlxTimer().start(0.50, function(_) {
        norbert.visible = true;
        norbert.animation.play('intro');
    });
    norbert.animation.finishCallback = function(_) { norbertcanIdle = true; };

    add(counter = new FlxSprite(223.1, 566.1)).loadGraphic(Paths.image('menus/mainmenu/newsSet/counter')).antialiasing = Options.antialiasing;

    //TWEAK 10
    add(fakeBF = new FlxSprite(1300, 700)).loadGraphic(Paths.image('menus/mainmenu/newsSet/fakeBF')).antialiasing = Options.antialiasing;
	add(fakegf = new FlxSprite(526, 607)).loadGraphic(Paths.image('menus/mainmenu/newsSet/goatGF')).antialiasing = Options.antialiasing;
    add(fakeEna = new FlxSprite(526, 607)).loadGraphic(Paths.image('menus/mainmenu/newsSet/goatGF')).antialiasing = Options.antialiasing;
    fakeEna.alpha = 0;

	add(bar = new FlxSprite().makeSolid(1233, 141, FlxColor.BLACK)).screenCenter(FlxAxes.X);
	bar.y = 553.45;
        
    add(newsText = new FlxBackdrop(-70, 1080)).loadGraphic(Paths.image('menus/mainmenu/breaking')).antialiasing = Options.antialiasing;
    newsText.velocity.set(180, 0);
    newsText.scale.set(0.8,0.8);
    newsText.y = 570;

    add(newsTexttwo = new FlxBackdrop(-45, 1080)).loadGraphic(Paths.image('menus/mainmenu/breaking')).antialiasing = Options.antialiasing;
    newsTexttwo.velocity.set(180, 0);
    newsTexttwo.scale.set(0.8,0.8);
    newsTexttwo.x = 490;
    newsTexttwo.y = 570;

    add(border = new FlxSprite(-19, -23)).loadGraphic(Paths.image('menus/mainmenu/border')).antialiasing = Options.antialiasing;
}

function beatHit() {
    if (norbertcanIdle) {
        norbert.offset.set(-1013, -4);
        norbert.animation.play('idle', true);
    }
}

function update() { 
    if (FlxG.keys.justPressed.F) FlxG.switchState(new FreeplayState());
    
    if (controls.SWITCHMOD || FlxG.keys.justPressed.SEVEN) {
        persistentUpdate = false; 
        persistentDraw = true;

        openSubState(controls.SWITCHMOD ? new ModSwitchMenu() : new EditorPicker());
    }
}