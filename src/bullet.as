package  
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author NRRedinbo
	 */
	public class bullet extends Entity 
	{
		
		public function bullet(x:int, y:int) 
		{
			this.x = x;
			this.y = y;
			this.setHitbox(2, 2);
			this.graphic = new Image(new BitmapData(2, 2, false, 0xffffff));
		}
		
		override public function update():void 
		{
			y -= FP.elapsed * GC.BULLET_SPEED;
			if (y <= -height) 
			{
				this.world.remove(this);
				
			}
			super.update();
		}
		
		override public function removed():void 
		{
			
			super.removed();
		}
	}

}