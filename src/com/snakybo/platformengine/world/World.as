package com.snakybo.platformengine.world {
	import com.snakybo.platformengine.block.Block;
	import com.snakybo.platformengine.block.BlockList;
	import com.snakybo.platformengine.entity.Entity;
	import com.snakybo.platformengine.entity.player.EntityPlayer;
	import com.snakybo.platformengine.Game;
	import com.snakybo.platformengine.utils.XMLLoader;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/** @author Kevin Krol */
	public class World {
		public static var gridSize:int;
		public static var levelWidth:int;
		
		public static var walls:Array;
		public static var entities:Array;
		
		private var levelID:int;
		private var level:XML;
		
		public function World(levelID:int) {
			walls = [];
			entities = [];
			
			this.levelID = levelID;
			
			var xmlLoader:XMLLoader = new XMLLoader();
			
			xmlLoader.addEventListener(Event.COMPLETE, onComplete);
			xmlLoader.load("xml/level.xml");
			
			function onComplete(e:Event):void {
				level = xmlLoader.xml[levelID];
				levelWidth = level.@width;
				gridSize = level.@gridSize;
				
				var spr:Sprite = new Sprite();
				
				spr.graphics.beginFill(level.@backgroundColor);
				spr.graphics.drawRect(0, 0, 1280, 720);
				spr.graphics.endFill();
				
				Game.main.addChild(spr);
								
				for (var y:int = 0; y < level.walls.row.length(); y++) {
					walls[y] = [];
					
					for (var x:int = 0; x < level.walls.row[y].wall.length(); x++) {
						var wall:XML = level.walls.row[y].wall[x];
						
						walls[y][wall.@x] = setBlock(wall.@blockID, wall.@x, y);
					}
				}
				
				entities.push(setEntity(EntityPlayer, level.player.@x, level.player.@y));
			}
		}
		
		/** Set block */
		private function setBlock(blockID:int, x:Number, y:Number):Block {
			return new (BlockList.blocks[blockID])(blockID, x, y)
		}
		
		/** Set entity */
		private function setEntity(entity:Class, x:Number, y:Number):Entity {
			return new entity(x, y);
		}
	}
}