package  
{
	/**
	 * ...
	 * @author NRRedinbo
	 */
	
	import net.flashpunk.graphics.Image;
	
	public class BlackBullet extends bullet 
	{
		
		public function BlackBullet(x:int, y:int) 
		{
			super(x, y);
			this.type = GC.TYPE_BLACK_BULLET;
			Image(this.graphic).color = 0x000000;
		}
		
	}

}