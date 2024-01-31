local src = script.Parent.Parent

local Props = require(src.Main)

local SoundProps = {}
SoundProps.__index = SoundProps

--------------------

type self = {
}

export type SoundProps = typeof(setmetatable({} :: self, SoundProps)) & Props.Props

--------------------

local random = Random.new()

--------------------

function SoundProps.new(storage: Instance, dump: Instance): SoundProps
    local self = Props.new(storage, dump)

    setmetatable(self, SoundProps)

    return self
end

function SoundProps.play(self: SoundProps, name: string, volume: number?, pitch: NumberRange?): Sound
    local prop = self:get(name)

    if pitch then
        prop.PlaybackSpeed = random:NextNumber(pitch.Min, pitch.Max)
    end

    if volume then
        prop.Volume = volume
    end

    prop.PlayOnRemove = true
    prop:Destroy()

    return prop
end

--------------------

setmetatable(SoundProps, Props)

return SoundProps