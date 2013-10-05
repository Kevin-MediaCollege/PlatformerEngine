package com.snakybo.platformengine.sound {
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.events.Event;
	import flash.media.SoundTransform;
	
	/** @author Kevin Krol */
	public class SoundHandler {
		private var sound:Sound;
		private var soundChannel:SoundChannel;
		private var soundTransform:SoundTransform;
		
		private var volume:Number;
		
		public function SoundHandler(sound:Class, volume:Number, soundChannel:SoundChannel = null) {		
			this.sound = new sound();
			this.volume = volume;
			this.soundChannel = new SoundChannel();
			this.soundTransform = new SoundTransform();
		}
		
		/** Play sound */
		public function playSound():void {
			if(volume > 0) {
				soundChannel = sound.play();
				soundTransform.volume = volume;
				
				soundChannel.soundTransform = soundTransform;
			}
		}
	}
}