package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;

import flixel.util.FlxColor;
import flixel.util.FlxSort;

import flixel.text.FlxText;

import flixel.ui.FlxButton;

import flixel.tile.FlxTilemap;

import flixel.group.FlxGroup;
import flixel.group.FlxSpriteGroup;

import flixel.effects.particles.FlxParticle;

import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.math.FlxRandom;

import flixel.system.FlxSound;

import flixel.addons.editors.ogmo.FlxOgmoLoader;

import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import flixel.addons.transition.TransitionFade;

class PlayState extends FlxTransitionableState
{
	public static var playState:PlayState;

	private static inline var TILE_SIZE:Int = 32;

	private var _mapLoader:FlxOgmoLoader;
	public var _map:FlxTilemap;
	// heatmap for debug
	//public var distmap:FlxTilemap;
	public var _distanceMap:FlxTilemap;
	public var _distances:Array<Int>;

	private var _enemies:FlxTypedGroup<Enemy>;
	private var _towers:FlxTypedGroup<Tower>;
	private var _lastTowerPlaced:Tower;
	private var _backSprites:FlxTypedSpriteGroup<FlxSprite>;
	private var _sprites:FlxTypedSpriteGroup<FlxSprite>;
	private var _attacks:FlxTypedSpriteGroup<Attack>;

	public var _goal:FlxPoint;
	public var _goalSprite:FlxSprite;

	public var _highlight:FlxSprite;

	public var _hud:HUD;
	public var _health:Int = 20;
	public var _energy:Int = 20;
	public var _income:Int = 15;

	public var _towerBrush:Tower.TowerType = None;

	public var _beforeWave:Bool = true;

	public var _harpMusic:FlxSound;
	public var _battleMusic:FlxSound;

	public var _level:Int;
	public var _wave:Int;
	public var _waveSpawner:Wave;
	public var _btnGo:FlxButton;
	public var _waveTxt:FlxText;

	public var _particles:FlxTypedSpriteGroup<FlxParticle>;
	public var _textParticles:FlxTypedSpriteGroup<FlxText>;

	public var _gameEnded:Bool = false;

	public function new(level:Int)
	{
		_level = level;

		super();
	}

