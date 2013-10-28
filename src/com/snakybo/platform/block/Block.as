package com.snakybo.platform.block {
	import flash.display.Sprite;
	import com.snakybo.platform.Main;
	import com.snakybo.platform.level.Level;
	
	/** @author Kevin Krol */
	public class Block {
		private var blockID:int;
		
		protected var sprite:Sprite;
		
		public function Block(blockID:int, x:int, y:int, color:uint) {
			this.blockID = blockID;
			
			sprite = new Sprite();
			sprite.graphics.beginFill(color);
			sprite.graphics.drawRect(0, 0, Level.BLOCK_SIZE, Level.BLOCK_SIZE);
			sprite.graphics.endFill();
			
			sprite.x = x * Level.BLOCK_SIZE;
			sprite.y = y * Level.BLOCK_SIZE;
			
			Main.instance.addChild(sprite);
		}
		
		/** @return x */
		public function getX():int {
			return sprite.x / Level.BLOCK_SIZE;
		}
		
		/** @return y */
		public function getY():int {
			return sprite.y / Level.BLOCK_SIZE;
		}
	}
}