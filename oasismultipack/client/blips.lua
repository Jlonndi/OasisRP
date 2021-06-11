local blips = {
	{title="Lawyers Office", colour=18, id=525, x = -1576.62, y = -572.11, z = 116.33, radius = 80.0},
	{title="Palm Properties", colour=69, id=375, x = -76.41, y = -818.71, z = 326.18, radius = 80.0},
	{title="Therapy Office", colour=3, id=197, x = -1905.82, y = -574.32, z = 19.09, radius = 80.0},
	{title="Vangelico Jewelery", colour=34, id=439, x = -621.66, y = -230.55, z = 38.06, radius = 40.0},
	{title="Mayors Office", colour=0, id=419, x = -567.61, y = -196.33, z = 38.21, radius = 80.0},


  }

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 1.0)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end) 


