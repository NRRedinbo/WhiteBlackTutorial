package  
{
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	
	/**
	 * ...
	 * @author NRRedinbo
	 */
	public class gameWorld extends World 
	{
		protected var player:Player;
		protected var scoreText:Text;
		protected var start:Sfx = new Sfx(GC.SFX_START);
		
		public function gameWorld() 
		{
			
			super();
		}
		
		override public function begin():void 
		{
			player = new Player(FP.screen.width / 2 - 10, 275);
			Text.size = 8;
			scoreText = new Text("0", 0, 0, FP.screen.width);
			addGraphic(scoreText);
			this.add(player);
			start.play();
			super.begin();
			
			FP.screen.color = 0x888888;
		}
		
		override public function update():void 
		{
			if (this.classCount(Player) != 0)
			{
				if(this.typeCount(GC.TYPE_ENEMY) == 0 || FP.random > GC.ENEMY_SPAWN_CHANCE)
				{
					if (FP.rand(2) == 0) add(new WhiteEnemy());
					else add(new BlackEnemy());
				}
			}
			
			scoreText.text = GV.Score.toString();
			if (this.classCount(Player) == 0 && this.typeCount(GC.TYPE_ENEMY) == 0)
			{
					add(player);
					GV.Score = 0;
			}
			
			super.update();
		}
	}

}