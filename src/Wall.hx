package ;

import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Spritemap;

class Wall extends Entity
{
	var tileWidth:Int = 15;
	var tileHeight:Int = 48;

	var spdX:Int; 

	public function new(speed:Int) 
	{
		super();

		type = "wall";
		var sprite = new Spritemap("graphics/Wall.png", tileWidth, tileHeight);
		sprite.add("static", [0]);		sprite.play("static");
		graphic = sprite;
		spdX=speed;

		setHitbox(tileWidth, tileHeight);
	}
	
	override public function update() 
	{
		moveBy(-1 * spdX * HXP.elapsed, 0);
	}
}