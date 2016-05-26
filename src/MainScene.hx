package ;

import com.haxepunk.graphics.atlas.TextureAtlas;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import src.Ground;


class MainScene extends Scene
{
	private var player:Runner;
	private var ground:Ground;
	
	public function new()
	{
		super();
		//var atlas:TextureAtlas = TextureAtlas.loadTexturePacker("atlas/atlas.xml");
		
		var playerCentreXPos = 100;
		var playerCentreYPos = Math.round(HXP.height/ 2);
		createPlayer(playerCentreXPos, playerCentreYPos);
		var groundYPos = Math.round((playerCentreYPos + (player.getSpriteHeight())));
		createGround(0, groundYPos);
		
	}
	
	private function createPlayer(x:Int, y:Int):Void
	{
		player = new Runner(x,y);
		add(player);
	}
	
	private function createGround(x:Int, y:Int):Void
	{
		ground = new Ground(HXP.width, Math.round(HXP.height / 2));
		ground.x = x;
		ground.y = y;
		add(ground);
	}
}