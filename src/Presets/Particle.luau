local src = script.Parent.Parent

local Props = require(src.Main)

local ParticleProps = {}
ParticleProps.__index = ParticleProps

--------------------

type self = {
}

export type ParticleProps = typeof(setmetatable({} :: self, ParticleProps)) & Props.Props

--------------------

function ParticleProps.new(storage: Instance, dump: Instance): ParticleProps
    local self = Props.new(storage, dump)

    setmetatable(self, ParticleProps)

    return self
end

function ParticleProps.attachment(self: ParticleProps): Attachment
    local attachment = Instance.new("Attachment")

    attachment.Parent = self.dump

    return attachment
end

function ParticleProps.emit(self: ParticleProps, name: string, amount: number, parent: Instance?): ParticleEmitter
    local prop = Props.get(self, name)

    prop.Parent = parent or self.dump
    prop:Emit(amount)

    return prop
end

--------------------

setmetatable(ParticleProps, Props)

return ParticleProps