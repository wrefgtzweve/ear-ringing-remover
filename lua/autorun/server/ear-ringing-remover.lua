-- Convar
local disableTinnitus = CreateConVar( "earringing_disable", 1, { FCVAR_ARCHIVE }, "Should the ear ringing/tinnitus effect be disabled?.", 0 ):GetBool()
cvars.AddChangeCallback( "earringing_disable", function( _, _, val )
    disableTinnitus = tobool( val )
end)

-- Remove tinnitus
hook.Add( "OnDamagedByExplosion", "DisableSound", function()
    if not disableTinnitus then return end
    return true
end)
