function onCountdown(event:CancellableEvent)
event.cancel();
introLength = 1;
function create() {
    camZooming = true;
    defaultCamZoom = 1;
    //lazy
    remove(boyfriend);
    remove(gf);
    remove(dad);

    add(bg = new FlxSprite(-75, 10).loadGraphic(Paths.image('bg/johnBG'))).antialiasing = Options.antialiasing;
    bg.scale.set(1.25,1.25);

    add(gf);
    add(dad);
    add(boyfriend);

    boyfriend.flipX = true;
    boyfriend.x = 450;
    boyfriend.y -= 25;
    boyfriend.cameraOffset.y += 75;
    boyfriend.cameraOffset.x += 100;
    
    dad.x = boyfriend.x;
    gf.x = boyfriend.x;
    
    dad.y = boyfriend.y;
    gf.y = boyfriend.y;
    strumLines.members[2].characters[1].x = boyfriend.x;
    strumLines.members[2].characters[1].y = boyfriend.y;
}

function postCreate() {
remove(iconP2);
strumLines.members[0].visible = false;
gf.visible = false;
dad.visible = false;
strumLines.members[2].characters[1].visible = false;
}

function beatHit(curBeat:Int) {
    switch(curBeat){
        //6... 7... so tuff...  2 johns
        case 67: strumLines.members[0].visible = true; 
            for (i in 0...strumLines.members[0].members.length){
            FlxTween.tween(strumLines.members[0].members[i], {x: 75 + 110 * i}, 1, {ease:FlxEase.circOut});
            FlxTween.tween(strumLines.members[1].members[i], {x: 750 + 110 * i}, 1, {ease:FlxEase.circOut});
        }
                FlxTween.tween(dad, {x: 200}, 1, {ease:FlxEase.circOut});
                FlxTween.tween(boyfriend, {x: 600}, 1, {ease:FlxEase.circOut});
                boyfriend.cameraOffset.x -= 200;
                dad.visible = true;

        //4 johns
        case 167:
            gf.visible = true;         
            strumLines.members[2].characters[1].visible = true;
            gf.x = dad.x;
            strumLines.members[2].characters[1].x = boyfriend.x;
            
                FlxTween.tween(gf, {y: -200}, 1, {ease:FlxEase.circOut});
                FlxTween.tween(strumLines.members[2].characters[1], {y: -200}, 1, {ease:FlxEase.circOut});

                
                FlxTween.tween(dad, {y: 200}, 1, {ease:FlxEase.circOut});
                FlxTween.tween(boyfriend, {y: 200}, 1, {ease:FlxEase.circOut});
                boyfriend.cameraOffset.y -= 150;
                boyfriend.cameraOffset.x += 25;
                defaultCamZoom = 0.8;

    }
}

//end of song removals yo! (lazy)
function stepHit(curStep:Int) {
    switch(curStep){
        case 804: remove(iconP1); remove(scoreTxt);
        case 805: remove(healthBar); remove(healthBarBG); remove(missesTxt);
        case 806: gf.visible = false; 
        case 807: dad.visible = false; strumLines.members[2].characters[1].visible = false; remove(accuracyTxt);
        case 808: boyfriend.alpha = 0;
        case 809: camGame.alpha = camHUD.alpha = 0;
    }
}