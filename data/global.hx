import funkin.backend.utils.NdllUtil;
import funkin.backend.utils.WindowUtils;
import funkin.menus.BetaWarningState;
import funkin.backend.system.framerate.Framerate;
import funkin.backend.scripting.GlobalScript;
import funkin.backend.assets.ModsFolder;
import funkin.backend.utils.NativeAPI.ConsoleColor;
import funkin.backend.system.Logs;


static var customStates:Map<FlxState, String> = [
    BetaWarningState => 'WeeklyIntro',
    MainMenuState => 'WeeklyMenu',
];

function new(){WindowUtils.winTitle = window.title = "FNF Weekly";}

function preStateSwitch() {
FlxG.mouse.visible = true;
Main.framerateSprite.codenameBuildField.text = "FNF Weekly";
    FlxG.camera.bgColor = 0xff000000;
    for (redirectState in customStates.keys()){
        if(FlxG.game._requestedState is redirectState){
            FlxG.game._requestedState = new ModState(customStates.get(redirectState));
        }
    }
}
//lazy
function postUpdate() {    
if (FlxG.keys.justPressed.F6) {
Logs.trace('Reloading global script(s)...', 1, ConsoleColor.YELLOW);
try {
GlobalScript.onModSwitch(ModsFolder.currentModFolder);
Logs.trace('Successfully reloaded global script(s)!', 1, ConsoleColor.GREEN);
} catch (e:Dynamic) {
Logs.trace('Uh Oh! Failed to reload global script(s).', 1, ConsoleColor.RED);}

if (FlxG.keys.justPressed.F8) {ModsFolder.reloadMods();}}}
function destroy(){ WindowUtils.winTitle = window.title = "Friday Night Funkin' - Codename Engine"; FlxG.mouse.visible = false;}