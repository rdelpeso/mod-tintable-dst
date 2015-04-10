-------------------------------------------------------------------------------
-- Link tintable components with an instance of the itemtile image

AddClassPostConstruct("widgets/itemtile", function(self)
	if self.item
    and self.item.components
    and self.item.components.tintable
  then
    self.item.components.tintable:SetImage(self.image)
	end
end)
