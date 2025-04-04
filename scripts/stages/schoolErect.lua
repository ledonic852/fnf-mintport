hasCreeps = false;
function onCreate()
	makeLuaSprite('sky', 'weeb/erect/weebSky2', 0, 0);
	setScrollFactor('sky', 0.1, 0.1);
	setProperty('sky.antialiasing', false);
	widShit = math.floor(getProperty('sky.width') * 6);
	scaleObject('sky', 6, 6);
	addLuaSprite('sky', false);

	repositionShit = -200;
	makeLuaSprite('school', 'weeb/erect/weebSchool2', repositionShit, 0);
	setScrollFactor('school', 0.6, 0.9);
	setProperty('school.antialiasing', false);
	scaleObject('school', 6, 6);
	addLuaSprite('school', false);
	
	makeLuaSprite('street', 'weeb/erect/weebStreet2', repositionShit, 0);
	setScrollFactor('street', 0.95, 0.95);
	setProperty('street.antialiasing', false);
	scaleObject('street', 6, 6);
	addLuaSprite('street', false);

	if not lowQuality then
		makeLuaSprite('treesBack', 'weeb/erect/weebTreesBack2', repositionShit + 170, 130);
		setScrollFactor('treesBack', 0.9, 0.9);
		setProperty('treesBack.antialiasing', false);
		setGraphicSize('treesBack', math.floor(widShit * 0.8));
		addLuaSprite('treesBack', false);
	end
	
	makeAnimatedLuaSprite('trees', 'weeb/erect/weebTrees2', repositionShit - 380, -800, 'packer');
	addAnimation('trees', 'treeLoop', {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18}, 12, true);
	setScrollFactor('trees', 0.85, 0.85);
	setProperty('trees.antialiasing', false);
	setGraphicSize('trees', math.floor(widShit * 1.4));
	addLuaSprite('trees', false);

	-- background things that only load if you have low quality option turned off
	if not lowQuality then
		makeAnimatedLuaSprite('petals', 'weeb/erect/petals2', repositionShit, -40);
		addAnimationByPrefix('petals', 'idle', 'PETALS ALL', 24, true);
		setScrollFactor('petals', 0.85, 0.85);
		setProperty('petals.antialiasing', false);
		setGraphicSize('petals', widShit);
		addLuaSprite('petals', false);
	end
end

function onCreatePost()
    initLuaShader("adjustColorDX");
    local color = hex2rgb('52351d')

    for i, v in pairs({'dad', 'gf', 'boyfriend'}) do
        setSpriteShader(v, 'adjustColorDX')

        -- Drop shadow parameters
        setShaderFloat(v, 'ang', 90 * (math.pi / 180))
        setShaderFloat(v, 'dist', 5)
        setShaderFloat(v, 'str', 1)
        setShaderFloat(v, 'thr', 0)

        setShaderSampler2D(v, 'altMask', 'weeb/erect/masks/' .. getProperty(v .. '.imageFile'):sub(12) .. '_mask')
        setShaderBool(v, 'useMask', true)
        setShaderFloat(v, 'thr2', 0.2)

        setShaderFloatArray(v, 'dropColor', {color.r, color.g, color.b})

        -- Color adjustment
        setShaderFloat(v, 'hue', -10)
        setShaderFloat(v, 'saturation', -23)
        setShaderFloat(v, 'brightness', -66)
        setShaderFloat(v, 'contrast', 4)
        setShaderFloat(v, 'AA_STAGES', 0)
    end

    if gfName ~= 'nene-pixel' then
        setShaderFloat('gf', 'brightness', -42)
        setShaderFloat('gf', 'contrast', 5)
        setShaderFloat('gf', 'saturation', -25)
        setShaderFloat('gf', 'dist', 3)
        setShaderFloat('gf', 'thr', 0.3)
    end
end

function onUpdatePost(e)
    for i, v in pairs({'dad', 'gf', 'boyfriend'}) do
        setShaderFloatArray(v, 'uFrameBounds', {
            0, 0,
            getProperty(v .. '._frame.frame.width'),
            getProperty(v .. '._frame.frame.height')
        })
        setShaderFloat(v, 'angOffset', getProperty(v .. '.angle') * math.pi / 180)
    end
end

function hex2rgb(hex)
    return {
        r = tonumber("0x" .. hex:sub(1, 2)) / 255,
        g = tonumber("0x" .. hex:sub(3, 4)) / 255,
        b = tonumber("0x" .. hex:sub(5, 6)) / 255
    }
end
