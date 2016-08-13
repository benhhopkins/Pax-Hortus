package;

import flixel.FlxBasic;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.math.FlxVector;
import flixel.math.FlxAngle;
import flixel.FlxG;

class Wave extends FlxBasic
{
	public var _enemies:Array<Enemy.EnemyType> = [];
	public var _spawnRate:Float = 1;
	private var _level:Int = 0;
	private var _wave:Int = 0;

	public var _spawning:Bool = false;
	public var _doneSpawning:Bool = false;
	public var _timeSinceLastSpawn:Float = 0;

	public function new(level:Int, wave:Int)
	{
		_level = level;
		_wave = wave;
		
		if(_level == 0)
		{
			if(_wave == 0)
			{
				for(i in 0...3)
					_enemies.push(Spirit);
				_spawnRate = 5;
			}
			else if(_wave == 1)
			{
				_enemies.push(Ghoul);
			}
			else if(_wave == 2)
			{
				for(i in 0...3)
				{
					_enemies.push(Spirit);
					_enemies.push(Spirit);
					_enemies.push(Ghoul);
				}
				_spawnRate = 3;
			}
			else if(_wave == 3)
			{
				for(i in 0...12)
				{
					_enemies.push(Spirit);
				}				
			}
			else if(_wave == 4)
			{
				for(i in 0...8)
				{
					_enemies.push(Spirit);
					_enemies.push(Ghoul);
				}
				_spawnRate = 2;
			}
			else if(_wave == 5)
			{
				_enemies.push(Demon);
			}
			else if(_wave == 6)
			{
				for(i in 0...20)
				{
					_enemies.push(Ghoul);	
				}
				_spawnRate = 2;
			}
			else if(_wave == 7)
			{
				for(i in 0...20)
				{
					_enemies.push(Spirit);	
				}
				_enemies.push(Demon);
				_spawnRate = 1.5;
			}
			else if(_wave == 8)
			{
				for(i in 0...30)
				{
					_enemies.push(Ghoul);	
				}
				_spawnRate = 1;
			}
			else if(_wave == 9)
			{
				_enemies.push(Demon);
				for(i in 0...15)
				{
					_enemies.push(Spirit);	
					_enemies.push(Ghoul);	
				}
				_spawnRate = 1;
			}
			else if(_wave == 10)
			{
				for(i in 0...15)
				{
					_enemies.push(Spirit);
					_enemies.push(Spirit);	
					_enemies.push(Ghoul);	
				}
				_enemies.push(Demon);
				_spawnRate = 0.5;
			}
			else if(_wave == 11)
			{
				for(i in 0...15)
				{
					_enemies.push(Ghoul);
				}
				_enemies.push(Demon);
				_enemies.push(Demon);
				_enemies.push(Demon);
				_spawnRate = 0.75;
			}
			else if(_wave == 12)
			{
				for(i in 0...15)
				{
					_enemies.push(Demon);
				}
				_spawnRate = 1.75;
			}
			else if(_wave == 13)
			{
				for(i in 0...12)
				{
					_enemies.push(Spirit);
					_enemies.push(Spirit);
					_enemies.push(Spirit);
					_enemies.push(Demon);
				}
				_spawnRate = 0.5;
			}
			else if(_wave == 14)
			{
				for(i in 0...10)
				{
					_enemies.push(Ghoul);
					_enemies.push(Ghoul);
					_enemies.push(Ghoul);
					_enemies.push(Spirit);
					_enemies.push(Spirit);
					_enemies.push(Spirit);
					_enemies.push(Demon);
					_enemies.push(Demon);
					_enemies.push(Demon);
				}
				for(i in 0...15)
				{
					_enemies.push(Demon);
				}
				_spawnRate = 0.5;
			}
		}
		else if(_level == 1)
		{
			for(x in 0...20)
				_enemies.push(Spirit);
		}

		_enemies.reverse();

		super();
	}

	public function getDescription():String
	{
		if(_level == 0)
		{
			switch(_wave)
			{
				case 0: return "Depressed spirits wander near the garden.";
				case 1: return "An injured zombie finds it's way to your oasis.";
				case 2: return "Word has spread: the dead seek healing here.";
				case 3: return "A mass of spirits is drifting over the horizon.";
				case 4: return "It seems the dead don't rest.";
				case 5: return "A wrathful demon arrives, angry with you.";
				case 6: return "Zombies tend to travel in hordes.";
				case 7: return "A demon is seen ushering a column of spirits.";
				case 8: return "Even more zombies...";
				case 9: return "This undead army is led by a demon.";
				case 10: return "They are legion.";
				case 11: return "Now the zombies are fleeing from the demons.";
				case 12: return "The demons are banding together!";
				case 13: return "The rage of the demons has driven a gaggle of ghosts this way.";
				case 14: return "This is it. The demons are sending the entire underworld.";
			}
		}
		if(_level == 1)
		{

		}
		return "unknown";
	}

	public override function update(elapsed:Float):Void 
	{
		super.update(elapsed);
	}

}