	override public function create():Void
	{
		super.create();

		playState = this;

		_harpMusic = new FlxSound();
		_harpMusic.loadEmbedded(AssetPaths.harp__ogg, true);
		_harpMusic.play(true, 0);
		_harpMusic.volume = 0.15;
		_battleMusic = new FlxSound();
		_battleMusic.loadEmbedded(AssetPaths.battleharp__ogg, true);
		_battleMusic.volume = 0.25;

		if(FlxG.sound.volume == 0)
		{
			_harpMusic.volume = 0;
			_battleMusic.volume = 0;
		}

		loadTiles();

		_towers = new FlxTypedGroup<Tower>();
		_enemies = new FlxTypedGroup<Enemy>();

		_backSprites = new FlxTypedSpriteGroup<FlxSprite>();
		add(_backSprites);

		_sprites = new FlxTypedSpriteGroup<FlxSprite>();
		add(_sprites);

		_attacks = new FlxTypedSpriteGroup<Attack>();
		add(_attacks);

		_particles = new FlxTypedSpriteGroup<FlxParticle>();
		add(_particles);

		_textParticles = new FlxTypedSpriteGroup<FlxText>();
		add(_textParticles);

		_highlight = new FlxSprite();
		_highlight.makeGraphic(TILE_SIZE, TILE_SIZE, FlxColor.fromRGB(0, 0, 0, 0));
		add(_highlight);

		_hud = new HUD();
		_hud.updateHUD(_health, _energy, _income);
		add(_hud);

		var btnRestart = new FlxButton(75, FlxG.height - 28, "Restart", function():Void {
			_harpMusic.fadeOut(1);
			_battleMusic.fadeOut(1);
			FlxG.switchState(new PlayState(0));
		});
		add(btnRestart);

		_wave = 0;
		_waveSpawner = new Wave(_level, _wave);
		_btnGo = new FlxButton(170, FlxG.height - 28, "Next Wave", function():Void {
			if(_beforeWave)
			{
				_beforeWave = false;
				_battleMusic.play(true, _harpMusic.time + 16);
				_battleMusic.fadeIn(1);
				_harpMusic.fadeOut(1);
				_waveSpawner._spawning = true;
				_btnGo.color = FlxColor.fromRGB(0, 0, 200, 150);
			}
		});
		_btnGo.onOver.callback = function():Void {
			_waveTxt.text = _waveSpawner.getDescription();
		};
		add(_btnGo);
		_waveTxt = new FlxText(75, FlxG.height - 55, 180, _waveSpawner.getDescription());
		_waveTxt.setBorderStyle(SHADOW, FlxColor.GRAY, 1, 1);
		add(_waveTxt);

		var btnHedge = new FlxButton(256, FlxG.height - 56, "Hedge", function():Void {
			_towerBrush = Hedge;
			_highlight.loadGraphic(AssetPaths.hedge__png, true, 32, 48);
			_highlight.offset.y = 16;
			_highlight.alpha = 0.5;
		});
		btnHedge.loadGraphic(AssetPaths.hedgebutton__png);
		btnHedge.label.color = FlxColor.WHITE;
		btnHedge.onOver.callback = function():Void {
			_waveTxt.text = "Hedge, Cost " + Std.string(Tower.towerCost(Hedge)) + "\nBlock the pathway.";
		};
		add(btnHedge);

		var btnOak = new FlxButton(320, FlxG.height - 56, "Oak", function():Void {
			_towerBrush = Oak;
			_highlight.loadGraphic(AssetPaths.oak__png, true, 32, 48);
			_highlight.offset.y = 16;
		});
		btnOak.loadGraphic(AssetPaths.oakbutton__png);
		btnOak.label.color = FlxColor.WHITE;
		btnOak.onOver.callback = function():Void {
			_waveTxt.text = "Oak, Cost " + Std.string(Tower.towerCost(Oak)) + "\nIncrease your power over nature.";
		};

		add(btnOak);

		var btnWildflower = new FlxButton(384, FlxG.height - 56, "Wildflower", function():Void {
			_towerBrush = Wildflower;
			_highlight.loadGraphic(AssetPaths.wildflower__png, true, 32, 32);
			_highlight.offset.y = 0;
		});
		btnWildflower.loadGraphic(AssetPaths.wildflowerbutton__png);
		btnWildflower.label.color = FlxColor.WHITE;
		btnWildflower.onOver.callback = function():Void {
			_waveTxt.text = "Wildflower, Cost " + Std.string(Tower.towerCost(Wildflower)) + "\nBeautify any garden.";
		};
		add(btnWildflower);

		var btnSunflower = new FlxButton(448, FlxG.height - 56, "Sunflower", function():Void {
			_towerBrush = Sunflower;
			_highlight.loadGraphic(AssetPaths.sunflower__png, true, 32, 32);
			_highlight.offset.y = 0;
		});
		btnSunflower.loadGraphic(AssetPaths.sunflowerbutton__png);
		btnSunflower.label.color = FlxColor.WHITE;
		btnSunflower.onOver.callback = function():Void {
			_waveTxt.text = "Sunflower, Cost " + Std.string(Tower.towerCost(Sunflower)) + "\nBrings joy.";
		};
		add(btnSunflower);

		var btnBerries = new FlxButton(512, FlxG.height - 56, "Berries", function():Void {
			_towerBrush = Berries;
			_highlight.loadGraphic(AssetPaths.berries__png, true, 32, 48);
			_highlight.offset.y = 16;
		});
		btnBerries.loadGraphic(AssetPaths.berriesbutton__png);
		btnBerries.label.color = FlxColor.WHITE;
		btnBerries.onOver.callback = function():Void {
			_waveTxt.text = "Berries, Cost " + Std.string(Tower.towerCost(Berries)) + "\nKnown to have healing properties.";
		};
		add(btnBerries);

		var btnBonsai = new FlxButton(576, FlxG.height - 56, "Bonsai", function():Void {
			_towerBrush = Bonsai;
			_highlight.loadGraphic(AssetPaths.bonsai__png, true, 32, 48);
			_highlight.offset.y = 16;
		});
		btnBonsai.loadGraphic(AssetPaths.bonsaibutton__png);
		btnBonsai.label.color = FlxColor.WHITE;
		btnBonsai.onOver.callback = function():Void {
			_waveTxt.text = "Bonsai, Cost " + Std.string(Tower.towerCost(Bonsai)) + "\nGives tranquility to all.";
		};
		add(btnBonsai);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		var tx:Int = Std.int(FlxG.mouse.x / TILE_SIZE);
		var ty:Int = Std.int(FlxG.mouse.y / TILE_SIZE);
		_highlight.x = tx * TILE_SIZE;
		_highlight.y = ty * TILE_SIZE;
		
		if(tx < 1 || _waveSpawner._spawning || _waveSpawner._doneSpawning)
		{
			_highlight.alpha = 0;
		}
		else
		{
			_highlight.alpha = 0.5;
			if(_map.getTile(tx, ty) > 8)
				_highlight.color = FlxColor.fromRGB(255, 0, 0);
			else
				_highlight.color = FlxColor.fromRGB(0, 255, 255);
		}
		
		if(!_gameEnded && !_waveSpawner._spawning && !_waveSpawner._doneSpawning)
		{
			if (FlxG.mouse.justPressed)
				placeTower();
			else if(FlxG.mouse.justPressedRight)
			{
				if(_map.getTile(tx, ty) == 10 || _map.getTile(tx, ty) == 11)
				{
					_map.setTile(tx, ty, 1);
					setTileValues();
					updateDistance();
					for(tower in _towers)
					{
						if(tower.x == tx * TILE_SIZE && tower.y == ty * TILE_SIZE)
							tower.kill();
					}
				}
			}
		}
		
		if(_waveSpawner._spawning)
		{
			_waveSpawner._timeSinceLastSpawn -= elapsed;
			if(_waveSpawner._timeSinceLastSpawn <= 0)
			{
				_waveSpawner._timeSinceLastSpawn += _waveSpawner._spawnRate;

				if(_waveSpawner._enemies.length > 0)
					placeEnemy(_waveSpawner._enemies.pop(), -32, 128);
				else
				{
					_waveSpawner._doneSpawning = true;
					_waveSpawner._spawning = false; 
				}
			}
		}

		updateEnemies();
		updateTowers(elapsed);

		_particles.forEachAlive(function(particle:FlxParticle):Void {
			if(particle.animation.finished)
				particle.kill();
		});

		_textParticles.forEachAlive(function(text:FlxText):Void {
			text.y -= 0.3;
			text.alpha -= 0.015;
			if(text.alpha <= 0)
				text.kill();
		});

		_sprites.sort(FlxSort.byY, FlxSort.ASCENDING);
	}

