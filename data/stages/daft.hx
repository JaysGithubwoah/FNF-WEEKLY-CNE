import openfl.display.BlendMode;
import funkin.backend.utils.ShaderResizeFix;
import openfl.system.Capabilities;

final dir = 'bg/daft punk/';

introLength = 0;

var ogCpuStrumX = [];
var ogStrumX = [];
var posFrom0 = [];

function postCreate(){
	var bg = new FlxSprite().loadGraphic(Paths.image(dir + 'background'));
	bg.screenCenter();
    add(bg);

	var ceiling = new FlxSprite().loadGraphic(Paths.image(dir + 'Cellingshit'));
	ceiling.screenCenter(FlxAxes.X);
	ceiling.y -= 250;
    add(ceiling);

	var dsotm = new FlxSprite().loadGraphic(Paths.image(dir + 'Pyramid'));
    dsotm.screenCenter(FlxAxes.X);
    dsotm.y -= 75;
    add(dsotm);

	var floor = new FlxSprite().loadGraphic(Paths.image(dir + 'Floor'));
    floor.y += 625;
    floor.x -= 37.5;
    add(floor);

	var flash = new FlxSprite(200, -200).loadGraphic(Paths.image(dir + 'flash'));
    flash.angle = 45;
    flash.blend = BlendMode.ADD;
    add(flash);

	var originalPosition = FlxPoint.get(-200, -200);
    FlxTween.tween(flash, {angle: -45, x: originalPosition.x - 225, y: originalPosition.y + 100}, 3, {ease: FlxEase.quadInOut, type: 4});

	var flash = new FlxSprite(605, -250).loadGraphic(Paths.image(dir + 'flash'));
    flash.angle = -45;
    flash.blend = BlendMode.ADD;
    add(flash);

    var originalPosition = FlxPoint.get(975, -200);
    FlxTween.tween(flash, {angle: 45, x: originalPosition.x + 225, y: originalPosition.y + 100}, 3, {ease: FlxEase.quadInOut, type: 4});

	speakers = new FlxSprite();
    speakers.frames = Paths.getSparrowAtlas(dir + 'Speakers');
    speakers.animation.addByPrefix('bump', 'Speakers', 24, false);
    speakers.animation.play('bump');
    speakers.screenCenter();
    speakers.y += 125;
    add(speakers);

    robot1 = new FlxSprite();
    robot1.frames = Paths.getSparrowAtlas(dir + 'DaftPunk');
    robot1.animation.addByPrefix('bump', 'IdleLeft', 24, false);
    robot1.animation.play('bump');
    // robot1.screenCenter();
    robot1.x += 300;
    robot1.y += 225;
    add(robot1);

    robot2 = new FlxSprite();
    robot2.frames = Paths.getSparrowAtlas(dir + 'DaftPunk');
    robot2.animation.addByPrefix('bump', 'IdleRight', 24, false);
    robot2.animation.play('bump');
    // robot1.screenCenter();
    robot2.x += 600;
    robot2.y += 45;
    add(robot2);

    var spotlights = new FlxSprite().loadGraphic(Paths.image(dir + 'SpotlightsFInal'));
    spotlights.screenCenter();
    spotlights.y += 400;
    add(spotlights);

	dad.screenCenter();
	dad.y += 85;

	boyfriend.screenCenter();
    boyfriend.y += 390;
    boyfriend.x += 10;

	for (a in [dad, boyfriend]){
		remove(a);
		insert(99, a);
	}

	windowShit(1280, 960);
	camHUD.width = camGame.width = 1280;
	camHUD.height = camGame.height = 960;
	for (a in [accuracyTxt, missesTxt, scoreTxt]) remove(a);
	for (a in [healthBar, healthBarBG, iconP1, iconP2]){
		a.screenCenter(FlxAxes.X);
		a.y += 220;
	}
	cpuStrums.visible = false;
	for (i in 0...4){
        ogStrumX.push(playerStrums.members[i].x);
        posFrom0.push(playerStrums.members[i].x);
        posFrom0[i] -= ogStrumX[0];
    }
    strumLineWidth = playerStrums.members[3].x + playerStrums.members[3].width - playerStrums.members[0].x;
	for (a in 0...playerStrums.length) playerStrums.members[a].x = posFrom0[a]+FlxG.width/2-strumLineWidth/2;

	camFollow.setPosition(650, 450);
    FlxG.camera.snapToTarget();
}

var camMoveAmount:Int = 20;
function postUpdate(elapsed:Float) {
	trace(iconP1.x, iconP2.x);
	camFollow.setPosition(650, 450);
	switch(strumLines.members[curCameraTarget].characters[0].getAnimName()) {
        case "singLEFT":
            camFollow.x -= camMoveAmount;
        case "singDOWN":
            camFollow.y += camMoveAmount;
        case "singUP":
            camFollow.y -= camMoveAmount;
        case "singRIGHT":
            camFollow.x += camMoveAmount;
    }
}

function beatHit(curBeat:Int) {
	speakers.animation.play('bump', true);
    robot1.animation.play('bump', true);
    robot2.animation.play('bump', true);
	if (curBeat % 4 == 0) sectionHit();
}

var fuck = false;
var counter = 0;
var thing = '';
function sectionHit(){
	counter += 1;
    if(counter % 2 == 0){
        fuck = !fuck;
        thing = fuck ? '' : '-alt';

        iconP2.setIcon(thing == '-alt' ? 'bot2' : 'bot1');
		iconP2.origin.set(iconP2.width, iconP2.height / 2);
    }
}

function onDadHit(e){
	if (e.note.strumLine.ID == 0) e.animSuffix = thing;
}

function onCameraMove(e) e.cancel();

function onStrumCreation(e) e.__doAnimation = false;

function destroy() windowShit(1280, 720);

function windowShit(newWidth:Int, newHeight:Int){
	FlxG.resizeWindow(newWidth, newHeight);
	FlxG.resizeGame(newWidth, newHeight);
	FlxG.scaleMode.width = FlxG.camera.width = newWidth;
	FlxG.scaleMode.height = FlxG.camera.height = newHeight;
	ShaderResizeFix.doResizeFix = true;
	ShaderResizeFix.fixSpritesShadersSizes();
	window.x = Capabilities.screenResolutionX/2 - window.width/2;
    window.y = Capabilities.screenResolutionY/2 - window.height/2;
}