package com.snakybo.platform.entity {
	import flash.display.Sprite;
	import com.snakybo.platform.level.Level;
	import com.snakybo.platform.Main;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	/** @author Kevin Krol */
	public class Entity {
		public static const ENTITY_HEIGHT:int = 128;
		
		private static var nextEntityID:int;
		
		protected var sprite:Sprite;
		
		private var entityID:int;
		
		private var canMoveLeft:Boolean;
		private var canMoveRight:Boolean;
		private var canJump:Boolean;
		
		private var isJumping:Boolean;
		private var isFalling:Boolean;
		
		public function Entity(x:int, y:int, color:uint) {
			this.entityID = nextEntityID++;
			
			sprite = new Sprite();
			sprite.graphics.beginFill(color);
			sprite.graphics.drawRect(0, 0, Level.BLOCK_SIZE, ENTITY_HEIGHT);
			sprite.graphics.endFill();
			
			sprite.x = x * Level.BLOCK_SIZE;
			sprite.y = y * Level.BLOCK_SIZE;
			
			Main.instance.addChild(sprite);
			
			canMoveLeft = true;
			canMoveRight = true;
			canJump = true;
		}
		
		/** Entity update method */
		public function update():void {
			
		}
		
		/** Move */
		protected function move(dir:int, amt:int):void {
			switch(dir) {
			case 0:
				sprite.y -= (amt * Level.BLOCK_SIZE);
				break;
			case 1:
				if(canMoveLeft) {
					sprite.x -= (amt * Level.BLOCK_SIZE);
				}
				
				break;
			case 2:
				sprite.y += (amt * Level.BLOCK_SIZE);
				break;
			case 3:
				if(canMoveRight) {
					sprite.x += (amt * Level.BLOCK_SIZE);
				}
				
				break;
			}
			
			checkCollision();
		}
		
		/** Jump */
		protected function jump():void {
			if (canJump) {
				move(0, 1);
				canJump = false;
			}
		}
		
		/** Fall */
		protected function fall():void {
			var timer:Timer = new Timer(500);
			
			isFalling = true;
			
			timer.addEventListener(TimerEvent.TIMER, fallDown);
			timer.start();
			
			function fallDown(e:TimerEvent):void {
				if(isFalling) {
					move(2, 1);
				} else {
					timer.stop();
				}
			}
		}
		
		/** Check for collision */
		private function checkCollision():void {
			canMoveLeft = true;
			canMoveRight = true;
			canJump = true;
				
			// Check for collision left
			if (Level.isBlockAt(getX() - 1, getY()) || Level.isBlockAt(getX() - 1, getY() + 1)) {
				canMoveLeft = false;
			}
			
			// Check for collision right
			if (Level.isBlockAt(getX() + 1, getY()) || Level.isBlockAt(getX() + 1, getY() + 1)) {
				canMoveRight = false;
			}
			
			// Check for collision up
			if (Level.isBlockAt(getX(), getY() - 1)) {
				canJump = false;
			}
			
			// Check for collision down
			if (Level.isBlockAt(getX(), getY() + 2)) {
				canJump = true;
				isFalling = false;
			} else {
				canJump = false;
				
				if(!isFalling) {
					fall();
				}
			}
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