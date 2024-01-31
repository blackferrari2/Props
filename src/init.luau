local Main = require(script.Main)
local Part = require(script.Presets.Part)
local Sound = require(script.Presets.Sound)
local Animation = require(script.Presets.Animation)

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