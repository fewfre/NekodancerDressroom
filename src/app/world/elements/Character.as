package app.world.elements
{
	import com.piterwilson.utils.*;
	import app.data.*;
	import app.world.data.*;
	import flash.display.*;
	import flash.events.*;
	import flash.geom.*;
	import flash.net.*;

	public class Character extends Sprite
	{
		// Storage
		public var outfit:MovieClip;
		public var animatePose:Boolean;

		private var _itemDataMap:Object;

		// Properties
		public function set scale(pVal:Number) : void { outfit.scaleX = outfit.scaleY = pVal; }

		// Constructor
		// pData = { x:Number, y:Number, [various "__Data"s], ?params:URLVariables }
		public function Character(pData:Object) {
			super();
			animatePose = false;

			this.x = pData.x;
			this.y = pData.y;

			this.buttonMode = true;
			this.addEventListener(MouseEvent.MOUSE_DOWN, function () { startDrag(); });
			this.addEventListener(MouseEvent.MOUSE_UP, function () { stopDrag(); });

			/****************************
			* Store Data
			*****************************/
			_itemDataMap = {};
			_itemDataMap[ITEM.SKIN] = pData.skin;
			_itemDataMap[ITEM.HEAD] = pData.head;
			_itemDataMap[ITEM.EYES] = pData.eyes;
			_itemDataMap[ITEM.SHIRT] = pData.shirt;
			_itemDataMap[ITEM.PANTS] = pData.pants;
			_itemDataMap[ITEM.SHOES] = pData.shoes;
			_itemDataMap[ITEM.GLASSES] = pData.glasses;
			_itemDataMap[ITEM.POSE] = pData.pose;
			
			if(pData.params) _parseParams(pData.params);

			updatePose();
		}

		public function updatePose() {
			var tScale = 3;
			if(outfit != null) { tScale = outfit.scaleX; removeChild(outfit); }
			outfit = addChild(new Pose(getItemData(ITEM.POSE))) as Pose;
			outfit.scaleX = outfit.scaleY = tScale;

			outfit.apply({
				items:[
					getItemData(ITEM.SKIN),
					getItemData(ITEM.HEAD),
					getItemData(ITEM.EYES),
					getItemData(ITEM.SHIRT),
					getItemData(ITEM.PANTS),
					getItemData(ITEM.SHOES),
					getItemData(ITEM.GLASSES),
				]
			});
			if(animatePose) outfit.play(); else outfit.stopAtLastFrame();
		}

		private function _parseParams(pParams:URLVariables) : void {
			trace(pParams.toString());

			// _setParamToType(pParams, ITEM.SKIN, "s", false);
			// _setParamToType(pParams, ITEM.HAIR, "d");
			_setParamToType(pParams, ITEM.HEAD, "h");
			// _setParamToType(pParams, ITEM.EARS, "e");
			// _setParamToType(pParams, ITEM.EYES, "y");
			// _setParamToType(pParams, ITEM.MOUTH, "m");
			// _setParamToType(pParams, ITEM.NECK, "n");
			// _setParamToType(pParams, ITEM.TAIL, "t");
			// _setParamToType(pParams, ITEM.CONTACTS, "c");
			// _setParamToType(pParams, ITEM.HAND, "hd");
			// _setParamToType(pParams, ITEM.POSE, "p", false);
		}
		private function _setParamToType(pParams:URLVariables, pType:String, pParam:String, pAllowNull:Boolean=true) {
			try {
				var tData:ItemData = null, tID = pParams[pParam], tColors;
				if(tID != null && tID != "") {
					tColors = _splitOnUrlColorSeperator(tID); // Get a list of all the colors (ID is first); ex: 5;ffffff;abcdef;169742
					tID = tColors.splice(0, 1)[0]; // Remove first item and store it as the ID.
					tData = GameAssets.getItemFromTypeID(pType, tID);
					if(tColors.length > 0) { tData.colors = _hexArrayToIntArray(tColors, tData.defaultColors); }
				}
				_itemDataMap[pType] = pAllowNull ? tData : ( tData == null ? _itemDataMap[pType] : tData );
			} catch (error:Error) { };
		}
		private function _hexArrayToIntArray(pColors:Array, pDefaults:Array) : Array {
			pColors = pColors.concat(); // Shallow Copy
			for(var i = 0; i < pDefaults.length; i++) {
				pColors[i] = pColors[i] ? _hexToInt(pColors[i]) : pDefaults[i];
			}
			return pColors;
		}
		private function _hexToInt(pVal:String) : int {
			return parseInt(pVal, 16);
		}
		private function _splitOnUrlColorSeperator(pVal:String) : Array {
			// Used to be , but changed to ; (for atelier801 forum support)
			return pVal.indexOf(";") > -1 ? pVal.split(";") : pVal.split(",");
		}

		public function getParams() : String {
			var tParms = new URLVariables();

			// _addParamToVariables(tParms, "s", ITEM.SKIN);
			// _addParamToVariables(tParms, "d", ITEM.HAIR);
			_addParamToVariables(tParms, "h", ITEM.HEAD);
			// _addParamToVariables(tParms, "e", ITEM.EARS);
			// _addParamToVariables(tParms, "y", ITEM.EYES);
			// _addParamToVariables(tParms, "m", ITEM.MOUTH);
			// _addParamToVariables(tParms, "n", ITEM.NECK);
			// _addParamToVariables(tParms, "t", ITEM.TAIL);
			// _addParamToVariables(tParms, "c", ITEM.CONTACTS);
			// _addParamToVariables(tParms, "hd", ITEM.HAND);
			// _addParamToVariables(tParms, "p", ITEM.POSE);

			return tParms.toString().replace(/%3B/g, ";");
		}
		private function _addParamToVariables(pParams:URLVariables, pParam:String, pType:String) {
			var tData:ItemData = getItemData(pType);
			if(tData) {
				pParams[pParam] = tData.id;
				var tColors = getColors(pType);
				if(String(tColors) != String(tData.defaultColors)) { // Quick way to compare two arrays with primitive types
					pParams[pParam] += ";"+_intArrayToHexArray(tColors).join(";");
				}
			}
			/*else { pParams[pParam] = ''; }*/
		}
		private function _intArrayToHexArray(pColors:Array) : Array {
			pColors = pColors.concat(); // Shallow Copy
			for(var i = 0; i < pColors.length; i++) {
				pColors[i] = _intToHex(pColors[i]);
			}
			return pColors;
		}
		private function _intToHex(pVal:int) : String {
			return pVal.toString(16).toUpperCase();
		}

		/****************************
		* Color
		*****************************/
		public function getColors(pType:String) : Array {
			return _itemDataMap[pType].colors;
		}

		public function colorItem(pType:String, arg2:int, pColor:String) : void {
			_itemDataMap[pType].colors[arg2] = GameAssets.convertColorToNumber(pColor);
			updatePose();
		}

		/****************************
		* Update Data
		*****************************/
		public function getItemData(pType:String) : ItemData {
			return _itemDataMap[pType];
		}

		public function setItemData(pItem:ItemData) : void {
			var tType = pItem.type;
			_itemDataMap[tType] = pItem;
			updatePose();
		}

		public function removeItem(pType:String) : void {
			_itemDataMap[pType] = null;
			updatePose();
		}
	}
}
