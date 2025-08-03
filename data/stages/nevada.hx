//this code fucking SUCKS

import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.effects.FlxFlicker;
import flixel.FlxG;

var black_screen:FlxSprite;
var grunt:FlxAnimate;
var somewhere:FlxSprite;
var play:FlxSprite;
var intropico:FlxSprite;
var introhank:FlxSprite;

var grunt_cycle:Int = 0;
var gruntWaving:Bool = false; // see if grunt is waving | todo: add grunt running check

// Toggleable shit
var do_intro:Bool = false;
var do_text:Bool = false;
var do_play_text:Bool = false;
var do_cool_hank:Bool = false;
var do_cool_pico:Bool = false;
var do_flash:Bool = false;
var do_duet:Bool = false;
var do_duet_off:Bool = false;

function onCountdown(event:CancellableEvent){event.cancel(); introLength = 1;}
function onPlayerHit(event:NoteHitEvent){ratingAntialiasing = false;}

function create()
{
    defaultCamZoom = 0.8;
    remove(dad);
    remove(boyfriend);

    camOther = new FlxCamera(0, 0);
    camOther.bgColor = FlxColor.TRANSPARENT;
    FlxG.cameras.remove(camHUD, false);
    FlxG.cameras.add(camOther, false);
    FlxG.cameras.add(camHUD, false);

    var sky = new FlxSprite(-855, -825, Paths.image("bg/nevada/sky"));
    sky.scrollFactor.set(0.85, 0.85);
    add(sky);

    var mountain = new FlxSprite(284, 303, Paths.image("bg/nevada/mountains"));
    mountain.scrollFactor.set(0.9, 0.9);
    add(mountain);

    var buildings = new FlxSprite(-115, -411, Paths.image("bg/nevada/buildings"));
    buildings.scrollFactor.set(0.95, 1.0);
    add(buildings);

    var floor = new FlxSprite(-811.2, -24.8, Paths.image("bg/nevada/floor"));
    add(floor);

    grunt = new FlxAnimate(-225, 258, 'images/bg/nevada/grunt');
    grunt.showPivot = false;
    grunt.anim.addBySymbol("gruntwalking", "gruntwalking", 24, true);
    grunt.anim.addBySymbol("grunthi", "grunthi", 24, true);
    grunt.anim.addBySymbol("gruntwalkingfast", "gruntwalkingfast", 24, true);
    add(grunt);

    var fg_building = new FlxSprite(-844.3, -559.45, Paths.image("bg/nevada/building_hole"));
    add(fg_building);

    add(boyfriend);
    add(dad);

    dad.y += 100;
    boyfriend.y -= 175;
    boyfriend.cameraOffset.x -= 75;
    boyfriend.scale.set(0.87, 0.87);
    dad.scale.set(0.87, 0.87);

    black_screen = new FlxSprite().makeGraphic(1, 1, FlxColor.BLACK);
    black_screen.scale.set(FlxG.width * 2, FlxG.height * 2);
    black_screen.updateHitbox();
    black_screen.scrollFactor.set();
    black_screen.screenCenter();
    black_screen.cameras = [camOther];
    add(black_screen);

    somewhere = new FlxSprite(0, 0, Paths.image("bg/nevada/somewhere"));
    somewhere.screenCenter();
    somewhere.alpha = 0;
    somewhere.cameras = [camOther];
    add(somewhere);

    intropico = new FlxSprite(1280, 0, Paths.image("bg/nevada/Intro_Pico"));
    intropico.cameras = [camOther];
    add(intropico);

    introhank = new FlxSprite(-1280, 0, Paths.image("bg/nevada/Intro_Hank"));
    introhank.cameras = [camOther];
    add(introhank);

    play = new FlxSprite(0, 0, Paths.image("bg/nevada/play"));
    play.visible = false;
    play.cameras = [camOther];
    add(play);

}

