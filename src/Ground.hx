package src;

import com.haxepunk.Entity;
import com.haxepunk.graphics.TiledSpritemap;

class Ground extends Entity
{
	public function new(width:Int, height:Int) 
	{
		super();
		var sprite = new TiledSpritemap("graphics/background2.png", 250, 225, width, height);
		sprite.add("static", [0]);
		sprite.add("moving", [0, 6, 1, 7, 2, 8, 3, 9, 4, 10, 5, 11], 12);
		sprite.play("moving");
		graphic = sprite;
	}
	
}