-------------------------------------------------------------------------------
-- Declares the Tintable component

local Tintable = Class(function(self, inst)
  self.inst = inst
  self.tint = {1,1,1,1}
  self.image = nil
end)

-------------------------------------------------------------------------------
-- Parses and normalizes the RGBA values based on the value of max
-- @param r red
-- @param g green
-- @param b blue
-- @param a alpha
-- @param max Maximum value of the incoming values

local function parseRGBA(r,g,b,a,max)
  if type(r) == "number" and r >= 0 and r <= max then
    r = r/max
  else
    r = 1
  end

  if type(g) == "number" and g >= 0 and g <= max then
    g = g/max
  else
    g = 1
  end

  if type(b) == "number" and b >= 0 and b <= max then
    b = b/max
  else
    b = 1
  end

  if type(a) == "number" and a >= 0 and a <= max then
    a = a/max
  else
    a = 1
  end

  return r,g,b,a
end

-------------------------------------------------------------------------------
-- Tints the itemtile image and the AnimState with the current tint

function Tintable:Tint()
  local t = self:Get()
  self.image:SetTint(unpack(t))
  self.inst.AnimState:OverrideMultColour(unpack(t))
end

-------------------------------------------------------------------------------
-- Stores instance of itemtile image and applies existing tint
-- @param image reference to itemtile image

function Tintable:SetImage(image)
  self.image = image
  self:Tint()
end

-------------------------------------------------------------------------------
-- Sets the tint color with values from 0 to 1
-- @param r red
-- @param g green
-- @param b blue
-- @param a alpha

function Tintable:Set(r, g, b, a)
  r,g,b,a = parseRGBA(r,g,b,a, 1)
  self.tint = {r, g, b, a}
  self:Tint()
end

-------------------------------------------------------------------------------
-- Sets the tint color with values from 0 to 255
-- @param r red
-- @param g green
-- @param b blue
-- @param a alpha

function Tintable:SetRGBA(r, g, b, a)
  r,g,b,a = parseRGBA(r,g,b,a, 255)
  self.tint = {r, g, b, a}
  self:Tint()
end

-------------------------------------------------------------------------------
-- Retrieves the current tint value
-- @return table representing the current normalized tint {r, g, b, a}

function Tintable:Get()
  return self.tint
end

-------------------------------------------------------------------------------
-- Stores the current tint in memory
-- @return table representing the saved tint { tint = {r,g,b,a} }

function Tintable:OnSave()
  return { tint = self.tint }
end

-------------------------------------------------------------------------------
-- Retrieves the current tint from memory
-- @param data table representing the saved tint { tint = {r,g,b,a} }

function Tintable:OnLoad(data)
  if data and type(data.tint) == "table" and table.maxn(data.tint) == 4 then
    self.tint = data.tint
  else
    self.tint = {1,1,1,1}
  end
end

return Tintable
