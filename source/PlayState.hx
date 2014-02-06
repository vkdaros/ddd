import haxe.ds.Vector;

import flash.events.Event;
import flash.events.KeyboardEvent;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxMath;
import flixel.util.FlxTimer;
import flixel.util.FlxArrayUtil;
import flixel.group.FlxGroup;
import flixel.system.FlxSound;

class PlayState extends State {
    private var background: FlxSprite;
    private var dice: Vector<Vector<Button>>;
    private var leftText: FlxText;
    private var rightText: FlxText;

	override public function create(): Void {
        // Add background.
        background = new Sprite(0, 0, "background.png");
        add(background);

        // Setup the HUD.
        createHUD();

        // Setup board.
        createDiceMatrix();

        // Done!!
		super.create();
	}

    private function createHUD(): Void {
        leftText = new FlxText(40, 450, 100, "Dice", 20);
        add(leftText);

        rightText = new FlxText(FlxG.width - 180, 450, 100, "=)", 20);
        rightText.alignment = "right";
        add(rightText);
    }

    private function createDiceMatrix() {
        dice = new Vector(8);
        for (i in 0...8) {
            dice[i] = new Vector(8);
        }
        for (i in 0...8) {
            for (j in 0...8) {
                dice[i][j] = new Button(dieOnClick, 42.5 + i * 45,
                                        42.5 + j * 45, "die.png", " 1");
                add(dice[i][j]);
            }
        }
    }

    private function dieOnClick() {
        // Something
    }

	override public function destroy(): Void {
		super.destroy();
	}

	override public function update(): Void {
		super.update();
	}

    override public function onBackButton(event: KeyboardEvent): Void {
        // Get ESCAPE from keyboard or BACK from android.
        if (event.keyCode == 27) {
            switchState(new MenuState());
            #if android
            event.stopImmediatePropagation();
            #end
        }
    }
}
