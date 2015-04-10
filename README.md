# Tintable
Mod for Don't Starve Together

## Description
Allows items to be tinted (alter their color). This mod is not intended to be used by itself. But rather combined with other mods in order to work properly.

## Usage
If you are building a mod that wants to make use of this component this is what you would need to do:

- Copy the contents of modmain.lua
- Copy the tintable component
- Add the tintable component to your item
```lua
  inst:AddComponent("tintable")
```
- Set the tint (colour) of the item
```lua
-- Via normalized values
inst.components.tintable:Set(1,0,0.5,1)
-- Via 255 based values
inst.components.tintable:SetRGBA(255,0,127,1)
```

## Thanks
To the guys that contributed ideas at http://forums.kleientertainment.com/topic/52701-inventory-item-tintcolour-possible
