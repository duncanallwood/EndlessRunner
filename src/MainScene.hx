package ;

import com.haxepunk.graphics.atlas.TextureAtlas;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;


class MainScene extends Scene
{
	private var player:Runner;
	private var ground:Ground;
	private var wall:Wall;
	
	public function new()
	{
		super();
		//var atlas:TextureAtlas = TextureAtlas.loadTexturePacker("atlas/atlas.xml");
		
		var playerCentreXPos = 100;
		var playerCentreYPos = Math.round(HXP.height/ 2);
		createPlayer(playerCentreXPos, playerCentreYPos);
		
		var groundYPos = Math.round((playerCentreYPos + (player.getSpriteHeight())));
		createGround(0, groundYPos);
		
		var wallXPos = HXP.width - 15;
		var wallYPos = groundYPos - 48;
		createWall(wallXPos, wallYPos);
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

	private function createWall(x:Int, y:Int):Void
	{
		wall = new Wall(500);
		wall.x = x;
		wall.y = y;
		add(wall);
	}
}