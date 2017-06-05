-- Define the class
Pointshop2.LowGravityPersistence = class( "Pointshop2.LowGravityPersistence" )
local LowGravityPersistence = Pointshop2.LowGravityPersistence 

-- Link to the Pointshop2 Database
LowGravityPersistence.static.DB = "Pointshop2"

-- Define model fields
LowGravityPersistence.static.model = {
    -- Name of the SQL Table
    tableName = "ps2_lowgravitypersistence",

    -- Table columns:
    fields = {
        -- Foreign key, needed to link to the basic item info row
        itemPersistenceId = "int",

        -- Our gravity multiplier
        multiplier = "luadata",
    },
    
    -- Link to the item persistence of base_pointshop_item
    belongsTo = {
        ItemPersistence = {
            class = "Pointshop2.ItemPersistence",
            foreignKey = "itemPersistenceId",
            onDelete = "CASCADE",
        }
    }
}

-- Include Database Logic (creating tables, adding accessor functions)
LowGravityPersistence:include( DatabaseModel )

-- Include EasyExport: Makes it possible to import/export the item
LowGravityPersistence:include( Pointshop2.EasyExport )

--[[
    Called by the Item Creator to update or create a persistence.
    Args:
    - saveTable: A table of custom fields created by the creator
    - doUpdate: A boolean, true if we are updating an item, false if 
                creating it.
]]--
function LowGravityPersistence.static.createOrUpdateFromSaveTable( saveTable, doUpdate )
    -- call the base item createOrUpdateFromSaveTable to save basic item info (description, name, price, etc.) 
    return Pointshop2.ItemPersistence.createOrUpdateFromSaveTable( saveTable, doUpdate )
    :Then( function( itemPersistence )
        if doUpdate then
            -- Find the database row to update
            return LowGravityPersistence.findByItemPersistenceId( itemPersistence.id )
        else
            -- Create a new database row
            local weaponPersistence = LowGravityPersistence:new( )
            -- link the basic item info
            weaponPersistence.itemPersistenceId = itemPersistence.id
            return weaponPersistence
        end
    end )
    :Then( function( lowGravPersistence )
        -- Set our custom properties
        lowGravPersistence.multiplier = saveTable.multiplier
        return lowGravPersistence:save( )
    end )
end