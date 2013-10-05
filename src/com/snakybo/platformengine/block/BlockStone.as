package com.snakybo.platformengine.block {
	
	/** @author Kevin Krol */
	public class BlockStone extends Block {
		public function BlockStone(blockID:int, x:Number, y:Number) {
			super(blockID, new stone());
			
			setX(x);
			setY(y);
			setHardness(5.0);
			setStepSound(soundStone);
		}
	}
}