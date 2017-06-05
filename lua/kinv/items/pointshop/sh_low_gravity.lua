ITEM.baseClass    = "base_pointshop_item"
ITEM.PrintName    = "Low Gravity"
ITEM.Description = "Equip this to get 2x Jump Power!"
ITEM.static.Price = {
    points = 100
}

function ITEM:PlayerSpawn( ply )
    if ply != self:GetOwner( ) then
        return
    end

    local oldJumpPower = ply:GetJumpPower( )
    timer.Simple( 0.5, function ( ) 
        ply:SetJumpPower( oldJumpPower * 2 )
    end )
end
Pointshop2.AddItemHook( "PlayerSpawn", ITEM )