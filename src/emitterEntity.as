package  
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Emitter;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.Tween;
	import net.flashpunk.tweens.misc.VarTween;
	import net.flashpunk.utils.Key;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Ease;

	
	/**
	 * ...
	 * @author NRRedinbo
	 */
	public class emitterEntity extends Entity 
	{

		
		public function emitterEntity() 
		{

		}
		
		public function explode():void
		{

			GV.EX = false;
			trace(GV.EX);
		}
		
		override public function update():void 
		{
			if (GV.EX == true) {
				explode();
			}
			super.update();
		}
	}
}