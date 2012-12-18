package 
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author NRRedinbo
	 */
	public class Main extends Engine
	
	{
		
		public function Main():void 
		{
			super(160, 300);
			FP.screen.scale = 2;
			FP.screen.color = 0x0000FF;
		}
		
		override public function init():void 
		{
			FP.world = new titleWorld();
			super.init();
		}
	}
	
}