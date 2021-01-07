package app.data
{
	import com.adobe.images.*;
	import com.fewfre.utils.*;
	import com.piterwilson.utils.ColorMathUtil;
	import app.data.*;
	import app.world.data.*;
	import app.world.elements.*;
	import flash.display.*;
	import flash.geom.*;
	import flash.net.*;
	import flash.display.MovieClip;

	public class GameAssets
	{
		private static const _MAX_COSTUMES_TO_CHECK_TO:Number = 30;//999;

		public static var head:Array;
		public static var eyes:Array;
		public static var shirts:Array;
		public static var pants:Array;
		public static var shoes:Array;
		public static var glasses:Array;

		public static var skins:Array;
		public static var poses:Array;

		public static var defaultPoseIndex:int;
		public static var defaultSkinIndex:int;
		public static var defaultEyesIndex:int;
		public static var defaultShirtIndex:int;
		public static var defaultPantsIndex:int;

		public static function init() : void {
			var i:int, lc:Class, type:String;
			
			// head = _setupCostumeArray({ base:"$EN_5", type:ITEM.HEAD, pad:3 });
			// head = head.concat(_setupCostumeArray({ base:"$EN_3", type:ITEM.HEAD, pad:3, idPrefix:"z" }));
			i = 0; type = ITEM.HEAD;
			head = [
				// 3000 range items use "s_ChapeauDessus" which specifies the item goes over the ears on side view
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_3000"), classMap:{ s_ChapeauDessus1:lc, s_ChapeauDessus2:_getLC("$EN_3001"), s_ChapeauDessus3:_getLC("$EN_3002") } }),
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_3003"), classMap:{ s_ChapeauDessus1:lc, s_ChapeauDessus2:_getLC("$EN_3004"), s_ChapeauDessus3:_getLC("$EN_3005") } }),
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_3006"), classMap:{ s_ChapeauDessus1:lc, s_ChapeauDessus2:_getLC("$EN_3007"), s_ChapeauDessus3:_getLC("$EN_3008") } }),
				// 5000 range items use "s_ChapeauDessous" which specifies the item goes under the ears on side view
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_5000"), classMap:{ s_ChapeauDessous1:lc, s_ChapeauDessous2:lc, s_ChapeauDessous3:lc } }),
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_5001"), classMap:{ s_ChapeauDessous1:lc, s_ChapeauDessous2:lc, s_ChapeauDessous3:lc } }),
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_5002"), classMap:{ s_ChapeauDessous1:lc, s_ChapeauDessous2:_getLC("$EN_5003"), s_ChapeauDessous3:_getLC("$EN_5004") } }),
				// NOTE: This one uses "s_CDD" instead of "s_ChapeauDessous1" as this item needs to appear under the ears ALWAYS
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_5005"), classMap:{ s_CDD:lc, s_ChapeauDessous2:_getLC("$EN_5007"), s_ChapeauDessous3:_getLC("$EN_5006") } }),
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_5008"), classMap:{ s_ChapeauDessous1:lc, s_ChapeauDessous2:lc, s_ChapeauDessous3:lc } }),
			];
			// eyes = _setupCostumeArray({ base:"$EN_1", type:ITEM.EYES, pad:3 });
			i = 0; type = ITEM.EYES;
			eyes = [
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_1000"), classMap:{ Ya:lc, Yb:_getLC("$EN_1001"), Yc:lc } }),
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_1002"), classMap:{ Ya:lc, Yb:_getLC("$EN_1003"), Yc:lc } }),
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_1004"), classMap:{ Ya:lc, Yb:_getLC("$EN_1005"), Yc:lc } }),
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_1006"), classMap:{ Ya:lc, Yb:_getLC("$EN_1007"), Yc:lc } }),
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_1008"), classMap:{ Ya:lc, Yb:_getLC("$EN_1009"), Yc:lc } }),
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_1010"), classMap:{ Ya:lc, Yb:_getLC("$EN_1011"), Yc:lc } }),
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_1012"), classMap:{ Ya:lc, Yb:_getLC("$EN_1013"), Yc:lc } }),
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_1014"), classMap:{ Ya:lc, Yb:_getLC("$EN_1015"), Yc:lc } }),
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_1016"), classMap:{ Ya:lc, Yb:_getLC("$EN_1017"), Yc:lc } }),
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_1018"), classMap:{ Ya:lc, Yb:_getLC("$EN_1019"), Yc:lc } }),
				new ItemData({ id:"inv", type:type, itemClass:MovieClip }),
			];
			defaultEyesIndex = 0;
			
			// shirts = _setupCostumeArray({ base:"$EN_4", type:ITEM.SHIRT, pad:3 });
			i = 0; type = ITEM.SHIRT;
			shirts = [
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_1"), classMap:{ C:lc, BS:_getLC("$EN_2"), BI:null } }),
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_5"), classMap:{ C:lc, BS:_getLC("$EN_6"), BI:_getLC("$EN_7") } }),
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_11"), classMap:{ C:lc, BS:_getLC("$EN_12"), BI:null } }),
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_13"), classMap:{ C:lc, BS:_getLC("$EN_14"), BI:null } }),
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_15"), classMap:{ C:lc, BS:_getLC("$EN_16"), BI:null } }),
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_17"), classMap:{ C:lc, BS:_getLC("$EN_18"), BI:null } }),
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_19"), classMap:{ C:lc, BS:_getLC("$EN_20"), BI:null } }),
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_21"), classMap:{ C:lc, BS:_getLC("$EN_22"), BI:null } }),
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_25"), classMap:{ C:lc, BS:_getLC("$EN_26"), BI:_getLC("$EN_27") } }),
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_28"), classMap:{ C:lc, BS:_getLC("$EN_29"), BI:_getLC("$EN_30") } }),
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_31"), classMap:{ C:lc, BS:_getLC("$EN_32"), BI:_getLC("$EN_33") } }),
				new ItemData({ id:"inv", type:type, itemClass:MovieClip }),
			];
			defaultShirtIndex = 0;
			
			// pants = _setupCostumeArray({ base:"$EN_4", type:ITEM.PANTS, pad:3 });
			i = 0; type = ITEM.PANTS;
			pants = [
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_3"), classMap:{ B:lc, JS:_getLC("$EN_4"), JI:null } }),
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_8"), classMap:{ B:lc, JS:_getLC("$EN_9"), JI:_getLC("$EN_10") } }),
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_23"), classMap:{ B:lc, JS:_getLC("$EN_24"), JI:null } }),
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_34"), classMap:{ B:lc, JS:_getLC("$EN_35"), JI:_getLC("$EN_36") } }),
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_37"), classMap:{ B:lc, JS:_getLC("$EN_38"), JI:null } }),
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_39"), classMap:{ B:lc, JS:_getLC("$EN_40"), JI:_getLC("$EN_41") } }),
				// Skirt is a special type of pants, having not only it's own ID type but own slot
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_6000"), classMap:{ s_Jupe:lc, JS:null, JI:null } }),
				new ItemData({ id:"inv", type:type, itemClass:MovieClip }),
			];
			defaultPantsIndex = 0;
			
			// shoes = _setupCostumeArray({ base:"$EN_4", type:ITEM.SHOES, pad:3 });
			shoes = _loopCheckCostume({ base:"$EN_4", pad:3 }, function(i:int,pClass:Class) : ItemData {
				return new ItemData({ id:i, type:ITEM.SHOES, itemClass:pClass, classMap:{ P:pClass } });
			});
			// glasses = _setupCostumeArray({ base:"$EN_2", type:ITEM.GLASSES, pad:3 });
			i = 0; type = ITEM.GLASSES;
			glasses = [
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_2000"), classMap:{ s_Lunettes1:lc, s_Lunettes2:_getLC("$EN_2001"), s_Lunettes3:_getLC("$EN_2002") } }),
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_2003"), classMap:{ s_Lunettes1:lc, s_Lunettes2:_getLC("$EN_2004"), s_Lunettes3:_getLC("$EN_2005") } }),
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_2006"), classMap:{ s_Lunettes1:lc, s_Lunettes2:_getLC("$EN_2007"), s_Lunettes3:_getLC("$EN_2008") } }),
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_2009"), classMap:{ s_Lunettes1:lc, s_Lunettes2:_getLC("$EN_2010"), s_Lunettes3:_getLC("$EN_2011") } }),
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_2012"), classMap:{ s_Lunettes1:lc, s_Lunettes2:_getLC("$EN_2014"), s_Lunettes3:_getLC("$EN_2013") } }),
				new ItemData({ id:i++, type:type, itemClass:lc=_getLC("$EN_2015"), classMap:{ s_Lunettes1:lc, s_Lunettes2:_getLC("$EN_2016"), s_Lunettes3:_getLC("$EN_2017") } })
			];

			skins = new Array();
			for(i = 1; i < _MAX_COSTUMES_TO_CHECK_TO; i++) {
				if(Fewf.assets.getLoadedClass( "$Ta_"+i ) != null) {
					skins.push( new SkinData({ id:i }) );
				}
			}
			defaultSkinIndex = 2;//FewfUtils.getIndexFromArrayWithKeyVal(skins, "id", ConstantsApp.DEFAULT_SKIN_ID);

			poses = [];
			for(i = 0; i <= 10; i++) {
				poses.push(new ItemData({ id:i, type:ITEM.POSE, itemClass:Fewf.assets.getLoadedClass( "$AN_"+i ) }));
			}
			defaultPoseIndex = 0;//FewfUtils.getIndexFromArrayWithKeyVal(poses, "id", ConstantsApp.DEFAULT_POSE_ID);
		}

		// pData = { base:String, type:String, after:String, pad:int, map:Array, sex:Boolean, itemClassToClassMap:String OR Array }
		private static function _setupCostumeArray(pData:Object) : Array {
			var tArray:Array = new Array();
			var tClassName:String;
			var tClass:Class;
			var tSexSpecificParts:int;
			var tIdPrefix = pData.idPrefix ? pData.idPrefix : "";
			for(var i = 0; i <= _MAX_COSTUMES_TO_CHECK_TO; i++) {
				if(pData.map) {
					for(var g:int = 0; g < (pData.sex ? 2 : 1); g++) {
						var tClassMap = {  }, tClassSuccess = null;
						tSexSpecificParts = 0;
						for(var j = 0; j <= pData.map.length; j++) {
							tClass = Fewf.assets.getLoadedClass( tClassName = pData.base+(pData.pad ? zeroPad(i, pData.pad) : i)+(pData.after ? pData.after : "")+pData.map[j] );
							if(tClass) { tClassMap[pData.map[j]] = tClass; tClassSuccess = tClass; }
							else if(pData.sex){
								tClass = Fewf.assets.getLoadedClass( tClassName+"_"+(g==0?1:2) );
								if(tClass) { tClassMap[pData.map[j]] = tClass; tClassSuccess = tClass; tSexSpecificParts++ }
							}
						}
						if(tClassSuccess) {
							var tIsSexSpecific = pData.sex && tSexSpecificParts > 0;
							tArray.push( new ItemData({ id:tIdPrefix+i+(tIsSexSpecific ? (g==1 ? "M" : "F") : ""), type:pData.type, classMap:tClassMap, itemClass:tClassSuccess }) );
						}
						if(tSexSpecificParts == 0) {
							break;
						}
					}
				} else {
					tClass = Fewf.assets.getLoadedClass( pData.base+(pData.pad ? zeroPad(i, pData.pad) : i)+(pData.after ? pData.after : "") );
					if(tClass != null) {
						tArray.push( new ItemData({ id:i, type:pData.type, itemClass:tClass}) );
						if(pData.itemClassToClassMap) {
							tArray[tArray.length-1].classMap = {};
							if(pData.itemClassToClassMap is Array) {
								for(var c:int = 0; c < pData.itemClassToClassMap.length; c++) {
									tArray[tArray.length-1].classMap[pData.itemClassToClassMap[c]] = tClass;
								}
							} else {
								tArray[tArray.length-1].classMap[pData.itemClassToClassMap] = tClass;
							}
						}
					}
				}
			}
			return tArray;
		}
		
		// pData = { base:String, pad:int, map:Array, itemClassToClassMap:String OR Array }
		private static function _loopCheckCostume(pData:Object, pCallback:Function) : Array {
			var tArray:Array = new Array(), tClass:Class, tItemData:ItemData;
			for(var i = 0; i <= _MAX_COSTUMES_TO_CHECK_TO; i++) {
				tClass = Fewf.assets.getLoadedClass( pData.base+(pData.pad ? zeroPad(i, pData.pad) : i) );
				if(tClass != null) {
					tItemData = pCallback(i, tClass);
					if(tItemData){ tArray.push(tItemData); }
				}
				
			}
			return tArray;
		}
		
		private static function _getLC(name:String) : Class {
			return Fewf.assets.getLoadedClass(name);
		}

		public static function zeroPad(number:int, width:int):String {
			var ret:String = ""+number;
			while( ret.length < width )
				ret="0" + ret;
			return ret;
		}

		public static function getArrayByType(pType:String) : Array {
			switch(pType) {
				case ITEM.HEAD:		return head;
				case ITEM.EYES:		return eyes;
				case ITEM.SHIRT:	return shirts;
				case ITEM.PANTS:	return pants;
				case ITEM.SHOES:	return shoes;
				case ITEM.GLASSES:	return glasses;
				case ITEM.SKIN:		return skins;
				case ITEM.POSE:		return poses;
				default: trace("[GameAssets](getArrayByType) Unknown type: "+pType);
			}
			return null;
		}

		public static function getItemFromTypeID(pType:String, pID:String) : ItemData {
			return FewfUtils.getFromArrayWithKeyVal(getArrayByType(pType), "id", pID);
		}

		/****************************
		* Color
		*****************************/
		public static function copyColor(copyFromMC:MovieClip, copyToMC:MovieClip) : MovieClip {
			if (copyFromMC == null || copyToMC == null) { return null; }
			var tChild1:*=null;
			var tChild2:*=null;
			var i:int = 0;
			while (i < copyFromMC.numChildren) {
				tChild1 = copyFromMC.getChildAt(i);
				tChild2 = copyToMC.getChildAt(i);
				if (tChild1.name.indexOf("Couleur") == 0 && tChild1.name.length > 7) {
					tChild2.transform.colorTransform = tChild1.transform.colorTransform;
				}
				i++;
			}
			return copyToMC;
		}

		public static function colorDefault(pMC:MovieClip) : MovieClip {
			if (pMC == null) { return null; }

			var tChild:*=null;
			var tHex:int=0;
			var loc1:*=0;
			while (loc1 < pMC.numChildren)
			{
				tChild = pMC.getChildAt(loc1);
				if (tChild.name.indexOf("Couleur") == 0 && tChild.name.length > 7)
				{
					tHex = int("0x" + tChild.name.substr(tChild.name.indexOf("_") + 1, 6));
					applyColorToObject(tChild, tHex);
				}
				++loc1;
			}
			return pMC;
		}

		// pData = { obj:DisplayObject, color:String OR int, ?swatch:int, ?name:String, ?colors:Array<int> }
		public static function colorItem(pData:Object) : DisplayObject {
			if (pData.obj == null) { return null; }

			var tHex:int = convertColorToNumber(pData.color);

			var tChild:DisplayObject;
			var i:int=0;
			while (i < pData.obj.numChildren) {
				tChild = pData.obj.getChildAt(i);
				if (tChild.name == pData.name || (tChild.name.indexOf("Couleur") == 0 && tChild.name.length > 7)) {
					if(pData.colors != null && pData.colors[tChild.name.charAt(7)] != null) {
						applyColorToObject(tChild, convertColorToNumber(pData.colors[tChild.name.charAt(7)]));
					}
					else if (!pData.swatch || pData.swatch == tChild.name.charAt(7)) {
						applyColorToObject(tChild, tHex);
					}
				}
				i++;
			}
			return pData.obj;
		}
		public static function convertColorToNumber(pColor) : int {
			return pColor is Number || pColor == null ? pColor : int("0x" + pColor);
		}
		
		// pColor is an int hex value. ex: 0x000000
		public static function applyColorToObject(pItem:DisplayObject, pColor:int) : void {
			if(pColor < 0) { return; }
			var tR:*=pColor >> 16 & 255;
			var tG:*=pColor >> 8 & 255;
			var tB:*=pColor & 255;
			pItem.transform.colorTransform = new flash.geom.ColorTransform(tR / 128, tG / 128, tB / 128);
		}

		public static function getColors(pMC:MovieClip) : Array {
			var tChild:*=null;
			var tTransform:*=null;
			var tArray:Array=new Array();

			var i:int=0;
			while (i < pMC.numChildren) {
				tChild = pMC.getChildAt(i);
				if (tChild.name.indexOf("Couleur") == 0 && tChild.name.length > 7) {
					tTransform = tChild.transform.colorTransform;
					tArray[tChild.name.charAt(7)] = ColorMathUtil.RGBToHex(tTransform.redMultiplier * 128, tTransform.greenMultiplier * 128, tTransform.blueMultiplier * 128);
				}
				i++;
			}
			return tArray;
		}

		public static function getNumOfCustomColors(pMC:MovieClip) : int {
			var tChild:*=null;
			var num:int = 0;
			var i:int = 0;
			while (i < pMC.numChildren) {
				tChild = pMC.getChildAt(i);
				if (tChild.name.indexOf("Couleur") == 0 && tChild.name.length > 7) {
					num++;
				}
				i++;
			}
			return num;
		}
		
		public static function getColoredItemImage(pData:ItemData) : MovieClip {
			return colorItem({ obj:getItemImage(pData), colors:pData.colors }) as MovieClip;
		}

		/****************************
		* Asset Creation
		*****************************/
		public static function getItemImage(pData:ItemData) : MovieClip {
			var tItem:MovieClip;
			switch(pData.type) {
				case ITEM.SKIN:
					tItem = getDefaultPoseSetup({ skin:pData });
					break;
				case ITEM.POSE:
					tItem = getDefaultPoseSetup({ pose:pData });
					break;
				case ITEM.SHIRT:
				case ITEM.PANTS:
				// case ITEM.SHOES:
					tItem = new Pose(poses[defaultPoseIndex]).apply({ items:[ pData ], removeBlanks:true });
					break;
				default:
					tItem = new pData.itemClass();
					colorDefault(tItem);
					break;
			}
			return tItem;
		}

		// pData = { ?pose:ItemData, ?skin:SkinData }
		public static function getDefaultPoseSetup(pData:Object) : Pose {
			var tPoseData = pData.pose ? pData.pose : poses[defaultPoseIndex];
			var tSkinData = pData.skin ? pData.skin : skins[defaultSkinIndex];
			var tEyesData = pData.eyes ? pData.eyes : eyes[defaultEyesIndex];
			var tShirtData = pData.shirt ? pData.shirt : shirts[defaultShirtIndex];
			var tPantsData = pData.pants ? pData.pants : pants[defaultPantsIndex];

			var tPose = new Pose(tPoseData);
			// if(tSkinData.gender == GENDER.MALE) {
			// 	tPose.apply({ items:[
			// 		tSkinData
			// 	], shamanMode:SHAMAN_MODE.OFF });
			// } else {
			// 	tPose.apply({ items:[
			// 		tSkinData
			// 	], shamanMode:SHAMAN_MODE.OFF });
			// }
			tPose.apply({ items:[
				tSkinData,
				tEyesData,
				tShirtData,
				tPantsData
			] });
			tPose.stopAtLastFrame();

			return tPose;
		}
	}
}
