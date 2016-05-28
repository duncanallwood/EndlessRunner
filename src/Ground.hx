package src;

import com.haxepunk.Entity;
import com.haxepunk.graphics.TiledSpritemap;

class Ground extends Entity
{
	public function new(width:Int, height:Int) 
	{
		super();
		var sprite = new TiledSpritemap("graphics/Ground.png", 50, 50, width, height);
		sprite.add("static", [0]);
		sprite.add("moving", [0,1,2,3,4,5,6,7,8,9]);
		sprite.play("moving");
		graphic = sprite;
	}
	
}