ITEM.baseClass	= "base_pointshop_item"
ITEM.multiplier = 2
ITEM.material = "pointshop2/winner2.png"

function ITEM:PlayerSpawn( ply )
    if ply != self:GetOwner() then
        return
    end

    local oldJumpPower = ply:GetJumpPower( )
    timer.Simple( 0.5, function ( ) 
        ply:SetJumpPower( oldJumpPower * self.multiplier )
    end )
end
Pointshop2.AddItemHook( "PlayerSpawn", ITEM )

-- Returns a Derma Control Name used to create the shop icon in normal mode
function ITEM.static:GetPointshopIconControl( )
	return "DPointshopMaterialIcon"
end

-- Returns a Derma Control Name used to create the shop icon in lowend mode
function ITEM.static:GetPointshopLowendIconControl( )
	return "DPointshopMaterialIcon"
end

-- Returns a derma icon that ised in the inventory
function ITEM:getIcon( )
	self.icon = vgui.Create( "DPointshopMaterialInvIcon" )
	self.icon:SetItem( self )
	return self.icon
end

function ITEM.static.GetPointshopIconDimensions( )
	return Pointshop2.GenerateIconSize( 4, 4 )
end