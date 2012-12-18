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
	import net.flashpunk.Sfx;
	
	/**
	 * ...
	 * @author NRRedinbo
	 */
	public class Player extends Entity 
	{
		protected var currentBullet:Class;
		protected var g:Image;
		protected var flipInTween:VarTween;
		protected var flipOutTween:VarTween;
		protected var explosionEmitter:Emitter;
		protected const FLIP_SPEED:Number = .5;
		protected const EXPLOSION_SIZE:uint = 100;
		protected var shoot:Sfx = new Sfx(GC.SFX_SHOOT);
		protected var switchTheColor:Sfx = new Sfx(GC.SFX_SWITCHCOLOR);
		protected var explodeSound:Sfx = new Sfx(GC.SFX_EXPLODE);


		public function Player(x:Number=0, y:Number=0) 
		{
			super(x, y);
			g = new Image(GC.GFX_PLAYER);
			g.originX = 6;

			flipInTween = new VarTween(onFlipInComplete, Tween.PERSIST);
			flipOutTween = new VarTween(onFlipOutComplete, Tween.PERSIST);

			explosionEmitter = new Emitter(new BitmapData(1, 1), 1, 1);
			explosionEmitter.newType("Explode", [0]);
			explosionEmitter.setAlpha("Explode", 1, 0);
			explosionEmitter.setMotion("Explode", 0, 100, 2, 360, -90, -.5, Ease.quadOut);

			explosionEmitter.relative = false;
			graphic = new Graphiclist(g, explosionEmitter);

			addTween(flipInTween);
			addTween(flipOutTween);
			this.setHitbox(20, 20);
			currentBullet = WhiteBullet;
		}
		protected function onFlipInComplete():void
		{
			switchColor();
			switchTheColor.play();
			flipOutTween.tween(g, "scaleX", 1, FLIP_SPEED / 2, Ease.quadIn);
			flipOutTween.start();
		}
		
		protected function onFlipOutComplete():void
		{
			
		}
		
		protected function switchColor():void
		{
			if (currentBullet == WhiteBullet)
				{
					//the player is currently white
					g.color = 0;
					explosionEmitter.setColor("Explode", 0, 0);
					currentBullet = BlackBullet;

				}
				else
				{
					//the player is currently black
					g.color = 0xffffff;
					explosionEmitter.setColor("Explode", 0xffffff, 0xffffff);
					this.currentBullet = WhiteBullet;
				}
		}
		

		override public function update():void 
		{
			x = Input.mouseX - width / 2;
			if (x < 0 ) x = 0;
			if (x > FP.screen.width - width) x = FP.screen.width - width;
			

			if (Input.mousePressed && !flipInTween.active && !flipOutTween.active)
			{
				//spawn bullet
				shoot.play();
				this.world.add(new currentBullet(x + 9, y));
			}
			
			if (Input.pressed(Key.Z) && !flipInTween.active && !flipOutTween.active)
			{
				flipInTween.tween(g, "scaleX", 0, FLIP_SPEED / 2, Ease.quadOut);
				flipInTween.start();
			}
						
			if (this.collide(GC.TYPE_ENEMY,x,y))
			{
				//dead!
				collidable = false;
				g.visible = false;
				
				explodeSound.play();
				
				for (var i:uint = 0; i < EXPLOSION_SIZE; i++)
				{
					explosionEmitter.emit("Explode", x +width / 2, y + height / 2);
				}
				
			}
			
			if (!collidable && explosionEmitter.particleCount == 0)
			{
				collidable = true;
				g.visible = true;
				if (this.world != null) this.world.remove(this);
				
			}
			super.update();
			
		}
	}

}