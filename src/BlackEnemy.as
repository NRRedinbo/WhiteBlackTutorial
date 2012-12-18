package 
{
	/**
	 * ...
	 * @author NRRedinbo
	 */
	import bullet;
	import net.flashpunk.graphics.Image;
	
	public class BlackEnemy extends enemy 
	{
		
		public function BlackEnemy() 
		{
			super();
			e.color = 0;
		}
		
		override protected function hit(b:bullet):void 
		{

			if (b.type == GC.TYPE_WHITE_BULLET)
			{

				this.getScore();
			}
			super.hit(b);
		}
		
	}

}