package com.snakybo.platform.level {
	import com.snakybo.platform.block.Block;
	import com.snakybo.platform.block.BlockRed;
	import com.snakybo.platform.entity.Entity;
	import com.snakybo.platform.entity.EntityPlayer;
	import flash.events.Event;
	import XML;
	import com.snakybo.platform.utils.XMLLoader;
	
	/** @author Kevin Krol */
	public class Level {
		public static var levelID:int = 0;
		
		public static var BLOCK_SIZE:int;
		
		private static var blocks:Vector.<Block>;
		private static var entities:Vector.<Entity>;
		
		private var level:XML;
		
		public function Level() {
			blocks = new Vector.<Block>();
			entities = new Vector.<Entity>();
			
			var loader:XMLLoader = new XMLLoader();
			
			loader.addEventListener(Event.COMPLETE, onComplete);
			loader.load("xml/level.xml");
			
			function onComplete(e:Event):void {
				level = loader.xml[Level.levelID];
				BLOCK_SIZE = level.@gridSize;
				
				load();
			}
		}
		
		public function update():void {
			for each(var entity:Entity in entities) {
				entity.update();
			}
		}
		
		/** Load a level */
		private function load():void {
			for (var b:int = 0; b < level.blocks.block.length(); b++) {
				var block:XML = level.blocks.block[b];
				
				switch(int(block.@id)) {
				case 0:
					setBlock(new BlockRed(block.@x, block.@y));
					break;
				}
			}
			
			for (var e:int = 0; e < level.entities.entity.length(); e++) {
				var entity:XML = level.entities.entity[e];
				
				switch(int(entity.@id)) {
				case 0:
					setEntity(new EntityPlayer(entity.@x, entity.@y));
					break;
				}
			}
		}
		
		/** Set a block */
		public function setBlock(block:Block):int {
			blocks.push(block);
			
			return blocks.indexOf(block);
		}
		
		/** Set an entity */
		public function setEntity(entity:Entity):int {
			entities.push(entity);
			
			return entities.indexOf(entity);
		}
		
		/** @return true if a block is at the specified coordinates */
		public static function isBlockAt(x:int, y:int):Boolean {
			if (getBlockAt(x, y) != null) {
				return true;
			}
			
			return false;
		}
		
		/** @return block object at the specified coordinates */
		public static function getBlockAt(x:int, y:int):Block {
			for (var i:int = 0; i < blocks.length; i++) {
				if (blocks[i].getX() == x && blocks[i].getY() == y) {
					return blocks[i];
				}
			}
			
			return null;
		}
	}
}