package com.snakybo.platformengine.utils {
	import com.snakybo.platformengine.block.Block;
	import com.snakybo.platformengine.world.World;
	import com.snakybo.platformengine.entity.Entity;

	/** @author Kevin Krol */
	public class Utils {
		/** Check if entity is colliding */
		public static function isColliding(b:Block, e:Entity):Boolean {
			if (b.getX() >= e.getX() && b.getX() <= (e.getX() - World.gridSize)) {
				
				if (b.getY() == (e.getY() + 1)) {
					return true;
				}
			}
			
			return false;
		}
	}
}