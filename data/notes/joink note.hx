//mimics that thing conan does in the og mod
function onNoteHit(e){
if(e.noteType == "joink note"){
FlxTween.tween(dad, {y: 150}, Conductor.crochet * 1 / 5500, {ease: FlxEase.elasticOut, onComplete: () -> {
FlxTween.tween(dad, {y: 168}, Conductor.crochet * 1 / 5500, {ease: FlxEase.circOut});}});}}