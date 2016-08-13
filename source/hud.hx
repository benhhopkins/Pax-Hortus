package;

import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;
using flixel.util.FlxSpriteUtil;

class HUD extends FlxTypedGroup<FlxSprite>
{
    private var _sprBack:FlxSprite;
    private var _txtHealth:FlxText;
    private var _txtEnergy:FlxText;
    private var _sprHealth:FlxSprite;
    private var _sprEnergy:FlxSprite;

    public function new()
    {
        super();
        _sprBack = new FlxSprite(0, FlxG.height - 96, AssetPaths.hudback__png);
        
        _txtHealth = new FlxText(40, FlxG.height - 50, 0, "20", 8);
        _txtHealth.setBorderStyle(SHADOW, FlxColor.GRAY, 1, 1);
        _sprHealth = new FlxSprite(10, FlxG.height - 50, AssetPaths.health__png);

        _txtEnergy = new FlxText(40, FlxG.height - 30, 0, "50", 8);
        _txtEnergy.setBorderStyle(SHADOW, FlxColor.GRAY, 1, 1);
        _sprEnergy = new FlxSprite(10, FlxG.height - 30, AssetPaths.energy__png);
        
        add(_sprBack);
        add(_sprHealth);
        add(_sprEnergy);
        add(_txtHealth);
        add(_txtEnergy);
        forEach(function(spr:FlxSprite)
        {
            spr.scrollFactor.set(0, 0);
        });
    }

    public function updateHUD(health:Int, energy:Int, income:Int):Void
    {
        _txtHealth.text = Std.string(health);
        _txtEnergy.text = Std.string(energy) + "+" + Std.string(income);
    }
}