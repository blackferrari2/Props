local Main = require(script.Main)
local Part = require(script.Part)
local Sound = require(script.Sound)
local Animation = require(script.Animation)

--------------------

export type Props = Main.Props
export type SoundProps = Sound.SoundProps
export type PartProps = Part.PartProps
export type AnimationProps = Animation.AnimationProps

--------------------

return {
    Main = Main,
    Part = Part,
    Sound = Sound,
    Animation = Animation,
}