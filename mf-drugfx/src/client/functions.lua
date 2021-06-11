function PointOnSphere(alt,azu,radius,orgX,orgY,orgZ)
  local toradians = 0.017453292384744
  alt,azu,radius,orgX,orgY,orgZ = ( tonumber(alt or 0) or 0 ) * toradians, ( tonumber(azu or 0) or 0 ) * toradians, tonumber(radius or 0) or 0, tonumber(orgX or 0) or 0, tonumber(orgY or 0) or 0, tonumber(orgZ or 0) or 0
  if      vector3
  then
      return
      vector3(
           orgX + radius * math.sin( azu ) * math.cos( alt ),
           orgY + radius * math.cos( azu ) * math.cos( alt ),
           orgZ + radius * math.sin( alt )
      )
  end
end

function ShowNotification(msg, flash, saveToBrief, hudColorIndex)
  ESX.ShowNotification(msg)
end

function ShowAdvancedNotification(sender, subject, msg, textureDict, iconType, flash, saveToBrief, hudColorIndex)
  if saveToBrief == nil then saveToBrief = true end
  AddTextEntry('terAdvancedNotification', msg)
  BeginTextCommandThefeedPost('terAdvancedNotification')
  if hudColorIndex then ThefeedNextPostBackgroundColor(hudColorIndex) end
  EndTextCommandThefeedPostMessagetext(textureDict, textureDict, false, iconType, sender, subject)
  EndTextCommandThefeedPostTicker(flash or false, saveToBrief)
end

function ShowHelpNotification(msg, thisFrame, beep, duration)
  AddTextEntry('terHelpNotification', msg)

  if thisFrame then
    DisplayHelpTextThisFrame('terHelpNotification', false)
  else
    if beep == nil then beep = false end
    BeginTextCommandDisplayHelp('terHelpNotification')
    EndTextCommandDisplayHelp(0, false, beep, duration or -1)
  end
end

function CreateBlip(pos,sprite,color,text,scale,display,shortRange,highDetail)
  local blip = AddBlipForCoord(pos.x,pos.y,pos.z)
  SetBlipSprite               (blip, (sprite or 1))
  SetBlipColour               (blip, (color or 4))
  SetBlipScale                (blip, (scale or 1.0))
  SetBlipDisplay              (blip, (display or 3))
  SetBlipAsShortRange         (blip, (shortRange or false))
  SetBlipHighDetail           (blip, (highDetail or true))
  BeginTextCommandSetBlipName ("STRING")
  AddTextComponentString      ((text or "Blip "..tostring(blip)))
  EndTextCommandSetBlipName   (blip)
  return blip
end