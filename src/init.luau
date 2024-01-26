local Main = require(script.Main)
local Part = require(script.Part)
local Sound = require(script.Sound)

--------------------

export type Props = Main.Props
export type SoundProps = Sound.SoundProps
export type PartProps = Part.PartProps

--------------------

return {
    Main = Main,  
    Part = Part,  
    Sound = Sound, 
}