local Main = require(script.Main)
local Part = require(script.Presets.Part)
local Sound = require(script.Presets.Sound)
local Animation = require(script.Presets.Animation)
local Particle = require(script.Presets.Particle)

--------------------

export type Props = Main.Props
export type SoundProps = Sound.SoundProps
export type PartProps = Part.PartProps
export type AnimationProps = Animation.AnimationProps
export type ParticleProps = Particle.ParticleProps

--------------------

return {
    Main = Main,
    Part = Part,
    Sound = Sound,
    Animation = Animation,
    Particle = Particle,
}