package com.snakybo.platformengine.entity {
	import com.snakybo.platformengine.block.Block;
	import flash.display.MovieClip;
	import com.snakybo.platformengine.Game;
	import com.snakybo.platformengine.world.World;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	
	/** @author Kevin Krol */
	public class Entity extends MovieClip {	
		private static var nextEntityID:int;
		
		public var entityID:int;
		public var position:Point;
		public var mc:MovieClip;
			
		protected var isOnGround:Boolean;
		protected var isJumping:Boolean;
		protected var isFalling:Boolean;
		protected var isMoving:Boolean;
		
		protected var isCollidingLeft:Boolean;
		protected var isCollidingRight:Boolean;		
		
		protected var maxHorizontalVelocity:Number;
		protected var maxVerticalVelocity:Number;		
		
		public function Entity(mc:MovieClip) {
			this.entityID = nextEntityID++;
			this.mc = mc;
			this.position = new Point();
			this.maxHorizontalVelocity = 10;
			this.maxVerticalVelocity = 9.8;
			
			Game.main.addChild(mc);
		}
		
		/** Entity input */
		public function input(e:KeyboardEvent):void { }
		
		/** Entity update */
		public function update(e:Event):void { }	
		
		/** Set X */
		protected function setX(x:Number):void {
			mc.x = x;
			position.x = x / 64;
		}
		
		/** Set X */
		protected function setY(y:Number):void {
			mc.y = y;
			position.y = y / 64;
		}
		
		/** Set X on block */
		protected function setXOnBlock(x:Number):void {
			setX(x * World.gridSize);
		}
		
		/** Set Y on block */
		protected function setYOnBlock(y:Number):void {
			setY(y * World.gridSize);
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