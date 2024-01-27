local Props = require(script.Parent.Main)

local PartProps = {}
PartProps.__index = PartProps

--------------------

type self = {
}

export type PartProps = typeof(setmetatable({} :: self, PartProps)) & Props.Props

--------------------

function PartProps.new(storage: Instance, dump: Instance): PartProps
    local self = Props.new(storage, dump)

    setmetatable(self, PartProps)

    return self
end

function PartProps.get(self: PartProps, name: string): BasePart
    local prop = Props.get(self, name)

    prop.CanCollide = false
    prop.CanQuery = false
    prop.CanTouch = false
    prop.Anchored = true
    prop.Massless = true

    return prop
end

--------------------

setmetatable(PartProps, Props)

return PartProps