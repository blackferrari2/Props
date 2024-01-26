local Props = require(script.Parent.Main)

local SoundProps = {}
SoundProps.__index = SoundProps

setmetatable(SoundProps, Props)

--------------------

type self = {
}

export type SoundProps = typeof(setmetatable({} :: self, SoundProps)) & Props.Props

--------------------

function SoundProps.new(storage: Instance): SoundProps
    local self = Props.new(storage, workspace)

    setmetatable(self, SoundProps)

    return self
end

function SoundProps.play(self: SoundProps, name: string, volume: number?, pitch: NumberRange?, parent: Instance?): Sound
    volume = volume or 1

    local prop = self:get(name)

    if parent then
        prop.Parent = parent
    end

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