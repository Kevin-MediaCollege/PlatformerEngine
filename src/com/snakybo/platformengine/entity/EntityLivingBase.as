package com.snakybo.platformengine.entity {
	import com.snakybo.platformengine.block.Block;
	import com.snakybo.platformengine.entity.player.EntityPlayer;
	import com.snakybo.platformengine.utils.Delay;
	import com.snakybo.platformengine.world.World;
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/** @author Kevin Krol */
	public class EntityLivingBase extends Entity {
		public static const HIT_AREA:Array = [
			[0, 0],
			[World.gridSize, 0],
			[World.gridSize, World.gridSize],
			[0, World.gridSize]
		];
		
		protected var target:EntityPlayer;
		
		protected var health:int;
		
		private var horizontalVelocity:Number;
		private var verticalVelocity:Number;
		
		private var fallDelay:Delay;
		private var jumpTime:Delay;
		
		private var jumpStart:Boolean;
		private var jumpStartDelay:int;
		
		public function EntityLivingBase(mc:MovieClip, health:int, x:Number, y:Number) {
			super(mc);
			
			this.health = health;
			this.fallDelay = new Delay(1);
			fallDelay.end();
			
			this.jumpTime = new Delay(3);
			jumpTime.end();
			
			this.horizontalVelocity = 0;
			this.verticalVelocity = 0;
			
			setXOnBlock(x);
			setYOnBlock(y);
		}
		
		public override function update(e:Event):void {
			isCollidingLeft = false;
			isCollidingRight = false;
			isOnGround = false;
			
			for (var y:int = 0; y < World.walls.length; y++) {
				for (var x:int = 0; x <= World.levelWidth; x++) {
					if (World.walls[y][x] != null) {
						if (y == (Math.floor(position.y + 1))) {
							if (!jumpStart) {
								trace("Not jumping");
								if (x  == Math.floor(position.x) || x == Math.ceil(position.x)) {
									var oldY:Number;
									
									isOnGround = true;
									
									if(isJumping) {
										isJumping = false;
									}
									
									while(World.walls[y][x].getY() <= (getY() + World.gridSize) - 1) {
										oldY = getY();
										
										setY(oldY - 0.1);
									}
									
									if ((position.y % 1) != 0) {
										oldY = getY();
										
										setY(oldY - 0.1);
									}
								}
							} else {
								jumpStartDelay++;
								
								if(jumpStartDelay >= 5) {
									jumpStart = false;
									jumpStartDelay = 0;
								}
							}
						} else if (y == (Math.floor(position.y))) {
							var oldX:Number;
							
							if (x  == Math.floor(position.x)) {
								isCollidingLeft = true;
								
								while (World.walls[y][x].getX() + World.gridSize >= getX()) {
									oldX = getX();
									setX(oldX + 0.1);
								}
							}
							
							if (x == Math.ceil(position.x)) {
								isCollidingRight = true;
								
								while (World.walls[y][x].getX() <= getX() + World.gridSize) {
									oldX = getX();
									setX(oldX - 0.1);
								}
							}
						}
					}
				}
			}
			
			if (!isOnGround && !fallDelay.active()) {
				fallDelay.start();
			}
			
			if(!isJumping) {
				if (!isOnGround && fallDelay.over()) {
					moveVertical(1);				
				}
			} else {
				//if (fallDelay.over()) {
					//if(!jumpTime.over()) {
						moveVertical( -1);
					//} else {
						//moveVertical(1);
					//}
				//}
			}
			
			if (!isMoving) {
				horizontalVelocity = 0;
				verticalVelocity = 0;
			}
			
			isMoving = false;
		}
		
		/** Move */
		protected function moveHorizontal(hor:int):void {
			var allowed:Boolean = true;
			var oldX:Number = getX();
			
			if ((hor < 0 && isCollidingLeft) || (hor > 0 && isCollidingRight)) {
				allowed = false;
				horizontalVelocity = 0;
			}
			
			if (allowed) {
				isMoving = true;
				
				if(horizontalVelocity < maxHorizontalVelocity) {
					horizontalVelocity += 0.3;
				}
				
				if (!isOnGround) {
					horizontalVelocity /= 2;
				}
				
				setX(oldX + (hor * horizontalVelocity));
			}
		}
		
		/** Move vertical */
		protected function moveVertical(ver:int):void {
			var oldY:Number = getY();
			
			isMoving = true;
			
			if (verticalVelocity < maxVerticalVelocity) {
				verticalVelocity += 0.2;
			}
			
			setY(oldY + (ver * verticalVelocity));
		}
		
		/** Jump entity */
		protected function jump():void {
			if(isOnGround && !isJumping) {
				isJumping = true;
				jumpStart = true;
				trace("jump!");
				
				if(!jumpTime.active()) {
					jumpTime.start();
				}
			}
		}
	}
}