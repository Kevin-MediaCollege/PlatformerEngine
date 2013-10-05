package com.snakybo.platformengine.block {
	
	/** @author Kevin Krol */
	public class BlockGrass extends Block {
		public function BlockGrass(blockID:int) {
			super(blockID, new grass());
		}
	}
}