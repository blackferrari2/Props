local Props = require(script.Parent.Main)

local SoundProps = {}
SoundProps.__index = SoundProps

setmetatable(SoundProps, Props)

--------------------

type self = {
}

export type SoundProps = typeof(setmetatable({} :: self, SoundProps)) & Props.Props

--------------------

function SoundProps.new(storage: Instance, dump: Instance): SoundProps
    local self = Props.new(storage, dump)

    setmetatable(self, SoundProps)

    return self
end

function SoundProps.play(self: SoundProps, name: string, volume: number?, pitch: NumberRange?): Sound
    volume = volume or 1

    local prop = self:get(name)

    if pitch then
        prop.PlaybackSpeed = math.random(pitch.Min, pitch.Max)
    end

    prop.PlayOnRemove = true
    prop.Volume = volume
    prop:Destroy()

    return prop
end

--------------------

return SoundProps