package  
{
	/**
	 * ...
	 * @author NRRedinbo
	 */
	public class GC 
	{
		[Embed(source="../assets/player.png")]
		public static const GFX_PLAYER:Class 
		
		[Embed(source="../assets/enemy.png")]
		public static const GFX_ENEMY:Class 
		
		[Embed(source = "../assets/logoTop.png")]
		public static const GFX_TITLE_TOP:Class;
		
		[Embed(source = "../assets/logoBottom.png")]
		public static const GFX_TITLE_BOTTOM:Class;
		
		[Embed(source = "../assets/explode.mp3")]
		public static const SFX_EXPLODE:Class;
		
		[Embed(source = "../assets/shoot.mp3")]
		public static const SFX_SHOOT:Class;
		
		[Embed(source = "../assets/start.mp3")]
		public static const SFX_START:Class;
		
		[Embed(source = "../assets/switchColor.mp3")]
		public static const SFX_SWITCHCOLOR:Class;
		
		public static const BULLET_SPEED:Number = 100;
		public static const ENEMY_SPEED:Number = 50;
		public static const ENEMY_SPAWN_CHANCE:Number = .98;
		public static const ENEMY_VALUE:Number = 100;
		
		public static const TYPE_WHITE_BULLET:String = "white_bullet";
		public static const TYPE_BLACK_BULLET:String = "black_bullet";
		public static const TYPE_ENEMY:String = "enemy";		
	}

}