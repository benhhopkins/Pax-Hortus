package;

import flixel.FlxSprite;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.math.FlxVector;

enum TowerType {
	None;
	Hedge;
	Oak;
	Wildflower;
	Sunflower;
	Berries;
	Bonsai;
}

enum DamageType {
	All;
	Joy;
	Healing;
	Tranquility;
}

class Tower extends FlxSprite
{
	public var _type:TowerType = Hedge;

	public var _attackDamage:Int = 0;
	public var _attackRange:Int = 0;
	public var _attackSpeed:Float = 0;
	public var _attackReady:Float = 0;
	public var _attackType:DamageType = All;
	public var _income:Int = 0;

	public var _blocking:Bool = false;

	public var _target:Enemy;
	
	public function new(towerType:TowerType, x:Float, y:Float)
	{
		_type = towerType;

		super(x, y);

		if(_type == Hedge)
		{
			loadGraphic(AssetPaths.hedge__png, true, 32, 48);
			offset.y = 16;
			animation.add("0", [0], 0);

			_blocking = true;
		}
		else if(_type == Oak)
		{
			loadGraphic(AssetPaths.oak__png, true, 32, 48);
			offset.y = 16;
			animation.add("0", [0], 0);
			_income = 3;

			_blocking = true;
		}
		else if(_type == Wildflower)
		{
			loadGraphic(AssetPaths.wildflower__png, true, 32, 32);
			animation.add("0", [0], 0);

			_attackDamage = 5;
			_attackRange = 110;
			_attackSpeed = 1;
		}
		else if(_type == Sunflower)
		{
			loadGraphic(AssetPaths.sunflower__png, true, 32, 32);
			animation.add("0", [0], 0);

			_attackType = Joy;

			_attackDamage = 10;
			_attackRange = 160;
			_attackSpeed = 2;
		}
		else if(_type == Berries)
		{
			loadGraphic(AssetPaths.berries__png, true, 32, 48);
			offset.y = 16;
			animation.add("0", [0], 0);

			_attackType = Healing;

			_attackDamage = 5;
			_attackRange = 64;
			_attackSpeed = 0.3;

			_blocking = true;
		}
		else if(_type == Bonsai)
		{
			loadGraphic(AssetPaths.bonsai__png, true, 32, 48);
			offset.y = 16;
			animation.add("0", [0], 0);

			_attackType = Tranquility;

			_attackDamage = 100;
			_attackRange = 256;
			_attackSpeed = 4;

			_blocking = true;
		}

		animation.play("0");
	}
	
	public override function update(elapsed:Float):Void 
	{
		super.update(elapsed);
	}

	public static function towerCost(towerType:TowerType):Int
	{
		if(towerType == Hedge)
		{
			return 1;
		}
		else if(towerType == Oak)
		{
			return 9;
		}
		else if(towerType == Wildflower)
		{
			return 5;
		}
		else if(towerType == Sunflower)
		{
			return 8;
		}
		else if(towerType == Berries)
		{
			return 20;
		}
		else if(towerType == Bonsai)
		{
			return 32;
		}
		return 0;
	}
}