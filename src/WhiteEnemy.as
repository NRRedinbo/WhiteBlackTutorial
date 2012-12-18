package 
{
	/**
	 * ...
	 * @author NRRedinbo
	 */
	import bullet;
	
	
	public class WhiteEnemy extends enemy 
	{
		
		public function WhiteEnemy() 
		{
			
			super();
			
		}
		
		override protected function hit(b:bullet):void 
		{

			if (b.type == GC.TYPE_BLACK_BULLET)
			{

				this.getScore();
			}
			super.hit(b);
		}
	}

}