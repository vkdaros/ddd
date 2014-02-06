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
        super(onClick, onOver, x, y, "die.png", "", 0xffffff, 18,
              true, false, 45, 45);

        animation.add("glow",  [0], 10, false);
        animation.add("black", [1], 10, false);
        animation.add("red",   [2], 10, false);
        visible = false;
    }

    private function onClick(button: Button): Void {
        if (state == "glow") {
            setFace("black", 1);
        } else if (value < 6) {
            value++;
        } else if (state == "black"){
            setFace("red", 1);
        } else {
            setFace("glow", 0);
        }
    }

    private function onOver(button: Button): Void {
        if (visible == false) {
            setFace("glow");
        }
    }

    public function setFace(?newState: String, newValue: Int = -1): Void {
        if (newState != null) {
            state = newState;
            animation.play(newState);
        }
        if (newValue != -1) {
            value = newValue;
        }
        visible = true;
    }

    public override function update(): Void {
        // Every time a changeText is called, an extra draw is called too. So
        // it is good to minimize changeText calls.
        if (value != lastValue) {
            if (value == 0) {
                changeText("");
            } else {
                #if mobile
                changeText("" + value);
                #end
                #if !mobile
                changeText("   " + value);
                #end
            }
            lastValue = value;
        }
        if (state == "glow") {
            visible = false;
        }
        super.update();
    }
}
