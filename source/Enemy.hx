package;

import flixel.FlxSprite;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.math.FlxVector;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.text.FlxText;

enum EnemyType
{
	Spirit;
	Ghoul;
	Demon;
}

class Enemy extends FlxSprite
{
	public var _moving:Bool = false;
	
	private var _dest:FlxPoint;
	private var _vec:FlxVector;

	private var _type:EnemyType = Spirit;
	private var _level:Int = 1;
	private var _speed:Int = 52;

	private var _health:Int = 40;
	
	public function new(enemyType:EnemyType, x:Float, y:Float, ?level:Int = 1)
	{
		_type = enemyType;
		_level = level;

		super(x + 8, y + 8);

		if(_type == Spirit)
		{
			loadGraphic(AssetPaths.spirit__png, true, 32, 32);
			animation.add("sad", [0, 1, 2, 3], 6);
			animation.add("happy", [4, 5, 6, 7], 8);

			FlxG.sound.play(AssetPaths.spirit__wav);
		}
		else if(_type == Ghoul)
		{
			loadGraphic(AssetPaths.ghoul__png, true, 32, 32);
			animation.add("sad", [0, 1, 2, 3], 3);
			animation.add("happy", [4, 5, 6, 7], 5);
			_speed = 40;
			_health = 120;

			FlxG.sound.play(AssetPaths.zombie__wav);
		}
		else if(_type == Demon)
		{
			loadGraphic(AssetPaths.demon__png, true, 32, 32);
			animation.add("sad", [0, 1, 2, 3], 6);
			animation.add("happy", [4, 5, 6, 7], 4);
			_speed = 75;
			_health = 200;

			FlxG.sound.play(AssetPaths.demon__wav);
		}

		animation.play("sad");

		setFacingFlip(FlxObject.LEFT, false, false);
		setFacingFlip(FlxObject.RIGHT, true, false);

		_dest = FlxPoint.get();
		_vec = FlxVector.get();
		setSize(16, 16);
		centerOrigin();
		centerOffsets();
	}
	
	public function moveTo(X:Float, Y:Float):Void 
	{
		_moving = true;
		_dest.set(X, Y);
		
		_vec.x = _dest.x - x;
		_vec.y = _dest.y - y;
		
		_vec.normalize();

		velocity.x = (_vec.x) * _speed;
		velocity.y = (_vec.y) * _speed;

		if(_vec.x > 0)
			facing = FlxObject.RIGHT;
		else if(_vec.x < 0)
			facing = FlxObject.LEFT;
	}
	
	private function finishMoveTo():Void 
	{
		setPosition(_dest.x, _dest.y);
		velocity.set();
		_moving = false;
	}
	
	public override function update(elapsed:Float):Void 
	{
		var oldx:Float = _vec.x;
		var oldy:Float = _vec.y;
		super.update(elapsed);
		_vec.x = _dest.x - x;
		_vec.y = _dest.y - y;
		
		if (!FlxMath.sameSign(oldx, _vec.x) || !FlxMath.sameSign(oldy, _vec.y))
			finishMoveTo();
	}
	
	private function signOf(f:Float):Int 
	{
		if (f < 0)
			return -1;
		else
			return 1;
	}

	public function getHealth():Int
	{
		return _health;
	}

	public function takeDamage(damage:Int, damageType:Tower.DamageType)
	{
		if((damageType == Tower.DamageType.Joy && _type == Spirit) ||
			(damageType == Tower.DamageType.Healing && _type == Ghoul) ||
			(damageType == Tower.DamageType.Tranquility && _type == Demon))
			damage *= 2;

		_health -= damage;
		var text = PlayState.playState._textParticles.recycle(FlxText);
		text.setPosition(x, y - 20);
		text.text = Std.string(damage);
		text.alpha = 1;
		switch(damageType)
		{
			case Tower.DamageType.All: text.color = FlxColor.WHITE;
			case Tower.DamageType.Joy: text.color = FlxColor.YELLOW;
			case Tower.DamageType.Healing: text.color = FlxColor.RED;
			case Tower.DamageType.Tranquility: text.color = FlxColor.CYAN;
		}
		text.setBorderStyle(SHADOW, FlxColor.BLACK, 1, 1);

		if(_health <= 0)
		{
			animation.play("happy");
			FlxG.sound.play(AssetPaths.chime__wav);
			_speed += 20;
		}
	}
}
