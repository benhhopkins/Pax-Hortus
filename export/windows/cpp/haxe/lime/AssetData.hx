package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
			type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/level01.oel", "assets/data/level01.oel");
			type.set ("assets/data/level01.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/level01.oep", "assets/data/level01.oep");
			type.set ("assets/data/level01.oep", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/all.png", "assets/images/all.png");
			type.set ("assets/images/all.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/berries.png", "assets/images/berries.png");
			type.set ("assets/images/berries.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/berriesbutton.png", "assets/images/berriesbutton.png");
			type.set ("assets/images/berriesbutton.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/bonsai.png", "assets/images/bonsai.png");
			type.set ("assets/images/bonsai.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/bonsaibutton.png", "assets/images/bonsaibutton.png");
			type.set ("assets/images/bonsaibutton.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/db32extragreen.pal", "assets/images/db32extragreen.pal");
			type.set ("assets/images/db32extragreen.pal", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/defeat.png", "assets/images/defeat.png");
			type.set ("assets/images/defeat.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/demon.png", "assets/images/demon.png");
			type.set ("assets/images/demon.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/energy.png", "assets/images/energy.png");
			type.set ("assets/images/energy.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ghoul.png", "assets/images/ghoul.png");
			type.set ("assets/images/ghoul.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/goal.png", "assets/images/goal.png");
			type.set ("assets/images/goal.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/healing.png", "assets/images/healing.png");
			type.set ("assets/images/healing.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/healinghit.png", "assets/images/healinghit.png");
			type.set ("assets/images/healinghit.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/health.png", "assets/images/health.png");
			type.set ("assets/images/health.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/heat.png", "assets/images/heat.png");
			type.set ("assets/images/heat.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/hedge.png", "assets/images/hedge.png");
			type.set ("assets/images/hedge.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/hedgebutton.png", "assets/images/hedgebutton.png");
			type.set ("assets/images/hedgebutton.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/hudback.png", "assets/images/hudback.png");
			type.set ("assets/images/hudback.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
			type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/joy.png", "assets/images/joy.png");
			type.set ("assets/images/joy.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/joyhit.png", "assets/images/joyhit.png");
			type.set ("assets/images/joyhit.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/oak.png", "assets/images/oak.png");
			type.set ("assets/images/oak.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/oakbutton.png", "assets/images/oakbutton.png");
			type.set ("assets/images/oakbutton.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/sparklehit.png", "assets/images/sparklehit.png");
			type.set ("assets/images/sparklehit.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/spirit.png", "assets/images/spirit.png");
			type.set ("assets/images/spirit.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/sunflower.png", "assets/images/sunflower.png");
			type.set ("assets/images/sunflower.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/sunflowerbutton.png", "assets/images/sunflowerbutton.png");
			type.set ("assets/images/sunflowerbutton.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tiles.png", "assets/images/tiles.png");
			type.set ("assets/images/tiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/title.png", "assets/images/title.png");
			type.set ("assets/images/title.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tranquility.png", "assets/images/tranquility.png");
			type.set ("assets/images/tranquility.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tranquilityhit.png", "assets/images/tranquilityhit.png");
			type.set ("assets/images/tranquilityhit.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/victory.png", "assets/images/victory.png");
			type.set ("assets/images/victory.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/warpouthappy.png", "assets/images/warpouthappy.png");
			type.set ("assets/images/warpouthappy.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/warpoutsad.png", "assets/images/warpoutsad.png");
			type.set ("assets/images/warpoutsad.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/wildflower.png", "assets/images/wildflower.png");
			type.set ("assets/images/wildflower.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/wildflowerbutton.png", "assets/images/wildflowerbutton.png");
			type.set ("assets/images/wildflowerbutton.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/battleharp.ogg", "assets/music/battleharp.ogg");
			type.set ("assets/music/battleharp.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/music/harp.ogg", "assets/music/harp.ogg");
			type.set ("assets/music/harp.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/berry.wav", "assets/sounds/berry.wav");
			type.set ("assets/sounds/berry.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/chime.wav", "assets/sounds/chime.wav");
			type.set ("assets/sounds/chime.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/demon.wav", "assets/sounds/demon.wav");
			type.set ("assets/sounds/demon.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/goodteleport.wav", "assets/sounds/goodteleport.wav");
			type.set ("assets/sounds/goodteleport.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/joy.wav", "assets/sounds/joy.wav");
			type.set ("assets/sounds/joy.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/loselife.wav", "assets/sounds/loselife.wav");
			type.set ("assets/sounds/loselife.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/plant.wav", "assets/sounds/plant.wav");
			type.set ("assets/sounds/plant.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/sparkle.wav", "assets/sounds/sparkle.wav");
			type.set ("assets/sounds/sparkle.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/spirit.wav", "assets/sounds/spirit.wav");
			type.set ("assets/sounds/spirit.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/tranquility.wav", "assets/sounds/tranquility.wav");
			type.set ("assets/sounds/tranquility.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/zombie.wav", "assets/sounds/zombie.wav");
			type.set ("assets/sounds/zombie.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/beep.ogg", "flixel/sounds/beep.ogg");
			type.set ("flixel/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/flixel.ogg", "flixel/sounds/flixel.ogg");
			type.set ("flixel/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/fonts/nokiafc22.ttf", "flixel/fonts/nokiafc22.ttf");
			type.set ("flixel/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/fonts/monsterrat.ttf", "flixel/fonts/monsterrat.ttf");
			type.set ("flixel/fonts/monsterrat.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/images/ui/button.png", "flixel/images/ui/button.png");
			type.set ("flixel/images/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
