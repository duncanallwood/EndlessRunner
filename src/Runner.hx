package ;

import com.haxepunk.Entity;
import com.haxepunk.graphics.atlas.AtlasRegion;
import com.haxepunk.HXP;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.haxepunk.graphics.Spritemap;

/**
 * Player - Running Man
 * @author duncana
 */
class Runner extends Entity
{
	// Movement constants. 
	public var MAXX:Int = 640;
	public var MAXY:Int = 480;
	public var GRAV:Int = 1500;
	public var FLOAT:Int = 3000;
	public var ACCEL:Int = 1200;
	public var DRAG:Int = 800;
	public var JUMP:Int = -500;
	public var LEAP:Float = 1.5;
	
	// Movement properties.
	public var onSolid:Bool = true;
	public var isCrashing:Bool = false;
	public var spdY:Float = 0;
	public var isRunning:Bool = true;
	
	// Sprite vars / constants
	private var sprite:Spritemap;
	private var spriteWidth:Int = 56;
	private var spriteHeight:Int = 67;
	public var RUNNING:String = "running";
	public var JUMPING:String = "jumping";
	public var FALLING:String = "falling";
	public var IDLE:String = "idle";
	
	public function new(xPos:Int, yPos:Int) 
	{
		super();
		sprite = new Spritemap("graphics/running.png", spriteWidth, spriteHeight);
		sprite.add(RUNNING, [0, 1, 2, 3, 4, 5, 6, 7], 10);
		sprite.play(RUNNING);
		graphic = sprite;
		x = xPos;
		y = yPos;
		
		Input.define("JUMP", [Key.SPACE, Key.SHIFT, Key.CONTROL, Key.UP]);
	}
	
	public function getSpriteHeight():Int {
		return spriteHeight;
	}
	public function getSpriteWidht():Int {
		return spriteWidth;
	}
	
	override public function update() {
		checkFloor();
		gravity();
		jumping();
		crashing();
		checkCollision();
		animate();
	}
	
	function checkFloor():Void
	{
		//if (collide(solid, x, y + 1)) onSolid = true;
		//else onSolid = false;
		onSolid = true;
	}
	
	function gravity():Void
	{
		if (onSolid) return;
		var g:Int = GRAV;
		if (spdY < 0 && !Input.check("JUMP")) g += FLOAT;
		spdY += g * HXP.elapsed;
		if (spdY > MAXY) spdY = MAXY;
	}
		
	function jumping():Void
	{
		if (onSolid && Input.pressed("JUMP"))
		{
			spdY = JUMP;
			onSolid = false;
		}
	}
	
	function crashing():Void 
	{
		// ducking into objects to crash through them
		// will figure this out later
	}
	
	function checkCollision():Void 
	{
		if (isCrashing /* && Can crash through object */ ) return;
		
		// if (playerX == objectCollisionZone) collide();
	}
	
	function animate():Void
	{
		
	}
}