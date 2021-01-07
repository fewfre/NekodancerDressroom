package app.world.elements
{
	import com.fewfre.utils.*;
	import app.data.*;
	import app.world.data.*;
	import flash.display.*;
	import flash.geom.*;
	
	public class Pose extends MovieClip
	{
		// Storage
		private var _poseData : ItemData;
		private var _pose : MovieClip;
		
		public function get pose():MovieClip { return _pose; }
		
		// Constructor
		public function Pose(pPoseData:ItemData) {
			super();
			_poseData = pPoseData;
			
			_pose = addChild( new pPoseData.itemClass() ) as MovieClip;
			stop();
		}
		
		override public function play() : void {
			super.play();
			_pose.play();
		}
		
		override public function stop() : void {
			super.stop();
			_pose.stop();
		}
		
		public function stopAtLastFrame() : void {
			_pose.gotoAndPlay(10000);
			stop();
		}
		
		// pData = { ?items:Array, ?removeBlanks:Boolean=false, ?shamanMode:int(SHAMAN_MODE) }
		public function apply(pData:Object) : MovieClip {
			if(!pData.items) pData.items = [];
			
			var tSkinData = FewfUtils.getFromArrayWithKeyVal(pData.items, "type", ITEM.SKIN);
			// if(tSkinData == null) { tSkinData = FewfUtils.getFromArrayWithKeyVal(pData.items, "type", ITEM.SKIN_COLOR); }
			
			var tShopData:Array = _orderType(pData.items);
			var part:MovieClip = null;
			var tChild:DisplayObject = null;
			var tItemsOnChild:int = 0;
			var tSlotName:String;
			
			// This works because poses, skins, and items have a group of letters/numbers that let each other know they should be grouped together.
			// For example; the "head" of a pose is T, as is the skin's head, hats, and hair. Thus they all go onto same area of the skin.
			// Loop in reverse so unused parts can be removed if required
			for(var i:int = _pose.numChildren-1; i >= 0; i--) {
				tChild = _pose.getChildAt(i);
				tItemsOnChild = 0;
				tSlotName = tChild.name;
				for(var j:int = 0; j < tShopData.length; j++) {
					part = _addToPoseIfCan(tChild as MovieClip, tShopData[j], tSlotName, pData) as MovieClip;
					_colorPart(part, tShopData[j], tSlotName);
					if(part) { tItemsOnChild++; }
				}
				if(pData.removeBlanks && tItemsOnChild == 0) {
					_pose.removeChildAt(i);
				}
				part = null;
			}
			
			return this;
		}
		
		private function _addToPoseIfCan(pSkinPart:MovieClip, pData:ItemData, pID:String, pOptions:Object=null) : DisplayObject {
			if(pData && pSkinPart) {
				var tClass = pData.getPart(pID, pOptions);
				if(tClass) {
					return pSkinPart.addChild( new tClass() );
				}
			}
			return null;
		}
		
		private function _colorPart(part:MovieClip, pData:ItemData, pSlotName:String) : void {
			if(!part) { return; }
			if(part is MovieClip) {
				if(pData.colors != null && !pData.isSkin()) {
					GameAssets.colorItem({ obj:part, colors:pData.colors });
				}
				else { GameAssets.colorDefault(part); }
			}
		}
		
		private function _orderType(pItems:Array) : Array {
			var i = pItems.length;
			while(i > 0) { i--;
				if(pItems[i] == null) {
					pItems.splice(i, 1);
				}
			}
			
			pItems.sort(function(a, b){
				return ITEM.LAYERING.indexOf(a.type) > ITEM.LAYERING.indexOf(b.type) ? 1 : -1;
			});
			
			return pItems;
		}
		
		public function colorFur(pSkinPart:MovieClip, pColor:int):DisplayObject {
			var i:int=0;
			var tChild:DisplayObject;
			if (pSkinPart.numChildren > 1) {
				while (i < pSkinPart.numChildren) {
					tChild = pSkinPart.getChildAt(i);
					i++;
				}
			} else {
				GameAssets.applyColorToObject(pSkinPart, pColor);
			}
			return pSkinPart;
		}
	}
}
