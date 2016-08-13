package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Future;
import lime.app.Preloader;
import lime.app.Promise;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.net.HTTPRequest;
import lime.system.CFFI;
import lime.text.Font;
import lime.utils.Bytes;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		
		#end
		
		#if flash
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		className.set ("assets/data/level01.oel", __ASSET__assets_data_level01_oel);
		type.set ("assets/data/level01.oel", AssetType.TEXT);
		className.set ("assets/data/level01.oep", __ASSET__assets_data_level01_oep);
		type.set ("assets/data/level01.oep", AssetType.TEXT);
		className.set ("assets/images/all.png", __ASSET__assets_images_all_png);
		type.set ("assets/images/all.png", AssetType.IMAGE);
		className.set ("assets/images/berries.png", __ASSET__assets_images_berries_png);
		type.set ("assets/images/berries.png", AssetType.IMAGE);
		className.set ("assets/images/berriesbutton.png", __ASSET__assets_images_berriesbutton_png);
		type.set ("assets/images/berriesbutton.png", AssetType.IMAGE);
		className.set ("assets/images/bonsai.png", __ASSET__assets_images_bonsai_png);
		type.set ("assets/images/bonsai.png", AssetType.IMAGE);
		className.set ("assets/images/bonsaibutton.png", __ASSET__assets_images_bonsaibutton_png);
		type.set ("assets/images/bonsaibutton.png", AssetType.IMAGE);
		className.set ("assets/images/db32extragreen.pal", __ASSET__assets_images_db32extragreen_pal);
		type.set ("assets/images/db32extragreen.pal", AssetType.TEXT);
		className.set ("assets/images/defeat.png", __ASSET__assets_images_defeat_png);
		type.set ("assets/images/defeat.png", AssetType.IMAGE);
		className.set ("assets/images/demon.png", __ASSET__assets_images_demon_png);
		type.set ("assets/images/demon.png", AssetType.IMAGE);
		className.set ("assets/images/energy.png", __ASSET__assets_images_energy_png);
		type.set ("assets/images/energy.png", AssetType.IMAGE);
		className.set ("assets/images/ghoul.png", __ASSET__assets_images_ghoul_png);
		type.set ("assets/images/ghoul.png", AssetType.IMAGE);
		className.set ("assets/images/goal.png", __ASSET__assets_images_goal_png);
		type.set ("assets/images/goal.png", AssetType.IMAGE);
		className.set ("assets/images/healing.png", __ASSET__assets_images_healing_png);
		type.set ("assets/images/healing.png", AssetType.IMAGE);
		className.set ("assets/images/healinghit.png", __ASSET__assets_images_healinghit_png);
		type.set ("assets/images/healinghit.png", AssetType.IMAGE);
		className.set ("assets/images/health.png", __ASSET__assets_images_health_png);
		type.set ("assets/images/health.png", AssetType.IMAGE);
		className.set ("assets/images/heat.png", __ASSET__assets_images_heat_png);
		type.set ("assets/images/heat.png", AssetType.IMAGE);
		className.set ("assets/images/hedge.png", __ASSET__assets_images_hedge_png);
		type.set ("assets/images/hedge.png", AssetType.IMAGE);
		className.set ("assets/images/hedgebutton.png", __ASSET__assets_images_hedgebutton_png);
		type.set ("assets/images/hedgebutton.png", AssetType.IMAGE);
		className.set ("assets/images/hudback.png", __ASSET__assets_images_hudback_png);
		type.set ("assets/images/hudback.png", AssetType.IMAGE);
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		className.set ("assets/images/joy.png", __ASSET__assets_images_joy_png);
		type.set ("assets/images/joy.png", AssetType.IMAGE);
		className.set ("assets/images/joyhit.png", __ASSET__assets_images_joyhit_png);
		type.set ("assets/images/joyhit.png", AssetType.IMAGE);
		className.set ("assets/images/oak.png", __ASSET__assets_images_oak_png);
		type.set ("assets/images/oak.png", AssetType.IMAGE);
		className.set ("assets/images/oakbutton.png", __ASSET__assets_images_oakbutton_png);
		type.set ("assets/images/oakbutton.png", AssetType.IMAGE);
		className.set ("assets/images/sparklehit.png", __ASSET__assets_images_sparklehit_png);
		type.set ("assets/images/sparklehit.png", AssetType.IMAGE);
		className.set ("assets/images/spirit.png", __ASSET__assets_images_spirit_png);
		type.set ("assets/images/spirit.png", AssetType.IMAGE);
		className.set ("assets/images/sunflower.png", __ASSET__assets_images_sunflower_png);
		type.set ("assets/images/sunflower.png", AssetType.IMAGE);
		className.set ("assets/images/sunflowerbutton.png", __ASSET__assets_images_sunflowerbutton_png);
		type.set ("assets/images/sunflowerbutton.png", AssetType.IMAGE);
		className.set ("assets/images/tiles.png", __ASSET__assets_images_tiles_png);
		type.set ("assets/images/tiles.png", AssetType.IMAGE);
		className.set ("assets/images/title.png", __ASSET__assets_images_title_png);
		type.set ("assets/images/title.png", AssetType.IMAGE);
		className.set ("assets/images/tranquility.png", __ASSET__assets_images_tranquility_png);
		type.set ("assets/images/tranquility.png", AssetType.IMAGE);
		className.set ("assets/images/tranquilityhit.png", __ASSET__assets_images_tranquilityhit_png);
		type.set ("assets/images/tranquilityhit.png", AssetType.IMAGE);
		className.set ("assets/images/victory.png", __ASSET__assets_images_victory_png);
		type.set ("assets/images/victory.png", AssetType.IMAGE);
		className.set ("assets/images/warpouthappy.png", __ASSET__assets_images_warpouthappy_png);
		type.set ("assets/images/warpouthappy.png", AssetType.IMAGE);
		className.set ("assets/images/warpoutsad.png", __ASSET__assets_images_warpoutsad_png);
		type.set ("assets/images/warpoutsad.png", AssetType.IMAGE);
		className.set ("assets/images/wildflower.png", __ASSET__assets_images_wildflower_png);
		type.set ("assets/images/wildflower.png", AssetType.IMAGE);
		className.set ("assets/images/wildflowerbutton.png", __ASSET__assets_images_wildflowerbutton_png);
		type.set ("assets/images/wildflowerbutton.png", AssetType.IMAGE);
		className.set ("assets/music/battleharp.ogg", __ASSET__assets_music_battleharp_ogg);
		type.set ("assets/music/battleharp.ogg", AssetType.SOUND);
		className.set ("assets/music/harp.ogg", __ASSET__assets_music_harp_ogg);
		type.set ("assets/music/harp.ogg", AssetType.SOUND);
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		className.set ("assets/sounds/berry.wav", __ASSET__assets_sounds_berry_wav);
		type.set ("assets/sounds/berry.wav", AssetType.SOUND);
		className.set ("assets/sounds/chime.wav", __ASSET__assets_sounds_chime_wav);
		type.set ("assets/sounds/chime.wav", AssetType.SOUND);
		className.set ("assets/sounds/demon.wav", __ASSET__assets_sounds_demon_wav);
		type.set ("assets/sounds/demon.wav", AssetType.SOUND);
		className.set ("assets/sounds/goodteleport.wav", __ASSET__assets_sounds_goodteleport_wav);
		type.set ("assets/sounds/goodteleport.wav", AssetType.SOUND);
		className.set ("assets/sounds/joy.wav", __ASSET__assets_sounds_joy_wav);
		type.set ("assets/sounds/joy.wav", AssetType.SOUND);
		className.set ("assets/sounds/loselife.wav", __ASSET__assets_sounds_loselife_wav);
		type.set ("assets/sounds/loselife.wav", AssetType.SOUND);
		className.set ("assets/sounds/plant.wav", __ASSET__assets_sounds_plant_wav);
		type.set ("assets/sounds/plant.wav", AssetType.SOUND);
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		className.set ("assets/sounds/sparkle.wav", __ASSET__assets_sounds_sparkle_wav);
		type.set ("assets/sounds/sparkle.wav", AssetType.SOUND);
		className.set ("assets/sounds/spirit.wav", __ASSET__assets_sounds_spirit_wav);
		type.set ("assets/sounds/spirit.wav", AssetType.SOUND);
		className.set ("assets/sounds/tranquility.wav", __ASSET__assets_sounds_tranquility_wav);
		type.set ("assets/sounds/tranquility.wav", AssetType.SOUND);
		className.set ("assets/sounds/zombie.wav", __ASSET__assets_sounds_zombie_wav);
		type.set ("assets/sounds/zombie.wav", AssetType.SOUND);
		className.set ("flixel/sounds/beep.ogg", __ASSET__flixel_sounds_beep_ogg);
		type.set ("flixel/sounds/beep.ogg", AssetType.SOUND);
		className.set ("flixel/sounds/flixel.ogg", __ASSET__flixel_sounds_flixel_ogg);
		type.set ("flixel/sounds/flixel.ogg", AssetType.SOUND);
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		
		
		#elseif html5
		
		var id;
		id = "assets/data/data-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/level01.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/level01.oep";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/all.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/berries.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/berriesbutton.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/bonsai.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/bonsaibutton.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/db32extragreen.pal";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/defeat.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/demon.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/energy.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ghoul.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/goal.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/healing.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/healinghit.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/health.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/heat.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/hedge.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/hedgebutton.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/hudback.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/images-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/joy.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/joyhit.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/oak.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/oakbutton.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sparklehit.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/spirit.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sunflower.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sunflowerbutton.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tiles.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/title.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tranquility.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tranquilityhit.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/victory.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/warpouthappy.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/warpoutsad.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/wildflower.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/wildflowerbutton.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/music/battleharp.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/music/harp.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/music/music-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/berry.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/chime.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/demon.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/goodteleport.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/joy.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/loselife.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/plant.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/sounds-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/sparkle.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/spirit.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/tranquility.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/zombie.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "flixel/sounds/beep.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "flixel/sounds/flixel.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "flixel/fonts/nokiafc22.ttf";
		className.set (id, __ASSET__flixel_fonts_nokiafc22_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/fonts/monsterrat.ttf";
		className.set (id, __ASSET__flixel_fonts_monsterrat_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/images/ui/button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/data/level01.oel", __ASSET__assets_data_level01_oel);
		type.set ("assets/data/level01.oel", AssetType.TEXT);
		
		className.set ("assets/data/level01.oep", __ASSET__assets_data_level01_oep);
		type.set ("assets/data/level01.oep", AssetType.TEXT);
		
		className.set ("assets/images/all.png", __ASSET__assets_images_all_png);
		type.set ("assets/images/all.png", AssetType.IMAGE);
		
		className.set ("assets/images/berries.png", __ASSET__assets_images_berries_png);
		type.set ("assets/images/berries.png", AssetType.IMAGE);
		
		className.set ("assets/images/berriesbutton.png", __ASSET__assets_images_berriesbutton_png);
		type.set ("assets/images/berriesbutton.png", AssetType.IMAGE);
		
		className.set ("assets/images/bonsai.png", __ASSET__assets_images_bonsai_png);
		type.set ("assets/images/bonsai.png", AssetType.IMAGE);
		
		className.set ("assets/images/bonsaibutton.png", __ASSET__assets_images_bonsaibutton_png);
		type.set ("assets/images/bonsaibutton.png", AssetType.IMAGE);
		
		className.set ("assets/images/db32extragreen.pal", __ASSET__assets_images_db32extragreen_pal);
		type.set ("assets/images/db32extragreen.pal", AssetType.TEXT);
		
		className.set ("assets/images/defeat.png", __ASSET__assets_images_defeat_png);
		type.set ("assets/images/defeat.png", AssetType.IMAGE);
		
		className.set ("assets/images/demon.png", __ASSET__assets_images_demon_png);
		type.set ("assets/images/demon.png", AssetType.IMAGE);
		
		className.set ("assets/images/energy.png", __ASSET__assets_images_energy_png);
		type.set ("assets/images/energy.png", AssetType.IMAGE);
		
		className.set ("assets/images/ghoul.png", __ASSET__assets_images_ghoul_png);
		type.set ("assets/images/ghoul.png", AssetType.IMAGE);
		
		className.set ("assets/images/goal.png", __ASSET__assets_images_goal_png);
		type.set ("assets/images/goal.png", AssetType.IMAGE);
		
		className.set ("assets/images/healing.png", __ASSET__assets_images_healing_png);
		type.set ("assets/images/healing.png", AssetType.IMAGE);
		
		className.set ("assets/images/healinghit.png", __ASSET__assets_images_healinghit_png);
		type.set ("assets/images/healinghit.png", AssetType.IMAGE);
		
		className.set ("assets/images/health.png", __ASSET__assets_images_health_png);
		type.set ("assets/images/health.png", AssetType.IMAGE);
		
		className.set ("assets/images/heat.png", __ASSET__assets_images_heat_png);
		type.set ("assets/images/heat.png", AssetType.IMAGE);
		
		className.set ("assets/images/hedge.png", __ASSET__assets_images_hedge_png);
		type.set ("assets/images/hedge.png", AssetType.IMAGE);
		
		className.set ("assets/images/hedgebutton.png", __ASSET__assets_images_hedgebutton_png);
		type.set ("assets/images/hedgebutton.png", AssetType.IMAGE);
		
		className.set ("assets/images/hudback.png", __ASSET__assets_images_hudback_png);
		type.set ("assets/images/hudback.png", AssetType.IMAGE);
		
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/images/joy.png", __ASSET__assets_images_joy_png);
		type.set ("assets/images/joy.png", AssetType.IMAGE);
		
		className.set ("assets/images/joyhit.png", __ASSET__assets_images_joyhit_png);
		type.set ("assets/images/joyhit.png", AssetType.IMAGE);
		
		className.set ("assets/images/oak.png", __ASSET__assets_images_oak_png);
		type.set ("assets/images/oak.png", AssetType.IMAGE);
		
		className.set ("assets/images/oakbutton.png", __ASSET__assets_images_oakbutton_png);
		type.set ("assets/images/oakbutton.png", AssetType.IMAGE);
		
		className.set ("assets/images/sparklehit.png", __ASSET__assets_images_sparklehit_png);
		type.set ("assets/images/sparklehit.png", AssetType.IMAGE);
		
		className.set ("assets/images/spirit.png", __ASSET__assets_images_spirit_png);
		type.set ("assets/images/spirit.png", AssetType.IMAGE);
		
		className.set ("assets/images/sunflower.png", __ASSET__assets_images_sunflower_png);
		type.set ("assets/images/sunflower.png", AssetType.IMAGE);
		
		className.set ("assets/images/sunflowerbutton.png", __ASSET__assets_images_sunflowerbutton_png);
		type.set ("assets/images/sunflowerbutton.png", AssetType.IMAGE);
		
		className.set ("assets/images/tiles.png", __ASSET__assets_images_tiles_png);
		type.set ("assets/images/tiles.png", AssetType.IMAGE);
		
		className.set ("assets/images/title.png", __ASSET__assets_images_title_png);
		type.set ("assets/images/title.png", AssetType.IMAGE);
		
		className.set ("assets/images/tranquility.png", __ASSET__assets_images_tranquility_png);
		type.set ("assets/images/tranquility.png", AssetType.IMAGE);
		
		className.set ("assets/images/tranquilityhit.png", __ASSET__assets_images_tranquilityhit_png);
		type.set ("assets/images/tranquilityhit.png", AssetType.IMAGE);
		
		className.set ("assets/images/victory.png", __ASSET__assets_images_victory_png);
		type.set ("assets/images/victory.png", AssetType.IMAGE);
		
		className.set ("assets/images/warpouthappy.png", __ASSET__assets_images_warpouthappy_png);
		type.set ("assets/images/warpouthappy.png", AssetType.IMAGE);
		
		className.set ("assets/images/warpoutsad.png", __ASSET__assets_images_warpoutsad_png);
		type.set ("assets/images/warpoutsad.png", AssetType.IMAGE);
		
		className.set ("assets/images/wildflower.png", __ASSET__assets_images_wildflower_png);
		type.set ("assets/images/wildflower.png", AssetType.IMAGE);
		
		className.set ("assets/images/wildflowerbutton.png", __ASSET__assets_images_wildflowerbutton_png);
		type.set ("assets/images/wildflowerbutton.png", AssetType.IMAGE);
		
		className.set ("assets/music/battleharp.ogg", __ASSET__assets_music_battleharp_ogg);
		type.set ("assets/music/battleharp.ogg", AssetType.SOUND);
		
		className.set ("assets/music/harp.ogg", __ASSET__assets_music_harp_ogg);
		type.set ("assets/music/harp.ogg", AssetType.SOUND);
		
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/berry.wav", __ASSET__assets_sounds_berry_wav);
		type.set ("assets/sounds/berry.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/chime.wav", __ASSET__assets_sounds_chime_wav);
		type.set ("assets/sounds/chime.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/demon.wav", __ASSET__assets_sounds_demon_wav);
		type.set ("assets/sounds/demon.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/goodteleport.wav", __ASSET__assets_sounds_goodteleport_wav);
		type.set ("assets/sounds/goodteleport.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/joy.wav", __ASSET__assets_sounds_joy_wav);
		type.set ("assets/sounds/joy.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/loselife.wav", __ASSET__assets_sounds_loselife_wav);
		type.set ("assets/sounds/loselife.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/plant.wav", __ASSET__assets_sounds_plant_wav);
		type.set ("assets/sounds/plant.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/sparkle.wav", __ASSET__assets_sounds_sparkle_wav);
		type.set ("assets/sounds/sparkle.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/spirit.wav", __ASSET__assets_sounds_spirit_wav);
		type.set ("assets/sounds/spirit.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/tranquility.wav", __ASSET__assets_sounds_tranquility_wav);
		type.set ("assets/sounds/tranquility.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/zombie.wav", __ASSET__assets_sounds_zombie_wav);
		type.set ("assets/sounds/zombie.wav", AssetType.SOUND);
		
		className.set ("flixel/sounds/beep.ogg", __ASSET__flixel_sounds_beep_ogg);
		type.set ("flixel/sounds/beep.ogg", AssetType.SOUND);
		
		className.set ("flixel/sounds/flixel.ogg", __ASSET__flixel_sounds_flixel_ogg);
		type.set ("flixel/sounds/flixel.ogg", AssetType.SOUND);
		
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						onChange.dispatch ();
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == TEXT && assetType == BINARY) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), Bytes));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):Bytes {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return Bytes.ofData (cast (Type.createInstance (className.get (id), []), flash.utils.ByteArray));
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return Bytes.ofData (bitmapData.getPixels (bitmapData.rect));
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), Bytes);
		
		#elseif html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Bytes);
		else return Bytes.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes.getString (0, bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.getString (0, bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String):Future<AudioBuffer> {
		
		var promise = new Promise<AudioBuffer> ();
		
		#if (flash)
		
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				promise.complete (audioBuffer);
				
			});
			soundLoader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			soundLoader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getAudioBuffer (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<AudioBuffer> (function () return getAudioBuffer (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadBytes (id:String):Future<Bytes> {
		
		var promise = new Promise<Bytes> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.dataFormat = flash.net.URLLoaderDataFormat.BINARY;
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = Bytes.ofData (event.currentTarget.data);
				promise.complete (bytes);
				
			});
			loader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			promise.completeWith (request.load (path.get (id) + "?" + Assets.cache.version));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Bytes> (function () return getBytes (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadImage (id:String):Future<Image> {
		
		var promise = new Promise<Image> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				promise.complete (Image.fromBitmapData (bitmapData));
				
			});
			loader.contentLoaderInfo.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.contentLoaderInfo.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				promise.complete (Image.fromImageElement (image));
				
			}
			image.onerror = promise.error;
			image.src = path.get (id) + "?" + Assets.cache.version;
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Image> (function () return getImage (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = Bytes.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = Bytes.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = Bytes.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = Bytes.readFile ("../Resources/manifest");
			#elseif (ios || tvos)
			var bytes = Bytes.readFile ("assets/manifest");
			#else
			var bytes = Bytes.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				if (bytes.length > 0) {
					
					var data = bytes.getString (0, bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if (ios || tvos)
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadText (id:String):Future<String> {
		
		var promise = new Promise<String> ();
		
		#if html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			var future = request.load (path.get (id) + "?" + Assets.cache.version);
			future.onProgress (function (progress) promise.progress (progress));
			future.onError (function (msg) promise.error (msg));
			future.onComplete (function (bytes) promise.complete (bytes.getString (0, bytes.length)));
			
		} else {
			
			promise.complete (getText (id));
			
		}
		
		#else
		
		promise.completeWith (loadBytes (id).then (function (bytes) {
			
			return new Future<String> (function () {
				
				if (bytes == null) {
					
					return null;
					
				} else {
					
					return bytes.getString (0, bytes.length);
					
				}
				
			});
			
		}));
		
		#end
		
		return promise.future;
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_data_data_goes_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_level01_oel extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_level01_oep extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_all_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_berries_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_berriesbutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bonsai_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bonsaibutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_db32extragreen_pal extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_defeat_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_demon_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_energy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_ghoul_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_goal_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_healing_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_healinghit_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_health_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_heat_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_hedge_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_hedgebutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_hudback_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_images_go_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_joy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_joyhit_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_oak_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_oakbutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sparklehit_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_spirit_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sunflower_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sunflowerbutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tiles_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_title_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tranquility_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tranquilityhit_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_victory_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_warpouthappy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_warpoutsad_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_wildflower_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_wildflowerbutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_music_battleharp_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_music_harp_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_goes_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_berry_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_chime_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_demon_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_goodteleport_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_joy_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_loselife_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_plant_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_sparkle_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_spirit_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_tranquility_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_zombie_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }


#elseif html5

























































@:keep #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { super (); name = "Nokia Cellphone FC Small"; } } 
@:keep #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { super (); name = "Monsterrat"; } } 



#else



#if (windows || mac || linux || cpp)


@:file("assets/data/data-goes-here.txt") #if display private #end class __ASSET__assets_data_data_goes_here_txt extends lime.utils.Bytes {}
@:file("assets/data/level01.oel") #if display private #end class __ASSET__assets_data_level01_oel extends lime.utils.Bytes {}
@:file("assets/data/level01.oep") #if display private #end class __ASSET__assets_data_level01_oep extends lime.utils.Bytes {}
@:image("assets/images/all.png") #if display private #end class __ASSET__assets_images_all_png extends lime.graphics.Image {}
@:image("assets/images/berries.png") #if display private #end class __ASSET__assets_images_berries_png extends lime.graphics.Image {}
@:image("assets/images/berriesbutton.png") #if display private #end class __ASSET__assets_images_berriesbutton_png extends lime.graphics.Image {}
@:image("assets/images/bonsai.png") #if display private #end class __ASSET__assets_images_bonsai_png extends lime.graphics.Image {}
@:image("assets/images/bonsaibutton.png") #if display private #end class __ASSET__assets_images_bonsaibutton_png extends lime.graphics.Image {}
@:file("assets/images/db32extragreen.pal") #if display private #end class __ASSET__assets_images_db32extragreen_pal extends lime.utils.Bytes {}
@:image("assets/images/defeat.png") #if display private #end class __ASSET__assets_images_defeat_png extends lime.graphics.Image {}
@:image("assets/images/demon.png") #if display private #end class __ASSET__assets_images_demon_png extends lime.graphics.Image {}
@:image("assets/images/energy.png") #if display private #end class __ASSET__assets_images_energy_png extends lime.graphics.Image {}
@:image("assets/images/ghoul.png") #if display private #end class __ASSET__assets_images_ghoul_png extends lime.graphics.Image {}
@:image("assets/images/goal.png") #if display private #end class __ASSET__assets_images_goal_png extends lime.graphics.Image {}
@:image("assets/images/healing.png") #if display private #end class __ASSET__assets_images_healing_png extends lime.graphics.Image {}
@:image("assets/images/healinghit.png") #if display private #end class __ASSET__assets_images_healinghit_png extends lime.graphics.Image {}
@:image("assets/images/health.png") #if display private #end class __ASSET__assets_images_health_png extends lime.graphics.Image {}
@:image("assets/images/heat.png") #if display private #end class __ASSET__assets_images_heat_png extends lime.graphics.Image {}
@:image("assets/images/hedge.png") #if display private #end class __ASSET__assets_images_hedge_png extends lime.graphics.Image {}
@:image("assets/images/hedgebutton.png") #if display private #end class __ASSET__assets_images_hedgebutton_png extends lime.graphics.Image {}
@:image("assets/images/hudback.png") #if display private #end class __ASSET__assets_images_hudback_png extends lime.graphics.Image {}
@:file("assets/images/images-go-here.txt") #if display private #end class __ASSET__assets_images_images_go_here_txt extends lime.utils.Bytes {}
@:image("assets/images/joy.png") #if display private #end class __ASSET__assets_images_joy_png extends lime.graphics.Image {}
@:image("assets/images/joyhit.png") #if display private #end class __ASSET__assets_images_joyhit_png extends lime.graphics.Image {}
@:image("assets/images/oak.png") #if display private #end class __ASSET__assets_images_oak_png extends lime.graphics.Image {}
@:image("assets/images/oakbutton.png") #if display private #end class __ASSET__assets_images_oakbutton_png extends lime.graphics.Image {}
@:image("assets/images/sparklehit.png") #if display private #end class __ASSET__assets_images_sparklehit_png extends lime.graphics.Image {}
@:image("assets/images/spirit.png") #if display private #end class __ASSET__assets_images_spirit_png extends lime.graphics.Image {}
@:image("assets/images/sunflower.png") #if display private #end class __ASSET__assets_images_sunflower_png extends lime.graphics.Image {}
@:image("assets/images/sunflowerbutton.png") #if display private #end class __ASSET__assets_images_sunflowerbutton_png extends lime.graphics.Image {}
@:image("assets/images/tiles.png") #if display private #end class __ASSET__assets_images_tiles_png extends lime.graphics.Image {}
@:image("assets/images/title.png") #if display private #end class __ASSET__assets_images_title_png extends lime.graphics.Image {}
@:image("assets/images/tranquility.png") #if display private #end class __ASSET__assets_images_tranquility_png extends lime.graphics.Image {}
@:image("assets/images/tranquilityhit.png") #if display private #end class __ASSET__assets_images_tranquilityhit_png extends lime.graphics.Image {}
@:image("assets/images/victory.png") #if display private #end class __ASSET__assets_images_victory_png extends lime.graphics.Image {}
@:image("assets/images/warpouthappy.png") #if display private #end class __ASSET__assets_images_warpouthappy_png extends lime.graphics.Image {}
@:image("assets/images/warpoutsad.png") #if display private #end class __ASSET__assets_images_warpoutsad_png extends lime.graphics.Image {}
@:image("assets/images/wildflower.png") #if display private #end class __ASSET__assets_images_wildflower_png extends lime.graphics.Image {}
@:image("assets/images/wildflowerbutton.png") #if display private #end class __ASSET__assets_images_wildflowerbutton_png extends lime.graphics.Image {}
@:file("assets/music/battleharp.ogg") #if display private #end class __ASSET__assets_music_battleharp_ogg extends lime.utils.Bytes {}
@:file("assets/music/harp.ogg") #if display private #end class __ASSET__assets_music_harp_ogg extends lime.utils.Bytes {}
@:file("assets/music/music-goes-here.txt") #if display private #end class __ASSET__assets_music_music_goes_here_txt extends lime.utils.Bytes {}
@:file("assets/sounds/berry.wav") #if display private #end class __ASSET__assets_sounds_berry_wav extends lime.utils.Bytes {}
@:file("assets/sounds/chime.wav") #if display private #end class __ASSET__assets_sounds_chime_wav extends lime.utils.Bytes {}
@:file("assets/sounds/demon.wav") #if display private #end class __ASSET__assets_sounds_demon_wav extends lime.utils.Bytes {}
@:file("assets/sounds/goodteleport.wav") #if display private #end class __ASSET__assets_sounds_goodteleport_wav extends lime.utils.Bytes {}
@:file("assets/sounds/joy.wav") #if display private #end class __ASSET__assets_sounds_joy_wav extends lime.utils.Bytes {}
@:file("assets/sounds/loselife.wav") #if display private #end class __ASSET__assets_sounds_loselife_wav extends lime.utils.Bytes {}
@:file("assets/sounds/plant.wav") #if display private #end class __ASSET__assets_sounds_plant_wav extends lime.utils.Bytes {}
@:file("assets/sounds/sounds-go-here.txt") #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends lime.utils.Bytes {}
@:file("assets/sounds/sparkle.wav") #if display private #end class __ASSET__assets_sounds_sparkle_wav extends lime.utils.Bytes {}
@:file("assets/sounds/spirit.wav") #if display private #end class __ASSET__assets_sounds_spirit_wav extends lime.utils.Bytes {}
@:file("assets/sounds/tranquility.wav") #if display private #end class __ASSET__assets_sounds_tranquility_wav extends lime.utils.Bytes {}
@:file("assets/sounds/zombie.wav") #if display private #end class __ASSET__assets_sounds_zombie_wav extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/4,1,0/assets/sounds/beep.ogg") #if display private #end class __ASSET__flixel_sounds_beep_ogg extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/4,1,0/assets/sounds/flixel.ogg") #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends lime.utils.Bytes {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,1,0/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,1,0/assets/fonts/monsterrat.ttf") #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:image("C:/HaxeToolkit/haxe/lib/flixel/4,1,0/assets/images/ui/button.png") #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}



#end
#end

#if (openfl && !flash)
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_nokiafc22_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_monsterrat_ttf (); src = font.src; name = font.name; super (); }}

#end

#end