	private function loadTiles():Void 
	{

		_mapLoader = new FlxOgmoLoader(AssetPaths.level01__oel);
		_map = _mapLoader.loadTilemap(AssetPaths.tiles__png, TILE_SIZE, TILE_SIZE, "Tiles");
		add(_map);

		// heatmap for debug
		/*var arr:Array<Int> = [];
		for (ww in 0..._map.widthInTiles)
		{
			for (hh in 0..._map.heightInTiles)
			{
				arr.push(0);
			}
		}
		distmap = new FlxTilemap();
		distmap.scale.set(TILE_SIZE, TILE_SIZE);
		distmap.loadMapFromArray(arr, _map.widthInTiles, _map.heightInTiles, AssetPaths.heat__png, 1, 1);
		add(distmap);*/
		

		setTileValues();

		_goal = FlxPoint.get();
		_goalSprite = new FlxSprite();
		_goalSprite.loadGraphic(AssetPaths.goal__png, true, 32, 32);
		_goalSprite.animation.add("idle", [0, 1, 2, 3, 4, 5, 6, 7], 16, true);
		_goalSprite.animation.play("idle");
		_goalSprite.setSize(1, 1);
		_goalSprite.centerOrigin();
		_goalSprite.centerOffsets();
		add(_goalSprite);
		placeGoal(0, 0);

		_mapLoader.loadEntities(placeEntities, "Entities");
	}

	private function setTileValues():Void
	{
		for(x in 0...11)
			_map.setTileProperties(x, FlxObject.NONE);
		for(x in 11...13)
			_map.setTileProperties(x, FlxObject.ANY);
	}

