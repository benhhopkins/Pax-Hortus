package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import flixel.system.FlxSound;

import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import flixel.addons.transition.TransitionFade;

class MenuState extends FlxTransitionableState
{
	private var _btnPlay:FlxButton;
	private var _title:FlxSprite;

	private var _transitionInit:Bool = false;

	public var _harpMusic:FlxSound;

	override public function create():Void
	{
		FlxG.mouse.useSystemCursor = true;
		if(FlxG.sound.volume != 0)
			FlxG.sound.volume = 0.25;

		_harpMusic = new FlxSound();
		_harpMusic.loadEmbedded(AssetPaths.harp__ogg, true);
		_harpMusic.play(true, 0);

		_btnPlay = new FlxButton(0, 0, "Play", clickPlay);
		_btnPlay.screenCenter();
		_btnPlay.y += 80;
		add(_btnPlay);

		var info = new FlxText(0, 0, 0, "You must cultivate this holy garden at the edge of the underworld.");
		info.screenCenter();
		info.y -= 30;
		add(info);

		var info2 = new FlxText(0, 0, 0, "Heal those tortured souls who walk this domain.");
		info2.screenCenter();
		info2.y -= 10;
		add(info2);

		var info3 = new FlxText(0, 0, 0, "Remove plants with right-click.");
		info3.screenCenter();
		info3.y += 30;
		add(info3);

		var info4 = new FlxText(0, 0, 0, "It is forbidden to fully block the path.");
		info4.screenCenter();
		info4.y += 50;
		add(info4);

		_title = new FlxSprite();
		_title.loadGraphic(AssetPaths.title__png, false);
		_title.screenCenter();
		_title.y -= 80;
		add(_title);

		var btnSound = new FlxButton(5, 5, "Sound", function():Void {
			if(FlxG.sound.volume > 0)
			{
				FlxG.sound.volume = 0;
				_harpMusic.volume = FlxG.sound.volume;
			}
			else
			{
				FlxG.sound.volume = 0.5;
				_harpMusic.volume = FlxG.sound.volume;
			}
		});
		add(btnSound);

		if(!_transitionInit)
		{
			_transitionInit = true;
			FlxTransitionableState.defaultTransIn = new TransitionData();
			FlxTransitionableState.defaultTransOut = new TransitionData();

			FlxTransitionableState.defaultTransIn.color = FlxColor.WHITE;
			FlxTransitionableState.defaultTransOut.color = FlxColor.WHITE;

			FlxTransitionableState.defaultTransIn.duration = 1;
			FlxTransitionableState.defaultTransOut.duration = 1;
		}

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

	private function clickPlay():Void
	{
		FlxG.switchState(new PlayState(0));
		_harpMusic.stop();
	}
}
