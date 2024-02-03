local src = script.Parent.Parent

local Props = require(src.Main)

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

--

function PartProps.createEmpty(cframe: CFrame?): Part
    local part = Instance.new("Part")

    part.CanQuery = false
    part.CanCollide = false
    part.Transparency = 1
    part.Anchored = true

    if cframe then
        part.CFrame = cframe
    end

    return part
end

--------------------

setmetatable(PartProps, Props)

return PartProps