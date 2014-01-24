﻿/*

######################## DISCLAMIER ######################## 















*/


package
{	
    import flash.display.*;
    import flash.events.*;
	import flash.utils.*;
    import flash.filters.BitmapFilterQuality;
    import flash.filters.DropShadowFilter;
	import flash.net.URLRequest;
	
	// -------------------------------------------------
	// Class ButtonClass
	// A wrapper for the SimpleButton class to give the standard look for buttons for this app.
	//
	// Public events:
	//		ButtonClass.ACTION - reports a click on the button
	// -------------------------------------------------
	public class ButtonClass extends MovieClip
	{
		private var pWidth:Number;
		private var pHeight:Number;
		private var pIconPath:String;
		public static var ACTION:String = "action";
		
		// -------------------------------------------------
		// -------------------------------------------------
		public function ButtonClass(btnWidth:Number, btnHeight:Number, iconPath:String)
		{
			pWidth = btnWidth;
			pHeight = btnHeight;
			pIconPath = iconPath;
			
			// Use built-in SimpleButton to provide basic mouse event handling
			// and state management.
			var buttonSprite:SimpleButton = new SimpleButton();
			buttonSprite.addEventListener(MouseEvent.CLICK, handleClick);
			
			// Sprite to represent button's up state
			var upSprite:Sprite = new Sprite();
			upSprite.graphics.lineStyle(1, 0xFFFFFF, 1.0);
			upSprite.graphics.beginFill(0xD0D0D0, 0.7);
			upSprite.graphics.drawRect(0, 0, pWidth, pWidth);
			
			// Sprite to represent button's down state
			var downSprite:Sprite = new Sprite();
			downSprite.graphics.lineStyle(1, 0xFFFFFF, 1.0);
			downSprite.graphics.beginFill(0xCCCCCC, 0.7);
			downSprite.graphics.drawRect(0, 0, pWidth, pHeight);
			downSprite.x = downSprite.y = 1;

			// Sprite to represent button's mouseover state
			var overSprite:Sprite = new Sprite();
			overSprite.graphics.lineStyle(1, 0xEEEEEE, 1.0);
			overSprite.graphics.beginFill(0xD0D0D0, 0.7);
			overSprite.graphics.drawRect(0, 0, pWidth, pWidth);
			
			// Setup button states
			buttonSprite.upState = upSprite;
			buttonSprite.overState = overSprite;
			buttonSprite.downState = downSprite;
			buttonSprite.useHandCursor = true;
			buttonSprite.hitTestState = upSprite;
			this.addChild(buttonSprite);
			
			// Add icon to up state sprite
			var ldrUp:Loader = new Loader();
			var urlReqUp:URLRequest = new URLRequest(pIconPath);
			ldrUp.load(urlReqUp);
			upSprite.addChild(ldrUp);

			// Add icon to over state sprite
			var ldrOver:Loader = new Loader();
			var urlReqOver:URLRequest = new URLRequest(pIconPath);
			ldrOver.load(urlReqOver);
			overSprite.addChild(ldrOver);

			// Add icon to down state sprite
			var ldrDown:Loader = new Loader();
			var urlReqDown:URLRequest = new URLRequest(pIconPath);
			ldrDown.load(urlReqDown);
			downSprite.addChild(ldrDown);
			
			// Add dropshadow effect to the whole button
			var filter:DropShadowFilter = new DropShadowFilter(3, 45, 0x000000, 0.5, 3, 3, 0.65,
				BitmapFilterQuality.HIGH, false, false);
			var myFilters:Array = new Array();
            myFilters.push(filter);
            filters = myFilters;
		}
		
		// -------------------------------------------------
		// Method: handleClick()
		// Internal method to respond to mouse click and to dispatch the
		// ACTION event.
		// -------------------------------------------------
		private function handleClick(evt:Event):void
		{
			dispatchEvent(new Event(ACTION));
		}
	}
}