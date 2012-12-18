package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import bullet;
	import net.flashpunk.graphics.Emitter;
	import net.flashpunk.tweens.misc.VarTween;
	import net.flashpunk.Tween;
	import flash.display.BitmapData;
	import net.flashpunk.utils.Ease;
	import net.flashpunk.Sfx;
	
	/**
	 * ...
	 * @author NRRedinbo
	 */
	public class enemy extends Entity
	{
		protected var e:Image;
		protected var explosionEmitter:Emitter;
		protected const EXPLOSION_SIZE:uint = 100;
		protected var explosionTrigger:Boolean = false;
		protected var timeToDie:Boolean = false;
		protected var explode:Sfx = new Sfx(GC.SFX_EXPLODE);

		public function enemy() 
		{
			super(FP.rand(FP.screen.width - 20), -10);
			e = new Image(GC.GFX_ENEMY);
			this.setHitbox(20, 20);
			this.type = GC.TYPE_ENEMY;
			explosionEmitter = new Emitter(new BitmapData(1, 1), 1, 1);
			explosionEmitter.newType("Explode", [0]);
			explosionEmitter.setAlpha("Explode", 1, 0);
			explosionEmitter.setMotion("Explode", 0, 100, .5, 360, -90, -.05, Ease.quadOut);
			explosionEmitter.relative = false;
			graphic = new Graphiclist(e, explosionEmitter);
		}
		
		override public function update():void 
		{
			this.y += FP.elapsed * GC.ENEMY_SPEED;
			if (this.y > FP.screen.height) this.world.remove(this);
			var b:bullet = bullet(this.collideTypes([GC.TYPE_WHITE_BULLET, GC.TYPE_BLACK_BULLET], x, y));

			if (b != null)
			{
				hit(b);
			}

			if (explosionTrigger == true)
			{
				collidable = false;
				e.visible = false;
				explode.play();
				
				for (var i:uint = 0; i < EXPLOSION_SIZE; i++)
				{
					explosionEmitter.emit("Explode", x + width / 2, y + height / 2);
					trace(i);
					if ( i > 80)
					{
						explosionTrigger = false;
						timeToDie = true;
					}
				}
			}
			if (timeToDie == true && explosionEmitter.particleCount == 0)
			{
				FP.elapsed
				this.world.remove(this);
				explosionTrigger = false;
			}
			super.update();
		}
		
		protected function hit(b:bullet):void
		{
			b.world.remove(b);
		}
		
		protected function getScore():void 
		{
			explosionTrigger = true;
			GV.Score += GC.ENEMY_VALUE;
		}

		override public function removed():void 
		{
			super.removed();
		}
	}

}