local src = script.Parent.Parent

local Props = require(src.Main)

local SoundProps = {}
SoundProps.__index = SoundProps

--------------------

type self = {
}

export type SoundProps = typeof(setmetatable({} :: self, SoundProps)) & Props.Props

--------------------

function SoundProps.new(storage: Instance): SoundProps
    local self = Props.new(storage, storage, true)

    setmetatable(self, SoundProps)

    return self
end

function SoundProps.play(self: SoundProps, name: string, volume: number?, pitch: NumberRange?): Sound
    volume = volume or 1

    local prop = self:get(name)

    if pitch then
        prop.PlaybackSpeed = math.random(pitch.Min, pitch.Max)
    end

    prop.Volume = volume
    prop:Play()

    return prop
end

--------------------

setmetatable(SoundProps, Props)

return SoundProps