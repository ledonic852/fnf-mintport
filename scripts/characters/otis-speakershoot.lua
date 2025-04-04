function onCreatePost()
    addLuaScript('scripts/characters/props/abot-stereo')
    callScript('scripts/characters/props/abot-stereo', 'createSpeaker', {'otis-speakershoot', 10, 10}) -- {characterName, offsetX, offsetY}
end