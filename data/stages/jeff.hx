var bg:FlxSprite;
introLength = 5.88;
function onCountdown(event)
event.cancel();

function create(){
    //cam zoom
    defaultCamZoom = 1;
    FlxG.keys.enabled = false;

    FlxG.sound.play(Paths.sound("jeff"));
    trace('cutsceneStart');
    new FlxTimer().start(2.68, function(tmr:FlxTimer)
        {
            //something about a caption here
        });
    new FlxTimer().start(3.92, function(tmr:FlxTimer)
    {
        
        camHUD.alpha = camGame.alpha = 1;
        dad.playAnim('Switch');
        boyfriend.playAnim('Jef');
    });
    new FlxTimer().start(5.88, function(tmr:FlxTimer)
        {   
            inst.pitch = 1;
            vocals.pitch = 1;
            FlxG.keys.enabled = true;
});

//song doesn't start until timer finishes
inst.pitch = 0;
vocals.pitch = 0;

//cam alphas at 0 for song intro
camHUD.alpha = camGame.alpha = 0;

//stage bg
remove(dad);
remove(boyfriend);
bg = new FlxSprite(-100, -150);
bg.loadGraphic(Paths.image("bg/jeff/my nam jef! youve seen the meme before right"));
bg.scale.set(2,2);
add(bg);
add(dad);
add(boyfriend);

//positions and offsets
dad.x -= 80;
dad.y += 120;
boyfriend.x -= 340;
boyfriend.y += 175;
}

function beatHit(curBeat:Int) {
    switch(curBeat){
    case 160 | 357:
    defaultCamZoom = 0.75;
	boyfriend.cameraOffset.y -= 80;
	dad.cameraOffset.y -= 80;
    case 290 |420:
    defaultCamZoom = 0.9;
    boyfriend.cameraOffset.y = 0;
    dad.cameraOffset.y = 0;
    case 475:camHUD.fade(FlxColor.BLACK, 3.25); 
    //FlxTween.tween(camHUD, {alpha: 0}, 3.25, {ease: FlxEase.linear});
}}