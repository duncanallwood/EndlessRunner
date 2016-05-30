package ;

import com.haxepunk.Entity;
import com.haxepunk.graphics.TiledSpritemap;

class Ground extends Entity
{
	var tileWidth:Int = 50;
	var tileHeight:Int = 50;

	public function new(fillWidth:Int, fillHeight:Int) 
	{
		super();

		type = "floor";
		var sprite = new TiledSpritemap("graphics/Ground.png", tileWidth, tileHeight, fillWidth, fillHeight);
		sprite.add("static", [0]);
		sprite.add("moving", [0,1,2,3,4,5,6,7,8,9]);
		sprite.play("moving");
		graphic = sprite;

		setHitbox(fillWidth, fillHeight);
	}
	
}