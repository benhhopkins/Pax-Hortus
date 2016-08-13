package;

import flixel.FlxSprite;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.math.FlxVector;
import flixel.math.FlxAngle;
import flixel.FlxG;
import flixel.group.FlxSpriteGroup;
import flixel.effects.particles.FlxParticle;

class Attack extends FlxSprite
{
	public var _attackDamage:Int = 0;
	public var _attackType:Tower.DamageType = All;
	public var _target:Enemy;

	public var _speed:Float = 100;

	public function new(attackDamage:Int, attackType:Tower.DamageType, target:Enemy, x:Float, y:Float)
	{
		_attackDamage = attackDamage;
		_attackType = attackType;
		_target = target;

		super(x, y);

		if(_attackType == All)
		{
			loadGraphic(AssetPaths.all__png, true, 16, 16);
			animation.add("0", [0, 1, 2, 4], 10);
			_speed = 80;
		}
		else if(_attackType == Joy)
		{
			loadGraphic(AssetPaths.joy__png, true, 16, 16);
			animation.add("0", [0, 1, 2, 3], 20);
		}
		else if(_attackType == Healing)
		{
			loadGraphic(AssetPaths.healing__png, true, 16, 16);
			animation.add("0", [0, 1, 2, 3], 10);
			_speed = 200;
		}
		else if(_attackType == Tranquility)
		{
			loadGraphic(AssetPaths.tranquility__png, true, 16, 16);
			animation.add("0", [0, 1, 2, 3], 15);
			_speed = 150;
		}

		animation.play("0");
	}
	
	public override function update(elapsed:Float):Void 
	{
		super.update(elapsed);

		velocity.set(_speed, 0);
		velocity.rotate(FlxPoint.weak(0, 0), FlxAngle.angleBetween(this, _target, true));

		if(FlxMath.distanceBetween(this, _target) < 10)
		{
			_target.takeDamage(_attackDamage, _attackType);
			kill();

			var particle = PlayState.playState._particles.recycle(FlxParticle);
			if(_attackType == All)
			{
				FlxG.sound.play(AssetPaths.sparkle__wav);
				particle.loadGraphic(AssetPaths.sparklehit__png, true, 16, 16);
			}
			else if(_attackType == Joy)
			{
				FlxG.sound.play(AssetPaths.joy__wav);
				particle.loadGraphic(AssetPaths.joyhit__png, true, 16, 16);
			}
			else if(_attackType == Healing)
			{
				FlxG.sound.play(AssetPaths.berry__wav);
				particle.loadGraphic(AssetPaths.healinghit__png, true, 16, 16);
			}
			else if(_attackType == Tranquility)
			{
				FlxG.sound.play(AssetPaths.tranquility__wav);
				particle.loadGraphic(AssetPaths.tranquilityhit__png, true, 32, 32);
			}
			
			particle.velocity.y = 0;
			particle.animation.add("0", [0, 1, 2, 3, 4, 5, 6, 7, 8], 30, false);
			particle.animation.play("0");
			particle.centerOrigin();
			particle.centerOffsets();
			particle.setPosition(x, y);
		}
	}
}