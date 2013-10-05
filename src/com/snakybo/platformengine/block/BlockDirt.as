package com.snakybo.platformengine.block {
	
	/** @author Kevin Krol */
	public class BlockDirt extends Block {
		public function BlockDirt(blockID:int) {
			super(blockID, new dirt());
		}
	}
}