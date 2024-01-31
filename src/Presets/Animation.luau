local src = script.Parent.Parent

local Props = require(src.Main)

local AnimationProps = {}
AnimationProps.__index = AnimationProps

--------------------

type self = {
}

export type AnimationProps = typeof(setmetatable({} :: self, AnimationProps)) & Props.Props

--------------------

function AnimationProps.new(storage: Instance, dump: Instance): AnimationProps
    local self = Props.new(storage, dump)

    setmetatable(self, AnimationProps)

    return self
end

function AnimationProps.getAnimationTrack(self: AnimationProps, name: string, animator: Animator): AnimationTrack
    local prop = Props.get(self, name)
    local track = animator:LoadAnimation(prop)

    prop:Destroy()

    return track
end

--------------------

setmetatable(AnimationProps, Props)

return AnimationProps