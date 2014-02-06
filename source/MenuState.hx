import flash.Lib;
import flash.system.System;
import flash.events.KeyboardEvent;

import flixel.FlxG;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class MenuState extends State {
    private var buttonPlay: Button;
    private var buttonExit: Button;

	override public function create(): Void {
        Lib.trace("MenuState: update: create");
		FlxG.cameras.bgColor = 0xff131c1b;

        var str: String = " Dice Domination Duel";
        var text: FlxText = new FlxText(0, 20, FlxG.width, str);
        text.color = 0xFFFFFF;
        text.size = 30;
        add(text);

        buttonPlay = new Button(playCallback, 200, 200, "button.png", " Play");
        buttonExit = new Button(exitCallback, 200, 400, "button.png", " Exit");
        add(buttonPlay);
        add(buttonExit);

		super.create();
	}

	override public function destroy(): Void {
		super.destroy();
	}

	override public function update(): Void	{
		super.update();
	}

    override public function onBackButton(event: KeyboardEvent): Void {
        // Get ESCAPE from keyboard or BACK from android.
        if (event.keyCode == 27) {
            #if !web
            //event.stopImmediatePropagation();
            System.exit(0);
            #end
        }
    }

    private function playCallback(): Void {
        switchState(new PlayState());
    }

    private function exitCallback(): Void {
        #if !web
        //event.stopImmediatePropagation();
        System.exit(0);
        #end
    }
}
