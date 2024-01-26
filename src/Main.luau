local TweenService = game:GetService("TweenService")

local Props = {}
Props.__index = Props

--------------------

type self = {
    storage: Instance,
    dump: Instance,
}

export type Props = typeof(setmetatable({} :: self, Props))

--------------------

local ERROR_CANT_FIND_PROP = "cant find prop %s"

--------------------

-- storage: where you store props
-- dump: where to put cloned props
function Props.new(storage: Instance, dump: Instance): Props
    local self = {
        storage = storage,
        dump = dump,
    }

    setmetatable(self, Props)

    return self
end

function Props.get(self: Props, name: string): Instance
    local prop = self.storage:FindFirstChild(name)

    if not prop then
        error(string.format(ERROR_CANT_FIND_PROP, name))
    end

    prop = prop:Clone()
    prop.Parent = self.dump

    return prop
end

--
    
function Props.tween(instance: Instance, info: TweenInfo, goals: {[string]: any}): Tween
    local tween = TweenService:Create(instance, info, goals)

    tween:Play()

    return tween
end

function Props.debri(instance: Instance, time: number | RBXScriptSignal, destroyMethod: string?): thread
    destroyMethod = destroyMethod or "Destroy"

    local thread = task.spawn(function()
        if typeof(time) == "number" then
            task.wait(time)
        else
            time:Wait()
        end

        local destroy = instance[destroyMethod]

        destroy(instance)
    end)

    return thread
end

--------------------

return Props