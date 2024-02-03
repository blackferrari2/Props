local src = script.Parent.Parent

local Props = require(src.Main)

local SoundProps = {}
SoundProps.__index = SoundProps

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

function SoundProps.play(self: SoundProps, name: string, properties: {[string]: any}, ...: SoundEffect?): Sound
    local prop = self:get(name)

    if properties then
        for property, value in pairs(properties) do
            prop[property] = value
        end
    end

    local soundEffects = {...}

    if #soundEffects > 0 then
        for _, soundEffect in pairs(soundEffects) do
            soundEffect.Parent = prop
        end
    end

    prop.PlayOnRemove = true
    prop:Destroy()

    return prop
end

--------------------

setmetatable(SoundProps, Props)

return SoundProps