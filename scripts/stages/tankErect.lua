function onCreate()
	-- background shit
	makeLuaSprite('stageback', 'warzone/erect/bg', -985, -805);
	setScrollFactor('stageback', 1, 1);
	scaleObject('stageback', 1.15, 1.15)

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeAnimatedLuaSprite('sniper', 'warzone/erect/sniper', -127, 349);
		setScrollFactor('sniper', 1, 1);
		scaleObject('sniper', 1.15, 1.15)
		addAnimationByPrefix('sniper', 'idle', 'Tankmanidlebaked instance 1')

		makeAnimatedLuaSprite('guy', 'warzone/erect/guy', 1398, 407);
		setScrollFactor('guy', 1, 1);
		scaleObject('guy', 1.15, 1.15)
		addAnimationByPrefix('guy', 'idle', 'BLTank2 instance 1')
	end

	addLuaSprite('stageback', false);
	addLuaSprite('sniper', false);
	addLuaSprite('guy', false);
end

function onUpdatePost(elapsed)
	setScrollFactor('boyfriend', 1, 1);
	setScrollFactor('dad', 1, 1);
	setScrollFactor('gf', 1, 1);
end