var upscaleAmt = 4;
function postCreate() {
    for (i in [scoreTxt, missesTxt, accuracyTxt]) {
        i.size *= upscaleAmt;
        i.scale.x /= upscaleAmt;
        i.scale.y /= upscaleAmt;
        i.antialiasing = true;
        i.y -= 21;
        i.borderSize *= upscaleAmt;
        i.fieldWidth += 1000;
        i.x -= 1000/2;
        i.borderQuality = 100;
    }
    
    scoreTxt.x += 65;
    accuracyTxt.x -= 65;
}