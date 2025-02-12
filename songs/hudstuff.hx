function postCreate(){
    healthBar.unbounded = true;
    doIconBop = false;
    iconP1.origin.set(0, iconP1.height / 2);
    iconP2.origin.set(iconP2.width, iconP2.height / 2);
}

var lerpHealth:Float = 1;
function postUpdate(e){
    lerpHealth = lerp(lerpHealth, healthBar.percent, 0.15);
    healthBar.percent = lerpHealth;
    iconP1.scale.set(lerp(iconP1.scale.x, 1, 0.15), lerp(iconP1.scale.y, 1, 0.15));
    iconP2.scale.set(lerp(iconP2.scale.x, 1, 0.15), lerp(iconP2.scale.y, 1, 0.15));
}

function beatHit(curBeat){
    iconP1.scale.set(1.2,1.2);
    iconP2.scale.set(1.2,1.2);
}
function onPostCountdown(event){
    if (event.swagCounter < 4 && event.swagCounter > 0){
        event.sprite.cameras = [camHUD];
        event.sprite.scale.x = 0.9;
        event.sprite.scale.y = 0.9;
        event.spriteTween.cancel();
        FlxTween.tween(event.sprite, {alpha: 0}, Conductor.crochet / 1000, {
            ease: FlxEase.cubeInOut,
            onComplete: function(twn:FlxTween)
            {
                remove(event.sprite, true);
            }
        });
    }
}