function postCreate()
{
    FlxG.camera.zoom = 0.6;
    isCameraOnForcedPos = true;
    camHUD.alpha = 0;
    comboGroup.y -= 75;
}

function beatHit() {
    if (do_intro) {
        FlxTween.tween(camFollow, {y: 200}, 5.5, {
            ease: FlxEase.smootherStepInOut,
            onComplete: function(_) {
                isCameraOnForcedPos = false;
                FlxTween.tween(camHUD, {alpha: 1}, 2, {ease: FlxEase.expoOut});
                FlxTween.tween(FlxG.camera, {zoom: 0.7}, 2, {ease: FlxEase.expoOut});
            }
        });
        FlxTween.tween(black_screen, {alpha: 0}, 5, {ease: FlxEase.expoOut, startDelay: 1.75});
        do_intro = false;
    }

    if (do_text) {
        FlxTween.tween(somewhere, {alpha: 1}, 1, {
            ease: FlxEase.linear,
            onComplete: function(_) {
                new FlxTimer().start(6, function(_) {
                    FlxTween.tween(somewhere, {alpha: 0}, 1, {ease: FlxEase.linear});
                });
            }
        });
        do_text = false;
    }

    if (do_play_text) {
        play.visible = true;
        FlxFlicker.flicker(play, 8, 1.0, false);
        do_play_text = false;
    }

    if (do_cool_hank) {
        FlxTween.tween(introhank, {x: 0}, 1.5, {ease: FlxEase.expoOut});
        do_cool_hank = false;
    }

    if (do_cool_pico) {
        FlxTween.tween(intropico, {x: 0}, 1.5, {ease: FlxEase.expoOut});
        do_cool_pico = false;
    }

    if (do_flash) {
        camHUD.flash(FlxColor.WHITE, 1.0);
        FlxTween.tween(intropico, {x: 1280}, 1.5, {ease: FlxEase.expoOut});
        FlxTween.tween(introhank, {x: -1280}, 1.5, {ease: FlxEase.expoOut});
        do_flash = false;
    }

    if (do_duet) {
        isCameraOnForcedPos = true;
        camFollow.set(675, 300);
        do_duet = false;
    }

    if (do_duet_off) {
        isCameraOnForcedPos = false;
        do_duet_off = false;
    }

    if (!gruntWaving && FlxG.random.bool(2)) // 2% chance each beat, sometimes breaks, im lazy so im not fixin it
    {
        switch (grunt_cycle)
        {
            case 0:
                grunt.x = 2000;
                grunt.flipX = true;
                grunt.anim.play("gruntwalkingfast");
                FlxTween.tween(grunt, {x: -225}, 2, {ease: FlxEase.linear});
            case 1:
                grunt.x = -225;
                grunt.flipX = false;
                grunt.anim.play("gruntwalking");
                FlxTween.tween(grunt, {x: 640}, 3.5, {
                    ease: FlxEase.linear,
                    onComplete: function(_) {
                        grunt.anim.play("grunthi");
                        gruntWaving = true;
                        new FlxTimer().start(1.5, function(_) {
                            gruntWaving = false;
                            FlxTween.tween(grunt, {x: 2000}, 1.5, {ease: FlxEase.linear});
                            grunt.anim.play("gruntwalkingfast");
                        });
                    }
                });
            case 2:
                grunt.x = 2000;
                grunt.flipX = true;
                grunt.anim.play("gruntwalkingfast");
                FlxTween.tween(grunt, {x: -225}, 2, {ease: FlxEase.linear});
        }
        grunt_cycle++;
        if (grunt_cycle > 2) grunt_cycle = 0;
    }

    switch(curBeat){
        case 16: do_text = true;
        case 31: do_play_text = true; do_intro = true;
        case 80: do_cool_hank = true;
        case 83: do_cool_pico = true;
        case 87: do_flash = true;
        case 412: camHUD.visible = camOther.visible = camGame.visible = false;
    }
}
