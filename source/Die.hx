import flash.Lib;

class Die extends Button {
    public var value: Int;
    private var lastValue: Int; // Used to prevent unecessary text changes.
    private var state: String;

    public function new(x: Float, y: Float, initialValue: Int = 0,
                        initialState: String = "glow") {
        value = initialValue;
        lastValue = initialValue;
        state = initialState;
        super(onClick, onOver, x, y, "die.png", "", 0xffffff, 20,
              true, false, 45, 45);

        animation.add("glow",  [0], 10, false);
        animation.add("black", [1], 10, false);
        animation.add("red",   [2], 10, false);
        visible = false;
    }

    private function onClick(button: Button): Void {
        if (state == "glow") {
            value = 1;
            changeTo("black");
        } else if (value < 6) {
            value++;
        } else if (state == "black"){
            value = 1;
            changeTo("red");
        } else {
            value = 0;
            changeTo("glow");
        }
    }

    private function onOver(button: Button): Void {
        if (visible == false) {
            changeTo("glow");
        }
    }

    private function changeTo(newState: String): Void {
        state = newState;
        animation.play(newState);
        visible = true;
    }

    public override function update(): Void {
        // Every time a changeText is called, an extra draw is called too. So
        // it is good to minimize changeText calls.
        if (value != lastValue) {
            if (value == 0) {
                changeText("");
            } else {
                changeText("   " + value);
            }
            lastValue = value;
        }
        if (state == "glow") {
            visible = false;
        }
        super.update();
    }
}
