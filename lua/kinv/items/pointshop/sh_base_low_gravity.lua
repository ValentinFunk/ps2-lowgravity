ITEM.baseClass	= "base_pointshop_item"
ITEM.multiplier = 2

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