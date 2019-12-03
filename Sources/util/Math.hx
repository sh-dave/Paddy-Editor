package util;

import zui.Zui;
import kha.math.Vector2;

class Math {
    public static inline function toRadians(degrees:Float):Float { return degrees * 0.0174532924; }

    public static function hitbox(ui:Zui, x:Float, y:Float, w:Float, h:Float, ?rotation:Float):Bool {
		var rotatedInput:Vector2 = rotatePoint(ui.inputX, ui.inputY, x + w / 2, y + h / 2, -rotation);
		return rotatedInput.x > x && rotatedInput.x < x + w && rotatedInput.y > y && rotatedInput.y < y + h;
	}

    public static function rotatePoint(pointX: Float, pointY: Float, centerX: Float, centerY: Float, angle:Float): Vector2 {
		pointX -= centerX;
		pointY -= centerY;

		var x = pointX * std.Math.cos(angle) - pointY * std.Math.sin(angle);
		var y = pointX * std.Math.sin(angle) + pointY * std.Math.cos(angle);

		return new Vector2(centerX + x, centerY + y);
	}
}