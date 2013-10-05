package com.snakybo.platformengine.block {
	import flash.display.MovieClip;
	import com.snakybo.platformengine.Game;
	import com.snakybo.platformengine.sound.StepSound;
	import flash.geom.Point;
	import flash.media.Sound;
	import com.snakybo.platformengine.world.World;
	
	/** @author Kevin Krol */
	public class Block extends MovieClip {
		public var blockID:int;
		
		public static const soundStone:StepSound = new StepSound("stone", 1.0);
		
		public var position:Point;
		public var mc:MovieClip;
		
		private var hardness:Number;
		private var stepSound:StepSound;		
		
		public function Block(blockID:int, mc:MovieClip) {
			this.blockID = blockID;
			this.mc = mc;
			this.position = new Point();
			
			Game.main.addChild(mc);
		}
		
		/** Set step sound */
		protected function setStepSound(stepSound:StepSound):void {
			this.stepSound = stepSound;
		}
		
		/** Set hardness */
		protected function setHardness(hardness:Number):void {
			this.hardness = hardness;
		}
		
		/** Set unbreakable */
		protected function setUnbreakable():void {
			this.hardness = -1;
		}
		
		/** Set X */
		protected function setX(x:Number):void {
			mc.x = x * World.gridSize;
			position.x = x;
		}
		
		/** Set X */
		protected function setY(y:Number):void {
			mc.y = y * World.gridSize;
			position.y = y;
		}
		
		/** Set X */
		public function getX():Number {
			return mc.x;
		}
		
		/** Set X */
		public function getY():Number {
			return mc.y;
		}
	}
}