function onNoteHit(e){
    if (e.noteType == "Noobador Note"){
        e.cancelAnim();
        strumLines.members[2].characters[0].playSingAnim(e.direction, e.animSuffix, null, true);
        strumLines.members[3].characters[0].playSingAnim(e.direction, e.animSuffix, null, true);
    }
}