	private function placeEntities(entityName:String, entityData:Xml):Void
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		if (entityName == "goal")
		{
			placeGoal(x, y);
		}
	}

	private function placeGoal(X:Float, Y:Float):Void 
	{
		_goal.x = Std.int(X / TILE_SIZE);
		_goal.y = Std.int(Y / TILE_SIZE);

		_goalSprite.x = Std.int(_goal.x * TILE_SIZE + _goalSprite.offset.x);
		_goalSprite.y = Std.int(_goal.y * TILE_SIZE + _goalSprite.offset.y);

		_map.setTile(Std.int(_goal.x), Std.int(_goal.y), 10, true);
		
		updateDistance();
	}

	private function updateDistance():Void 
	{
		var startX:Int = Std.int((_goal.y * _map.widthInTiles) + _goal.x);
		var endX:Int = 0;
		if (startX == endX)
			endX = 1;

		var tempDistances = _map.computePathDistance(startX, endX, NONE, false);
		
		if (tempDistances == null)
		{
			if(_lastTowerPlaced != null)
			{
				_map.setTile(Std.int(_lastTowerPlaced.x / TILE_SIZE), Std.int(_lastTowerPlaced.y / TILE_SIZE), 1, true);
				if(_lastTowerPlaced._income > 0)
					_income -= _lastTowerPlaced._income;
				_lastTowerPlaced.kill();
				_lastTowerPlaced = null;
				updateDistance();
			}
			return;
		}
		else
			_distances = tempDistances;
		
		var maxDistance:Int = 1;
		for (dist in _distances) 
		{
			if (dist > maxDistance)
				maxDistance = dist;
		}
		
		for (i in 0..._distances.length) 
		{
			var disti:Int = 0;
			if (_distances[i] < 0) 
				disti = 1000;
			else
				disti = Std.int(999 * (_distances[i] / maxDistance));

			// heatmap for debug
			//distmap.setTileByIndex(i, disti, true);
		}
	}

	private function placeTower():Void 
	{
		if(_towerBrush == None)
			return;

		var tx:Int = Std.int(FlxG.mouse.x / TILE_SIZE);
		var ty:Int = Std.int(FlxG.mouse.y / TILE_SIZE);
		if(tx < 1 || tx > _map.widthInTiles - 1 || ty < 0 || ty > _map.heightInTiles - 1)
			return;

		var cost = Tower.towerCost(_towerBrush);
		if(cost > _energy)
			return;

		if(_map.getTile(tx, ty) > 8)
			return;

		var tower = new Tower(_towerBrush, tx * TILE_SIZE, ty * TILE_SIZE);
		_towers.add(tower);
		if(tower._blocking)
		{
			_map.setTile(tx, ty, 11, true);
			_sprites.add(tower);
			_lastTowerPlaced = tower;
			setTileValues();
			updateDistance();
		}
		else
		{
			_map.setTile(tx, ty, 10, true);
			_backSprites.add(tower);
		}

		_energy -= cost;
		if(tower._income > 0)
		{
			_income += _lastTowerPlaced._income;
		}
		_hud.updateHUD(_health, _energy, _income);

		FlxG.sound.play(AssetPaths.plant__wav);
	}

	private function placeEnemy(enemyType:Enemy.EnemyType, x:Int, y:Int):Void 
	{
		var enemy = _enemies.add(new Enemy(enemyType, x, y));
		_sprites.add(enemy);
	}

	private function updateEnemies():Void 
	{
		FlxG.collide(_map, _enemies);

		var liveEnemies:Int = 0;
		
		for (enemy in _enemies) 
		{
			if(!enemy.alive)
				continue;

			if (!enemy._moving)
			{
				var tx:Int = Std.int((enemy.x-enemy.offset.x) / TILE_SIZE);
				var ty:Int = Std.int((enemy.y-enemy.offset.y) / TILE_SIZE);
				
				var bestX:Int = 0;
				var bestY:Int = 0;
				var bestDist:Float = Math.POSITIVE_INFINITY;
				var neighbors:Array<Array<Float>> = [[999, 999, 999], [999, 999, 999], [999, 999, 999]];
				for (xx in -1...2) 
				{
					for (yy in -1...2) 
					{
						var theX:Int = tx + xx;
						var theY:Int = ty + yy;
						
						if (theX >= 0 && theY < _map.widthInTiles &&
							theY >= 0 && theY < _map.heightInTiles &&
							(xx == 0 || yy == 0))
						{
							var distance:Float = _distances[theY * _map.widthInTiles + theX];
							neighbors[yy + 1][xx + 1] = distance;
							
							if (distance >= 0 && (distance <= bestDist || (bestX == 0 && bestY == 0)))
							{
								bestDist = distance;
								bestX = xx;
								bestY = yy;
							}
						}
					}
				}
				
				if (!(bestX == 0 && bestY == 0))
				{
					enemy.moveTo((tx * TILE_SIZE) + (bestX * TILE_SIZE) + enemy.offset.x, (ty * TILE_SIZE) + (bestY * TILE_SIZE) + enemy.offset.y);
				}
			}

			if(FlxMath.distanceBetween(enemy, _goalSprite) < 10)
			{
				enemy.kill();
				var particle = _particles.recycle(FlxParticle);
				if(enemy.getHealth() > 0)
				{
					particle.loadGraphic(AssetPaths.warpoutsad__png, true, 32, 48);	
					particle.velocity.y = 100;
					_health--;
					_hud.updateHUD(_health, _energy, _income);
					FlxG.camera.shake(0.01, 0.5, function():Void{}, true, flixel.util.FlxAxes.X);
					FlxG.sound.play(AssetPaths.loselife__wav);

					if(_health <= 0 && !_gameEnded)
					{
						_gameEnded = true;
						var defeat = new FlxSprite();
						defeat.loadGraphic(AssetPaths.defeat__png);
						defeat.screenCenter();
						defeat.y -= 50;
						add(defeat);

						var cont = new FlxButton(0, 0, "Continue", function():Void { FlxG.switchState(new MenuState()); });
						cont.screenCenter();
						cont.y += 50;
						add(cont);

						_harpMusic.stop();
						_battleMusic.stop();
					}
				}
				else
				{
					particle.loadGraphic(AssetPaths.warpouthappy__png, true, 32, 48);
					particle.velocity.y = -100;
					FlxG.sound.play(AssetPaths.goodteleport__wav);
				}
				particle.animation.add("0", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 30, false);
				particle.animation.play("0");
				particle.centerOrigin();
				particle.centerOffsets();
				particle.setPosition(enemy.x, enemy.y);
			}
		}

		if(_waveSpawner._doneSpawning && _enemies.countLiving() == 0 && !_gameEnded)
		{
			_energy += _income;
			_hud.updateHUD(_health, _energy, _income);

			_wave++;

			if(_wave > 14)
			{
				_gameEnded = true;
				var victory = new FlxSprite();
				victory.loadGraphic(AssetPaths.victory__png);
				victory.screenCenter();
				victory.y -= 50;
				add(victory);

				var cont = new FlxButton(0, 0, "Continue", function():Void { FlxG.switchState(new MenuState()); });
				cont.screenCenter();
				cont.y += 50;
				add(cont);

				_harpMusic.stop();
				_battleMusic.stop();
			}
			else
			{
				_waveSpawner = new Wave(_level, _wave);
				_waveTxt.text = _waveSpawner.getDescription();
				_beforeWave = true;
				_btnGo.color = FlxColor.WHITE;
				_harpMusic.play(true, _battleMusic.time + 16);
				_harpMusic.fadeIn(1);
				_battleMusic.fadeOut(1);
			}
		}
	}

	private function updateTowers(elapsed:Float):Void
	{
		for(tower in _towers)
		{
			if(tower._attackSpeed > 0 && tower.alive)
			{
				if(tower._attackReady > 0)
					tower._attackReady -= elapsed;

				if(tower._attackReady <= 0)
				{
					if(tower._target != null)
					{
						if(FlxMath.distanceBetween(tower._target, tower) <= tower._attackRange && tower._target.getHealth() > 0 && tower._target.alive)
						{
							_attacks.add(new Attack(tower._attackDamage, tower._attackType, tower._target, tower.x, tower.y));
							tower._attackReady = tower._attackSpeed;
						}
						else
						{
							tower._target = null;
						}
					}

					if(tower._target == null)
					{
						var newTarget:Enemy = null;
						var closestDistance:Int = tower._attackRange;
						for (enemy in _enemies) 
						{
							var distance = FlxMath.distanceBetween(enemy, tower);
							if(distance <= closestDistance && enemy.getHealth() > 0 && enemy.alive)
							{
								closestDistance = distance;
								newTarget = enemy;
							}
						}

						if(newTarget != null)
						{
							tower._target = newTarget;
							_attacks.add(new Attack(tower._attackDamage, tower._attackType, tower._target, tower.x, tower.y));
							tower._attackReady = tower._attackSpeed;
						}
					}
				}
			}
		}
	}
}
