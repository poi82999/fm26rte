local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = "Football Manager Cheat Engine Table Presets"
L1_1 = "FMCETablePresets"
L2_1 = "26.1.1.0"
L3_1 = "tdg6661"
L4_1 = ""
L5_1 = string
L5_1 = L5_1.format
L6_1 = string
L6_1 = L6_1.empty
if not L6_1 then
  L6_1 = STRING_EMPTY
  if not L6_1 then
    L6_1 = ""
  end
end
L7_1 = translate
L8_1 = {}
L8_1.Name = L0_1
L8_1.ClassName = L1_1
L8_1.Version = L2_1
L8_1.Author = L3_1
L8_1.License = L4_1
FMCETablePresets = L8_1
L8_1 = {}
scriptDisable = L8_1

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = getAddressSafe
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isClub
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_17
    end
  end
  L2_2 = readQword
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_17::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isClub
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_30
    end
  end
  L2_2 = readQword
  L3_2 = "ptrClub"
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_30::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isClub
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L2_2 = readQword
  L3_2 = cluo
  L3_2 = L3_2.Cino
  L3_2 = L1_2 + L3_2
  L2_2 = L2_2(L3_2)
  L3_2 = readQword
  L4_2 = cluo
  L4_2 = L4_2.Cint
  L4_2 = L1_2 + L4_2
  L3_2 = L3_2(L4_2)
  L4_2 = getAddressSafe
  L5_2 = readQword
  L6_2 = cluo
  L6_2 = L6_2.Cnam
  L6_2 = L1_2 + L6_2
  L5_2 = L5_2(L6_2)
  L5_2 = L5_2 + 4
  L4_2 = L4_2(L5_2)
  L5_2 = getAddressSafe
  L6_2 = readQword
  L7_2 = cluo
  L7_2 = L7_2.Csnm
  L7_2 = L1_2 + L7_2
  L6_2 = L6_2(L7_2)
  L6_2 = L6_2 + 4
  L5_2 = L5_2(L6_2)
  L6_2 = getAddressSafe
  L7_2 = readQword
  L8_2 = cluo
  L8_2 = L8_2.Csxn
  L8_2 = L3_2 + L8_2
  L7_2 = L7_2(L8_2)
  L7_2 = L7_2 + 4
  L6_2 = L6_2(L7_2)
  L7_2 = getAddressSafe
  L8_2 = readQword
  L9_2 = cluo
  L9_2 = L9_2.Tcnn
  L9_2 = L2_2 + L9_2
  L8_2 = L8_2(L9_2)
  L8_2 = L8_2 + 4
  L7_2 = L7_2(L8_2)
  L8_2 = changeString
  L9_2 = L4_2
  L10_2 = "Full Name"
  L8_2(L9_2, L10_2)
  L8_2 = changeString
  L9_2 = L5_2
  L10_2 = "Short Name"
  L8_2(L9_2, L10_2)
  L8_2 = changeString
  L9_2 = L6_2
  L10_2 = "Six Letter Name"
  L8_2(L9_2, L10_2)
  L8_2 = changeString
  L9_2 = L7_2
  L10_2 = "Nickname"
  L8_2(L9_2, L10_2)
  return
end

changeClubName = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "changeClubName"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L3_2 = getAddressSafe
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isClub
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_17
    end
  end
  L4_2 = readQword
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L3_2 = L4_2
  ::lbl_17::
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isClub
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_30
    end
  end
  L4_2 = readQword
  L5_2 = "ptrClub"
  L4_2 = L4_2(L5_2)
  L3_2 = L4_2
  ::lbl_30::
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isClub
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L4_2 = readQword
  L5_2 = readQword
  L6_2 = L3_2 + 24
  L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L5_2(L6_2)
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  if L4_2 == nil or L4_2 == 0 then
    L5_2 = nil
    return L5_2
  end
  L5_2 = readQword
  L6_2 = L4_2 + 56
  L5_2 = L5_2(L6_2)
  L6_2 = readQword
  L7_2 = L4_2 + 64
  L6_2 = L6_2(L7_2)
  L7_2 = 0
  L8_2 = os
  L8_2 = L8_2.clock
  L8_2 = L8_2()
  if A1_2 == 0 then
    L9_2 = forEachPlayerInClub
    L10_2 = L3_2
    
    function L11_2(A0_3, A1_3)
      local L2_3, L3_3, L4_3
      L2_3 = matchCA_PA
      L3_3 = getPersonFromPlayer
      L4_3 = A1_3
      L3_3, L4_3 = L3_3(L4_3)
      L2_3(L3_3, L4_3)
      L2_3 = L7_2
      L2_3 = L2_3 + 1
      L7_2 = L2_3
    end
    
    L9_2(L10_2, L11_2)
  elseif A1_2 == 1 then
    L9_2 = forEach
    L10_2 = L5_2
    L11_2 = L6_2
    L12_2 = 8
    
    function L13_2(A0_3, A1_3)
      local L2_3, L3_3, L4_3, L5_3
      L2_3 = readQword
      L3_3 = A1_3
      L2_3 = L2_3(L3_3)
      L3_3 = isPlayer
      L4_3 = getPersonFromPlayer
      L5_3 = L2_3
      L4_3, L5_3 = L4_3(L5_3)
      L3_3 = L3_3(L4_3, L5_3)
      if not L3_3 then
        return
      end
      L3_3 = matchCA_PA
      L4_3 = getPersonFromPlayer
      L5_3 = L2_3
      L4_3, L5_3 = L4_3(L5_3)
      L3_3(L4_3, L5_3)
      L3_3 = L7_2
      L3_3 = L3_3 + 1
      L7_2 = L3_3
    end
    
    L9_2(L10_2, L11_2, L12_2, L13_2)
  else
    L9_2 = nil
    return L9_2
  end
  if A2_2 then
    L9_2 = MessageDialog
    L10_2 = string
    L10_2 = L10_2.format
    L11_2 = [[
		Item(s) edited : %d
		Elapsed time is: %.3f s
		]]
    L12_2 = L7_2
    L13_2 = os
    L13_2 = L13_2.clock
    L13_2 = L13_2()
    L13_2 = L13_2 - L8_2
    L10_2 = L10_2(L11_2, L12_2, L13_2)
    L11_2 = 2
    return L9_2(L10_2, L11_2)
  end
  return
end

matchTeamCA_PA = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "matchTeamCA_PA"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = getAddressSafe
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isClubOrNation
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_17
    end
  end
  L3_2 = readQword
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L2_2 = L3_2
  ::lbl_17::
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isClubOrNation
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_27
    end
  end
  do return end
  ::lbl_27::
  L3_2 = 0
  L4_2 = os
  L4_2 = L4_2.clock
  L4_2 = L4_2()
  L5_2 = forEachPlayerInClub
  L6_2 = L2_2
  
  function L7_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L2_3 = removePlayerBans
    L3_3 = getPersonFromPlayer
    L4_3 = A1_3
    L3_3, L4_3 = L3_3(L4_3)
    L2_3(L3_3, L4_3)
    L2_3 = L3_2
    L2_3 = L2_3 + 1
    L3_2 = L2_3
  end
  
  L5_2(L6_2, L7_2)
  if A1_2 then
    L5_2 = MessageDialog
    L6_2 = string
    L6_2 = L6_2.format
    L7_2 = [[
		Item(s) edited : %d
		Elapsed time is: %.3f s
		]]
    L8_2 = L3_2
    L9_2 = os
    L9_2 = L9_2.clock
    L9_2 = L9_2()
    L9_2 = L9_2 - L4_2
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    L7_2 = 2
    return L5_2(L6_2, L7_2)
  end
  return
end

removeTeamBans = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "removeTeamBans"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L3_2 = getAddressSafe
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isClubOrNation
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_17
    end
  end
  L4_2 = readQword
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L3_2 = L4_2
  ::lbl_17::
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isClubOrNation
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_27
    end
  end
  do return end
  ::lbl_27::
  L4_2 = 0
  L5_2 = os
  L5_2 = L5_2.clock
  L5_2 = L5_2()
  L6_2 = forEachPlayerInClub
  L7_2 = L3_2
  
  function L8_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L2_3 = removePlayerInjuries
    L3_3 = getPersonFromPlayer
    L4_3 = A1_3
    L3_3 = L3_3(L4_3)
    L4_3 = A1_2
    L2_3(L3_3, L4_3)
    L2_3 = L4_2
    L2_3 = L2_3 + 1
    L4_2 = L2_3
  end
  
  L6_2(L7_2, L8_2)
  if A2_2 then
    L6_2 = MessageDialog
    L7_2 = string
    L7_2 = L7_2.format
    L8_2 = [[
		Item(s) edited : %d
		Elapsed time is: %.3f s
		]]
    L9_2 = L4_2
    L10_2 = os
    L10_2 = L10_2.clock
    L10_2 = L10_2()
    L10_2 = L10_2 - L5_2
    L7_2 = L7_2(L8_2, L9_2, L10_2)
    L8_2 = 2
    return L6_2(L7_2, L8_2)
  end
  return
end

removeTeamInjuries = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "removeTeamInjuries"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L3_2 = getAddressSafe
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isClubOrNation
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_17
    end
  end
  L4_2 = readQword
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L3_2 = L4_2
  ::lbl_17::
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isClubOrNation
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_27
    end
  end
  do return end
  ::lbl_27::
  L4_2 = 0
  L5_2 = os
  L5_2 = L5_2.clock
  L5_2 = L5_2()
  L6_2 = forEachPlayerInClub
  L7_2 = L3_2
  
  function L8_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3
    L2_3 = getPersonFromPlayer
    L3_3 = A1_3
    L2_3 = L2_3(L3_3)
    L3_3 = isInjured
    L4_3 = L2_3
    L3_3 = L3_3(L4_3)
    if not L3_3 then
      L3_3 = removePlayerInjuries
      L4_3 = L2_3
      L5_3 = A1_2
      L6_3 = true
      L3_3(L4_3, L5_3, L6_3)
      L3_3 = L4_2
      L3_3 = L3_3 + 1
      L4_2 = L3_3
    end
  end
  
  L6_2(L7_2, L8_2)
  if A2_2 then
    L6_2 = MessageDialog
    L7_2 = string
    L7_2 = L7_2.format
    L8_2 = [[
		Item(s) edited : %d
		Elapsed time is: %.3f s
		]]
    L9_2 = L4_2
    L10_2 = os
    L10_2 = L10_2.clock
    L10_2 = L10_2()
    L10_2 = L10_2 - L5_2
    L7_2 = L7_2(L8_2, L9_2, L10_2)
    L8_2 = 2
    return L6_2(L7_2, L8_2)
  end
  return
end

improveTeamCondition = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "improveTeamCondition"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = getAddressSafe
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isClubOrNation
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_17
    end
  end
  L3_2 = readQword
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L2_2 = L3_2
  ::lbl_17::
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isClubOrNation
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_27
    end
  end
  do return end
  ::lbl_27::
  L3_2 = 0
  L4_2 = os
  L4_2 = L4_2.clock
  L4_2 = L4_2()
  L5_2 = forEachPlayerInClub
  L6_2 = L2_2
  
  function L7_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L2_3 = writeSmallInteger
    L3_3 = plao
    L3_3 = L3_3.Popc
    L3_3 = A1_3 + L3_3
    L4_3 = 5000
    L2_3(L3_3, L4_3)
    L2_3 = writeSmallInteger
    L3_3 = plao
    L3_3 = L3_3.Pmsh
    L3_3 = A1_3 + L3_3
    L4_3 = 5000
    L2_3(L3_3, L4_3)
    L2_3 = writeSmallInteger
    L3_3 = plao
    L3_3 = L3_3.Pftg
    L3_3 = A1_3 + L3_3
    L4_3 = 1000
    L2_3(L3_3, L4_3)
    L2_3 = writeByte
    L3_3 = plao
    L3_3 = L3_3.Pmor
    L3_3 = A1_3 + L3_3
    L4_3 = 1
    L2_3(L3_3, L4_3)
    L2_3 = L3_2
    L2_3 = L2_3 + 1
    L3_2 = L2_3
  end
  
  L5_2(L6_2, L7_2)
  if A1_2 then
    L5_2 = MessageDialog
    L6_2 = string
    L6_2 = L6_2.format
    L7_2 = [[
		Item(s) edited : %d
		Elapsed time is: %.3f s
		]]
    L8_2 = L3_2
    L9_2 = os
    L9_2 = L9_2.clock
    L9_2 = L9_2()
    L9_2 = L9_2 - L4_2
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    L7_2 = 2
    return L5_2(L6_2, L7_2)
  end
  return
end

destroyTeam = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "destroyTeam"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = getAddressSafe
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isClubOrNation
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_17
    end
  end
  L3_2 = readQword
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L2_2 = L3_2
  ::lbl_17::
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isClubOrNation
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_27
    end
  end
  do return end
  ::lbl_27::
  L3_2 = 0
  L4_2 = os
  L4_2 = L4_2.clock
  L4_2 = L4_2()
  L5_2 = forEachPlayerInClub
  L6_2 = L2_2
  
  function L7_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L2_3 = removePlayerUnhappiness
    L3_3 = getPersonFromPlayer
    L4_3 = A1_3
    L3_3, L4_3 = L3_3(L4_3)
    L2_3(L3_3, L4_3)
    L2_3 = L3_2
    L2_3 = L2_3 + 1
    L3_2 = L2_3
  end
  
  L5_2(L6_2, L7_2)
  if A1_2 then
    L5_2 = MessageDialog
    L6_2 = string
    L6_2 = L6_2.format
    L7_2 = [[
		Item(s) edited : %d
		Elapsed time is: %.3f s
		]]
    L8_2 = L3_2
    L9_2 = os
    L9_2 = L9_2.clock
    L9_2 = L9_2()
    L9_2 = L9_2 - L4_2
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    L7_2 = 2
    return L5_2(L6_2, L7_2)
  end
  return
end

removeTeamUnhappiness = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "removeTeamUnhappiness"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = getAddressSafe
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isClubOrNation
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_17
    end
  end
  L3_2 = readQword
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L2_2 = L3_2
  ::lbl_17::
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isClubOrNation
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_27
    end
  end
  do return end
  ::lbl_27::
  L3_2 = 0
  L4_2 = os
  L4_2 = L4_2.clock
  L4_2 = L4_2()
  L5_2 = forEachPlayerInClub
  L6_2 = L2_2
  
  function L7_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L2_3 = maxTrainingHappiness
    L3_3 = getPersonFromPlayer
    L4_3 = A1_3
    L3_3, L4_3 = L3_3(L4_3)
    L2_3(L3_3, L4_3)
    L2_3 = L3_2
    L2_3 = L2_3 + 1
    L3_2 = L2_3
  end
  
  L5_2(L6_2, L7_2)
  if A1_2 then
    L5_2 = MessageDialog
    L6_2 = string
    L6_2 = L6_2.format
    L7_2 = [[
		Item(s) edited : %d
		Elapsed time is: %.3f s
		]]
    L8_2 = L3_2
    L9_2 = os
    L9_2 = L9_2.clock
    L9_2 = L9_2()
    L9_2 = L9_2 - L4_2
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    L7_2 = 2
    return L5_2(L6_2, L7_2)
  end
  return
end

maxTeamTrainingHappiness = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "maxTeamTrainingHappiness"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = getAddressSafe
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isClubOrNation
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_17
    end
  end
  L3_2 = readQword
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L2_2 = L3_2
  ::lbl_17::
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isClubOrNation
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_27
    end
  end
  do return end
  ::lbl_27::
  L3_2 = 0
  L4_2 = os
  L4_2 = L4_2.clock
  L4_2 = L4_2()
  L5_2 = forEachPlayerInClub
  L6_2 = L2_2
  
  function L7_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3
    if A1_3 == nil or A1_3 == 0 then
      L2_3 = nil
      return L2_3
    end
    L2_3 = getAddressSafe
    L3_3 = A1_3
    L2_3 = L2_3(L3_3)
    A1_3 = L2_3
    L2_3 = getPersonFromPlayer
    L3_3 = A1_3
    L2_3 = L2_3(L3_3)
    if L2_3 == nil then
      return
    end
    
    function L3_3(A0_4, A1_4)
      local L2_4, L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4
      L2_4 = getAddressSafe
      L3_4 = A0_4
      L2_4 = L2_4(L3_4)
      if L2_4 == nil then
        return
      end
      L3_4 = readQword
      L4_4 = plao
      L4_4 = L4_4.Ptfa
      L4_4 = L2_4 + L4_4
      L3_4 = L3_4(L4_4)
      L2_4 = L3_4
      if L2_4 == nil then
        return
      end
      L3_4 = L2_4
      if L3_4 == nil then
        return
      end
      L4_4 = L2_4 + 224
      if L4_4 == nil then
        return
      end
      L5_4 = 0
      L6_4 = forEach
      L7_4 = L3_4
      L8_4 = L4_4
      L9_4 = 32
      
      function L10_4(A0_5, A1_5)
        local L2_5, L3_5, L4_5, L5_5, L6_5, L7_5, L8_5, L9_5, L10_5
        L2_5 = getAddressSafe
        L3_5 = A1_5
        L2_5 = L2_5(L3_5)
        if L2_5 == nil then
          return
        end
        L3_5 = readQword
        L4_5 = L2_5 + 0
        L3_5 = L3_5(L4_5)
        if L3_5 == nil then
          return
        end
        L4_5 = readQword
        L5_5 = L2_5 + 8
        L4_5 = L4_5(L5_5)
        if L4_5 == nil then
          return
        end
        L5_5 = readInteger
        L6_5 = L2_5 + 24
        L5_5 = L5_5(L6_5)
        L6_5 = A0_5 - 1
        if L5_5 ~= L6_5 then
          return
        end
        L6_5 = forEach
        L7_5 = L3_5
        L8_5 = L4_5
        L9_5 = 4
        
        function L10_5(A0_6, A1_6)
          local L2_6, L3_6, L4_6, L5_6
          L2_6 = A1_4
          L3_6 = A1_6
          L4_6 = L5_5
          L5_6 = A0_6
          L2_6(L3_6, L4_6, L5_6)
        end
        
        L6_5(L7_5, L8_5, L9_5, L10_5)
      end
      
      L6_4(L7_4, L8_4, L9_4, L10_4)
    end
    
    L4_3 = L3_3
    L5_3 = A1_3
    
    function L6_3(A0_4, A1_4, A2_4)
      local L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4
      L3_4 = readInteger
      L4_4 = A0_4
      L3_4 = L3_4(L4_4)
      L4_4 = bAnd
      L5_4 = L3_4
      L6_4 = 16383
      L4_4 = L4_4(L5_4, L6_4)
      L5_4 = bAnd
      L6_4 = L3_4
      L7_4 = 4294950912
      L5_4 = L5_4(L6_4, L7_4)
      if L4_4 < 10000 then
        L6_4 = writeInteger
        L7_4 = A0_4
        L8_4 = bOr
        L9_4 = L5_4
        L10_4 = 10000
        L8_4, L9_4, L10_4 = L8_4(L9_4, L10_4)
        L6_4(L7_4, L8_4, L9_4, L10_4)
      end
    end
    
    L4_3(L5_3, L6_3)
    L4_3 = L3_2
    L4_3 = L4_3 + 1
    L3_2 = L4_3
  end
  
  L5_2(L6_2, L7_2)
  if A1_2 then
    L5_2 = MessageDialog
    L6_2 = string
    L6_2 = L6_2.format
    L7_2 = [[
		Item(s) edited : %d
		Elapsed time is: %.3f s
		]]
    L8_2 = L3_2
    L9_2 = os
    L9_2 = L9_2.clock
    L9_2 = L9_2()
    L9_2 = L9_2 - L4_2
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    L7_2 = 2
    return L5_2(L6_2, L7_2)
  end
  return
end

maxTacticalFamiliarity = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "maxTacticalFamiliarity"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = getAddressSafe
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isClubOrNation
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_17
    end
  end
  L3_2 = readQword
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L2_2 = L3_2
  ::lbl_17::
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isClubOrNation
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_27
    end
  end
  do return end
  ::lbl_27::
  L3_2 = 0
  L4_2 = os
  L4_2 = L4_2.clock
  L4_2 = L4_2()
  L5_2 = forEachPlayerInClub
  L6_2 = L2_2
  
  function L7_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
    L2_3 = getPersonFromPlayer
    L3_3 = A1_3
    L2_3 = L2_3(L3_3)
    if L2_3 == nil or L2_3 == 0 then
      L3_3 = nil
      return L3_3
    end
    L3_3 = readQword
    L4_3 = pero
    L4_3 = L4_3.Ppdt
    L4_3 = L2_3 + L4_3
    L3_3 = L3_3(L4_3)
    if L3_3 == nil or L3_3 == 0 then
      L4_3 = nil
      return L4_3
    end
    L4_3 = readQword
    L5_3 = L3_3 + 24
    L4_3 = L4_3(L5_3)
    startAddr = L4_3
    L4_3 = readQword
    L5_3 = L3_3 + 32
    L4_3 = L4_3(L5_3)
    endAddr = L4_3
    L4_3 = forEach
    L5_3 = startAddr
    L6_3 = endAddr
    L7_3 = 8
    
    function L8_3(A0_4, A1_4)
      local L2_4, L3_4, L4_4
      L2_4 = writeByte
      L3_4 = A1_4 + 5
      L4_4 = 100
      L2_4(L3_4, L4_4)
    end
    
    L4_3(L5_3, L6_3, L7_3, L8_3)
    L4_3 = L3_2
    L4_3 = L4_3 + 1
    L3_2 = L4_3
  end
  
  L5_2(L6_2, L7_2)
  if A1_2 then
    L5_2 = MessageDialog
    L6_2 = string
    L6_2 = L6_2.format
    L7_2 = [[
		Item(s) edited : %d
		Elapsed time is: %.3f s
		]]
    L8_2 = L3_2
    L9_2 = os
    L9_2 = L9_2.clock
    L9_2 = L9_2()
    L9_2 = L9_2 - L4_2
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    L7_2 = 2
    return L5_2(L6_2, L7_2)
  end
  return
end

maxTeamCohesion = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "maxTeamCohesion"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = getAddressSafe
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isClubOrNation
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_17
    end
  end
  L3_2 = readQword
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L2_2 = L3_2
  ::lbl_17::
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isClubOrNation
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_27
    end
  end
  do return end
  ::lbl_27::
  L3_2 = 0
  L4_2 = os
  L4_2 = L4_2.clock
  L4_2 = L4_2()
  L5_2 = forEachTeamInClub
  L6_2 = L2_2
  
  function L7_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L2_3 = readQword
    L3_3 = A1_3
    L2_3 = L2_3(L3_3)
    if L2_3 == nil or L2_3 == 0 then
      return
    end
    L3_3 = forEachTransferOffer
    
    function L4_3(A0_4, A1_4)
      local L2_4, L3_4, L4_4, L5_4, L6_4, L7_4
      L2_4 = readQword
      L3_4 = tfoo
      L3_4 = L3_4.Tmfr
      L3_4 = A1_4 + L3_4
      L2_4 = L2_4(L3_4)
      L3_4 = readQword
      L4_4 = tfoo
      L4_4 = L4_4.Tmt1
      L4_4 = A1_4 + L4_4
      L3_4 = L3_4(L4_4)
      L4_4 = readByte
      L5_4 = tfoo
      L5_4 = L5_4.Ttst
      L5_4 = A1_4 + L5_4
      L4_4 = L4_4(L5_4)
      L5_4 = L2_3
      if L2_4 ~= L5_4 then
        L5_4 = L2_3
      end
      if L3_4 == L5_4 and L4_4 ~= 2 and L4_4 ~= 3 and L4_4 ~= 15 and L4_4 ~= 16 and L4_4 ~= 19 and L4_4 ~= 20 then
        L5_4 = writeByte
        L6_4 = tfoo
        L6_4 = L6_4.Ttst
        L6_4 = A1_4 + L6_4
        L7_4 = 3
        L5_4(L6_4, L7_4)
        L5_4 = L3_2
        L5_4 = L5_4 + 1
        L3_2 = L5_4
      end
    end
    
    L3_3(L4_3)
  end
  
  L5_2(L6_2, L7_2)
  if A1_2 then
    L5_2 = MessageDialog
    L6_2 = string
    L6_2 = L6_2.format
    L7_2 = [[
		Item(s) edited : %d
		Elapsed time is: %.3f s
		]]
    L8_2 = L3_2
    L9_2 = os
    L9_2 = L9_2.clock
    L9_2 = L9_2()
    L9_2 = L9_2 - L4_2
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    L7_2 = 2
    return L5_2(L6_2, L7_2)
  end
  return
end

clubNoTransferActivity = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "clubNoTransferActivity"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L3_2 = getAddressSafe
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isClub
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_17
    end
  end
  L4_2 = readQword
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L3_2 = L4_2
  ::lbl_17::
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isClub
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_30
    end
  end
  L4_2 = readQword
  L5_2 = "ptrClub"
  L4_2 = L4_2(L5_2)
  L3_2 = L4_2
  ::lbl_30::
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isClub
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L4_2 = 0
  L5_2 = os
  L5_2 = L5_2.clock
  L5_2 = L5_2()
  L6_2 = forEachPlayerInClub
  L7_2 = L3_2
  
  function L8_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L2_3 = getPersonFromPlayer
    L3_3 = A1_3
    L2_3 = L2_3(L3_3)
    L3_3 = A1_2
    if L3_3 then
      L3_3 = readByte
      L4_3 = pero
      L4_3 = L4_3.Pada
      L4_3 = L2_3 + L4_3
      L4_3 = L4_3 + 4
      L3_3 = L3_3(L4_3)
      if L3_3 ~= 127 then
        return
      end
      L3_3 = writeByte
      L4_3 = pero
      L4_3 = L4_3.Pada
      L4_3 = L2_3 + L4_3
      L4_3 = L4_3 + 4
      L5_3 = math
      L5_3 = L5_3.random
      L6_3 = 12
      L7_3 = 20
      L5_3, L6_3, L7_3 = L5_3(L6_3, L7_3)
      L3_3(L4_3, L5_3, L6_3, L7_3)
    else
      L3_3 = writeByte
      L4_3 = pero
      L4_3 = L4_3.Pada
      L4_3 = L2_3 + L4_3
      L4_3 = L4_3 + 4
      L5_3 = 127
      L3_3(L4_3, L5_3)
    end
    L3_3 = L4_2
    L3_3 = L3_3 + 1
    L4_2 = L3_3
  end
  
  L6_2(L7_2, L8_2)
  if A2_2 then
    L6_2 = MessageDialog
    L7_2 = string
    L7_2 = L7_2.format
    L8_2 = [[
		Item(s) edited : %d
		Elapsed time is: %.3f s
		]]
    L9_2 = L4_2
    L10_2 = os
    L10_2 = L10_2.clock
    L10_2 = L10_2()
    L10_2 = L10_2 - L5_2
    L7_2 = L7_2(L8_2, L9_2, L10_2)
    L8_2 = 2
    return L6_2(L7_2, L8_2)
  end
  return
end

hackTeamProfessionalism = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "hackTeamProfessionalism"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L2_2 = getAddressSafe
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isClub
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_17
    end
  end
  L3_2 = readQword
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L2_2 = L3_2
  ::lbl_17::
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isClub
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_30
    end
  end
  L3_2 = readQword
  L4_2 = "ptrClub"
  L3_2 = L3_2(L4_2)
  L2_2 = L3_2
  ::lbl_30::
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isClub
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L3_2 = os
  L3_2 = L3_2.clock
  L3_2 = L3_2()
  L4_2 = readQword
  L5_2 = cluo
  L5_2 = L5_2.Cfin
  L5_2 = L2_2 + L5_2
  L4_2 = L4_2(L5_2)
  if L4_2 ~= nil and L4_2 ~= 0 then
    L5_2 = getRTTIClassName
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    if L5_2 ~= "db::CLUB_FINANCE_BASE" then
      goto lbl_58
    end
  end
  do return end
  ::lbl_58::
  L5_2 = readInteger
  L6_2 = cluo
  L6_2 = L6_2.Ccba
  L6_2 = L4_2 + L6_2
  L5_2 = L5_2(L6_2)
  L6_2 = readInteger
  L7_2 = cluo
  L7_2 = L7_2.Ctbu
  L7_2 = L4_2 + L7_2
  L6_2 = L6_2(L7_2)
  L7_2 = readInteger
  L8_2 = cluo
  L8_2 = L8_2.Ctbc
  L8_2 = L4_2 + L8_2
  L7_2 = L7_2(L8_2)
  L8_2 = validateValue
  L9_2 = L5_2 + 400000000
  L10_2 = 0
  L11_2 = 1300000000
  L12_2 = 1300000000
  L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
  L9_2 = validateValue
  L10_2 = L6_2 + 200000000
  L11_2 = 0
  L12_2 = 1300000000
  L13_2 = 1300000000
  L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2)
  L10_2 = validateValue
  L11_2 = L7_2 + 200000000
  L12_2 = 0
  L13_2 = 1300000000
  L14_2 = 1300000000
  L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
  L11_2 = writeInteger
  L12_2 = cluo
  L12_2 = L12_2.Ccba
  L12_2 = L4_2 + L12_2
  L13_2 = L8_2
  L11_2(L12_2, L13_2)
  L11_2 = writeInteger
  L12_2 = cluo
  L12_2 = L12_2.Ctbu
  L12_2 = L4_2 + L12_2
  L13_2 = L9_2
  L11_2(L12_2, L13_2)
  L11_2 = writeInteger
  L12_2 = cluo
  L12_2 = L12_2.Ctbc
  L12_2 = L4_2 + L12_2
  L13_2 = L10_2
  L11_2(L12_2, L13_2)
  L11_2 = writeInteger
  L12_2 = cluo
  L12_2 = L12_2.Crmb
  L12_2 = L4_2 + L12_2
  L13_2 = 6500000
  L11_2(L12_2, L13_2)
  L11_2 = writeInteger
  L12_2 = cluo
  L12_2 = L12_2.Cmwe
  L12_2 = L4_2 + L12_2
  L13_2 = 2000000
  L11_2(L12_2, L13_2)
  if A1_2 then
    L11_2 = MessageDialog
    L12_2 = string
    L12_2 = L12_2.format
    L13_2 = [[
		Operation Success!
		Elapsed time is: %.3f s
		]]
    L14_2 = os
    L14_2 = L14_2.clock
    L14_2 = L14_2()
    L14_2 = L14_2 - L3_2
    L12_2 = L12_2(L13_2, L14_2)
    L13_2 = 2
    return L11_2(L12_2, L13_2)
  end
  return
end

boostFinances = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "boostFinances"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L3_2 = getAddressSafe
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isClub
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_17
    end
  end
  L4_2 = readQword
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L3_2 = L4_2
  ::lbl_17::
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isClub
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_30
    end
  end
  L4_2 = readQword
  L5_2 = "ptrClub"
  L4_2 = L4_2(L5_2)
  L3_2 = L4_2
  ::lbl_30::
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isClub
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L4_2 = os
  L4_2 = L4_2.clock
  L4_2 = L4_2()
  L5_2 = readQword
  L6_2 = cluo
  L6_2 = L6_2.Cfin
  L6_2 = L3_2 + L6_2
  L5_2 = L5_2(L6_2)
  if L5_2 ~= nil and L5_2 ~= 0 then
    L6_2 = getRTTIClassName
    L7_2 = L5_2
    L6_2 = L6_2(L7_2)
    if L6_2 ~= "db::CLUB_FINANCE_BASE" then
      goto lbl_58
    end
  end
  do return end
  ::lbl_58::
  L6_2 = readInteger
  L7_2 = cluo
  L7_2 = L7_2.Ctbu
  L7_2 = L5_2 + L7_2
  L6_2 = L6_2(L7_2)
  L7_2 = readInteger
  L8_2 = cluo
  L8_2 = L8_2.Ctwg
  L8_2 = L5_2 + L8_2
  L7_2 = L7_2(L8_2)
  L8_2 = readInteger
  L9_2 = cluo
  L9_2 = L9_2.Chwp
  L9_2 = L5_2 + L9_2
  L8_2 = L8_2(L9_2)
  L9_2 = validateValue
  L10_2 = L6_2 * 1.25
  L10_2 = L6_2 + L10_2
  L11_2 = 0
  L12_2 = 1300000000
  L13_2 = 1300000000
  L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2)
  L10_2 = validateValue
  L11_2 = A1_2 / 100
  L11_2 = L6_2 * L11_2
  L11_2 = L6_2 + L11_2
  L12_2 = 0
  L13_2 = 1300000000
  L14_2 = 1300000000
  L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
  L11_2 = validateValue
  L12_2 = A1_2 / 100
  L12_2 = L7_2 * L12_2
  L12_2 = L7_2 + L12_2
  L13_2 = 0
  L14_2 = 1300000000
  L15_2 = 1300000000
  L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2)
  L12_2 = validateValue
  L13_2 = A1_2 / 100
  L13_2 = L8_2 * L13_2
  L13_2 = L8_2 + L13_2
  L14_2 = 0
  L15_2 = 1300000000
  L16_2 = 1300000000
  L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2)
  L13_2 = writeInteger
  L14_2 = cluo
  L14_2 = L14_2.Ccba
  L14_2 = L5_2 + L14_2
  L15_2 = L9_2
  L13_2(L14_2, L15_2)
  L13_2 = writeInteger
  L14_2 = cluo
  L14_2 = L14_2.Ctbu
  L14_2 = L5_2 + L14_2
  L15_2 = L10_2
  L13_2(L14_2, L15_2)
  L13_2 = writeInteger
  L14_2 = cluo
  L14_2 = L14_2.Ctbc
  L14_2 = L5_2 + L14_2
  L15_2 = L10_2
  L13_2(L14_2, L15_2)
  L13_2 = writeInteger
  L14_2 = cluo
  L14_2 = L14_2.Crmb
  L14_2 = L5_2 + L14_2
  L15_2 = L11_2
  L13_2(L14_2, L15_2)
  L13_2 = writeInteger
  L14_2 = cluo
  L14_2 = L14_2.Cmwe
  L14_2 = L5_2 + L14_2
  L15_2 = L12_2
  L13_2(L14_2, L15_2)
  if A2_2 then
    L13_2 = MessageDialog
    L14_2 = string
    L14_2 = L14_2.format
    L15_2 = [[
		Operation Success!
		Elapsed time is: %.3f s
		]]
    L16_2 = os
    L16_2 = L16_2.clock
    L16_2 = L16_2()
    L16_2 = L16_2 - L4_2
    L14_2 = L14_2(L15_2, L16_2)
    L15_2 = 2
    return L13_2(L14_2, L15_2)
  end
  return
end

adjustFinances = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "adjustFinances"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = getAddressSafe
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isClub
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_17
    end
  end
  L2_2 = readQword
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_17::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isClub
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_30
    end
  end
  L2_2 = readQword
  L3_2 = "ptrClub"
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_30::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isClub
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L2_2 = readQword
  L3_2 = cluo
  L3_2 = L3_2.Cfin
  L3_2 = L1_2 + L3_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = getRTTIClassName
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 ~= "db::CLUB_FINANCE_BASE" then
      goto lbl_55
    end
  end
  do return end
  ::lbl_55::
  L3_2 = writeInteger
  L4_2 = cluo
  L4_2 = L4_2.Ccba
  L4_2 = L2_2 + L4_2
  L5_2 = 400000000
  L3_2(L4_2, L5_2)
  L3_2 = writeInteger
  L4_2 = cluo
  L4_2 = L4_2.Ctbu
  L4_2 = L2_2 + L4_2
  L5_2 = 200000000
  L3_2(L4_2, L5_2)
  L3_2 = writeInteger
  L4_2 = cluo
  L4_2 = L4_2.Ctbc
  L4_2 = L2_2 + L4_2
  L5_2 = 200000000
  L3_2(L4_2, L5_2)
  L3_2 = writeInteger
  L4_2 = cluo
  L4_2 = L4_2.Crmb
  L4_2 = L2_2 + L4_2
  L5_2 = 6500000
  L3_2(L4_2, L5_2)
  L3_2 = writeInteger
  L4_2 = cluo
  L4_2 = L4_2.Cmwe
  L4_2 = L2_2 + L4_2
  L5_2 = 2000000
  L3_2(L4_2, L5_2)
  return
end

freezeFinances = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "freezeFinances"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = getAddressSafe
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isClub
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_17
    end
  end
  L3_2 = readQword
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L2_2 = L3_2
  ::lbl_17::
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isClub
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_30
    end
  end
  L3_2 = readQword
  L4_2 = "ptrClub"
  L3_2 = L3_2(L4_2)
  L2_2 = L3_2
  ::lbl_30::
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isClub
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L3_2 = os
  L3_2 = L3_2.clock
  L3_2 = L3_2()
  L4_2 = readQword
  L5_2 = cluo
  L5_2 = L5_2.Cint
  L5_2 = L2_2 + L5_2
  L4_2 = L4_2(L5_2)
  if L4_2 == nil or L4_2 == 0 then
    return
  end
  L5_2 = readQword
  L6_2 = cluo
  L6_2 = L6_2.Cdbt
  L6_2 = L4_2 + L6_2
  L5_2 = L5_2(L6_2)
  if L5_2 ~= nil and L5_2 ~= 0 then
    L6_2 = writeQword
    L7_2 = getAddressSafe
    L8_2 = cluo
    L8_2 = L8_2.Cdbt
    L8_2 = L4_2 + L8_2
    L8_2 = L8_2 + 8
    L7_2 = L7_2(L8_2)
    L8_2 = L5_2
    L6_2(L7_2, L8_2)
  end
  if A1_2 then
    L6_2 = MessageDialog
    L7_2 = string
    L7_2 = L7_2.format
    L8_2 = [[
		Operation Success!
		Elapsed time is: %.3f s
		]]
    L9_2 = os
    L9_2 = L9_2.clock
    L9_2 = L9_2()
    L9_2 = L9_2 - L3_2
    L7_2 = L7_2(L8_2, L9_2)
    L8_2 = 2
    return L6_2(L7_2, L8_2)
  end
  return
end

removeClubDebtsLoans = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "removeClubDebtsLoans"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L3_2 = getAddressSafe
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isClub
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_17
    end
  end
  L4_2 = readQword
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L3_2 = L4_2
  ::lbl_17::
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isClub
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_30
    end
  end
  L4_2 = readQword
  L5_2 = "ptrClub"
  L4_2 = L4_2(L5_2)
  L3_2 = L4_2
  ::lbl_30::
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isClub
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L4_2 = 0
  L5_2 = os
  L5_2 = L5_2.clock
  L5_2 = L5_2()
  L6_2 = forEachPlayerInClub
  L7_2 = L3_2
  
  function L8_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3
    L2_3 = getPersonFromPlayer
    L3_3 = A1_3
    L2_3 = L2_3(L3_3)
    L3_3 = removePersonClausesBonuses
    L4_3 = L2_3
    L5_3 = A1_2
    L3_3(L4_3, L5_3)
    L3_3 = L4_2
    L3_3 = L3_3 + 1
    L4_2 = L3_3
  end
  
  L6_2(L7_2, L8_2)
  if A2_2 then
    L6_2 = MessageDialog
    L7_2 = string
    L7_2 = L7_2.format
    L8_2 = [[
		Item(s) edited : %d
		Elapsed time is: %.3f s
		]]
    L9_2 = L4_2
    L10_2 = os
    L10_2 = L10_2.clock
    L10_2 = L10_2()
    L10_2 = L10_2 - L5_2
    L7_2 = L7_2(L8_2, L9_2, L10_2)
    L8_2 = 2
    return L6_2(L7_2, L8_2)
  end
  return
end

removeTeamClausesBonuses = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "removeTeamClausesBonuses"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L4_2 = getAddressSafe
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  if L4_2 ~= nil and L4_2 ~= 0 then
    L5_2 = isClub
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      goto lbl_17
    end
  end
  L5_2 = readQword
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  L4_2 = L5_2
  ::lbl_17::
  if L4_2 ~= nil and L4_2 ~= 0 then
    L5_2 = isClub
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      goto lbl_30
    end
  end
  L5_2 = readQword
  L6_2 = "ptrClub"
  L5_2 = L5_2(L6_2)
  L4_2 = L5_2
  ::lbl_30::
  if L4_2 ~= nil and L4_2 ~= 0 then
    L5_2 = isClub
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L5_2 = 0
  L6_2 = os
  L6_2 = L6_2.clock
  L6_2 = L6_2()
  L7_2 = forEachPlayerInClub
  L8_2 = L4_2
  
  function L9_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
    L2_3 = getPersonFromPlayer
    L3_3 = A1_3
    L2_3 = L2_3(L3_3)
    L3_3 = readQword
    L4_3 = pero
    L4_3 = L4_3.Pflc
    L4_3 = L2_3 + L4_3
    L3_3 = L3_3(L4_3)
    L4_3 = readBit
    L5_3 = pero
    L5_3 = L5_3.Pffl
    L5_3 = L3_3 + L5_3
    L6_3 = 0
    L4_3 = L4_3(L5_3, L6_3)
    L4_3 = L4_3 == 1
    if L4_3 then
      return
    end
    L5_3 = extendPersonContract
    L6_3 = L2_3
    L7_3 = A1_2
    L8_3 = A2_2
    L5_3(L6_3, L7_3, L8_3)
    L5_3 = L5_2
    L5_3 = L5_3 + 1
    L5_2 = L5_3
  end
  
  L7_2(L8_2, L9_2)
  if A3_2 then
    L7_2 = MessageDialog
    L8_2 = string
    L8_2 = L8_2.format
    L9_2 = [[
		Item(s) edited : %d
		Elapsed time is: %.3f s
		]]
    L10_2 = L5_2
    L11_2 = os
    L11_2 = L11_2.clock
    L11_2 = L11_2()
    L11_2 = L11_2 - L6_2
    L8_2 = L8_2(L9_2, L10_2, L11_2)
    L9_2 = 2
    return L7_2(L8_2, L9_2)
  end
  return
end

extendAllPlayersContract = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "extendAllPlayersContract"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L4_2 = getAddressSafe
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  if L4_2 ~= nil and L4_2 ~= 0 then
    L5_2 = isClub
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      goto lbl_17
    end
  end
  L5_2 = readQword
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  L4_2 = L5_2
  ::lbl_17::
  if L4_2 ~= nil and L4_2 ~= 0 then
    L5_2 = isClub
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      goto lbl_30
    end
  end
  L5_2 = readQword
  L6_2 = "ptrClub"
  L5_2 = L5_2(L6_2)
  L4_2 = L5_2
  ::lbl_30::
  if L4_2 ~= nil and L4_2 ~= 0 then
    L5_2 = isClub
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L5_2 = os
  L5_2 = L5_2.clock
  L5_2 = L5_2()
  L6_2 = readQword
  L7_2 = L4_2 + 320
  L6_2 = L6_2(L7_2)
  if L6_2 ~= nil then
    L6_2 = readQword
    L7_2 = L4_2 + 320
    L6_2 = L6_2(L7_2)
    if L6_2 ~= 0 then
      L6_2 = extendPersonContract
      L7_2 = getPersonFromPlayer
      L8_2 = readQword
      L9_2 = L4_2 + 320
      L8_2, L9_2 = L8_2(L9_2)
      L7_2 = L7_2(L8_2, L9_2)
      L8_2 = A1_2
      L9_2 = A2_2
      L6_2(L7_2, L8_2, L9_2)
    end
  end
  L6_2 = forEachCoachInClub
  L7_2 = L4_2
  
  function L8_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3
    L2_3 = extendPersonContract
    L3_3 = getPersonFromPlayer
    L4_3 = A1_3
    L3_3 = L3_3(L4_3)
    L4_3 = A1_2
    L5_3 = A2_2
    L2_3(L3_3, L4_3, L5_3)
  end
  
  L6_2(L7_2, L8_2)
  L6_2 = forEachMedicalInClub
  L7_2 = L4_2
  
  function L8_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3
    L2_3 = extendPersonContract
    L3_3 = getPersonFromPlayer
    L4_3 = A1_3
    L3_3 = L3_3(L4_3)
    L4_3 = A1_2
    L5_3 = A2_2
    L2_3(L3_3, L4_3, L5_3)
  end
  
  L6_2(L7_2, L8_2)
  L6_2 = forEachRecruiterInClub
  L7_2 = L4_2
  
  function L8_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3
    L2_3 = extendPersonContract
    L3_3 = getPersonFromPlayer
    L4_3 = A1_3
    L3_3 = L3_3(L4_3)
    L4_3 = A1_2
    L5_3 = A2_2
    L2_3(L3_3, L4_3, L5_3)
  end
  
  L6_2(L7_2, L8_2)
  if A3_2 then
    L6_2 = MessageDialog
    L7_2 = string
    L7_2 = L7_2.format
    L8_2 = [[
		Operation Success!
		Elapsed time is: %.3f s
		]]
    L9_2 = os
    L9_2 = L9_2.clock
    L9_2 = L9_2()
    L9_2 = L9_2 - L5_2
    L7_2 = L7_2(L8_2, L9_2)
    L8_2 = 2
    return L6_2(L7_2, L8_2)
  end
  return
end

extendAllStaffContract = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "extendAllStaffContract"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L3_2 = getAddressSafe
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isClub
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_17
    end
  end
  L4_2 = readQword
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L3_2 = L4_2
  ::lbl_17::
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isClub
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_30
    end
  end
  L4_2 = readQword
  L5_2 = "ptrClub"
  L4_2 = L4_2(L5_2)
  L3_2 = L4_2
  ::lbl_30::
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isClub
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L4_2 = 0
  L5_2 = os
  L5_2 = L5_2.clock
  L5_2 = L5_2()
  L6_2 = forEachPlayerInClub
  L7_2 = L3_2
  
  function L8_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L2_3 = getPersonFromPlayer
    L3_3 = A1_3
    L2_3 = L2_3(L3_3)
    L3_3 = readQword
    L4_3 = pero
    L4_3 = L4_3.Pflc
    L4_3 = L2_3 + L4_3
    L3_3 = L3_3(L4_3)
    L4_3 = readBit
    L5_3 = pero
    L5_3 = L5_3.Pffl
    L5_3 = L3_3 + L5_3
    L6_3 = 0
    L4_3 = L4_3(L5_3, L6_3)
    L4_3 = L4_3 == 1
    if L4_3 then
      return
    end
    L5_3 = lifetimeContract
    L6_3 = L2_3
    L7_3 = A1_2
    L5_3(L6_3, L7_3)
    L5_3 = L4_2
    L5_3 = L5_3 + 1
    L4_2 = L5_3
  end
  
  L6_2(L7_2, L8_2)
  if A2_2 then
    L6_2 = MessageDialog
    L7_2 = string
    L7_2 = L7_2.format
    L8_2 = [[
		Item(s) edited : %d
		Elapsed time is: %.3f s
		]]
    L9_2 = L4_2
    L10_2 = os
    L10_2 = L10_2.clock
    L10_2 = L10_2()
    L10_2 = L10_2 - L5_2
    L7_2 = L7_2(L8_2, L9_2, L10_2)
    L8_2 = 2
    return L6_2(L7_2, L8_2)
  end
  return
end

lifetimeContractAllPlayers = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "lifetimeContractAllPlayers"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = getAddressSafe
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isClub
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_17
    end
  end
  L4_2 = readQword
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L3_2 = L4_2
  ::lbl_17::
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isClub
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_30
    end
  end
  L4_2 = readQword
  L5_2 = "ptrClub"
  L4_2 = L4_2(L5_2)
  L3_2 = L4_2
  ::lbl_30::
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isClub
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L4_2 = os
  L4_2 = L4_2.clock
  L4_2 = L4_2()
  L5_2 = readQword
  L6_2 = cluo
  L6_2 = L6_2.Cdof
  L6_2 = L3_2 + L6_2
  L5_2 = L5_2(L6_2)
  if L5_2 ~= nil and L5_2 ~= 0 then
    L6_2 = lifetimeContract
    L7_2 = getPersonFromPlayer
    L8_2 = L5_2
    L7_2 = L7_2(L8_2)
    L8_2 = A1_2
    L6_2(L7_2, L8_2)
  end
  L6_2 = forEachCoachInClub
  L7_2 = L3_2
  
  function L8_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L2_3 = lifetimeContract
    L3_3 = getPersonFromPlayer
    L4_3 = A1_3
    L3_3 = L3_3(L4_3)
    L4_3 = A1_2
    L2_3(L3_3, L4_3)
  end
  
  L6_2(L7_2, L8_2)
  L6_2 = forEachMedicalInClub
  L7_2 = L3_2
  
  function L8_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L2_3 = lifetimeContract
    L3_3 = getPersonFromPlayer
    L4_3 = A1_3
    L3_3 = L3_3(L4_3)
    L4_3 = A1_2
    L2_3(L3_3, L4_3)
  end
  
  L6_2(L7_2, L8_2)
  L6_2 = forEachRecruiterInClub
  L7_2 = L3_2
  
  function L8_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L2_3 = lifetimeContract
    L3_3 = getPersonFromPlayer
    L4_3 = A1_3
    L3_3 = L3_3(L4_3)
    L4_3 = A1_2
    L2_3(L3_3, L4_3)
  end
  
  L6_2(L7_2, L8_2)
  if A2_2 then
    L6_2 = MessageDialog
    L7_2 = string
    L7_2 = L7_2.format
    L8_2 = [[
		Operation Success!
		Elapsed time is: %.3f s
		]]
    L9_2 = os
    L9_2 = L9_2.clock
    L9_2 = L9_2()
    L9_2 = L9_2 - L4_2
    L7_2 = L7_2(L8_2, L9_2)
    L8_2 = 2
    return L6_2(L7_2, L8_2)
  end
  return
end

lifetimeContractAllStaff = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "lifetimeContractAllStaff"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L3_2 = getAddressSafe
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isClub
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_17
    end
  end
  L4_2 = readQword
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L3_2 = L4_2
  ::lbl_17::
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isClub
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_30
    end
  end
  L4_2 = readQword
  L5_2 = "ptrClub"
  L4_2 = L4_2(L5_2)
  L3_2 = L4_2
  ::lbl_30::
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isClub
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L4_2 = 0
  L5_2 = os
  L5_2 = L5_2.clock
  L5_2 = L5_2()
  L6_2 = forEachPlayerInClub
  L7_2 = L3_2
  
  function L8_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L2_3 = cutPersonWage
    L3_3 = getPersonFromPlayer
    L4_3 = A1_3
    L3_3 = L3_3(L4_3)
    L4_3 = A1_2
    L2_3(L3_3, L4_3)
    L2_3 = L4_2
    L2_3 = L2_3 + 1
    L4_2 = L2_3
  end
  
  L6_2(L7_2, L8_2)
  if A2_2 then
    L6_2 = MessageDialog
    L7_2 = string
    L7_2 = L7_2.format
    L8_2 = [[
		Item(s) edited : %d
		Elapsed time is: %.3f s
		]]
    L9_2 = L4_2
    L10_2 = os
    L10_2 = L10_2.clock
    L10_2 = L10_2()
    L10_2 = L10_2 - L5_2
    L7_2 = L7_2(L8_2, L9_2, L10_2)
    L8_2 = 2
    return L6_2(L7_2, L8_2)
  end
  return
end

cutAllPlayersWage = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "cutAllPlayersWage"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L3_2 = getAddressSafe
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isClub
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_17
    end
  end
  L4_2 = readQword
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L3_2 = L4_2
  ::lbl_17::
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isClub
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_30
    end
  end
  L4_2 = readQword
  L5_2 = "ptrClub"
  L4_2 = L4_2(L5_2)
  L3_2 = L4_2
  ::lbl_30::
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isClub
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L4_2 = os
  L4_2 = L4_2.clock
  L4_2 = L4_2()
  L5_2 = readQword
  L6_2 = cluo
  L6_2 = L6_2.Cdof
  L6_2 = L3_2 + L6_2
  L5_2 = L5_2(L6_2)
  if L5_2 ~= nil then
    L5_2 = readQword
    L6_2 = cluo
    L6_2 = L6_2.Cdof
    L6_2 = L3_2 + L6_2
    L5_2 = L5_2(L6_2)
    if L5_2 ~= 0 then
      L5_2 = cutPersonWage
      L6_2 = getPersonFromPlayer
      L7_2 = readQword
      L8_2 = cluo
      L8_2 = L8_2.Cdof
      L8_2 = L3_2 + L8_2
      L7_2, L8_2 = L7_2(L8_2)
      L6_2 = L6_2(L7_2, L8_2)
      L7_2 = A1_2
      L5_2(L6_2, L7_2)
    end
  end
  L5_2 = forEachCoachInClub
  L6_2 = L3_2
  
  function L7_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L2_3 = cutPersonWage
    L3_3 = getPersonFromPlayer
    L4_3 = A1_3
    L3_3 = L3_3(L4_3)
    L4_3 = A1_2
    L2_3(L3_3, L4_3)
  end
  
  L5_2(L6_2, L7_2)
  L5_2 = forEachMedicalInClub
  L6_2 = L3_2
  
  function L7_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L2_3 = cutPersonWage
    L3_3 = getPersonFromPlayer
    L4_3 = A1_3
    L3_3 = L3_3(L4_3)
    L4_3 = A1_2
    L2_3(L3_3, L4_3)
  end
  
  L5_2(L6_2, L7_2)
  L5_2 = forEachRecruiterInClub
  L6_2 = L3_2
  
  function L7_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L2_3 = cutPersonWage
    L3_3 = getPersonFromPlayer
    L4_3 = A1_3
    L3_3 = L3_3(L4_3)
    L4_3 = A1_2
    L2_3(L3_3, L4_3)
  end
  
  L5_2(L6_2, L7_2)
  if A2_2 then
    L5_2 = MessageDialog
    L6_2 = string
    L6_2 = L6_2.format
    L7_2 = [[
		Operation Success!
		Elapsed time is: %.3f s
		]]
    L8_2 = os
    L8_2 = L8_2.clock
    L8_2 = L8_2()
    L8_2 = L8_2 - L4_2
    L6_2 = L6_2(L7_2, L8_2)
    L7_2 = 2
    return L5_2(L6_2, L7_2)
  end
  return
end

cutAllStaffWage = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "cutAllStaffWage"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L3_2 = getAddressSafe
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isClub
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_17
    end
  end
  L4_2 = readQword
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L3_2 = L4_2
  ::lbl_17::
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isClub
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_30
    end
  end
  L4_2 = readQword
  L5_2 = "ptrClub"
  L4_2 = L4_2(L5_2)
  L3_2 = L4_2
  ::lbl_30::
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isClub
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L4_2 = 0
  L5_2 = os
  L5_2 = L5_2.clock
  L5_2 = L5_2()
  L6_2 = forEachPlayerInClub
  L7_2 = L3_2
  
  function L8_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L2_3 = wageAdjustment
    L3_3 = getPersonFromPlayer
    L4_3 = A1_3
    L3_3 = L3_3(L4_3)
    L4_3 = A1_2
    L2_3(L3_3, L4_3)
    L2_3 = L4_2
    L2_3 = L2_3 + 1
    L4_2 = L2_3
  end
  
  L6_2(L7_2, L8_2)
  if A2_2 then
    L6_2 = MessageDialog
    L7_2 = string
    L7_2 = L7_2.format
    L8_2 = [[
		Item(s) edited : %d
		Elapsed time is: %.3f s
		]]
    L9_2 = L4_2
    L10_2 = os
    L10_2 = L10_2.clock
    L10_2 = L10_2()
    L10_2 = L10_2 - L5_2
    L7_2 = L7_2(L8_2, L9_2, L10_2)
    L8_2 = 2
    return L6_2(L7_2, L8_2)
  end
  return
end

wageAdjustmentAllPlayers = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "wageAdjustmentAllPlayers"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = readQword
  L2_2 = "ptrClub"
  L1_2 = L1_2(L2_2)
  if L1_2 == nil or L1_2 == 0 then
    L2_2 = nil
    return L2_2
  end
  L2_2 = os
  L2_2 = L2_2.clock
  L2_2 = L2_2()
  L3_2 = readQword
  L4_2 = cluo
  L4_2 = L4_2.Cdof
  L4_2 = L1_2 + L4_2
  L3_2 = L3_2(L4_2)
  if L3_2 ~= nil then
    L3_2 = readQword
    L4_2 = cluo
    L4_2 = L4_2.Cdof
    L4_2 = L1_2 + L4_2
    L3_2 = L3_2(L4_2)
    if L3_2 ~= 0 then
      L3_2 = wageAdjustment
      L4_2 = getPersonFromPlayer
      L5_2 = readQword
      L6_2 = cluo
      L6_2 = L6_2.Cdof
      L6_2 = L1_2 + L6_2
      L5_2, L6_2 = L5_2(L6_2)
      L4_2 = L4_2(L5_2, L6_2)
      L5_2 = A0_2
      L3_2(L4_2, L5_2)
    end
  end
  L3_2 = forEachCoachInClub
  L4_2 = L1_2
  
  function L5_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L2_3 = wageAdjustment
    L3_3 = getPersonFromPlayer
    L4_3 = A1_3
    L3_3 = L3_3(L4_3)
    L4_3 = A0_2
    L2_3(L3_3, L4_3)
  end
  
  L3_2(L4_2, L5_2)
  L3_2 = forEachMedicalInClub
  L4_2 = L1_2
  
  function L5_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L2_3 = wageAdjustment
    L3_3 = getPersonFromPlayer
    L4_3 = A1_3
    L3_3 = L3_3(L4_3)
    L4_3 = A0_2
    L2_3(L3_3, L4_3)
  end
  
  L3_2(L4_2, L5_2)
  L3_2 = forEachRecruiterInClub
  L4_2 = L1_2
  
  function L5_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L2_3 = wageAdjustment
    L3_3 = getPersonFromPlayer
    L4_3 = A1_3
    L3_3 = L3_3(L4_3)
    L4_3 = A0_2
    L2_3(L3_3, L4_3)
  end
  
  L3_2(L4_2, L5_2)
  L3_2 = MessageDialog
  L4_2 = string
  L4_2 = L4_2.format
  L5_2 = [[
  Operation Success!
  Elapsed time is: %.3f s
  ]]
  L6_2 = os
  L6_2 = L6_2.clock
  L6_2 = L6_2()
  L6_2 = L6_2 - L2_2
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = 2
  return L3_2(L4_2, L5_2)
end

wageAdjustmentAllStaff = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "wageAdjustmentAllStaff"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L4_2 = getAddressSafe
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  if L4_2 ~= nil and L4_2 ~= 0 then
    L5_2 = isClub
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      goto lbl_17
    end
  end
  L5_2 = readQword
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  L4_2 = L5_2
  ::lbl_17::
  if L4_2 ~= nil and L4_2 ~= 0 then
    L5_2 = isClub
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      goto lbl_30
    end
  end
  L5_2 = readQword
  L6_2 = "ptrClub"
  L5_2 = L5_2(L6_2)
  L4_2 = L5_2
  ::lbl_30::
  if L4_2 ~= nil and L4_2 ~= 0 then
    L5_2 = isClub
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L5_2 = 0
  L6_2 = os
  L6_2 = L6_2.clock
  L6_2 = L6_2()
  L7_2 = A1_2
  if A2_2 then
    L8_2 = createStringList
    L8_2 = L8_2()
    L9_2 = pairs
    L10_2 = squadSelectionValueTypes
    L9_2, L10_2, L11_2 = L9_2(L10_2)
    for L12_2, L13_2 in L9_2, L10_2, L11_2 do
      L14_2 = L8_2.add
      L15_2 = squadSelectionValueTypes
      L15_2 = L15_2[L12_2]
      L14_2(L15_2)
    end
    L9_2 = showSelectionList
    L10_2 = "Selection Value List"
    L11_2 = "Select item from list"
    L12_2 = L8_2
    L9_2, L10_2 = L9_2(L10_2, L11_2, L12_2)
    if L9_2 == -1 then
      return
    end
    L11_2 = pairs
    L12_2 = squadSelectionValueTypes
    L11_2, L12_2, L13_2 = L11_2(L12_2)
    for L14_2, L15_2 in L11_2, L12_2, L13_2 do
      if L10_2 == L15_2 then
        L7_2 = L14_2
        break
      end
    end
  end
  L8_2 = forEachPlayerInClub
  L9_2 = L4_2
  
  function L10_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L2_3 = registerPlayer
    L3_3 = getPersonFromPlayer
    L4_3 = A1_3
    L3_3 = L3_3(L4_3)
    L4_3 = L7_2
    L2_3(L3_3, L4_3)
    L2_3 = L5_2
    L2_3 = L2_3 + 1
    L5_2 = L2_3
  end
  
  L8_2(L9_2, L10_2)
  if A3_2 then
    L8_2 = MessageDialog
    L9_2 = string
    L9_2 = L9_2.format
    L10_2 = [[
		Item(s) edited : %d
		Elapsed time is: %.3f s
		]]
    L11_2 = L5_2
    L12_2 = os
    L12_2 = L12_2.clock
    L12_2 = L12_2()
    L12_2 = L12_2 - L6_2
    L9_2 = L9_2(L10_2, L11_2, L12_2)
    L10_2 = 2
    return L8_2(L9_2, L10_2)
  end
  return
end

registerTeam = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "registerTeam"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  L2_2 = getAddressSafe
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isClub
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_17
    end
  end
  L3_2 = readQword
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L2_2 = L3_2
  ::lbl_17::
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isClub
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_30
    end
  end
  L3_2 = readQword
  L4_2 = "ptrClub"
  L3_2 = L3_2(L4_2)
  L2_2 = L3_2
  ::lbl_30::
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isClub
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L3_2 = os
  L3_2 = L3_2.clock
  L3_2 = L3_2()
  L4_2 = 0
  L5_2 = getFirstTeamFromClub
  L6_2 = L2_2
  L5_2 = L5_2(L6_2)
  if L5_2 ~= nil and L5_2 ~= 0 then
    L6_2 = isTeam
    L7_2 = L5_2
    L6_2 = L6_2(L7_2)
    if L6_2 then
      goto lbl_57
    end
  end
  do return end
  ::lbl_57::
  L6_2 = readQword
  L7_2 = "mgrFinance"
  L6_2 = L6_2(L7_2)
  if L6_2 == nil or L6_2 == 0 then
    return
  end
  L7_2 = readInteger
  L8_2 = "datTimeRoot"
  L7_2 = L7_2(L8_2)
  if L7_2 == nil or L7_2 == 0 then
    return
  end
  L8_2 = readQword
  L9_2 = L6_2 + 24
  L8_2 = L8_2(L9_2)
  L9_2 = readQword
  L10_2 = L8_2
  L9_2 = L9_2(L10_2)
  L10_2 = readQword
  L11_2 = L8_2 + 8
  L10_2 = L10_2(L11_2)
  if L9_2 == nil or L10_2 == nil then
    return
  end
  L11_2 = readQword
  L12_2 = L6_2 + 32
  L11_2 = L11_2(L12_2)
  L12_2 = readQword
  L13_2 = L11_2
  L12_2 = L12_2(L13_2)
  L13_2 = readQword
  L14_2 = L11_2 + 8
  L13_2 = L13_2(L14_2)
  if L12_2 == nil or L13_2 == nil then
    return
  end
  L14_2 = readQword
  L15_2 = L6_2 + 40
  L14_2 = L14_2(L15_2)
  L15_2 = readQword
  L16_2 = L14_2
  L15_2 = L15_2(L16_2)
  L16_2 = readQword
  L17_2 = L14_2 + 8
  L16_2 = L16_2(L17_2)
  if L15_2 == nil or L16_2 == nil then
    return
  end
  L17_2 = forEach
  L18_2 = L9_2
  L19_2 = L10_2
  L20_2 = 8
  
  function L21_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3
    L2_3 = Table
    L2_3 = L2_3.MaxShowItem
    if A0_3 > L2_3 then
      L2_3 = false
      return L2_3
    end
    L2_3 = readQword
    L3_3 = A1_3
    L2_3 = L2_3(L3_3)
    L3_3 = readQword
    L4_3 = L2_3 + 32
    L3_3 = L3_3(L4_3)
    L4_3 = L2_2
    if L4_3 ~= L3_3 then
      return
    end
    L4_3 = writeInteger
    L5_3 = L2_3 + 20
    L6_3 = L7_2
    L4_3(L5_3, L6_3)
    L4_3 = L4_2
    L4_3 = L4_3 + 1
    L4_2 = L4_3
  end
  
  L17_2(L18_2, L19_2, L20_2, L21_2)
  L17_2 = forEach
  L18_2 = L12_2
  L19_2 = L13_2
  L20_2 = 8
  
  function L21_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3
    L2_3 = Table
    L2_3 = L2_3.MaxShowItem
    if A0_3 > L2_3 then
      L2_3 = false
      return L2_3
    end
    L2_3 = readQword
    L3_3 = A1_3
    L2_3 = L2_3(L3_3)
    L3_3 = readQword
    L4_3 = L2_3 + 8
    L3_3 = L3_3(L4_3)
    L4_3 = L2_2
    if L4_3 ~= L3_3 then
      return
    end
    L4_3 = writeInteger
    L5_3 = L2_3 + 16
    L6_3 = L7_2
    L4_3(L5_3, L6_3)
    L4_3 = L4_2
    L4_3 = L4_3 + 1
    L4_2 = L4_3
  end
  
  L17_2(L18_2, L19_2, L20_2, L21_2)
  L17_2 = forEach
  L18_2 = StadiumChangeTableStart
  L19_2 = StadiumChangeTableEnd
  L20_2 = 8
  
  function L21_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3
    L2_3 = Table
    L2_3 = L2_3.MaxShowItem
    if A0_3 > L2_3 then
      L2_3 = false
      return L2_3
    end
    L2_3 = readQword
    L3_3 = A1_3
    L2_3 = L2_3(L3_3)
    L3_3 = readQword
    L4_3 = L2_3 + 24
    L3_3 = L3_3(L4_3)
    L4_3 = L5_2
    if L4_3 ~= L3_3 then
      return
    end
    L4_3 = writeInteger
    L5_3 = cluo
    L5_3 = L5_3.Ssta
    L5_3 = L2_3 + L5_3
    L6_3 = L7_2
    L4_3(L5_3, L6_3)
    L4_3 = L4_2
    L4_3 = L4_3 + 1
    L4_2 = L4_3
  end
  
  L17_2(L18_2, L19_2, L20_2, L21_2)
  if A1_2 then
    L17_2 = MessageDialog
    L18_2 = string
    L18_2 = L18_2.format
    L19_2 = [[
		Item(s) edited : %d
		Elapsed time is: %.3f s
		]]
    L20_2 = L4_2
    L21_2 = os
    L21_2 = L21_2.clock
    L21_2 = L21_2()
    L21_2 = L21_2 - L3_2
    L18_2 = L18_2(L19_2, L20_2, L21_2)
    L19_2 = 2
    return L17_2(L18_2, L19_2)
  end
  return
end

completeBoardRequests = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "completeBoardRequests"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = getAddressSafe
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isClub
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_17
    end
  end
  L3_2 = readQword
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L2_2 = L3_2
  ::lbl_17::
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isClub
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_30
    end
  end
  L3_2 = readQword
  L4_2 = "ptrClub"
  L3_2 = L3_2(L4_2)
  L2_2 = L3_2
  ::lbl_30::
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isClub
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L3_2 = os
  L3_2 = L3_2.clock
  L3_2 = L3_2()
  L4_2 = getFirstTeamFromClub
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  if L4_2 ~= nil and L4_2 ~= 0 then
    L5_2 = isTeam
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      goto lbl_56
    end
  end
  do return end
  ::lbl_56::
  L5_2 = getAddressSafe
  L6_2 = teao
  L6_2 = L6_2.Tsti
  L6_2 = L4_2 + L6_2
  L5_2 = L5_2(L6_2)
  L6_2 = changeStadium
  L7_2 = L5_2
  L6_2(L7_2)
  if A1_2 then
    L6_2 = MessageDialog
    L7_2 = string
    L7_2 = L7_2.format
    L8_2 = [[
		Operation Success!
		Elapsed time is: %.3f s
		]]
    L9_2 = os
    L9_2 = L9_2.clock
    L9_2 = L9_2()
    L9_2 = L9_2 - L3_2
    L7_2 = L7_2(L8_2, L9_2)
    L8_2 = 2
    return L6_2(L7_2, L8_2)
  end
  return
end

changeClubStadium = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "changeClubStadium"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = getAddressSafe
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isClub
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_17
    end
  end
  L3_2 = readQword
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L2_2 = L3_2
  ::lbl_17::
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isClub
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_30
    end
  end
  L3_2 = readQword
  L4_2 = "ptrClub"
  L3_2 = L3_2(L4_2)
  L2_2 = L3_2
  ::lbl_30::
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isClub
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L3_2 = os
  L3_2 = L3_2.clock
  L3_2 = L3_2()
  L4_2 = getAddressSafe
  L5_2 = cluo
  L5_2 = L5_2.Ctrg
  L5_2 = L2_2 + L5_2
  L4_2 = L4_2(L5_2)
  L5_2 = changeStadium
  L6_2 = L4_2
  L5_2(L6_2)
  if A1_2 then
    L5_2 = MessageDialog
    L6_2 = string
    L6_2 = L6_2.format
    L7_2 = [[
		Operation Success!
		Elapsed time is: %.3f s
		]]
    L8_2 = os
    L8_2 = L8_2.clock
    L8_2 = L8_2()
    L8_2 = L8_2 - L3_2
    L6_2 = L6_2(L7_2, L8_2)
    L7_2 = 2
    return L5_2(L6_2, L7_2)
  end
  return
end

changeClubTrainingGround = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "changeClubTrainingGround"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = readQword
  L1_2 = "ptrClub"
  L0_2 = L0_2(L1_2)
  if L0_2 == nil or L0_2 == 0 then
    L1_2 = nil
    return L1_2
  end
  L1_2 = readQword
  L2_2 = readQword
  L3_2 = cluo
  L3_2 = L3_2.Ctea
  L3_2 = L0_2 + L3_2
  L2_2, L3_2, L4_2, L5_2, L6_2, L7_2 = L2_2(L3_2)
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2)
  if L1_2 == nil or L1_2 == 0 then
    L2_2 = nil
    return L2_2
  end
  L2_2 = readQword
  L3_2 = teao
  L3_2 = L3_2.Tsti
  L3_2 = L1_2 + L3_2
  L2_2 = L2_2(L3_2)
  if L2_2 == nil or L2_2 == 0 then
    L3_2 = nil
    return L3_2
  end
  L3_2 = os
  L3_2 = L3_2.clock
  L3_2 = L3_2()
  L4_2 = writeQword
  L5_2 = stao
  L5_2 = L5_2.Sowi
  L5_2 = L2_2 + L5_2
  L6_2 = L0_2
  L4_2(L5_2, L6_2)
  L4_2 = writeByte
  L5_2 = stao
  L5_2 = L5_2.Soty
  L5_2 = L2_2 + L5_2
  L6_2 = 1
  L4_2(L5_2, L6_2)
  L4_2 = writeSmallInteger
  L5_2 = stao
  L5_2 = L5_2.Doco
  L5_2 = L2_2 + L5_2
  L6_2 = getCurrentDay
  L6_2, L7_2 = L6_2()
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = writeSmallInteger
  L5_2 = stao
  L5_2 = L5_2.Doco
  L5_2 = L2_2 + L5_2
  L5_2 = L5_2 + 2
  L6_2 = getCurrentYear
  L6_2, L7_2 = L6_2()
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = MessageDialog
  L5_2 = string
  L5_2 = L5_2.format
  L6_2 = [[
  Operation Success!
  Elapsed time is: %.3f s
  ]]
  L7_2 = os
  L7_2 = L7_2.clock
  L7_2 = L7_2()
  L7_2 = L7_2 - L3_2
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = 2
  return L4_2(L5_2, L6_2)
end

stadiumOwner = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "stadiumOwner"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2
  L3_2 = getAddressSafe
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isClubOrNation
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_17
    end
  end
  L4_2 = readQword
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L3_2 = L4_2
  ::lbl_17::
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isClubOrNation
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_27
    end
  end
  do return end
  ::lbl_27::
  L4_2 = readInteger
  L5_2 = objo
  L5_2 = L5_2.Duni
  L5_2 = L3_2 + L5_2
  L4_2 = L4_2(L5_2)
  if L4_2 == nil or L4_2 == 0 then
    L5_2 = nil
    return L5_2
  end
  L5_2 = os
  L5_2 = L5_2.clock
  L5_2 = L5_2()
  L6_2 = getObjectName
  L7_2 = L3_2
  L6_2 = L6_2(L7_2)
  L7_2 = string
  L7_2 = L7_2.format
  L8_2 = "object_%d"
  L9_2 = L4_2
  L7_2 = L7_2(L8_2, L9_2)
  L8_2 = isClub
  L9_2 = L3_2
  L8_2 = L8_2(L9_2)
  if L8_2 then
    L8_2 = string
    L8_2 = L8_2.format
    L9_2 = "club_%d"
    L10_2 = L4_2
    L8_2 = L8_2(L9_2, L10_2)
    L7_2 = L8_2
  end
  L8_2 = isNation
  L9_2 = L3_2
  L8_2 = L8_2(L9_2)
  if L8_2 then
    L8_2 = string
    L8_2 = L8_2.format
    L9_2 = "nation_%d"
    L10_2 = L4_2
    L8_2 = L8_2(L9_2, L10_2)
    L7_2 = L8_2
  end
  L8_2 = string
  L8_2 = L8_2.format
  L9_2 = [[
{$lua}
if syntaxcheck then return end
[ENABLE]
memrec.Color = Color.SwitchOn
memrec.Description = 'Switcher (On)'
disableOtherRecords(memrec, false)

local _updateFunc = function()
  if freezerItems == nil then return nil end
	
  if %s == nil then
    %s = {}
  end

  %s.flag = 0
  %s.addr = '%x'
  %s.uid = %d

  local pos = table.contains(freezerItems, %s)
  local len = #freezerItems
  if pos == nil then
    freezerItems[len+1] = %s
  else
    freezerItems[pos] = %s
  end
end

_updateFunc()
[DISABLE]
table.remove(freezerItems, table.contains(freezerItems, %s))
memrec.Color = Color.SwitchOff
memrec.Description = 'Switcher (Off)']]
  L10_2 = L7_2
  L11_2 = L7_2
  L12_2 = L7_2
  L13_2 = L7_2
  L14_2 = L3_2
  L15_2 = L7_2
  L16_2 = L4_2
  L17_2 = L7_2
  L18_2 = L7_2
  L19_2 = L7_2
  L20_2 = L7_2
  L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
  L9_2 = string
  L9_2 = L9_2.format
  L10_2 = [[
{$lua}
if syntaxcheck then return end
[ENABLE]
%s.flag = writeBitInt(%s.flag, 0, true)
[DISABLE]
%s.flag = writeBitInt(%s.flag, 0, false)]]
  L11_2 = L7_2
  L12_2 = L7_2
  L13_2 = L7_2
  L14_2 = L7_2
  L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
  L10_2 = string
  L10_2 = L10_2.format
  L11_2 = [[
{$lua}
if syntaxcheck then return end
[ENABLE]
%s.flag = writeBitInt(%s.flag, 1, true)
[DISABLE]
%s.flag = writeBitInt(%s.flag, 1, false)]]
  L12_2 = L7_2
  L13_2 = L7_2
  L14_2 = L7_2
  L15_2 = L7_2
  L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2)
  L11_2 = string
  L11_2 = L11_2.format
  L12_2 = [[
{$lua}
if syntaxcheck then return end
[ENABLE]
local rec = findRecord(memrec.Parent, 'Remove All Injuries')
rec.Active = false
%s.flag = writeBitInt(%s.flag, 2, true)
[DISABLE]
%s.flag = writeBitInt(%s.flag, 2, false)]]
  L13_2 = L7_2
  L14_2 = L7_2
  L15_2 = L7_2
  L16_2 = L7_2
  L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2)
  L12_2 = string
  L12_2 = L12_2.format
  L13_2 = [[
{$lua}
if syntaxcheck then return end
[ENABLE]
local rec = findRecord(memrec.Parent, 'Destroy Team')
rec.Active = false
%s.flag = writeBitInt(%s.flag, 3, true)
[DISABLE]
%s.flag = writeBitInt(%s.flag, 3, false)]]
  L14_2 = L7_2
  L15_2 = L7_2
  L16_2 = L7_2
  L17_2 = L7_2
  L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)
  L13_2 = string
  L13_2 = L13_2.format
  L14_2 = [[
{$lua}
if syntaxcheck then return end
[ENABLE]
%s.flag = writeBitInt(%s.flag, 4, true)
[DISABLE]
%s.flag = writeBitInt(%s.flag, 4, false)]]
  L15_2 = L7_2
  L16_2 = L7_2
  L17_2 = L7_2
  L18_2 = L7_2
  L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2, L18_2)
  L14_2 = string
  L14_2 = L14_2.format
  L15_2 = [[
{$lua}
if syntaxcheck then return end
[ENABLE]
%s.flag = writeBitInt(%s.flag, 5, true)
[DISABLE]
%s.flag = writeBitInt(%s.flag, 5, false)]]
  L16_2 = L7_2
  L17_2 = L7_2
  L18_2 = L7_2
  L19_2 = L7_2
  L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2, L19_2)
  L15_2 = string
  L15_2 = L15_2.format
  L16_2 = [[
{$lua}
if syntaxcheck then return end
[ENABLE]
%s.flag = writeBitInt(%s.flag, 6, true)
[DISABLE]
%s.flag = writeBitInt(%s.flag, 6, false)]]
  L17_2 = L7_2
  L18_2 = L7_2
  L19_2 = L7_2
  L20_2 = L7_2
  L15_2 = L15_2(L16_2, L17_2, L18_2, L19_2, L20_2)
  L16_2 = string
  L16_2 = L16_2.format
  L17_2 = [[
{$lua}
if syntaxcheck then return end
[ENABLE]
%s.flag = writeBitInt(%s.flag, 7, true)
[DISABLE]
%s.flag = writeBitInt(%s.flag, 7, false)]]
  L18_2 = L7_2
  L19_2 = L7_2
  L20_2 = L7_2
  L21_2 = L7_2
  L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2, L21_2)
  L17_2 = string
  L17_2 = L17_2.format
  L18_2 = "%s (ID: %d) >"
  L19_2 = L6_2
  L20_2 = L4_2
  L17_2 = L17_2(L18_2, L19_2, L20_2)
  L18_2 = getAddressList
  L18_2 = L18_2()
  L18_2 = L18_2.getMemoryRecordByID
  L19_2 = A1_2
  L18_2 = L18_2(L19_2)
  if L18_2 ~= nil then
    L18_2.options = "[moHideChildren]"
    L19_2 = nil
    L20_2 = nil
    
    function L21_2(A0_3, A1_3)
      local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3
      L2_3 = false
      L3_3 = 0
      L4_3 = A0_3.Count
      L4_3 = L4_3 - 1
      L5_3 = 1
      for L6_3 = L3_3, L4_3, L5_3 do
        L7_3 = string
        L7_3 = L7_3.match
        L8_3 = A0_3.Child
        L8_3 = L8_3[L6_3]
        L8_3 = L8_3.Description
        L9_3 = A1_3
        L7_3 = L7_3(L8_3, L9_3)
        if L7_3 ~= nil then
          L7_3 = A0_3.Child
          L7_3 = L7_3[L6_3]
          L19_2 = L7_3
          L2_3 = true
          break
        end
      end
      return L2_3
    end
    
    L22_2 = L21_2
    L23_2 = L18_2
    L24_2 = L6_2
    L22_2 = L22_2(L23_2, L24_2)
    if not L22_2 then
      L22_2 = createRecord
      L23_2 = L18_2
      L24_2 = L17_2
      L25_2 = vtGrouped
      L26_2 = 0
      L27_2 = nil
      L22_2 = L22_2(L23_2, L24_2, L25_2, L26_2, L27_2)
      L19_2 = L22_2
      L19_2.options = "[moHideChildren]"
      L22_2 = Color
      L22_2 = L22_2.Child2
      L19_2.Color = L22_2
      L19_2.DontSave = true
      L22_2 = createRecord
      L23_2 = L19_2
      L24_2 = "Switcher"
      L25_2 = vtAutoAssembler
      L26_2 = nil
      L27_2 = nil
      L28_2 = nil
      L29_2 = L8_2
      L22_2 = L22_2(L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
      L20_2 = L22_2
      L22_2 = Color
      L22_2 = L22_2.SwitchOff
      L20_2.Color = L22_2
      L22_2 = createRecord
      L23_2 = L19_2
      L24_2 = "----------------------------------------------------------------------------------------------------------------------------------"
      L25_2 = vtGrouped
      L26_2 = nil
      L27_2 = nil
      L22_2 = L22_2(L23_2, L24_2, L25_2, L26_2, L27_2)
      L20_2 = L22_2
      L22_2 = Color
      L22_2 = L22_2.SeparatorSmall
      L20_2.Color = L22_2
      L22_2 = createRecord
      L23_2 = L19_2
      L24_2 = "Maximise Existing Tactical Familiarity"
      L25_2 = vtAutoAssembler
      L26_2 = nil
      L27_2 = nil
      L28_2 = nil
      L29_2 = L9_2
      L22_2 = L22_2(L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
      L20_2 = L22_2
      L22_2 = Color
      L22_2 = L22_2.Text
      L20_2.Color = L22_2
      L22_2 = createRecord
      L23_2 = L19_2
      L24_2 = "Maximise Existing Team Cohesion"
      L25_2 = vtAutoAssembler
      L26_2 = nil
      L27_2 = nil
      L28_2 = nil
      L29_2 = L10_2
      L22_2 = L22_2(L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
      L20_2 = L22_2
      L22_2 = Color
      L22_2 = L22_2.Text
      L20_2.Color = L22_2
      L22_2 = createRecord
      L23_2 = L19_2
      L24_2 = "Destroy Team"
      L25_2 = vtAutoAssembler
      L26_2 = nil
      L27_2 = nil
      L28_2 = nil
      L29_2 = L11_2
      L22_2 = L22_2(L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
      L20_2 = L22_2
      L22_2 = Color
      L22_2 = L22_2.Text
      L20_2.Color = L22_2
      L22_2 = createRecord
      L23_2 = L19_2
      L24_2 = "Remove All Injuries"
      L25_2 = vtAutoAssembler
      L26_2 = nil
      L27_2 = nil
      L28_2 = nil
      L29_2 = L12_2
      L22_2 = L22_2(L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
      L20_2 = L22_2
      L22_2 = Color
      L22_2 = L22_2.Text
      L20_2.Color = L22_2
      L22_2 = createRecord
      L23_2 = L19_2
      L24_2 = "Remove All Bans"
      L25_2 = vtAutoAssembler
      L26_2 = nil
      L27_2 = nil
      L28_2 = nil
      L29_2 = L13_2
      L22_2 = L22_2(L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
      L20_2 = L22_2
      L22_2 = Color
      L22_2 = L22_2.Text
      L20_2.Color = L22_2
      L22_2 = isClub
      L23_2 = L3_2
      L22_2 = L22_2(L23_2)
      if L22_2 then
        L22_2 = createRecord
        L23_2 = L19_2
        L24_2 = "No Transfer Activity"
        L25_2 = vtAutoAssembler
        L26_2 = nil
        L27_2 = nil
        L28_2 = nil
        L29_2 = L14_2
        L22_2 = L22_2(L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
        L20_2 = L22_2
        L22_2 = Color
        L22_2 = L22_2.Text
        L20_2.Color = L22_2
        L22_2 = createRecord
        L23_2 = L19_2
        L24_2 = "Freeze Bank Balance"
        L25_2 = vtAutoAssembler
        L26_2 = nil
        L27_2 = nil
        L28_2 = nil
        L29_2 = L15_2
        L22_2 = L22_2(L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
        L20_2 = L22_2
        L22_2 = Color
        L22_2 = L22_2.Text
        L20_2.Color = L22_2
        L22_2 = createRecord
        L23_2 = L19_2
        L24_2 = "Hack Team Professionalism"
        L25_2 = vtAutoAssembler
        L26_2 = nil
        L27_2 = nil
        L28_2 = nil
        L29_2 = L16_2
        L22_2 = L22_2(L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
        L20_2 = L22_2
        L22_2 = Color
        L22_2 = L22_2.Text
        L20_2.Color = L22_2
      end
    else
      L22_2 = findRecord
      L23_2 = L19_2
      L24_2 = "^Switcher"
      L22_2 = L22_2(L23_2, L24_2)
      L22_2.Active = false
      L22_2.Script = L8_2
    end
  end
  if A2_2 then
    L19_2 = MessageDialog
    L20_2 = string
    L20_2 = L20_2.format
    L21_2 = [[
		Operation Success!
		Elapsed time is: %.3f s
		]]
    L22_2 = os
    L22_2 = L22_2.clock
    L22_2 = L22_2()
    L22_2 = L22_2 - L5_2
    L20_2 = L20_2(L21_2, L22_2)
    L21_2 = 2
    return L19_2(L20_2, L21_2)
  end
  return
end

addClubToFreezer = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "addClubToFreezer"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L3_2 = getAddressSafe
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isClub
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_17
    end
  end
  L4_2 = readQword
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L3_2 = L4_2
  ::lbl_17::
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isClub
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_30
    end
  end
  L4_2 = readQword
  L5_2 = "ptrClub"
  L4_2 = L4_2(L5_2)
  L3_2 = L4_2
  ::lbl_30::
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isClub
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L4_2 = os
  L4_2 = L4_2.clock
  L4_2 = L4_2()
  L5_2 = readQword
  L6_2 = cluo
  L6_2 = L6_2.Cino
  L6_2 = L3_2 + L6_2
  L5_2 = L5_2(L6_2)
  L6_2 = readQword
  L7_2 = cluo
  L7_2 = L7_2.Cint
  L7_2 = L3_2 + L7_2
  L6_2 = L6_2(L7_2)
  L7_2 = readQword
  L8_2 = readQword
  L9_2 = cluo
  L9_2 = L9_2.Ctea
  L9_2 = L3_2 + L9_2
  L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L8_2(L9_2)
  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  if L7_2 == nil or L7_2 == 0 then
    return
  end
  L8_2 = readQword
  L9_2 = teao
  L9_2 = L9_2.Tsti
  L9_2 = L7_2 + L9_2
  L8_2 = L8_2(L9_2)
  if L8_2 == nil or L8_2 == 0 then
    return
  end
  L9_2 = readInteger
  L10_2 = stao
  L10_2 = L10_2.Scpy
  L10_2 = L8_2 + L10_2
  L9_2 = L9_2(L10_2)
  L10_2 = writeInteger
  L11_2 = cluo
  L11_2 = L11_2.Catd
  L11_2 = L5_2 + L11_2
  L12_2 = A1_2 / 100
  L12_2 = L9_2 * L12_2
  L10_2(L11_2, L12_2)
  L10_2 = writeInteger
  L11_2 = cluo
  L11_2 = L11_2.Cmna
  L11_2 = L5_2 + L11_2
  L12_2 = L9_2 * 0.45
  L10_2(L11_2, L12_2)
  L10_2 = writeInteger
  L11_2 = cluo
  L11_2 = L11_2.Cmxa
  L11_2 = L5_2 + L11_2
  L12_2 = L9_2
  L10_2(L11_2, L12_2)
  if A2_2 then
    L10_2 = MessageDialog
    L11_2 = string
    L11_2 = L11_2.format
    L12_2 = [[
		Operation Success!
		Elapsed time is: %.3f s
		]]
    L13_2 = os
    L13_2 = L13_2.clock
    L13_2 = L13_2()
    L13_2 = L13_2 - L4_2
    L11_2 = L11_2(L12_2, L13_2)
    L12_2 = 2
    return L10_2(L11_2, L12_2)
  end
  return
end

setStadiumAverageAttendance = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "setStadiumAverageAttendance"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = getAddressSafe
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isClub
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_17
    end
  end
  L3_2 = readQword
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L2_2 = L3_2
  ::lbl_17::
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isClub
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_30
    end
  end
  L3_2 = readQword
  L4_2 = "ptrClub"
  L3_2 = L3_2(L4_2)
  L2_2 = L3_2
  ::lbl_30::
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isClub
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L3_2 = os
  L3_2 = L3_2.clock
  L3_2 = L3_2()
  L4_2 = readQword
  L5_2 = cluo
  L5_2 = L5_2.Cdof
  L5_2 = L2_2 + L5_2
  L4_2 = L4_2(L5_2)
  if L4_2 ~= nil then
    L4_2 = readQword
    L5_2 = cluo
    L5_2 = L5_2.Cdof
    L5_2 = L2_2 + L5_2
    L4_2 = L4_2(L5_2)
    if L4_2 ~= 0 then
      L4_2 = maxNonPlayerScoutingKnowledgeLevel
      L5_2 = readQword
      L6_2 = cluo
      L6_2 = L6_2.Cdof
      L6_2 = L2_2 + L6_2
      L5_2, L6_2, L7_2 = L5_2(L6_2)
      L4_2(L5_2, L6_2, L7_2)
    end
  end
  L4_2 = forEachCoachInClub
  L5_2 = L2_2
  
  function L6_2(A0_3, A1_3)
    local L2_3, L3_3
    L2_3 = maxNonPlayerScoutingKnowledgeLevel
    L3_3 = A1_3
    L2_3(L3_3)
  end
  
  L4_2(L5_2, L6_2)
  L4_2 = forEachMedicalInClub
  L5_2 = L2_2
  
  function L6_2(A0_3, A1_3)
    local L2_3, L3_3
    L2_3 = maxNonPlayerScoutingKnowledgeLevel
    L3_3 = A1_3
    L2_3(L3_3)
  end
  
  L4_2(L5_2, L6_2)
  L4_2 = forEachRecruiterInClub
  L5_2 = L2_2
  
  function L6_2(A0_3, A1_3)
    local L2_3, L3_3
    L2_3 = maxNonPlayerScoutingKnowledgeLevel
    L3_3 = A1_3
    L2_3(L3_3)
  end
  
  L4_2(L5_2, L6_2)
  if A1_2 then
    L4_2 = MessageDialog
    L5_2 = string
    L5_2 = L5_2.format
    L6_2 = [[
		Operation Success!
		Elapsed time is: %.3f s
		]]
    L7_2 = os
    L7_2 = L7_2.clock
    L7_2 = L7_2()
    L7_2 = L7_2 - L3_2
    L5_2 = L5_2(L6_2, L7_2)
    L6_2 = 2
    return L4_2(L5_2, L6_2)
  end
  return
end

maxAllStaffScoutingKnowledgeLevel = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "maxAllStaffScoutingKnowledgeLevel"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = nil
  L2_2 = nil
  L3_2 = nil
  L4_2 = nil
  L5_2 = getAddressSafe
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  L1_2 = L5_2
  if L1_2 ~= 0 and L1_2 ~= nil then
    L5_2 = getRTTIClassName
    L6_2 = L1_2
    L5_2 = L5_2(L6_2)
    L5_2 = not L5_2
    if L5_2 == "db::ACTUAL_NON_PLAYER" then
      L5_2 = getRTTIClassName
      L6_2 = L1_2
      L5_2 = L5_2(L6_2)
      L5_2 = not L5_2
      if L5_2 == "db::ACTUAL_PLAYER_AND_NON_PLAYER" then
        goto lbl_56
      end
    end
    L5_2 = getAddressSafe
    L6_2 = readPointer
    L7_2 = nplo
    L7_2 = L7_2.PsKL
    L7_2 = L1_2 + L7_2
    L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
    L2_2 = L5_2
    if L2_2 ~= nil and L2_2 ~= 0 then
      L5_2 = readPointer
      L6_2 = L2_2
      L5_2 = L5_2(L6_2)
      L3_2 = L5_2
      if L3_2 ~= nil and L3_2 ~= 0 then
        L5_2 = readPointer
        L6_2 = L2_2 + 8
        L5_2 = L5_2(L6_2)
        L4_2 = L5_2
        if L4_2 ~= nil and L4_2 ~= 0 then
          L5_2 = forEach
          L6_2 = L3_2
          L7_2 = L4_2
          L8_2 = 8
          
          function L9_2(A0_3, A1_3)
            local L2_3, L3_3, L4_3, L5_3
            L2_3 = Table
            L2_3 = L2_3.MaxShowItem
            if A0_3 > L2_3 then
              L2_3 = false
              return L2_3
            end
            L2_3 = readPointer
            L3_3 = A1_3
            L2_3 = L2_3(L3_3)
            if L2_3 == nil or L2_3 == 0 then
              return
            end
            L3_3 = writeByte
            L4_3 = L2_3 + 36
            L5_3 = 100
            L3_3(L4_3, L5_3)
          end
          
          L5_2(L6_2, L7_2, L8_2, L9_2)
        end
      end
    end
  end
  ::lbl_56::
  return
end

maxNonPlayerScoutingKnowledgeLevel = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "maxNonPlayerScoutingKnowledgeLevel"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = getAddressSafe
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPerson
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_17
    end
  end
  L2_2 = readQword
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_17::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPerson
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_30
    end
  end
  L2_2 = readQword
  L3_2 = "ptrPerson"
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_30::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPerson
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L2_2 = getPersonData
  L3_2 = "ptrPerson"
  L2_2, L3_2 = L2_2(L3_2)
  L4_2 = getAddressSafe
  L5_2 = "[["
  L6_2 = hex
  L7_2 = L2_2.FirstName
  L6_2 = L6_2(L7_2)
  L7_2 = "]+0]+4"
  L5_2 = L5_2 .. L6_2 .. L7_2
  L4_2 = L4_2(L5_2)
  L5_2 = getAddressSafe
  L6_2 = "[["
  L7_2 = hex
  L8_2 = L2_2.LastName
  L7_2 = L7_2(L8_2)
  L8_2 = "]+0]+4"
  L6_2 = L6_2 .. L7_2 .. L8_2
  L5_2 = L5_2(L6_2)
  L6_2 = getAddressSafe
  L7_2 = "[["
  L8_2 = hex
  L9_2 = L2_2.CommonName
  L8_2 = L8_2(L9_2)
  L9_2 = "]+0]+4"
  L7_2 = L7_2 .. L8_2 .. L9_2
  L6_2 = L6_2(L7_2)
  L7_2 = getAddressSafe
  L8_2 = "["
  L9_2 = hex
  L10_2 = L2_2.FullName
  L9_2 = L9_2(L10_2)
  L10_2 = "]+4"
  L8_2 = L8_2 .. L9_2 .. L10_2
  L7_2 = L7_2(L8_2)
  L8_2 = changeString
  L9_2 = L4_2
  L10_2 = Table
  L10_2 = L10_2.Language
  L10_2 = L10_2[1718]
  L8_2(L9_2, L10_2)
  L8_2 = changeString
  L9_2 = L5_2
  L10_2 = Table
  L10_2 = L10_2.Language
  L10_2 = L10_2[1779]
  L8_2(L9_2, L10_2)
  L8_2 = changeString
  L9_2 = L6_2
  L10_2 = Table
  L10_2 = L10_2.Language
  L10_2 = L10_2[1778]
  L8_2(L9_2, L10_2)
  L8_2 = changeString
  L9_2 = L7_2
  L10_2 = Table
  L10_2 = L10_2.Language
  L10_2 = L10_2[1777]
  L8_2(L9_2, L10_2)
  return
end

changePersonName = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "changePersonName"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = getAddressSafe
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPerson
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_17
    end
  end
  L2_2 = readQword
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_17::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPerson
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_30
    end
  end
  L2_2 = readQword
  L3_2 = "ptrPerson"
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_30::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPerson
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L2_2 = getPlayerFromPerson
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if L2_2 == nil or L2_2 == 0 then
    L3_2 = nil
    return L3_2
  end
  L3_2 = readQword
  L4_2 = plao
  L4_2 = L4_2.Pshn
  L4_2 = L2_2 + L4_2
  L3_2 = L3_2(L4_2)
  if L3_2 == nil or L3_2 == 0 then
    L4_2 = nil
    return L4_2
  end
  L4_2 = changeString
  L5_2 = getAddressSafe
  L6_2 = L3_2 + 4
  L5_2 = L5_2(L6_2)
  L6_2 = Table
  L6_2 = L6_2.Language
  L6_2 = L6_2[18097]
  return L4_2(L5_2, L6_2)
end

changePlayerShirtName = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "changePlayerShirtName"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = getAddressSafe
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPerson
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_17
    end
  end
  L2_2 = readQword
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_17::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPerson
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_30
    end
  end
  L2_2 = readQword
  L3_2 = "ptrPerson"
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_30::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPerson
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L2_2 = getAddressSafe
  L3_2 = pero
  L3_2 = L3_2.Pdob
  L3_2 = L1_2 + L3_2
  L2_2 = L2_2(L3_2)
  L3_2 = changeDate
  L4_2 = L2_2
  L5_2 = nil
  L3_2(L4_2, L5_2)
  return
end

changeDOB = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "changeDOB"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = getAddressSafe
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPerson
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_17
    end
  end
  L2_2 = readQword
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_17::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPerson
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_30
    end
  end
  L2_2 = readQword
  L3_2 = "ptrPerson"
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_30::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPerson
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L2_2 = changeCity
  L3_2 = pero
  L3_2 = L3_2.Pcbi
  L3_2 = L1_2 + L3_2
  L2_2(L3_2)
  return
end

changePersonBirthPlace = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "changePersonBirthPlace"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = getAddressSafe
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPerson
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_17
    end
  end
  L2_2 = readQword
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_17::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPerson
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_30
    end
  end
  L2_2 = readQword
  L3_2 = "ptrPerson"
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_30::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPerson
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L2_2 = changeNation
  L3_2 = pero
  L3_2 = L3_2.Pnti
  L3_2 = L1_2 + L3_2
  L2_2(L3_2)
  return
end

changePersonNationality = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "changePersonNationality"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = getAddressSafe
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPlayer
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_17
    end
  end
  L2_2 = readQword
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_17::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPlayer
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_30
    end
  end
  L2_2 = readQword
  L3_2 = "ptrPerson"
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_30::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPlayer
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L2_2 = nil
  L3_2 = createCustomSelectionList
  L4_2 = "Nation List"
  L5_2 = NationTableStart
  L6_2 = NationTableEnd
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  if L3_2 == nil then
    return
  end
  L4_2 = getPersonNation
  L5_2 = L1_2
  L4_2 = L4_2(L5_2)
  if L4_2 == nil or L4_2 == 0 or L4_2 == L3_2 then
    return
  end
  L5_2 = forEachRelationInPerson
  L6_2 = L1_2
  
  function L7_2(A0_3, A1_3)
    local L2_3, L3_3
    L2_3 = readByte
    L3_3 = A1_3 + 11
    L2_3 = L2_3(L3_3)
    if L2_3 == 9 then
      L2_3 = readQword
      L3_3 = A1_3
      L2_3 = L2_3(L3_3)
      L3_3 = L3_2
      if L2_3 == L3_3 then
        L2_3 = true
        L2_2 = L2_3
        L2_3 = false
        return L2_3
      end
    end
  end
  
  L5_2(L6_2, L7_2)
  if not L2_2 then
    L5_2 = forEachRelationInPerson
    L6_2 = L1_2
    
    function L7_2(A0_3, A1_3)
      local L2_3, L3_3, L4_3
      L2_3 = readByte
      L3_3 = A1_3 + 11
      L2_3 = L2_3(L3_3)
      if L2_3 ~= 71 then
        L2_3 = readByte
        L3_3 = A1_3 + 11
        L2_3 = L2_3(L3_3)
        if L2_3 ~= 106 then
          goto lbl_37
        end
      end
      L2_3 = writeQword
      L3_3 = A1_3
      L4_3 = L3_2
      L2_3(L3_3, L4_3)
      L2_3 = writeSmallInteger
      L3_3 = A1_3 + 8
      L4_3 = 0
      L2_3(L3_3, L4_3)
      L2_3 = writeByte
      L3_3 = A1_3 + 10
      L4_3 = 8
      L2_3(L3_3, L4_3)
      L2_3 = writeByte
      L3_3 = A1_3 + 11
      L4_3 = 9
      L2_3(L3_3, L4_3)
      L2_3 = writeByte
      L3_3 = A1_3 + 12
      L4_3 = 100
      L2_3(L3_3, L4_3)
      L2_3 = writeByte
      L3_3 = A1_3 + 13
      L4_3 = 80
      L2_3(L3_3, L4_3)
      L2_3 = false
      do return L2_3 end
      ::lbl_37::
    end
    
    L5_2(L6_2, L7_2)
  end
  return
end

addPersonOtherNationality = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "addPersonOtherNationality"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2
  L3_2 = getAddressSafe
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isPerson
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_17
    end
  end
  L4_2 = readQword
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L3_2 = L4_2
  ::lbl_17::
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isPerson
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_30
    end
  end
  L4_2 = readQword
  L5_2 = "ptrPerson"
  L4_2 = L4_2(L5_2)
  L3_2 = L4_2
  ::lbl_30::
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isPerson
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L4_2 = getPersonData
  L5_2 = L3_2
  L4_2, L5_2 = L4_2(L5_2)
  L6_2 = L5_2.FullContract
  if L6_2 ~= nil then
    L6_2 = L5_2.FullContract
    if L6_2 ~= 0 then
      goto lbl_51
    end
  end
  L6_2 = nil
  do return L6_2 end
  ::lbl_51::
  L6_2 = getRTTIClassName
  L7_2 = L5_2.FullContract
  L6_2 = L6_2(L7_2)
  L6_2 = L6_2 == "db::FULL_CONTRACT"
  if not L6_2 then
    L7_2 = nil
    return L7_2
  end
  L7_2 = getVTable
  L8_2 = L3_2
  L7_2 = L7_2(L8_2)
  L8_2 = tonumber
  L9_2 = getCurrentYear
  L9_2 = L9_2()
  L10_2 = L5_2.BirthDateYear
  L9_2 = L9_2 - L10_2
  L8_2 = L8_2(L9_2)
  L9_2 = getPersonClub
  L10_2 = L3_2
  L9_2 = L9_2(L10_2)
  L10_2 = readQword
  L11_2 = readQword
  L12_2 = cluo
  L12_2 = L12_2.Ctea
  L12_2 = L9_2 + L12_2
  L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2 = L11_2(L12_2)
  L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
  L11_2 = A1_2
  L12_2 = A2_2
  L13_2 = tonumber
  L14_2 = getDate
  L15_2 = L5_2.FullContractEndDay
  L16_2 = L5_2.FullContractEndYear
  L17_2 = 1
  L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2 = L14_2(L15_2, L16_2, L17_2)
  L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
  L14_2 = tonumber
  L15_2 = getDate
  L16_2 = L5_2.FullContractEndDay
  L17_2 = L5_2.FullContractEndYear
  L18_2 = 2
  L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2 = L15_2(L16_2, L17_2, L18_2)
  L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
  if L12_2 == 1 then
    L15_2 = writeSmallInteger
    L16_2 = L4_2.FullContractStartDay
    L17_2 = tonumber
    L18_2 = getCurrentDay
    L18_2, L19_2, L20_2, L21_2, L22_2, L23_2 = L18_2()
    L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2 = L17_2(L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
    L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
    L15_2 = writeSmallInteger
    L16_2 = L4_2.FullContractStartYear
    L17_2 = tonumber
    L18_2 = getCurrentYear
    L18_2, L19_2, L20_2, L21_2, L22_2, L23_2 = L18_2()
    L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2 = L17_2(L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
    L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
  elseif L12_2 == 2 then
    L15_2 = writeSmallInteger
    L16_2 = L4_2.FullContractStartDay
    L17_2 = 1
    L15_2(L16_2, L17_2)
    L15_2 = writeSmallInteger
    L16_2 = L4_2.FullContractStartYear
    L17_2 = tonumber
    L18_2 = getCurrentYear
    L18_2 = L18_2()
    L18_2 = L18_2 + L11_2
    L18_2 = L18_2 - 3
    L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2 = L17_2(L18_2)
    L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
  else
    return
  end
  L15_2 = writeSmallInteger
  L16_2 = L4_2.FullContractEndDay
  L17_2 = tonumber
  L18_2 = setDate
  L19_2 = L13_2
  L20_2 = L14_2
  L21_2 = getCurrentYear
  L21_2 = L21_2()
  L21_2 = L21_2 + L11_2
  L18_2, L19_2, L20_2, L21_2, L22_2, L23_2 = L18_2(L19_2, L20_2, L21_2)
  L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2 = L17_2(L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
  L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
  L15_2 = writeSmallInteger
  L16_2 = L4_2.FullContractEndYear
  L17_2 = tonumber
  L18_2 = getCurrentYear
  L18_2 = L18_2()
  L18_2 = L18_2 + L11_2
  L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2 = L17_2(L18_2)
  L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
  L15_2 = writeByte
  L16_2 = L4_2.FullContractContractType
  L17_2 = 1
  L15_2(L16_2, L17_2)
  L15_2 = vtbPlayer
  if L7_2 ~= L15_2 then
    L15_2 = vtbPlayerStaff
    if L7_2 ~= L15_2 then
      goto lbl_234
    end
  end
  L15_2 = getPlayerFromPerson
  L16_2 = L3_2
  L15_2 = L15_2(L16_2)
  L16_2 = readByte
  L17_2 = plao
  L17_2 = L17_2.Ppos
  L17_2 = L15_2 + L17_2
  L16_2 = L16_2(L17_2)
  L16_2 = L16_2 == 20
  L17_2 = readSmallInteger
  L18_2 = plao
  L18_2 = L18_2.Pcab
  L18_2 = L15_2 + L18_2
  L17_2 = L17_2(L18_2)
  L18_2 = 3
  L19_2 = 0
  L20_2 = 0
  L21_2 = forEachPlayerInTeam
  L22_2 = L10_2
  
  function L23_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3
    if 100 < A0_3 then
      L2_3 = false
      return L2_3
    end
    L2_3 = readQword
    L3_3 = A1_3
    L2_3 = L2_3(L3_3)
    if L2_3 == nil then
      return
    end
    L3_3 = isPlayer
    L4_3 = getPersonFromPlayer
    L5_3 = L2_3
    L4_3, L5_3 = L4_3(L5_3)
    L3_3 = L3_3(L4_3, L5_3)
    if not L3_3 then
      return
    end
    L3_3 = L19_2
    L4_3 = readSmallInteger
    L5_3 = plao
    L5_3 = L5_3.Pcab
    L5_3 = L2_3 + L5_3
    L4_3 = L4_3(L5_3)
    L3_3 = L3_3 + L4_3
    L19_2 = L3_3
    L3_3 = L20_2
    L3_3 = L3_3 + 1
    L20_2 = L3_3
  end
  
  L21_2(L22_2, L23_2)
  L19_2 = L19_2 / L20_2
  if 20 < L8_2 then
    if L17_2 >= L19_2 then
      if L16_2 then
        L18_2 = 15
      end
    else
      L18_2 = 6
      if L16_2 then
        L18_2 = 20
      end
    end
  elseif 18 < L8_2 then
    if L17_2 >= L19_2 then
      if L16_2 then
        L18_2 = 15
      end
    else
      L18_2 = 10
    end
  elseif 15 < L8_2 then
    if L17_2 >= L19_2 then
      if L16_2 then
        L18_2 = 15
      end
    else
      L18_2 = 11
    end
  else
    L18_2 = 11
  end
  L21_2 = writeByte
  L22_2 = L4_2.FullContractAgreedPlayingTime
  L23_2 = L18_2
  L21_2(L22_2, L23_2)
  L21_2 = readByte
  L22_2 = L4_2.FullContractPreviousPlayingTime
  L21_2 = L21_2(L22_2)
  if L21_2 ~= 0 then
    L21_2 = writeByte
    L22_2 = L4_2.FullContractPreviousPlayingTime
    L23_2 = L18_2
    L21_2(L22_2, L23_2)
  end
  ::lbl_234::
  return
end

extendPersonContract = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "extendPersonContract"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = getAddressSafe
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isPerson
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_17
    end
  end
  L3_2 = readQword
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L2_2 = L3_2
  ::lbl_17::
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isPerson
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_30
    end
  end
  L3_2 = readQword
  L4_2 = "ptrPerson"
  L3_2 = L3_2(L4_2)
  L2_2 = L3_2
  ::lbl_30::
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isPerson
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L3_2 = readQword
  L4_2 = pero
  L4_2 = L4_2.Pflc
  L4_2 = L2_2 + L4_2
  L3_2 = L3_2(L4_2)
  if L3_2 == nil or L3_2 == 0 then
    L4_2 = nil
    return L4_2
  end
  L4_2 = getRTTIClassName
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L4_2 = L4_2 == "db::FULL_CONTRACT"
  if not L4_2 then
    L5_2 = nil
    return L5_2
  end
  L5_2 = readInteger
  L6_2 = pero
  L6_2 = L6_2.Pcwg
  L6_2 = L3_2 + L6_2
  L5_2 = L5_2(L6_2)
  L6_2 = A1_2 / 100
  L6_2 = L5_2 * L6_2
  L6_2 = L5_2 - L6_2
  if L6_2 < 1 then
    return
  end
  L7_2 = writeInteger
  L8_2 = pero
  L8_2 = L8_2.Pcwg
  L8_2 = L3_2 + L8_2
  L9_2 = L6_2
  return L7_2(L8_2, L9_2)
end

cutPersonWage = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "cutPersonWage"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2
  L2_2 = getAddressSafe
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isPerson
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_17
    end
  end
  L3_2 = readQword
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L2_2 = L3_2
  ::lbl_17::
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isPerson
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_30
    end
  end
  L3_2 = readQword
  L4_2 = "ptrPerson"
  L3_2 = L3_2(L4_2)
  L2_2 = L3_2
  ::lbl_30::
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isPerson
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L3_2 = readQword
  L4_2 = pero
  L4_2 = L4_2.Pflc
  L4_2 = L2_2 + L4_2
  L3_2 = L3_2(L4_2)
  if L3_2 == nil or L3_2 == 0 then
    L4_2 = nil
    return L4_2
  end
  L4_2 = getRTTIClassName
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L4_2 = L4_2 == "db::FULL_CONTRACT"
  if not L4_2 then
    L5_2 = nil
    return L5_2
  end
  L5_2 = 0
  L6_2 = 0
  L7_2 = readByte
  L8_2 = pero
  L8_2 = L8_2.Pcjo
  L8_2 = L3_2 + L8_2
  L7_2 = L7_2(L8_2)
  L8_2 = isPlayer
  L9_2 = L2_2
  L8_2 = L8_2(L9_2)
  if L8_2 and L7_2 == 1 then
    L8_2 = getPlayerFromPerson
    L9_2 = L2_2
    L8_2 = L8_2(L9_2)
    if L8_2 == nil or L8_2 == 0 then
      L9_2 = nil
      return L9_2
    end
    L9_2 = readSmallInteger
    L10_2 = plao
    L10_2 = L10_2.Pcab
    L10_2 = L8_2 + L10_2
    L9_2 = L9_2(L10_2)
    L5_2 = L9_2
    L9_2 = readSmallInteger
    L10_2 = plao
    L10_2 = L10_2.Pcrp
    L10_2 = L8_2 + L10_2
    L9_2 = L9_2(L10_2)
    L6_2 = L9_2
  end
  L8_2 = isStaff
  L9_2 = L2_2
  L8_2 = L8_2(L9_2)
  if L8_2 and L7_2 ~= 1 then
    L8_2 = getPlayerFromPerson
    L9_2 = L2_2
    L8_2 = L8_2(L9_2)
    if L8_2 == nil or L8_2 == 0 then
      L9_2 = nil
      return L9_2
    end
    L9_2 = readSmallInteger
    L10_2 = nplo
    L10_2 = L10_2.Ncra
    L10_2 = L8_2 + L10_2
    L9_2 = L9_2(L10_2)
    L5_2 = L9_2
    L9_2 = readSmallInteger
    L10_2 = nplo
    L10_2 = L10_2.Ncrr
    L10_2 = L8_2 + L10_2
    L9_2 = L9_2(L10_2)
    L6_2 = L9_2
  end
  L8_2 = getClubNation
  L9_2 = getPersonClub
  L10_2 = L2_2
  L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2 = L9_2(L10_2)
  L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2)
  if L8_2 == nil or L8_2 == 0 then
    L9_2 = nil
    return L9_2
  end
  L9_2 = readQword
  L10_2 = readQword
  L11_2 = nato
  L11_2 = L11_2.Ntct
  L11_2 = L8_2 + L11_2
  L10_2 = L10_2(L11_2)
  L11_2 = nato
  L11_2 = L11_2.Nwgv
  L10_2 = L10_2 + L11_2
  L9_2 = L9_2(L10_2)
  if L9_2 == nil or L9_2 == 0 then
    L10_2 = nil
    return L10_2
  end
  L10_2 = os
  L10_2 = L10_2.clock
  L10_2 = L10_2()
  L11_2 = {}
  L12_2 = 0
  L13_2 = 1
  L14_2 = 20
  L15_2 = 1
  for L16_2 = L13_2, L14_2, L15_2 do
    L17_2 = readInteger
    L18_2 = L9_2 + L12_2
    L17_2 = L17_2(L18_2)
    L11_2[L16_2] = L17_2
    L12_2 = L12_2 + 4
  end
  L13_2 = {}
  L14_2 = 1
  L15_2 = 11
  L16_2 = 21
  L17_2 = 31
  L18_2 = 41
  L19_2 = 51
  L20_2 = 61
  L21_2 = 71
  L22_2 = 81
  L23_2 = 91
  L24_2 = 101
  L25_2 = 111
  L26_2 = 121
  L27_2 = 131
  L28_2 = 141
  L29_2 = 151
  L30_2 = 161
  L31_2 = 171
  L32_2 = 181
  L33_2 = 191
  L13_2[1] = L14_2
  L13_2[2] = L15_2
  L13_2[3] = L16_2
  L13_2[4] = L17_2
  L13_2[5] = L18_2
  L13_2[6] = L19_2
  L13_2[7] = L20_2
  L13_2[8] = L21_2
  L13_2[9] = L22_2
  L13_2[10] = L23_2
  L13_2[11] = L24_2
  L13_2[12] = L25_2
  L13_2[13] = L26_2
  L13_2[14] = L27_2
  L13_2[15] = L28_2
  L13_2[16] = L29_2
  L13_2[17] = L30_2
  L13_2[18] = L31_2
  L13_2[19] = L32_2
  L13_2[20] = L33_2
  L14_2 = {}
  L15_2 = 50
  L16_2 = 550
  L17_2 = 1050
  L18_2 = 1550
  L19_2 = 2050
  L20_2 = 2550
  L21_2 = 3050
  L22_2 = 3550
  L23_2 = 4050
  L24_2 = 4550
  L25_2 = 5050
  L26_2 = 5550
  L27_2 = 6050
  L28_2 = 6550
  L29_2 = 7050
  L30_2 = 7550
  L31_2 = 8050
  L32_2 = 8550
  L33_2 = 9050
  L34_2 = 9550
  L14_2[1] = L15_2
  L14_2[2] = L16_2
  L14_2[3] = L17_2
  L14_2[4] = L18_2
  L14_2[5] = L19_2
  L14_2[6] = L20_2
  L14_2[7] = L21_2
  L14_2[8] = L22_2
  L14_2[9] = L23_2
  L14_2[10] = L24_2
  L14_2[11] = L25_2
  L14_2[12] = L26_2
  L14_2[13] = L27_2
  L14_2[14] = L28_2
  L14_2[15] = L29_2
  L14_2[16] = L30_2
  L14_2[17] = L31_2
  L14_2[18] = L32_2
  L14_2[19] = L33_2
  L14_2[20] = L34_2
  L15_2 = 0
  if A1_2 == 1 then
    L16_2 = 20
    L17_2 = 1
    L18_2 = -1
    for L19_2 = L16_2, L17_2, L18_2 do
      L20_2 = L13_2[L19_2]
      if L5_2 > L20_2 then
        L20_2 = L13_2[L19_2]
        if L20_2 == 191 then
          L20_2 = math
          L20_2 = L20_2.random
          L21_2 = L11_2[L19_2]
          L22_2 = 500000
          L20_2 = L20_2(L21_2, L22_2)
          L15_2 = L20_2
          break
        end
        L20_2 = math
        L20_2 = L20_2.random
        L21_2 = L11_2[L19_2]
        L22_2 = L19_2 + 1
        L22_2 = L11_2[L22_2]
        L20_2 = L20_2(L21_2, L22_2)
        L15_2 = L20_2
        break
      end
    end
  elseif A1_2 == 2 then
    L16_2 = 20
    L17_2 = 1
    L18_2 = -1
    for L19_2 = L16_2, L17_2, L18_2 do
      L20_2 = L14_2[L19_2]
      if L6_2 > L20_2 then
        L20_2 = L14_2[L19_2]
        if L20_2 == 9550 then
          L20_2 = math
          L20_2 = L20_2.random
          L21_2 = L11_2[L19_2]
          L22_2 = 500000
          L20_2 = L20_2(L21_2, L22_2)
          L15_2 = L20_2
          break
        end
        L20_2 = math
        L20_2 = L20_2.random
        L21_2 = L11_2[L19_2]
        L22_2 = L19_2 + 1
        L22_2 = L11_2[L22_2]
        L20_2 = L20_2(L21_2, L22_2)
        L15_2 = L20_2
        break
      end
    end
  else
    L16_2 = math
    L16_2 = L16_2.random
    L17_2 = 1
    L18_2 = 500000
    L16_2 = L16_2(L17_2, L18_2)
    L15_2 = L16_2
  end
  L16_2 = writeInteger
  L17_2 = pero
  L17_2 = L17_2.Pcwg
  L17_2 = L3_2 + L17_2
  L18_2 = L15_2
  return L16_2(L17_2, L18_2)
end

wageAdjustment = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "wageAdjustment"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L0_2 = readQword
  L1_2 = "ptrPerson"
  L0_2 = L0_2(L1_2)
  if L0_2 ~= nil and L0_2 ~= 0 then
    L1_2 = isPerson
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
    if L1_2 then
      goto lbl_15
    end
  end
  L1_2 = nil
  do return L1_2 end
  ::lbl_15::
  L1_2 = getAddressList
  L1_2 = L1_2()
  L1_2 = L1_2.getMemoryRecordByID
  L2_2 = 23644
  L1_2 = L1_2(L2_2)
  L2_2 = getAddressList
  L2_2 = L2_2()
  L2_2 = L2_2.getMemoryRecordByID
  L3_2 = 1662
  L2_2 = L2_2(L3_2)
  L3_2 = getAddressSafe
  L4_2 = pero
  L4_2 = L4_2.Pada
  L4_2 = L0_2 + L4_2
  L3_2 = L3_2(L4_2)
  L4_2 = 0
  L5_2 = 7
  L6_2 = 1
  for L7_2 = L4_2, L5_2, L6_2 do
    L8_2 = writeByte
    L9_2 = L3_2 + L7_2
    L10_2 = math
    L10_2 = L10_2.random
    L11_2 = 1
    L12_2 = 20
    L10_2, L11_2, L12_2 = L10_2(L11_2, L12_2)
    L8_2(L9_2, L10_2, L11_2, L12_2)
  end
  L4_2 = isPlayer
  L5_2 = L0_2
  L4_2 = L4_2(L5_2)
  if L4_2 then
    L4_2 = getPlayerFromPerson
    L5_2 = L0_2
    L4_2 = L4_2(L5_2)
    L5_2 = writeFMAttribute
    L6_2 = plao
    L6_2 = L6_2.Patr
    L6_2 = L4_2 + L6_2
    L6_2 = L6_2 + 51
    L7_2 = math
    L7_2 = L7_2.random
    L8_2 = 1
    L9_2 = 20
    L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L7_2(L8_2, L9_2)
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
    L5_2 = writeFMAttribute
    L6_2 = plao
    L6_2 = L6_2.Patr
    L6_2 = L4_2 + L6_2
    L6_2 = L6_2 + 40
    L7_2 = math
    L7_2 = L7_2.random
    L8_2 = 1
    L9_2 = 20
    L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L7_2(L8_2, L9_2)
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  end
  L4_2 = getPersonPersonality
  L5_2 = L1_2
  L6_2 = "ptrRCA+4"
  L4_2(L5_2, L6_2)
  return
end

randomPersonality = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "randomPersonality"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = getAddressSafe
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPerson
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_17
    end
  end
  L2_2 = readQword
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_17::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPerson
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_30
    end
  end
  L2_2 = readQword
  L3_2 = "ptrPerson"
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_30::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPerson
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L2_2 = readQword
  L3_2 = pero
  L3_2 = L3_2.Ptrn
  L3_2 = L1_2 + L3_2
  L2_2 = L2_2(L3_2)
  if L2_2 == nil or L2_2 == 0 then
    return
  end
  L3_2 = readQword
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = readQword
  L5_2 = L2_2 + 8
  L4_2 = L4_2(L5_2)
  L5_2 = readQword
  L6_2 = "mgrTransfer"
  L5_2 = L5_2(L6_2)
  L6_2 = readQword
  L7_2 = L5_2 + 32
  L6_2 = L6_2(L7_2)
  L7_2 = readQword
  L8_2 = L5_2 + 40
  L7_2 = L7_2(L8_2)
  L8_2 = L7_2 - L6_2
  L8_2 = L8_2 / 8
  L9_2 = L4_2 - L3_2
  L9_2 = L9_2 / 4
  L10_2 = forEach
  L11_2 = L3_2
  L12_2 = L4_2
  L13_2 = 4
  
  function L14_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3
    if 100 < A0_3 then
      L2_3 = false
      return L2_3
    end
    L2_3 = readSmallInteger
    L3_3 = A1_3
    L2_3 = L2_3(L3_3)
    if not (L2_3 < 0) then
      L3_3 = L8_2
      if not (L2_3 > L3_3) then
        goto lbl_15
      end
    end
    L3_3 = false
    do return L3_3 end
    ::lbl_15::
    L3_3 = readQword
    L4_3 = L6_2
    L5_3 = L2_3 * 8
    L4_3 = L4_3 + L5_3
    L3_3 = L3_3(L4_3)
    A1_3 = L3_3
    if A1_3 == nil then
      L3_3 = false
      return L3_3
    end
    L3_3 = readByte
    L4_3 = tfoo
    L4_3 = L4_3.Ttst
    L4_3 = A1_3 + L4_3
    L3_3 = L3_3(L4_3)
    if L3_3 ~= 2 and L3_3 ~= 3 and L3_3 ~= 15 and L3_3 ~= 16 and L3_3 ~= 19 and L3_3 ~= 20 then
      L4_3 = writeByte
      L5_3 = tfoo
      L5_3 = L5_3.Ttst
      L5_3 = A1_3 + L5_3
      L6_3 = 3
      L4_3(L5_3, L6_3)
    end
  end
  
  L10_2(L11_2, L12_2, L13_2, L14_2)
  return
end

cancelAllOffers = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "cancelAllOffers"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = getAddressSafe
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPerson
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_17
    end
  end
  L2_2 = readQword
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_17::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPerson
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_30
    end
  end
  L2_2 = readQword
  L3_2 = "ptrPerson"
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_30::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPerson
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L2_2 = isPlayer
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L2_2 = getPlayerFromPerson
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 == nil or L2_2 == 0 then
      L3_2 = nil
      return L3_2
    end
    L3_2 = writeSmallInteger
    L4_2 = plao
    L4_2 = L4_2.Pcab
    L4_2 = L2_2 + L4_2
    L5_2 = readSmallInteger
    L6_2 = plao
    L6_2 = L6_2.Ppab
    L6_2 = L2_2 + L6_2
    L5_2, L6_2 = L5_2(L6_2)
    return L3_2(L4_2, L5_2, L6_2)
  end
  L2_2 = isStaff
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L2_2 = getPlayerFromPerson
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 == nil or L2_2 == 0 then
      L3_2 = nil
      return L3_2
    end
    L3_2 = writeSmallInteger
    L4_2 = nplo
    L4_2 = L4_2.Ncra
    L4_2 = L2_2 + L4_2
    L5_2 = readSmallInteger
    L6_2 = nplo
    L6_2 = L6_2.Npta
    L6_2 = L2_2 + L6_2
    L5_2, L6_2 = L5_2(L6_2)
    return L3_2(L4_2, L5_2, L6_2)
  end
  return
end

matchCA_PA = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "matchCA_PA"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = getAddressSafe
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPlayer
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_17
    end
  end
  L2_2 = readQword
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_17::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPlayer
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_30
    end
  end
  L2_2 = readQword
  L3_2 = "ptrPerson"
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_30::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPlayer
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L2_2 = writeQword
  L3_2 = plao
  L3_2 = L3_2.Pprm
  L3_2 = L1_2 + L3_2
  L4_2 = 0
  L2_2(L3_2, L4_2)
  return
end

removeAllTraits = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "removeAllTraits"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = getAddressSafe
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isPlayer
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_17
    end
  end
  L4_2 = readQword
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L3_2 = L4_2
  ::lbl_17::
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isPlayer
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_30
    end
  end
  L4_2 = readQword
  L5_2 = "ptrPerson"
  L4_2 = L4_2(L5_2)
  L3_2 = L4_2
  ::lbl_30::
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isPlayer
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L4_2 = getPlayerFromPerson
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  if L4_2 == nil or L4_2 == 0 then
    L5_2 = nil
    return L5_2
  end
  if not A2_2 then
    L5_2 = readQword
    L6_2 = plao
    L6_2 = L6_2.Pijl
    L6_2 = L4_2 + L6_2
    L5_2 = L5_2(L6_2)
    if L5_2 ~= nil and L5_2 ~= 0 then
      L6_2 = writeQword
      L7_2 = L5_2 + 8
      L8_2 = readQword
      L9_2 = L5_2
      L8_2, L9_2 = L8_2(L9_2)
      L6_2(L7_2, L8_2, L9_2)
    end
  end
  L5_2 = writeSmallInteger
  L6_2 = plao
  L6_2 = L6_2.Pmsh
  L6_2 = L4_2 + L6_2
  L7_2 = A1_2
  L5_2(L6_2, L7_2)
  L5_2 = writeSmallInteger
  L6_2 = plao
  L6_2 = L6_2.Pftg
  L6_2 = L4_2 + L6_2
  L7_2 = 0
  L5_2(L6_2, L7_2)
  L5_2 = writeSmallInteger
  L6_2 = plao
  L6_2 = L6_2.Popc
  L6_2 = L4_2 + L6_2
  L7_2 = A1_2
  L5_2(L6_2, L7_2)
  L5_2 = writeByte
  L6_2 = plao
  L6_2 = L6_2.Pmor
  L6_2 = L4_2 + L6_2
  L7_2 = 20
  L5_2(L6_2, L7_2)
  return
end

removePlayerInjuries = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "removePlayerInjuries"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = getAddressSafe
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPlayer
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_17
    end
  end
  L2_2 = readQword
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_17::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPlayer
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_30
    end
  end
  L2_2 = readQword
  L3_2 = "ptrPerson"
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_30::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPlayer
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L2_2 = getPlayerFromPerson
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if L2_2 == nil or L2_2 == 0 then
    L3_2 = nil
    return L3_2
  end
  L3_2 = readQword
  L4_2 = plao
  L4_2 = L4_2.Pijl
  L4_2 = L2_2 + L4_2
  L3_2 = L3_2(L4_2)
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = writeQword
    L5_2 = L3_2 + 32
    L6_2 = readQword
    L7_2 = L3_2 + 24
    L6_2, L7_2 = L6_2(L7_2)
    L4_2(L5_2, L6_2, L7_2)
  end
  return
end

removePlayerBans = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "removePlayerBans"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L1_2 = getAddressSafe
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPlayer
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_17
    end
  end
  L2_2 = readQword
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_17::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPlayer
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_30
    end
  end
  L2_2 = readQword
  L3_2 = "ptrPerson"
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_30::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPlayer
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L2_2 = readQword
  L3_2 = pero
  L3_2 = L3_2.Pflc
  L3_2 = L1_2 + L3_2
  L2_2 = L2_2(L3_2)
  if L2_2 == nil or L2_2 == 0 then
    L3_2 = nil
    return L3_2
  end
  L3_2 = getRTTIClassName
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L3_2 = L3_2 == "db::FULL_CONTRACT"
  if not L3_2 then
    L4_2 = nil
    return L4_2
  end
  L4_2 = readQword
  L5_2 = plao
  L5_2 = L5_2.Punh
  L5_2 = L2_2 + L5_2
  L4_2 = L4_2(L5_2)
  if L4_2 == nil or L4_2 == 0 then
    L5_2 = nil
    return L5_2
  end
  L5_2 = readInteger
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  if 0 < L5_2 then
    L6_2 = 1
    L7_2 = L5_2
    L8_2 = 1
    for L9_2 = L6_2, L7_2, L8_2 do
      L10_2 = readQword
      L11_2 = L9_2 * 8
      L11_2 = L4_2 + L11_2
      L10_2 = L10_2(L11_2)
      if L10_2 ~= nil and L10_2 ~= 0 then
        L11_2 = readInteger
        L12_2 = L10_2 + 4
        L11_2 = L11_2(L12_2)
        if L11_2 == 124518401 then
          L11_2 = writeInteger
          L12_2 = L10_2 + 4
          L13_2 = readInteger
          L14_2 = getAddressSafe
          L15_2 = "datTimeRoot"
          L14_2, L15_2 = L14_2(L15_2)
          L13_2, L14_2, L15_2 = L13_2(L14_2, L15_2)
          L11_2(L12_2, L13_2, L14_2, L15_2)
        end
      end
    end
  end
  return
end

removePlayerUnhappiness = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "removePlayerUnhappiness"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = getAddressSafe
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPlayer
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_17
    end
  end
  L2_2 = readQword
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_17::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPlayer
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_30
    end
  end
  L2_2 = readQword
  L3_2 = "ptrPerson"
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_30::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPlayer
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L2_2 = forEachRelationInPerson
  L3_2 = L1_2
  
  function L4_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3
    L2_3 = readBytes
    L3_3 = A1_3 + 11
    L2_3 = L2_3(L3_3)
    if L2_3 == 71 then
      L3_3 = writeByte
      L4_3 = A1_3 + 12
      L5_3 = 127
      L3_3(L4_3, L5_3)
      L3_3 = false
      return L3_3
    end
  end
  
  L2_2(L3_2, L4_2)
  return
end

maxTrainingHappiness = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "maxTrainingHappiness"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = getAddressSafe
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isPlayer
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_17
    end
  end
  L4_2 = readQword
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L3_2 = L4_2
  ::lbl_17::
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isPlayer
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_30
    end
  end
  L4_2 = readQword
  L5_2 = "ptrPerson"
  L4_2 = L4_2(L5_2)
  L3_2 = L4_2
  ::lbl_30::
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isPlayer
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L4_2 = getPlayerCurrentTeam
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  if L4_2 == nil or L4_2 == 0 then
    return
  end
  L5_2 = A1_2
  L6_2 = nil
  if A2_2 then
    L7_2 = createSelectionList
    L8_2 = "Squad Selection Value"
    L9_2 = squadSelectionValueTypes
    L7_2 = L7_2(L8_2, L9_2)
    L5_2 = L7_2
    if L5_2 == nil then
      return
    end
  end
  L7_2 = forEachRelationInPerson
  L8_2 = L3_2
  
  function L9_2(A0_3, A1_3)
    local L2_3, L3_3
    L2_3 = readByte
    L3_3 = A1_3 + 11
    L2_3 = L2_3(L3_3)
    if L2_3 == 25 then
      L2_3 = readByte
      L3_3 = A1_3 + 12
      L2_3 = L2_3(L3_3)
      L3_3 = L5_2
      if L2_3 == L3_3 then
        L2_3 = true
        L6_2 = L2_3
        L2_3 = false
        return L2_3
      end
    end
  end
  
  L7_2(L8_2, L9_2)
  if not L6_2 then
    L7_2 = forEachRelationInPerson
    L8_2 = L3_2
    
    function L9_2(A0_3, A1_3)
      local L2_3, L3_3, L4_3
      L2_3 = readByte
      L3_3 = A1_3 + 11
      L2_3 = L2_3(L3_3)
      if L2_3 ~= 71 then
        L2_3 = readByte
        L3_3 = A1_3 + 11
        L2_3 = L2_3(L3_3)
        if L2_3 ~= 106 then
          goto lbl_33
        end
      end
      L2_3 = writeQword
      L3_3 = A1_3
      L4_3 = L4_2
      L2_3(L3_3, L4_3)
      L2_3 = writeSmallInteger
      L3_3 = A1_3 + 8
      L4_3 = 0
      L2_3(L3_3, L4_3)
      L2_3 = writeByte
      L3_3 = A1_3 + 10
      L4_3 = 4
      L2_3(L3_3, L4_3)
      L2_3 = writeByte
      L3_3 = A1_3 + 11
      L4_3 = 25
      L2_3(L3_3, L4_3)
      L2_3 = writeByte
      L3_3 = A1_3 + 12
      L4_3 = L5_2
      L2_3(L3_3, L4_3)
      L2_3 = false
      do return L2_3 end
      ::lbl_33::
    end
    
    L7_2(L8_2, L9_2)
  end
  return
end

registerPlayer = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "registerPlayer"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2, L48_2, L49_2, L50_2, L51_2, L52_2, L53_2, L54_2, L55_2, L56_2, L57_2, L58_2, L59_2, L60_2, L61_2, L62_2, L63_2, L64_2, L65_2, L66_2, L67_2, L68_2, L69_2, L70_2, L71_2, L72_2, L73_2, L74_2, L75_2, L76_2, L77_2, L78_2, L79_2, L80_2, L81_2, L82_2, L83_2, L84_2, L85_2, L86_2, L87_2, L88_2, L89_2, L90_2, L91_2, L92_2, L93_2, L94_2, L95_2, L96_2, L97_2, L98_2, L99_2, L100_2, L101_2, L102_2, L103_2, L104_2, L105_2, L106_2, L107_2, L108_2, L109_2, L110_2, L111_2
  L1_2 = getAddressSafe
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPlayer
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_17
    end
  end
  L2_2 = readQword
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_17::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPlayer
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_30
    end
  end
  L2_2 = readQword
  L3_2 = "ptrPerson"
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_30::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPlayer
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L2_2 = getPlayerFromPerson
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if L2_2 == nil or L2_2 == 0 then
    L3_2 = nil
    return L3_2
  end
  L3_2 = getPlayerData
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L2_2 = L3_2
  if L2_2 == nil or L2_2 == 0 then
    L3_2 = nil
    return L3_2
  end
  L3_2 = {}
  L4_2 = tonumber
  L5_2 = L2_2.Adaptability
  L5_2 = L5_2.value
  L4_2 = L4_2(L5_2)
  L5_2 = tonumber
  L6_2 = L2_2.Ambition
  L6_2 = L6_2.value
  L5_2 = L5_2(L6_2)
  L6_2 = tonumber
  L7_2 = L2_2.Loyalty
  L7_2 = L7_2.value
  L6_2 = L6_2(L7_2)
  L7_2 = tonumber
  L8_2 = L2_2.Pressure
  L8_2 = L8_2.value
  L7_2 = L7_2(L8_2)
  L8_2 = tonumber
  L9_2 = L2_2.Professionalism
  L9_2 = L9_2.value
  L8_2 = L8_2(L9_2)
  L9_2 = tonumber
  L10_2 = L2_2.Sportmanship
  L10_2 = L10_2.value
  L9_2 = L9_2(L10_2)
  L10_2 = tonumber
  L11_2 = L2_2.Temperament
  L11_2 = L11_2.value
  L10_2 = L10_2(L11_2)
  L11_2 = tonumber
  L12_2 = L2_2.Controversy
  L12_2 = L12_2.value
  L11_2 = L11_2(L12_2)
  L12_2 = tonumber
  L13_2 = L2_2.Consistency
  L13_2 = L13_2.value
  L12_2 = L12_2(L13_2)
  L13_2 = tonumber
  L14_2 = L2_2.Dirtiness
  L14_2 = L14_2.value
  L13_2 = L13_2(L14_2)
  L14_2 = tonumber
  L15_2 = L2_2.ImportantMatches
  L15_2 = L15_2.value
  L14_2 = L14_2(L15_2)
  L15_2 = tonumber
  L16_2 = L2_2.InjuryProness
  L16_2 = L16_2.value
  L15_2 = L15_2(L16_2)
  L16_2 = tonumber
  L17_2 = L2_2.Versatility
  L17_2 = L17_2.value
  L16_2 = L16_2(L17_2)
  L17_2 = tonumber
  L18_2 = L2_2.AerialAbility
  L18_2 = L18_2.value
  L17_2 = L17_2(L18_2)
  L18_2 = tonumber
  L19_2 = L2_2.CommandOfArea
  L19_2 = L19_2.value
  L18_2 = L18_2(L19_2)
  L19_2 = tonumber
  L20_2 = L2_2.Communication
  L20_2 = L20_2.value
  L19_2 = L19_2(L20_2)
  L20_2 = tonumber
  L21_2 = L2_2.Eccentricity
  L21_2 = L21_2.value
  L20_2 = L20_2(L21_2)
  L21_2 = tonumber
  L22_2 = L2_2.Handling
  L22_2 = L22_2.value
  L21_2 = L21_2(L22_2)
  L22_2 = tonumber
  L23_2 = L2_2.Kicking
  L23_2 = L23_2.value
  L22_2 = L22_2(L23_2)
  L23_2 = tonumber
  L24_2 = L2_2.OneOnOnes
  L24_2 = L24_2.value
  L23_2 = L23_2(L24_2)
  L24_2 = tonumber
  L25_2 = L2_2.TendencyToPunch
  L25_2 = L25_2.value
  L24_2 = L24_2(L25_2)
  L25_2 = tonumber
  L26_2 = L2_2.Reflexes
  L26_2 = L26_2.value
  L25_2 = L25_2(L26_2)
  L26_2 = tonumber
  L27_2 = L2_2.RushingOut
  L27_2 = L27_2.value
  L26_2 = L26_2(L27_2)
  L27_2 = tonumber
  L28_2 = L2_2.Throwing
  L28_2 = L28_2.value
  L27_2 = L27_2(L28_2)
  L28_2 = tonumber
  L29_2 = L2_2.Aggression
  L29_2 = L29_2.value
  L28_2 = L28_2(L29_2)
  L29_2 = tonumber
  L30_2 = L2_2.Anticipation
  L30_2 = L30_2.value
  L29_2 = L29_2(L30_2)
  L30_2 = tonumber
  L31_2 = L2_2.Bravery
  L31_2 = L31_2.value
  L30_2 = L30_2(L31_2)
  L31_2 = tonumber
  L32_2 = L2_2.Composure
  L32_2 = L32_2.value
  L31_2 = L31_2(L32_2)
  L32_2 = tonumber
  L33_2 = L2_2.Concentration
  L33_2 = L33_2.value
  L32_2 = L32_2(L33_2)
  L33_2 = tonumber
  L34_2 = L2_2.Decisions
  L34_2 = L34_2.value
  L33_2 = L33_2(L34_2)
  L34_2 = tonumber
  L35_2 = L2_2.Determination
  L35_2 = L35_2.value
  L34_2 = L34_2(L35_2)
  L35_2 = tonumber
  L36_2 = L2_2.Flair
  L36_2 = L36_2.value
  L35_2 = L35_2(L36_2)
  L36_2 = tonumber
  L37_2 = L2_2.Leadership
  L37_2 = L37_2.value
  L36_2 = L36_2(L37_2)
  L37_2 = tonumber
  L38_2 = L2_2.OffTheBall
  L38_2 = L38_2.value
  L37_2 = L37_2(L38_2)
  L38_2 = tonumber
  L39_2 = L2_2.Positioning
  L39_2 = L39_2.value
  L38_2 = L38_2(L39_2)
  L39_2 = tonumber
  L40_2 = L2_2.Teamwork
  L40_2 = L40_2.value
  L39_2 = L39_2(L40_2)
  L40_2 = tonumber
  L41_2 = L2_2.Vision
  L41_2 = L41_2.value
  L40_2 = L40_2(L41_2)
  L41_2 = tonumber
  L42_2 = L2_2.Workrate
  L42_2 = L42_2.value
  L41_2 = L41_2(L42_2)
  L42_2 = tonumber
  L43_2 = L2_2.Acceleration
  L43_2 = L43_2.value
  L42_2 = L42_2(L43_2)
  L43_2 = tonumber
  L44_2 = L2_2.Agility
  L44_2 = L44_2.value
  L43_2 = L43_2(L44_2)
  L44_2 = tonumber
  L45_2 = L2_2.Balance
  L45_2 = L45_2.value
  L44_2 = L44_2(L45_2)
  L45_2 = tonumber
  L46_2 = L2_2.Jumping
  L46_2 = L46_2.value
  L45_2 = L45_2(L46_2)
  L46_2 = tonumber
  L47_2 = L2_2.NaturalFitness
  L47_2 = L47_2.value
  L46_2 = L46_2(L47_2)
  L47_2 = tonumber
  L48_2 = L2_2.Pace
  L48_2 = L48_2.value
  L47_2 = L47_2(L48_2)
  L48_2 = tonumber
  L49_2 = L2_2.Stamina
  L49_2 = L49_2.value
  L48_2 = L48_2(L49_2)
  L49_2 = tonumber
  L50_2 = L2_2.Strength
  L50_2 = L50_2.value
  L49_2 = L49_2(L50_2)
  L50_2 = tonumber
  L51_2 = L2_2.Corners
  L51_2 = L51_2.value
  L50_2 = L50_2(L51_2)
  L51_2 = tonumber
  L52_2 = L2_2.Crossing
  L52_2 = L52_2.value
  L51_2 = L51_2(L52_2)
  L52_2 = tonumber
  L53_2 = L2_2.Dribbling
  L53_2 = L53_2.value
  L52_2 = L52_2(L53_2)
  L53_2 = tonumber
  L54_2 = L2_2.Finishing
  L54_2 = L54_2.value
  L53_2 = L53_2(L54_2)
  L54_2 = tonumber
  L55_2 = L2_2.FirstTouch
  L55_2 = L55_2.value
  L54_2 = L54_2(L55_2)
  L55_2 = tonumber
  L56_2 = L2_2.Freekicks
  L56_2 = L56_2.value
  L55_2 = L55_2(L56_2)
  L56_2 = tonumber
  L57_2 = L2_2.Heading
  L57_2 = L57_2.value
  L56_2 = L56_2(L57_2)
  L57_2 = tonumber
  L58_2 = L2_2.LongShots
  L58_2 = L58_2.value
  L57_2 = L57_2(L58_2)
  L58_2 = tonumber
  L59_2 = L2_2.Longthrows
  L59_2 = L59_2.value
  L58_2 = L58_2(L59_2)
  L59_2 = tonumber
  L60_2 = L2_2.Marking
  L60_2 = L60_2.value
  L59_2 = L59_2(L60_2)
  L60_2 = tonumber
  L61_2 = L2_2.Passing
  L61_2 = L61_2.value
  L60_2 = L60_2(L61_2)
  L61_2 = tonumber
  L62_2 = L2_2.PenaltyTaking
  L62_2 = L62_2.value
  L61_2 = L61_2(L62_2)
  L62_2 = tonumber
  L63_2 = L2_2.Tackling
  L63_2 = L63_2.value
  L62_2 = L62_2(L63_2)
  L63_2 = tonumber
  L64_2 = L2_2.Technique
  L64_2 = L64_2.value
  L63_2 = L63_2(L64_2)
  L64_2 = 3
  L65_2 = 2
  L66_2 = getObjectName
  L67_2 = L1_2
  L66_2 = L66_2(L67_2)
  L67_2 = readInteger
  L68_2 = objo
  L68_2 = L68_2.Duni
  L68_2 = L1_2 + L68_2
  L67_2 = L67_2(L68_2)
  L68_2 = string
  L68_2 = L68_2.format
  L69_2 = "SK (D):\t %.1f%%"
  L70_2 = math
  L70_2 = L70_2.average
  L71_2 = {}
  L72_2 = L18_2
  L73_2 = L22_2
  L74_2 = L23_2
  L75_2 = L25_2
  L76_2 = L29_2
  L77_2 = L32_2
  L78_2 = L38_2
  L79_2 = L43_2
  L71_2[1] = L72_2
  L71_2[2] = L73_2
  L71_2[3] = L74_2
  L71_2[4] = L75_2
  L71_2[5] = L76_2
  L71_2[6] = L77_2
  L71_2[7] = L78_2
  L71_2[8] = L79_2
  L70_2 = L70_2(L71_2)
  L70_2 = L70_2 * L64_2
  L71_2 = math
  L71_2 = L71_2.average
  L72_2 = {}
  L73_2 = L17_2
  L74_2 = L19_2
  L75_2 = L54_2
  L76_2 = L21_2
  L77_2 = L60_2
  L78_2 = L26_2
  L79_2 = L27_2
  L80_2 = L31_2
  L81_2 = L33_2
  L82_2 = L40_2
  L83_2 = L42_2
  L72_2[1] = L73_2
  L72_2[2] = L74_2
  L72_2[3] = L75_2
  L72_2[4] = L76_2
  L72_2[5] = L77_2
  L72_2[6] = L78_2
  L72_2[7] = L79_2
  L72_2[8] = L80_2
  L72_2[9] = L81_2
  L72_2[10] = L82_2
  L72_2[11] = L83_2
  L71_2 = L71_2(L72_2)
  L71_2 = L71_2 * L65_2
  L70_2 = L70_2 + L71_2
  L68_2 = L68_2(L69_2, L70_2)
  L69_2 = string
  L69_2 = L69_2.format
  L70_2 = "\tGK (D):\t %.1f%%"
  L71_2 = math
  L71_2 = L71_2.average
  L72_2 = {}
  L73_2 = L17_2
  L74_2 = L18_2
  L75_2 = L19_2
  L76_2 = L21_2
  L77_2 = L22_2
  L78_2 = L25_2
  L79_2 = L32_2
  L80_2 = L38_2
  L81_2 = L43_2
  L72_2[1] = L73_2
  L72_2[2] = L74_2
  L72_2[3] = L75_2
  L72_2[4] = L76_2
  L72_2[5] = L77_2
  L72_2[6] = L78_2
  L72_2[7] = L79_2
  L72_2[8] = L80_2
  L72_2[9] = L81_2
  L71_2 = L71_2(L72_2)
  L71_2 = L71_2 * L64_2
  L72_2 = math
  L72_2 = L72_2.average
  L73_2 = {}
  L74_2 = L23_2
  L75_2 = L27_2
  L76_2 = L29_2
  L77_2 = L33_2
  L73_2[1] = L74_2
  L73_2[2] = L75_2
  L73_2[3] = L76_2
  L73_2[4] = L77_2
  L72_2 = L72_2(L73_2)
  L72_2 = L72_2 * L65_2
  L71_2 = L71_2 + L72_2
  L69_2 = L69_2(L70_2, L71_2)
  L70_2 = string
  L70_2 = L70_2.format
  L71_2 = [[

SK (S):	 %.1f%%]]
  L72_2 = math
  L72_2 = L72_2.average
  L73_2 = {}
  L74_2 = L18_2
  L75_2 = L22_2
  L76_2 = L23_2
  L77_2 = L25_2
  L78_2 = L26_2
  L79_2 = L29_2
  L80_2 = L31_2
  L81_2 = L32_2
  L82_2 = L38_2
  L83_2 = L43_2
  L73_2[1] = L74_2
  L73_2[2] = L75_2
  L73_2[3] = L76_2
  L73_2[4] = L77_2
  L73_2[5] = L78_2
  L73_2[6] = L79_2
  L73_2[7] = L80_2
  L73_2[8] = L81_2
  L73_2[9] = L82_2
  L73_2[10] = L83_2
  L72_2 = L72_2(L73_2)
  L72_2 = L72_2 * L64_2
  L73_2 = math
  L73_2 = L73_2.average
  L74_2 = {}
  L75_2 = L17_2
  L76_2 = L19_2
  L77_2 = L54_2
  L78_2 = L21_2
  L79_2 = L60_2
  L80_2 = L27_2
  L81_2 = L33_2
  L82_2 = L40_2
  L83_2 = L42_2
  L74_2[1] = L75_2
  L74_2[2] = L76_2
  L74_2[3] = L77_2
  L74_2[4] = L78_2
  L74_2[5] = L79_2
  L74_2[6] = L80_2
  L74_2[7] = L81_2
  L74_2[8] = L82_2
  L74_2[9] = L83_2
  L73_2 = L73_2(L74_2)
  L73_2 = L73_2 * L65_2
  L72_2 = L72_2 + L73_2
  L70_2 = L70_2(L71_2, L72_2)
  L71_2 = string
  L71_2 = L71_2.format
  L72_2 = [[

SK (A):	 %.1f%%]]
  L73_2 = math
  L73_2 = L73_2.average
  L74_2 = {}
  L75_2 = L18_2
  L76_2 = L22_2
  L77_2 = L23_2
  L78_2 = L25_2
  L79_2 = L26_2
  L80_2 = L29_2
  L81_2 = L31_2
  L82_2 = L32_2
  L83_2 = L38_2
  L84_2 = L43_2
  L74_2[1] = L75_2
  L74_2[2] = L76_2
  L74_2[3] = L77_2
  L74_2[4] = L78_2
  L74_2[5] = L79_2
  L74_2[6] = L80_2
  L74_2[7] = L81_2
  L74_2[8] = L82_2
  L74_2[9] = L83_2
  L74_2[10] = L84_2
  L73_2 = L73_2(L74_2)
  L73_2 = L73_2 * L64_2
  L74_2 = math
  L74_2 = L74_2.average
  L75_2 = {}
  L76_2 = L17_2
  L77_2 = L19_2
  L78_2 = L20_2
  L79_2 = L54_2
  L80_2 = L21_2
  L81_2 = L60_2
  L82_2 = L27_2
  L83_2 = L33_2
  L84_2 = L40_2
  L85_2 = L42_2
  L75_2[1] = L76_2
  L75_2[2] = L77_2
  L75_2[3] = L78_2
  L75_2[4] = L79_2
  L75_2[5] = L80_2
  L75_2[6] = L81_2
  L75_2[7] = L82_2
  L75_2[8] = L83_2
  L75_2[9] = L84_2
  L75_2[10] = L85_2
  L74_2 = L74_2(L75_2)
  L74_2 = L74_2 * L65_2
  L73_2 = L73_2 + L74_2
  L71_2 = L71_2(L72_2, L73_2)
  L68_2 = L68_2 .. L69_2 .. L70_2 .. L71_2
  L3_2[1] = L68_2
  L68_2 = string
  L68_2 = L68_2.format
  L69_2 = "CD (D):\t %.1f%%"
  L70_2 = math
  L70_2 = L70_2.average
  L71_2 = {}
  L72_2 = L56_2
  L73_2 = L59_2
  L74_2 = L62_2
  L75_2 = L38_2
  L76_2 = L45_2
  L77_2 = L49_2
  L71_2[1] = L72_2
  L71_2[2] = L73_2
  L71_2[3] = L74_2
  L71_2[4] = L75_2
  L71_2[5] = L76_2
  L71_2[6] = L77_2
  L70_2 = L70_2(L71_2)
  L70_2 = L70_2 * L64_2
  L71_2 = math
  L71_2 = L71_2.average
  L72_2 = {}
  L73_2 = L28_2
  L74_2 = L29_2
  L75_2 = L30_2
  L76_2 = L31_2
  L77_2 = L32_2
  L78_2 = L33_2
  L79_2 = L47_2
  L72_2[1] = L73_2
  L72_2[2] = L74_2
  L72_2[3] = L75_2
  L72_2[4] = L76_2
  L72_2[5] = L77_2
  L72_2[6] = L78_2
  L72_2[7] = L79_2
  L71_2 = L71_2(L72_2)
  L71_2 = L71_2 * L65_2
  L70_2 = L70_2 + L71_2
  L68_2 = L68_2(L69_2, L70_2)
  L69_2 = string
  L69_2 = L69_2.format
  L70_2 = "\tFB (D):\t %.1f%%"
  L71_2 = math
  L71_2 = L71_2.average
  L72_2 = {}
  L73_2 = L59_2
  L74_2 = L62_2
  L75_2 = L29_2
  L76_2 = L32_2
  L77_2 = L38_2
  L72_2[1] = L73_2
  L72_2[2] = L74_2
  L72_2[3] = L75_2
  L72_2[4] = L76_2
  L72_2[5] = L77_2
  L71_2 = L71_2(L72_2)
  L71_2 = L71_2 * L64_2
  L72_2 = math
  L72_2 = L72_2.average
  L73_2 = {}
  L74_2 = L51_2
  L75_2 = L60_2
  L76_2 = L31_2
  L77_2 = L33_2
  L78_2 = L39_2
  L79_2 = L47_2
  L80_2 = L48_2
  L73_2[1] = L74_2
  L73_2[2] = L75_2
  L73_2[3] = L76_2
  L73_2[4] = L77_2
  L73_2[5] = L78_2
  L73_2[6] = L79_2
  L73_2[7] = L80_2
  L72_2 = L72_2(L73_2)
  L72_2 = L72_2 * L65_2
  L71_2 = L71_2 + L72_2
  L69_2 = L69_2(L70_2, L71_2)
  L70_2 = string
  L70_2 = L70_2.format
  L71_2 = [[

CD (S):	 %.1f%%]]
  L72_2 = math
  L72_2 = L72_2.average
  L73_2 = {}
  L74_2 = L56_2
  L75_2 = L62_2
  L76_2 = L28_2
  L77_2 = L30_2
  L78_2 = L33_2
  L79_2 = L38_2
  L80_2 = L45_2
  L81_2 = L49_2
  L73_2[1] = L74_2
  L73_2[2] = L75_2
  L73_2[3] = L76_2
  L73_2[4] = L77_2
  L73_2[5] = L78_2
  L73_2[6] = L79_2
  L73_2[7] = L80_2
  L73_2[8] = L81_2
  L72_2 = L72_2(L73_2)
  L72_2 = L72_2 * L64_2
  L73_2 = math
  L73_2 = L73_2.average
  L74_2 = {}
  L75_2 = L59_2
  L76_2 = L29_2
  L77_2 = L31_2
  L78_2 = L32_2
  L74_2[1] = L75_2
  L74_2[2] = L76_2
  L74_2[3] = L77_2
  L74_2[4] = L78_2
  L73_2 = L73_2(L74_2)
  L73_2 = L73_2 * L65_2
  L72_2 = L72_2 + L73_2
  L70_2 = L70_2(L71_2, L72_2)
  L71_2 = string
  L71_2 = L71_2.format
  L72_2 = "\tFB (S):\t %.1f%%"
  L73_2 = math
  L73_2 = L73_2.average
  L74_2 = {}
  L75_2 = L59_2
  L76_2 = L62_2
  L77_2 = L29_2
  L78_2 = L32_2
  L79_2 = L38_2
  L80_2 = L39_2
  L81_2 = L41_2
  L74_2[1] = L75_2
  L74_2[2] = L76_2
  L74_2[3] = L77_2
  L74_2[4] = L78_2
  L74_2[5] = L79_2
  L74_2[6] = L80_2
  L74_2[7] = L81_2
  L73_2 = L73_2(L74_2)
  L73_2 = L73_2 * L64_2
  L74_2 = math
  L74_2 = L74_2.average
  L75_2 = {}
  L76_2 = L51_2
  L77_2 = L52_2
  L78_2 = L60_2
  L79_2 = L63_2
  L80_2 = L31_2
  L81_2 = L33_2
  L82_2 = L47_2
  L83_2 = L48_2
  L75_2[1] = L76_2
  L75_2[2] = L77_2
  L75_2[3] = L78_2
  L75_2[4] = L79_2
  L75_2[5] = L80_2
  L75_2[6] = L81_2
  L75_2[7] = L82_2
  L75_2[8] = L83_2
  L74_2 = L74_2(L75_2)
  L74_2 = L74_2 * L65_2
  L73_2 = L73_2 + L74_2
  L71_2 = L71_2(L72_2, L73_2)
  L72_2 = string
  L72_2 = L72_2.format
  L73_2 = [[

CD (C):	 %.1f%%]]
  L74_2 = math
  L74_2 = L74_2.average
  L75_2 = {}
  L76_2 = L59_2
  L77_2 = L62_2
  L78_2 = L29_2
  L79_2 = L32_2
  L80_2 = L33_2
  L81_2 = L38_2
  L82_2 = L47_2
  L75_2[1] = L76_2
  L75_2[2] = L77_2
  L75_2[3] = L78_2
  L75_2[4] = L79_2
  L75_2[5] = L80_2
  L75_2[6] = L81_2
  L75_2[7] = L82_2
  L74_2 = L74_2(L75_2)
  L74_2 = L74_2 * L64_2
  L75_2 = math
  L75_2 = L75_2.average
  L76_2 = {}
  L77_2 = L56_2
  L78_2 = L30_2
  L79_2 = L31_2
  L80_2 = L45_2
  L81_2 = L49_2
  L76_2[1] = L77_2
  L76_2[2] = L78_2
  L76_2[3] = L79_2
  L76_2[4] = L80_2
  L76_2[5] = L81_2
  L75_2 = L75_2(L76_2)
  L75_2 = L75_2 * L65_2
  L74_2 = L74_2 + L75_2
  L72_2 = L72_2(L73_2, L74_2)
  L73_2 = string
  L73_2 = L73_2.format
  L74_2 = "\tFB (A):\t %.1f%%"
  L75_2 = math
  L75_2 = L75_2.average
  L76_2 = {}
  L77_2 = L51_2
  L78_2 = L62_2
  L79_2 = L29_2
  L80_2 = L38_2
  L81_2 = L39_2
  L82_2 = L41_2
  L83_2 = L47_2
  L84_2 = L48_2
  L76_2[1] = L77_2
  L76_2[2] = L78_2
  L76_2[3] = L79_2
  L76_2[4] = L80_2
  L76_2[5] = L81_2
  L76_2[6] = L82_2
  L76_2[7] = L83_2
  L76_2[8] = L84_2
  L75_2 = L75_2(L76_2)
  L75_2 = L75_2 * L64_2
  L76_2 = math
  L76_2 = L76_2.average
  L77_2 = {}
  L78_2 = L52_2
  L79_2 = L54_2
  L80_2 = L59_2
  L81_2 = L60_2
  L82_2 = L63_2
  L83_2 = L31_2
  L84_2 = L32_2
  L85_2 = L33_2
  L86_2 = L37_2
  L87_2 = L42_2
  L88_2 = L43_2
  L77_2[1] = L78_2
  L77_2[2] = L79_2
  L77_2[3] = L80_2
  L77_2[4] = L81_2
  L77_2[5] = L82_2
  L77_2[6] = L83_2
  L77_2[7] = L84_2
  L77_2[8] = L85_2
  L77_2[9] = L86_2
  L77_2[10] = L87_2
  L77_2[11] = L88_2
  L76_2 = L76_2(L77_2)
  L76_2 = L76_2 * L65_2
  L75_2 = L75_2 + L76_2
  L73_2 = L73_2(L74_2, L75_2)
  L74_2 = string
  L74_2 = L74_2.format
  L75_2 = [[

BPD (D):	 %.1f%%]]
  L76_2 = math
  L76_2 = L76_2.average
  L77_2 = {}
  L78_2 = L56_2
  L79_2 = L59_2
  L80_2 = L60_2
  L81_2 = L62_2
  L82_2 = L31_2
  L83_2 = L38_2
  L84_2 = L45_2
  L85_2 = L49_2
  L77_2[1] = L78_2
  L77_2[2] = L79_2
  L77_2[3] = L80_2
  L77_2[4] = L81_2
  L77_2[5] = L82_2
  L77_2[6] = L83_2
  L77_2[7] = L84_2
  L77_2[8] = L85_2
  L76_2 = L76_2(L77_2)
  L76_2 = L76_2 * L64_2
  L77_2 = math
  L77_2 = L77_2.average
  L78_2 = {}
  L79_2 = L54_2
  L80_2 = L63_2
  L81_2 = L28_2
  L82_2 = L29_2
  L83_2 = L30_2
  L84_2 = L32_2
  L85_2 = L33_2
  L86_2 = L40_2
  L87_2 = L47_2
  L78_2[1] = L79_2
  L78_2[2] = L80_2
  L78_2[3] = L81_2
  L78_2[4] = L82_2
  L78_2[5] = L83_2
  L78_2[6] = L84_2
  L78_2[7] = L85_2
  L78_2[8] = L86_2
  L78_2[9] = L87_2
  L77_2 = L77_2(L78_2)
  L77_2 = L77_2 * L65_2
  L76_2 = L76_2 + L77_2
  L74_2 = L74_2(L75_2, L76_2)
  L75_2 = string
  L75_2 = L75_2.format
  L76_2 = "\tWB (D):\t %.1f%%"
  L77_2 = math
  L77_2 = L77_2.average
  L78_2 = {}
  L79_2 = L59_2
  L80_2 = L62_2
  L81_2 = L29_2
  L82_2 = L38_2
  L83_2 = L39_2
  L84_2 = L41_2
  L85_2 = L42_2
  L86_2 = L48_2
  L78_2[1] = L79_2
  L78_2[2] = L80_2
  L78_2[3] = L81_2
  L78_2[4] = L82_2
  L78_2[5] = L83_2
  L78_2[6] = L84_2
  L78_2[7] = L85_2
  L78_2[8] = L86_2
  L77_2 = L77_2(L78_2)
  L77_2 = L77_2 * L64_2
  L78_2 = math
  L78_2 = L78_2.average
  L79_2 = {}
  L80_2 = L51_2
  L81_2 = L52_2
  L82_2 = L54_2
  L83_2 = L60_2
  L84_2 = L63_2
  L85_2 = L32_2
  L86_2 = L33_2
  L87_2 = L37_2
  L88_2 = L43_2
  L89_2 = L47_2
  L79_2[1] = L80_2
  L79_2[2] = L81_2
  L79_2[3] = L82_2
  L79_2[4] = L83_2
  L79_2[5] = L84_2
  L79_2[6] = L85_2
  L79_2[7] = L86_2
  L79_2[8] = L87_2
  L79_2[9] = L88_2
  L79_2[10] = L89_2
  L78_2 = L78_2(L79_2)
  L78_2 = L78_2 * L65_2
  L77_2 = L77_2 + L78_2
  L75_2 = L75_2(L76_2, L77_2)
  L76_2 = string
  L76_2 = L76_2.format
  L77_2 = [[

BPD (S):	 %.1f%%]]
  L78_2 = math
  L78_2 = L78_2.average
  L79_2 = {}
  L80_2 = L56_2
  L81_2 = L60_2
  L82_2 = L62_2
  L83_2 = L28_2
  L84_2 = L30_2
  L85_2 = L31_2
  L86_2 = L33_2
  L87_2 = L38_2
  L88_2 = L45_2
  L89_2 = L49_2
  L79_2[1] = L80_2
  L79_2[2] = L81_2
  L79_2[3] = L82_2
  L79_2[4] = L83_2
  L79_2[5] = L84_2
  L79_2[6] = L85_2
  L79_2[7] = L86_2
  L79_2[8] = L87_2
  L79_2[9] = L88_2
  L79_2[10] = L89_2
  L78_2 = L78_2(L79_2)
  L78_2 = L78_2 * L64_2
  L79_2 = math
  L79_2 = L79_2.average
  L80_2 = {}
  L81_2 = L54_2
  L82_2 = L59_2
  L83_2 = L63_2
  L84_2 = L29_2
  L85_2 = L32_2
  L86_2 = L40_2
  L80_2[1] = L81_2
  L80_2[2] = L82_2
  L80_2[3] = L83_2
  L80_2[4] = L84_2
  L80_2[5] = L85_2
  L80_2[6] = L86_2
  L79_2 = L79_2(L80_2)
  L79_2 = L79_2 * L65_2
  L78_2 = L78_2 + L79_2
  L76_2 = L76_2(L77_2, L78_2)
  L77_2 = string
  L77_2 = L77_2.format
  L78_2 = "\tWB (S):\t %.1f%%"
  L79_2 = math
  L79_2 = L79_2.average
  L80_2 = {}
  L81_2 = L51_2
  L82_2 = L52_2
  L83_2 = L59_2
  L84_2 = L62_2
  L85_2 = L37_2
  L86_2 = L39_2
  L87_2 = L41_2
  L88_2 = L42_2
  L89_2 = L48_2
  L80_2[1] = L81_2
  L80_2[2] = L82_2
  L80_2[3] = L83_2
  L80_2[4] = L84_2
  L80_2[5] = L85_2
  L80_2[6] = L86_2
  L80_2[7] = L87_2
  L80_2[8] = L88_2
  L80_2[9] = L89_2
  L79_2 = L79_2(L80_2)
  L79_2 = L79_2 * L64_2
  L80_2 = math
  L80_2 = L80_2.average
  L81_2 = {}
  L82_2 = L54_2
  L83_2 = L60_2
  L84_2 = L63_2
  L85_2 = L29_2
  L86_2 = L32_2
  L87_2 = L33_2
  L88_2 = L38_2
  L89_2 = L43_2
  L90_2 = L47_2
  L81_2[1] = L82_2
  L81_2[2] = L83_2
  L81_2[3] = L84_2
  L81_2[4] = L85_2
  L81_2[5] = L86_2
  L81_2[6] = L87_2
  L81_2[7] = L88_2
  L81_2[8] = L89_2
  L81_2[9] = L90_2
  L80_2 = L80_2(L81_2)
  L80_2 = L80_2 * L65_2
  L79_2 = L79_2 + L80_2
  L77_2 = L77_2(L78_2, L79_2)
  L78_2 = string
  L78_2 = L78_2.format
  L79_2 = [[

BPD (C):	 %.1f%%]]
  L80_2 = math
  L80_2 = L80_2.average
  L81_2 = {}
  L82_2 = L59_2
  L83_2 = L60_2
  L84_2 = L62_2
  L85_2 = L29_2
  L86_2 = L31_2
  L87_2 = L32_2
  L88_2 = L33_2
  L89_2 = L38_2
  L90_2 = L47_2
  L81_2[1] = L82_2
  L81_2[2] = L83_2
  L81_2[3] = L84_2
  L81_2[4] = L85_2
  L81_2[5] = L86_2
  L81_2[6] = L87_2
  L81_2[7] = L88_2
  L81_2[8] = L89_2
  L81_2[9] = L90_2
  L80_2 = L80_2(L81_2)
  L80_2 = L80_2 * L64_2
  L81_2 = math
  L81_2 = L81_2.average
  L82_2 = {}
  L83_2 = L54_2
  L84_2 = L56_2
  L85_2 = L63_2
  L86_2 = L30_2
  L87_2 = L40_2
  L88_2 = L45_2
  L89_2 = L49_2
  L82_2[1] = L83_2
  L82_2[2] = L84_2
  L82_2[3] = L85_2
  L82_2[4] = L86_2
  L82_2[5] = L87_2
  L82_2[6] = L88_2
  L82_2[7] = L89_2
  L81_2 = L81_2(L82_2)
  L81_2 = L81_2 * L65_2
  L80_2 = L80_2 + L81_2
  L78_2 = L78_2(L79_2, L80_2)
  L79_2 = string
  L79_2 = L79_2.format
  L80_2 = "\tWB (A):\t %.1f%%"
  L81_2 = math
  L81_2 = L81_2.average
  L82_2 = {}
  L83_2 = L51_2
  L84_2 = L52_2
  L85_2 = L62_2
  L86_2 = L63_2
  L87_2 = L37_2
  L88_2 = L39_2
  L89_2 = L41_2
  L90_2 = L42_2
  L91_2 = L47_2
  L92_2 = L48_2
  L82_2[1] = L83_2
  L82_2[2] = L84_2
  L82_2[3] = L85_2
  L82_2[4] = L86_2
  L82_2[5] = L87_2
  L82_2[6] = L88_2
  L82_2[7] = L89_2
  L82_2[8] = L90_2
  L82_2[9] = L91_2
  L82_2[10] = L92_2
  L81_2 = L81_2(L82_2)
  L81_2 = L81_2 * L64_2
  L82_2 = math
  L82_2 = L82_2.average
  L83_2 = {}
  L84_2 = L54_2
  L85_2 = L59_2
  L86_2 = L60_2
  L87_2 = L29_2
  L88_2 = L32_2
  L89_2 = L33_2
  L90_2 = L35_2
  L91_2 = L38_2
  L92_2 = L43_2
  L83_2[1] = L84_2
  L83_2[2] = L85_2
  L83_2[3] = L86_2
  L83_2[4] = L87_2
  L83_2[5] = L88_2
  L83_2[6] = L89_2
  L83_2[7] = L90_2
  L83_2[8] = L91_2
  L83_2[9] = L92_2
  L82_2 = L82_2(L83_2)
  L82_2 = L82_2 * L65_2
  L81_2 = L81_2 + L82_2
  L79_2 = L79_2(L80_2, L81_2)
  L80_2 = string
  L80_2 = L80_2.format
  L81_2 = [[

NCB (C):	 %.1f%%]]
  L82_2 = math
  L82_2 = L82_2.average
  L83_2 = {}
  L84_2 = L59_2
  L85_2 = L60_2
  L86_2 = L62_2
  L87_2 = L29_2
  L88_2 = L31_2
  L89_2 = L32_2
  L90_2 = L33_2
  L91_2 = L38_2
  L92_2 = L47_2
  L83_2[1] = L84_2
  L83_2[2] = L85_2
  L83_2[3] = L86_2
  L83_2[4] = L87_2
  L83_2[5] = L88_2
  L83_2[6] = L89_2
  L83_2[7] = L90_2
  L83_2[8] = L91_2
  L83_2[9] = L92_2
  L82_2 = L82_2(L83_2)
  L82_2 = L82_2 * L64_2
  L83_2 = math
  L83_2 = L83_2.average
  L84_2 = {}
  L85_2 = L54_2
  L86_2 = L56_2
  L87_2 = L63_2
  L88_2 = L30_2
  L89_2 = L40_2
  L90_2 = L45_2
  L91_2 = L49_2
  L84_2[1] = L85_2
  L84_2[2] = L86_2
  L84_2[3] = L87_2
  L84_2[4] = L88_2
  L84_2[5] = L89_2
  L84_2[6] = L90_2
  L84_2[7] = L91_2
  L83_2 = L83_2(L84_2)
  L83_2 = L83_2 * L65_2
  L82_2 = L82_2 + L83_2
  L80_2 = L80_2(L81_2, L82_2)
  L81_2 = string
  L81_2 = L81_2.format
  L82_2 = "\tCWB (D):\t %.1f%%"
  L83_2 = math
  L83_2 = L83_2.average
  L84_2 = {}
  L85_2 = L56_2
  L86_2 = L59_2
  L87_2 = L60_2
  L88_2 = L62_2
  L89_2 = L31_2
  L90_2 = L38_2
  L91_2 = L45_2
  L92_2 = L49_2
  L84_2[1] = L85_2
  L84_2[2] = L86_2
  L84_2[3] = L87_2
  L84_2[4] = L88_2
  L84_2[5] = L89_2
  L84_2[6] = L90_2
  L84_2[7] = L91_2
  L84_2[8] = L92_2
  L83_2 = L83_2(L84_2)
  L83_2 = L83_2 * L64_2
  L84_2 = math
  L84_2 = L84_2.average
  L85_2 = {}
  L86_2 = L54_2
  L87_2 = L63_2
  L88_2 = L28_2
  L89_2 = L29_2
  L90_2 = L30_2
  L91_2 = L32_2
  L92_2 = L33_2
  L93_2 = L40_2
  L94_2 = L47_2
  L85_2[1] = L86_2
  L85_2[2] = L87_2
  L85_2[3] = L88_2
  L85_2[4] = L89_2
  L85_2[5] = L90_2
  L85_2[6] = L91_2
  L85_2[7] = L92_2
  L85_2[8] = L93_2
  L85_2[9] = L94_2
  L84_2 = L84_2(L85_2)
  L84_2 = L84_2 * L65_2
  L83_2 = L83_2 + L84_2
  L81_2 = L81_2(L82_2, L83_2)
  L82_2 = string
  L82_2 = L82_2.format
  L83_2 = [[

NCB (S):	 %.1f%%]]
  L84_2 = math
  L84_2 = L84_2.average
  L85_2 = {}
  L86_2 = L56_2
  L87_2 = L60_2
  L88_2 = L62_2
  L89_2 = L28_2
  L90_2 = L30_2
  L91_2 = L31_2
  L92_2 = L33_2
  L93_2 = L38_2
  L94_2 = L45_2
  L95_2 = L49_2
  L85_2[1] = L86_2
  L85_2[2] = L87_2
  L85_2[3] = L88_2
  L85_2[4] = L89_2
  L85_2[5] = L90_2
  L85_2[6] = L91_2
  L85_2[7] = L92_2
  L85_2[8] = L93_2
  L85_2[9] = L94_2
  L85_2[10] = L95_2
  L84_2 = L84_2(L85_2)
  L84_2 = L84_2 * L64_2
  L85_2 = math
  L85_2 = L85_2.average
  L86_2 = {}
  L87_2 = L54_2
  L88_2 = L59_2
  L89_2 = L63_2
  L90_2 = L29_2
  L91_2 = L32_2
  L92_2 = L40_2
  L86_2[1] = L87_2
  L86_2[2] = L88_2
  L86_2[3] = L89_2
  L86_2[4] = L90_2
  L86_2[5] = L91_2
  L86_2[6] = L92_2
  L85_2 = L85_2(L86_2)
  L85_2 = L85_2 * L65_2
  L84_2 = L84_2 + L85_2
  L82_2 = L82_2(L83_2, L84_2)
  L83_2 = string
  L83_2 = L83_2.format
  L84_2 = "\tCWB (S):\t %.1f%%"
  L85_2 = math
  L85_2 = L85_2.average
  L86_2 = {}
  L87_2 = L56_2
  L88_2 = L60_2
  L89_2 = L62_2
  L90_2 = L28_2
  L91_2 = L30_2
  L92_2 = L31_2
  L93_2 = L33_2
  L94_2 = L38_2
  L95_2 = L45_2
  L96_2 = L49_2
  L86_2[1] = L87_2
  L86_2[2] = L88_2
  L86_2[3] = L89_2
  L86_2[4] = L90_2
  L86_2[5] = L91_2
  L86_2[6] = L92_2
  L86_2[7] = L93_2
  L86_2[8] = L94_2
  L86_2[9] = L95_2
  L86_2[10] = L96_2
  L85_2 = L85_2(L86_2)
  L85_2 = L85_2 * L64_2
  L86_2 = math
  L86_2 = L86_2.average
  L87_2 = {}
  L88_2 = L54_2
  L89_2 = L59_2
  L90_2 = L63_2
  L91_2 = L29_2
  L92_2 = L32_2
  L93_2 = L40_2
  L87_2[1] = L88_2
  L87_2[2] = L89_2
  L87_2[3] = L90_2
  L87_2[4] = L91_2
  L87_2[5] = L92_2
  L87_2[6] = L93_2
  L86_2 = L86_2(L87_2)
  L86_2 = L86_2 * L65_2
  L85_2 = L85_2 + L86_2
  L83_2 = L83_2(L84_2, L85_2)
  L84_2 = string
  L84_2 = L84_2.format
  L85_2 = [[

NCB (D):	 %.1f%%]]
  L86_2 = math
  L86_2 = L86_2.average
  L87_2 = {}
  L88_2 = L56_2
  L89_2 = L59_2
  L90_2 = L60_2
  L91_2 = L62_2
  L92_2 = L31_2
  L93_2 = L38_2
  L94_2 = L45_2
  L95_2 = L49_2
  L87_2[1] = L88_2
  L87_2[2] = L89_2
  L87_2[3] = L90_2
  L87_2[4] = L91_2
  L87_2[5] = L92_2
  L87_2[6] = L93_2
  L87_2[7] = L94_2
  L87_2[8] = L95_2
  L86_2 = L86_2(L87_2)
  L86_2 = L86_2 * L64_2
  L87_2 = math
  L87_2 = L87_2.average
  L88_2 = {}
  L89_2 = L54_2
  L90_2 = L63_2
  L91_2 = L28_2
  L92_2 = L29_2
  L93_2 = L30_2
  L94_2 = L32_2
  L95_2 = L33_2
  L96_2 = L40_2
  L97_2 = L47_2
  L88_2[1] = L89_2
  L88_2[2] = L90_2
  L88_2[3] = L91_2
  L88_2[4] = L92_2
  L88_2[5] = L93_2
  L88_2[6] = L94_2
  L88_2[7] = L95_2
  L88_2[8] = L96_2
  L88_2[9] = L97_2
  L87_2 = L87_2(L88_2)
  L87_2 = L87_2 * L65_2
  L86_2 = L86_2 + L87_2
  L84_2 = L84_2(L85_2, L86_2)
  L85_2 = string
  L85_2 = L85_2.format
  L86_2 = "\tCWB (A):\t %.1f%%"
  L87_2 = math
  L87_2 = L87_2.average
  L88_2 = {}
  L89_2 = L59_2
  L90_2 = L60_2
  L91_2 = L62_2
  L92_2 = L29_2
  L93_2 = L31_2
  L94_2 = L32_2
  L95_2 = L33_2
  L96_2 = L38_2
  L97_2 = L47_2
  L88_2[1] = L89_2
  L88_2[2] = L90_2
  L88_2[3] = L91_2
  L88_2[4] = L92_2
  L88_2[5] = L93_2
  L88_2[6] = L94_2
  L88_2[7] = L95_2
  L88_2[8] = L96_2
  L88_2[9] = L97_2
  L87_2 = L87_2(L88_2)
  L87_2 = L87_2 * L64_2
  L88_2 = math
  L88_2 = L88_2.average
  L89_2 = {}
  L90_2 = L54_2
  L91_2 = L56_2
  L92_2 = L63_2
  L93_2 = L30_2
  L94_2 = L40_2
  L95_2 = L45_2
  L96_2 = L49_2
  L89_2[1] = L90_2
  L89_2[2] = L91_2
  L89_2[3] = L92_2
  L89_2[4] = L93_2
  L89_2[5] = L94_2
  L89_2[6] = L95_2
  L89_2[7] = L96_2
  L88_2 = L88_2(L89_2)
  L88_2 = L88_2 * L65_2
  L87_2 = L87_2 + L88_2
  L85_2 = L85_2(L86_2, L87_2)
  L86_2 = string
  L86_2 = L86_2.format
  L87_2 = [[

WCB (D):	 %.1f%%]]
  L88_2 = math
  L88_2 = L88_2.average
  L89_2 = {}
  L90_2 = L51_2
  L91_2 = L56_2
  L92_2 = L59_2
  L93_2 = L62_2
  L94_2 = L38_2
  L95_2 = L45_2
  L96_2 = L48_2
  L97_2 = L49_2
  L89_2[1] = L90_2
  L89_2[2] = L91_2
  L89_2[3] = L92_2
  L89_2[4] = L93_2
  L89_2[5] = L94_2
  L89_2[6] = L95_2
  L89_2[7] = L96_2
  L89_2[8] = L97_2
  L88_2 = L88_2(L89_2)
  L88_2 = L88_2 * L64_2
  L89_2 = math
  L89_2 = L89_2.average
  L90_2 = {}
  L91_2 = L52_2
  L92_2 = L28_2
  L93_2 = L29_2
  L94_2 = L30_2
  L95_2 = L31_2
  L96_2 = L32_2
  L97_2 = L33_2
  L98_2 = L41_2
  L99_2 = L47_2
  L90_2[1] = L91_2
  L90_2[2] = L92_2
  L90_2[3] = L93_2
  L90_2[4] = L94_2
  L90_2[5] = L95_2
  L90_2[6] = L96_2
  L90_2[7] = L97_2
  L90_2[8] = L98_2
  L90_2[9] = L99_2
  L89_2 = L89_2(L90_2)
  L89_2 = L89_2 * L65_2
  L88_2 = L88_2 + L89_2
  L86_2 = L86_2(L87_2, L88_2)
  L87_2 = string
  L87_2 = L87_2.format
  L88_2 = "\tIWB (D):\t %.1f%%"
  L89_2 = math
  L89_2 = L89_2.average
  L90_2 = {}
  L91_2 = L56_2
  L92_2 = L59_2
  L93_2 = L60_2
  L94_2 = L62_2
  L95_2 = L31_2
  L96_2 = L38_2
  L97_2 = L45_2
  L98_2 = L49_2
  L90_2[1] = L91_2
  L90_2[2] = L92_2
  L90_2[3] = L93_2
  L90_2[4] = L94_2
  L90_2[5] = L95_2
  L90_2[6] = L96_2
  L90_2[7] = L97_2
  L90_2[8] = L98_2
  L89_2 = L89_2(L90_2)
  L89_2 = L89_2 * L64_2
  L90_2 = math
  L90_2 = L90_2.average
  L91_2 = {}
  L92_2 = L54_2
  L93_2 = L63_2
  L94_2 = L28_2
  L95_2 = L29_2
  L96_2 = L30_2
  L97_2 = L32_2
  L98_2 = L33_2
  L99_2 = L40_2
  L100_2 = L47_2
  L91_2[1] = L92_2
  L91_2[2] = L93_2
  L91_2[3] = L94_2
  L91_2[4] = L95_2
  L91_2[5] = L96_2
  L91_2[6] = L97_2
  L91_2[7] = L98_2
  L91_2[8] = L99_2
  L91_2[9] = L100_2
  L90_2 = L90_2(L91_2)
  L90_2 = L90_2 * L65_2
  L89_2 = L89_2 + L90_2
  L87_2 = L87_2(L88_2, L89_2)
  L88_2 = string
  L88_2 = L88_2.format
  L89_2 = [[

WCB (S):	 %.1f%%]]
  L90_2 = math
  L90_2 = L90_2.average
  L91_2 = {}
  L92_2 = L51_2
  L93_2 = L56_2
  L94_2 = L52_2
  L95_2 = L59_2
  L96_2 = L62_2
  L97_2 = L38_2
  L98_2 = L45_2
  L99_2 = L47_2
  L100_2 = L48_2
  L101_2 = L49_2
  L91_2[1] = L92_2
  L91_2[2] = L93_2
  L91_2[3] = L94_2
  L91_2[4] = L95_2
  L91_2[5] = L96_2
  L91_2[6] = L97_2
  L91_2[7] = L98_2
  L91_2[8] = L99_2
  L91_2[9] = L100_2
  L91_2[10] = L101_2
  L90_2 = L90_2(L91_2)
  L90_2 = L90_2 * L64_2
  L91_2 = math
  L91_2 = L91_2.average
  L92_2 = {}
  L93_2 = L28_2
  L94_2 = L29_2
  L95_2 = L30_2
  L96_2 = L31_2
  L97_2 = L32_2
  L98_2 = L33_2
  L99_2 = L37_2
  L100_2 = L41_2
  L92_2[1] = L93_2
  L92_2[2] = L94_2
  L92_2[3] = L95_2
  L92_2[4] = L96_2
  L92_2[5] = L97_2
  L92_2[6] = L98_2
  L92_2[7] = L99_2
  L92_2[8] = L100_2
  L91_2 = L91_2(L92_2)
  L91_2 = L91_2 * L65_2
  L90_2 = L90_2 + L91_2
  L88_2 = L88_2(L89_2, L90_2)
  L89_2 = string
  L89_2 = L89_2.format
  L90_2 = "\tIWB (S):\t %.1f%%"
  L91_2 = math
  L91_2 = L91_2.average
  L92_2 = {}
  L93_2 = L56_2
  L94_2 = L60_2
  L95_2 = L62_2
  L96_2 = L28_2
  L97_2 = L30_2
  L98_2 = L31_2
  L99_2 = L33_2
  L100_2 = L38_2
  L101_2 = L45_2
  L102_2 = L49_2
  L92_2[1] = L93_2
  L92_2[2] = L94_2
  L92_2[3] = L95_2
  L92_2[4] = L96_2
  L92_2[5] = L97_2
  L92_2[6] = L98_2
  L92_2[7] = L99_2
  L92_2[8] = L100_2
  L92_2[9] = L101_2
  L92_2[10] = L102_2
  L91_2 = L91_2(L92_2)
  L91_2 = L91_2 * L64_2
  L92_2 = math
  L92_2 = L92_2.average
  L93_2 = {}
  L94_2 = L54_2
  L95_2 = L59_2
  L96_2 = L63_2
  L97_2 = L29_2
  L98_2 = L32_2
  L99_2 = L40_2
  L93_2[1] = L94_2
  L93_2[2] = L95_2
  L93_2[3] = L96_2
  L93_2[4] = L97_2
  L93_2[5] = L98_2
  L93_2[6] = L99_2
  L92_2 = L92_2(L93_2)
  L92_2 = L92_2 * L65_2
  L91_2 = L91_2 + L92_2
  L89_2 = L89_2(L90_2, L91_2)
  L90_2 = string
  L90_2 = L90_2.format
  L91_2 = [[

WCB (A):	 %.1f%%]]
  L92_2 = math
  L92_2 = L92_2.average
  L93_2 = {}
  L94_2 = L51_2
  L95_2 = L56_2
  L96_2 = L52_2
  L97_2 = L59_2
  L98_2 = L62_2
  L99_2 = L37_2
  L100_2 = L45_2
  L101_2 = L47_2
  L102_2 = L48_2
  L103_2 = L49_2
  L93_2[1] = L94_2
  L93_2[2] = L95_2
  L93_2[3] = L96_2
  L93_2[4] = L97_2
  L93_2[5] = L98_2
  L93_2[6] = L99_2
  L93_2[7] = L100_2
  L93_2[8] = L101_2
  L93_2[9] = L102_2
  L93_2[10] = L103_2
  L92_2 = L92_2(L93_2)
  L92_2 = L92_2 * L64_2
  L93_2 = math
  L93_2 = L93_2.average
  L94_2 = {}
  L95_2 = L28_2
  L96_2 = L29_2
  L97_2 = L30_2
  L98_2 = L31_2
  L99_2 = L32_2
  L100_2 = L33_2
  L101_2 = L38_2
  L102_2 = L41_2
  L94_2[1] = L95_2
  L94_2[2] = L96_2
  L94_2[3] = L97_2
  L94_2[4] = L98_2
  L94_2[5] = L99_2
  L94_2[6] = L100_2
  L94_2[7] = L101_2
  L94_2[8] = L102_2
  L93_2 = L93_2(L94_2)
  L93_2 = L93_2 * L65_2
  L92_2 = L92_2 + L93_2
  L90_2 = L90_2(L91_2, L92_2)
  L91_2 = string
  L91_2 = L91_2.format
  L92_2 = "\tIWB (A):\t %.1f%%"
  L93_2 = math
  L93_2 = L93_2.average
  L94_2 = {}
  L95_2 = L59_2
  L96_2 = L60_2
  L97_2 = L62_2
  L98_2 = L29_2
  L99_2 = L31_2
  L100_2 = L32_2
  L101_2 = L33_2
  L102_2 = L38_2
  L103_2 = L47_2
  L94_2[1] = L95_2
  L94_2[2] = L96_2
  L94_2[3] = L97_2
  L94_2[4] = L98_2
  L94_2[5] = L99_2
  L94_2[6] = L100_2
  L94_2[7] = L101_2
  L94_2[8] = L102_2
  L94_2[9] = L103_2
  L93_2 = L93_2(L94_2)
  L93_2 = L93_2 * L64_2
  L94_2 = math
  L94_2 = L94_2.average
  L95_2 = {}
  L96_2 = L54_2
  L97_2 = L56_2
  L98_2 = L63_2
  L99_2 = L30_2
  L100_2 = L40_2
  L101_2 = L45_2
  L102_2 = L49_2
  L95_2[1] = L96_2
  L95_2[2] = L97_2
  L95_2[3] = L98_2
  L95_2[4] = L99_2
  L95_2[5] = L100_2
  L95_2[6] = L101_2
  L95_2[7] = L102_2
  L94_2 = L94_2(L95_2)
  L94_2 = L94_2 * L65_2
  L93_2 = L93_2 + L94_2
  L91_2 = L91_2(L92_2, L93_2)
  L92_2 = string
  L92_2 = L92_2.format
  L93_2 = [[

L (S):	 %.1f%%]]
  L94_2 = math
  L94_2 = L94_2.average
  L95_2 = {}
  L96_2 = L54_2
  L97_2 = L59_2
  L98_2 = L60_2
  L99_2 = L62_2
  L100_2 = L29_2
  L101_2 = L31_2
  L102_2 = L32_2
  L103_2 = L33_2
  L104_2 = L38_2
  L105_2 = L39_2
  L106_2 = L40_2
  L107_2 = L47_2
  L95_2[1] = L96_2
  L95_2[2] = L97_2
  L95_2[3] = L98_2
  L95_2[4] = L99_2
  L95_2[5] = L100_2
  L95_2[6] = L101_2
  L95_2[7] = L102_2
  L95_2[8] = L103_2
  L95_2[9] = L104_2
  L95_2[10] = L105_2
  L95_2[11] = L106_2
  L95_2[12] = L107_2
  L94_2 = L94_2(L95_2)
  L94_2 = L94_2 * L64_2
  L95_2 = math
  L95_2 = L95_2.average
  L96_2 = {}
  L97_2 = L52_2
  L98_2 = L56_2
  L99_2 = L63_2
  L100_2 = L30_2
  L101_2 = L35_2
  L102_2 = L43_2
  L103_2 = L44_2
  L104_2 = L45_2
  L105_2 = L48_2
  L106_2 = L49_2
  L96_2[1] = L97_2
  L96_2[2] = L98_2
  L96_2[3] = L99_2
  L96_2[4] = L100_2
  L96_2[5] = L101_2
  L96_2[6] = L102_2
  L96_2[7] = L103_2
  L96_2[8] = L104_2
  L96_2[9] = L105_2
  L96_2[10] = L106_2
  L95_2 = L95_2(L96_2)
  L95_2 = L95_2 * L65_2
  L94_2 = L94_2 + L95_2
  L92_2 = L92_2(L93_2, L94_2)
  L93_2 = string
  L93_2 = L93_2.format
  L94_2 = "\tNFB (D):\t %.1f%%"
  L95_2 = math
  L95_2 = L95_2.average
  L96_2 = {}
  L97_2 = L59_2
  L98_2 = L60_2
  L99_2 = L62_2
  L100_2 = L29_2
  L101_2 = L31_2
  L102_2 = L32_2
  L103_2 = L33_2
  L104_2 = L38_2
  L105_2 = L47_2
  L96_2[1] = L97_2
  L96_2[2] = L98_2
  L96_2[3] = L99_2
  L96_2[4] = L100_2
  L96_2[5] = L101_2
  L96_2[6] = L102_2
  L96_2[7] = L103_2
  L96_2[8] = L104_2
  L96_2[9] = L105_2
  L95_2 = L95_2(L96_2)
  L95_2 = L95_2 * L64_2
  L96_2 = math
  L96_2 = L96_2.average
  L97_2 = {}
  L98_2 = L54_2
  L99_2 = L56_2
  L100_2 = L63_2
  L101_2 = L30_2
  L102_2 = L40_2
  L103_2 = L45_2
  L104_2 = L49_2
  L97_2[1] = L98_2
  L97_2[2] = L99_2
  L97_2[3] = L100_2
  L97_2[4] = L101_2
  L97_2[5] = L102_2
  L97_2[6] = L103_2
  L97_2[7] = L104_2
  L96_2 = L96_2(L97_2)
  L96_2 = L96_2 * L65_2
  L95_2 = L95_2 + L96_2
  L93_2 = L93_2(L94_2, L95_2)
  L94_2 = string
  L94_2 = L94_2.format
  L95_2 = [[

L (A):	 %.1f%%]]
  L96_2 = math
  L96_2 = L96_2.average
  L97_2 = {}
  L98_2 = L52_2
  L99_2 = L54_2
  L100_2 = L59_2
  L101_2 = L60_2
  L102_2 = L62_2
  L103_2 = L29_2
  L104_2 = L31_2
  L105_2 = L32_2
  L106_2 = L33_2
  L107_2 = L35_2
  L108_2 = L38_2
  L109_2 = L39_2
  L110_2 = L40_2
  L111_2 = L47_2
  L97_2[1] = L98_2
  L97_2[2] = L99_2
  L97_2[3] = L100_2
  L97_2[4] = L101_2
  L97_2[5] = L102_2
  L97_2[6] = L103_2
  L97_2[7] = L104_2
  L97_2[8] = L105_2
  L97_2[9] = L106_2
  L97_2[10] = L107_2
  L97_2[11] = L108_2
  L97_2[12] = L109_2
  L97_2[13] = L110_2
  L97_2[14] = L111_2
  L96_2 = L96_2(L97_2)
  L96_2 = L96_2 * L64_2
  L97_2 = math
  L97_2 = L97_2.average
  L98_2 = {}
  L99_2 = L56_2
  L100_2 = L57_2
  L101_2 = L63_2
  L102_2 = L30_2
  L103_2 = L42_2
  L104_2 = L43_2
  L105_2 = L44_2
  L106_2 = L45_2
  L107_2 = L48_2
  L108_2 = L49_2
  L98_2[1] = L99_2
  L98_2[2] = L100_2
  L98_2[3] = L101_2
  L98_2[4] = L102_2
  L98_2[5] = L103_2
  L98_2[6] = L104_2
  L98_2[7] = L105_2
  L98_2[8] = L106_2
  L98_2[9] = L107_2
  L98_2[10] = L108_2
  L97_2 = L97_2(L98_2)
  L97_2 = L97_2 * L65_2
  L96_2 = L96_2 + L97_2
  L94_2 = L94_2(L95_2, L96_2)
  L68_2 = L68_2 .. L69_2 .. L70_2 .. L71_2 .. L72_2 .. L73_2 .. L74_2 .. L75_2 .. L76_2 .. L77_2 .. L78_2 .. L79_2 .. L80_2 .. L81_2 .. L82_2 .. L83_2 .. L84_2 .. L85_2 .. L86_2 .. L87_2 .. L88_2 .. L89_2 .. L90_2 .. L91_2 .. L92_2 .. L93_2 .. L94_2
  L3_2[2] = L68_2
  L68_2 = string
  L68_2 = L68_2.format
  L69_2 = "DM (D):\t %.1f%%"
  L70_2 = math
  L70_2 = L70_2.average
  L71_2 = {}
  L72_2 = L62_2
  L73_2 = L32_2
  L74_2 = L33_2
  L75_2 = L38_2
  L76_2 = L39_2
  L71_2[1] = L72_2
  L71_2[2] = L73_2
  L71_2[3] = L74_2
  L71_2[4] = L75_2
  L71_2[5] = L76_2
  L70_2 = L70_2(L71_2)
  L70_2 = L70_2 * L64_2
  L71_2 = math
  L71_2 = L71_2.average
  L72_2 = {}
  L73_2 = L54_2
  L74_2 = L59_2
  L75_2 = L60_2
  L76_2 = L63_2
  L77_2 = L28_2
  L78_2 = L29_2
  L79_2 = L31_2
  L80_2 = L41_2
  L81_2 = L48_2
  L72_2[1] = L73_2
  L72_2[2] = L74_2
  L72_2[3] = L75_2
  L72_2[4] = L76_2
  L72_2[5] = L77_2
  L72_2[6] = L78_2
  L72_2[7] = L79_2
  L72_2[8] = L80_2
  L72_2[9] = L81_2
  L71_2 = L71_2(L72_2)
  L71_2 = L71_2 * L65_2
  L70_2 = L70_2 + L71_2
  L68_2 = L68_2(L69_2, L70_2)
  L69_2 = string
  L69_2 = L69_2.format
  L70_2 = "\tCM (D):\t %.1f%%"
  L71_2 = math
  L71_2 = L71_2.average
  L72_2 = {}
  L73_2 = L62_2
  L74_2 = L32_2
  L75_2 = L33_2
  L76_2 = L38_2
  L77_2 = L39_2
  L72_2[1] = L73_2
  L72_2[2] = L74_2
  L72_2[3] = L75_2
  L72_2[4] = L76_2
  L72_2[5] = L77_2
  L71_2 = L71_2(L72_2)
  L71_2 = L71_2 * L64_2
  L72_2 = math
  L72_2 = L72_2.average
  L73_2 = {}
  L74_2 = L54_2
  L75_2 = L59_2
  L76_2 = L60_2
  L77_2 = L63_2
  L78_2 = L28_2
  L79_2 = L29_2
  L80_2 = L31_2
  L81_2 = L41_2
  L82_2 = L48_2
  L73_2[1] = L74_2
  L73_2[2] = L75_2
  L73_2[3] = L76_2
  L73_2[4] = L77_2
  L73_2[5] = L78_2
  L73_2[6] = L79_2
  L73_2[7] = L80_2
  L73_2[8] = L81_2
  L73_2[9] = L82_2
  L72_2 = L72_2(L73_2)
  L72_2 = L72_2 * L65_2
  L71_2 = L71_2 + L72_2
  L69_2 = L69_2(L70_2, L71_2)
  L70_2 = string
  L70_2 = L70_2.format
  L71_2 = [[

DM (S):	 %.1f%%]]
  L72_2 = math
  L72_2 = L72_2.average
  L73_2 = {}
  L74_2 = L54_2
  L75_2 = L60_2
  L76_2 = L62_2
  L77_2 = L33_2
  L78_2 = L39_2
  L73_2[1] = L74_2
  L73_2[2] = L75_2
  L73_2[3] = L76_2
  L73_2[4] = L77_2
  L73_2[5] = L78_2
  L72_2 = L72_2(L73_2)
  L72_2 = L72_2 * L64_2
  L73_2 = math
  L73_2 = L73_2.average
  L74_2 = {}
  L75_2 = L63_2
  L76_2 = L29_2
  L77_2 = L31_2
  L78_2 = L32_2
  L79_2 = L37_2
  L80_2 = L40_2
  L81_2 = L41_2
  L82_2 = L48_2
  L74_2[1] = L75_2
  L74_2[2] = L76_2
  L74_2[3] = L77_2
  L74_2[4] = L78_2
  L74_2[5] = L79_2
  L74_2[6] = L80_2
  L74_2[7] = L81_2
  L74_2[8] = L82_2
  L73_2 = L73_2(L74_2)
  L73_2 = L73_2 * L65_2
  L72_2 = L72_2 + L73_2
  L70_2 = L70_2(L71_2, L72_2)
  L71_2 = string
  L71_2 = L71_2.format
  L72_2 = "\tCM (S):\t %.1f%%"
  L73_2 = math
  L73_2 = L73_2.average
  L74_2 = {}
  L75_2 = L54_2
  L76_2 = L60_2
  L77_2 = L62_2
  L78_2 = L33_2
  L79_2 = L39_2
  L74_2[1] = L75_2
  L74_2[2] = L76_2
  L74_2[3] = L77_2
  L74_2[4] = L78_2
  L74_2[5] = L79_2
  L73_2 = L73_2(L74_2)
  L73_2 = L73_2 * L64_2
  L74_2 = math
  L74_2 = L74_2.average
  L75_2 = {}
  L76_2 = L63_2
  L77_2 = L29_2
  L78_2 = L31_2
  L79_2 = L32_2
  L80_2 = L37_2
  L81_2 = L40_2
  L82_2 = L41_2
  L83_2 = L48_2
  L75_2[1] = L76_2
  L75_2[2] = L77_2
  L75_2[3] = L78_2
  L75_2[4] = L79_2
  L75_2[5] = L80_2
  L75_2[6] = L81_2
  L75_2[7] = L82_2
  L75_2[8] = L83_2
  L74_2 = L74_2(L75_2)
  L74_2 = L74_2 * L65_2
  L73_2 = L73_2 + L74_2
  L71_2 = L71_2(L72_2, L73_2)
  L72_2 = string
  L72_2 = L72_2.format
  L73_2 = [[

VOL (S):	 %.1f%%]]
  L74_2 = math
  L74_2 = L74_2.average
  L75_2 = {}
  L76_2 = L54_2
  L77_2 = L60_2
  L78_2 = L33_2
  L79_2 = L37_2
  L75_2[1] = L76_2
  L75_2[2] = L77_2
  L75_2[3] = L78_2
  L75_2[4] = L79_2
  L74_2 = L74_2(L75_2)
  L74_2 = L74_2 * L64_2
  L75_2 = math
  L75_2 = L75_2.average
  L76_2 = {}
  L77_2 = L57_2
  L78_2 = L62_2
  L79_2 = L63_2
  L80_2 = L29_2
  L81_2 = L31_2
  L82_2 = L39_2
  L83_2 = L40_2
  L84_2 = L41_2
  L85_2 = L42_2
  L86_2 = L48_2
  L76_2[1] = L77_2
  L76_2[2] = L78_2
  L76_2[3] = L79_2
  L76_2[4] = L80_2
  L76_2[5] = L81_2
  L76_2[6] = L82_2
  L76_2[7] = L83_2
  L76_2[8] = L84_2
  L76_2[9] = L85_2
  L76_2[10] = L86_2
  L75_2 = L75_2(L76_2)
  L75_2 = L75_2 * L65_2
  L74_2 = L74_2 + L75_2
  L72_2 = L72_2(L73_2, L74_2)
  L73_2 = string
  L73_2 = L73_2.format
  L74_2 = "\tCM (A):\t %.1f%%"
  L75_2 = math
  L75_2 = L75_2.average
  L76_2 = {}
  L77_2 = L54_2
  L78_2 = L60_2
  L79_2 = L33_2
  L80_2 = L37_2
  L76_2[1] = L77_2
  L76_2[2] = L78_2
  L76_2[3] = L79_2
  L76_2[4] = L80_2
  L75_2 = L75_2(L76_2)
  L75_2 = L75_2 * L64_2
  L76_2 = math
  L76_2 = L76_2.average
  L77_2 = {}
  L78_2 = L57_2
  L79_2 = L62_2
  L80_2 = L63_2
  L81_2 = L29_2
  L82_2 = L31_2
  L83_2 = L39_2
  L84_2 = L40_2
  L85_2 = L41_2
  L86_2 = L42_2
  L87_2 = L48_2
  L77_2[1] = L78_2
  L77_2[2] = L79_2
  L77_2[3] = L80_2
  L77_2[4] = L81_2
  L77_2[5] = L82_2
  L77_2[6] = L83_2
  L77_2[7] = L84_2
  L77_2[8] = L85_2
  L77_2[9] = L86_2
  L77_2[10] = L87_2
  L76_2 = L76_2(L77_2)
  L76_2 = L76_2 * L65_2
  L75_2 = L75_2 + L76_2
  L73_2 = L73_2(L74_2, L75_2)
  L74_2 = string
  L74_2 = L74_2.format
  L75_2 = [[

VOL (A):	 %.1f%%]]
  L76_2 = math
  L76_2 = L76_2.average
  L77_2 = {}
  L78_2 = L54_2
  L79_2 = L60_2
  L80_2 = L33_2
  L81_2 = L37_2
  L77_2[1] = L78_2
  L77_2[2] = L79_2
  L77_2[3] = L80_2
  L77_2[4] = L81_2
  L76_2 = L76_2(L77_2)
  L76_2 = L76_2 * L64_2
  L77_2 = math
  L77_2 = L77_2.average
  L78_2 = {}
  L79_2 = L57_2
  L80_2 = L62_2
  L81_2 = L63_2
  L82_2 = L29_2
  L83_2 = L31_2
  L84_2 = L39_2
  L85_2 = L40_2
  L86_2 = L41_2
  L87_2 = L42_2
  L88_2 = L48_2
  L78_2[1] = L79_2
  L78_2[2] = L80_2
  L78_2[3] = L81_2
  L78_2[4] = L82_2
  L78_2[5] = L83_2
  L78_2[6] = L84_2
  L78_2[7] = L85_2
  L78_2[8] = L86_2
  L78_2[9] = L87_2
  L78_2[10] = L88_2
  L77_2 = L77_2(L78_2)
  L77_2 = L77_2 * L65_2
  L76_2 = L76_2 + L77_2
  L74_2 = L74_2(L75_2, L76_2)
  L75_2 = string
  L75_2 = L75_2.format
  L76_2 = "\tAP (S):\t %.1f%%"
  L77_2 = math
  L77_2 = L77_2.average
  L78_2 = {}
  L79_2 = L54_2
  L80_2 = L60_2
  L81_2 = L63_2
  L82_2 = L31_2
  L83_2 = L33_2
  L84_2 = L37_2
  L85_2 = L39_2
  L86_2 = L40_2
  L78_2[1] = L79_2
  L78_2[2] = L80_2
  L78_2[3] = L81_2
  L78_2[4] = L82_2
  L78_2[5] = L83_2
  L78_2[6] = L84_2
  L78_2[7] = L85_2
  L78_2[8] = L86_2
  L77_2 = L77_2(L78_2)
  L77_2 = L77_2 * L64_2
  L78_2 = math
  L78_2 = L78_2.average
  L79_2 = {}
  L80_2 = L52_2
  L81_2 = L29_2
  L82_2 = L35_2
  L83_2 = L43_2
  L79_2[1] = L80_2
  L79_2[2] = L81_2
  L79_2[3] = L82_2
  L79_2[4] = L83_2
  L78_2 = L78_2(L79_2)
  L78_2 = L78_2 * L65_2
  L77_2 = L77_2 + L78_2
  L75_2 = L75_2(L76_2, L77_2)
  L76_2 = string
  L76_2 = L76_2.format
  L77_2 = [[

BWM (D):	 %.1f%%]]
  L78_2 = math
  L78_2 = L78_2.average
  L79_2 = {}
  L80_2 = L62_2
  L81_2 = L28_2
  L82_2 = L29_2
  L83_2 = L30_2
  L84_2 = L39_2
  L85_2 = L41_2
  L79_2[1] = L80_2
  L79_2[2] = L81_2
  L79_2[3] = L82_2
  L79_2[4] = L83_2
  L79_2[5] = L84_2
  L79_2[6] = L85_2
  L78_2 = L78_2(L79_2)
  L78_2 = L78_2 * L64_2
  L79_2 = math
  L79_2 = L79_2.average
  L80_2 = {}
  L81_2 = L59_2
  L82_2 = L32_2
  L83_2 = L38_2
  L84_2 = L43_2
  L85_2 = L47_2
  L86_2 = L48_2
  L87_2 = L49_2
  L80_2[1] = L81_2
  L80_2[2] = L82_2
  L80_2[3] = L83_2
  L80_2[4] = L84_2
  L80_2[5] = L85_2
  L80_2[6] = L86_2
  L80_2[7] = L87_2
  L79_2 = L79_2(L80_2)
  L79_2 = L79_2 * L65_2
  L78_2 = L78_2 + L79_2
  L76_2 = L76_2(L77_2, L78_2)
  L77_2 = string
  L77_2 = L77_2.format
  L78_2 = "\tAP (A):\t %.1f%%"
  L79_2 = math
  L79_2 = L79_2.average
  L80_2 = {}
  L81_2 = L52_2
  L82_2 = L54_2
  L83_2 = L60_2
  L84_2 = L63_2
  L85_2 = L31_2
  L86_2 = L33_2
  L87_2 = L37_2
  L88_2 = L39_2
  L89_2 = L40_2
  L80_2[1] = L81_2
  L80_2[2] = L82_2
  L80_2[3] = L83_2
  L80_2[4] = L84_2
  L80_2[5] = L85_2
  L80_2[6] = L86_2
  L80_2[7] = L87_2
  L80_2[8] = L88_2
  L80_2[9] = L89_2
  L79_2 = L79_2(L80_2)
  L79_2 = L79_2 * L64_2
  L80_2 = math
  L80_2 = L80_2.average
  L81_2 = {}
  L82_2 = L29_2
  L83_2 = L35_2
  L84_2 = L42_2
  L85_2 = L43_2
  L81_2[1] = L82_2
  L81_2[2] = L83_2
  L81_2[3] = L84_2
  L81_2[4] = L85_2
  L80_2 = L80_2(L81_2)
  L80_2 = L80_2 * L65_2
  L79_2 = L79_2 + L80_2
  L77_2 = L77_2(L78_2, L79_2)
  L78_2 = string
  L78_2 = L78_2.format
  L79_2 = [[

BWM (S):	 %.1f%%]]
  L80_2 = math
  L80_2 = L80_2.average
  L81_2 = {}
  L82_2 = L62_2
  L83_2 = L28_2
  L84_2 = L29_2
  L85_2 = L30_2
  L86_2 = L39_2
  L87_2 = L41_2
  L81_2[1] = L82_2
  L81_2[2] = L83_2
  L81_2[3] = L84_2
  L81_2[4] = L85_2
  L81_2[5] = L86_2
  L81_2[6] = L87_2
  L80_2 = L80_2(L81_2)
  L80_2 = L80_2 * L64_2
  L81_2 = math
  L81_2 = L81_2.average
  L82_2 = {}
  L83_2 = L59_2
  L84_2 = L60_2
  L85_2 = L32_2
  L86_2 = L43_2
  L87_2 = L47_2
  L88_2 = L48_2
  L89_2 = L49_2
  L82_2[1] = L83_2
  L82_2[2] = L84_2
  L82_2[3] = L85_2
  L82_2[4] = L86_2
  L82_2[5] = L87_2
  L82_2[6] = L88_2
  L82_2[7] = L89_2
  L81_2 = L81_2(L82_2)
  L81_2 = L81_2 * L65_2
  L80_2 = L80_2 + L81_2
  L78_2 = L78_2(L79_2, L80_2)
  L79_2 = string
  L79_2 = L79_2.format
  L80_2 = "\tMEZ (S):\t %.1f%%"
  L81_2 = math
  L81_2 = L81_2.average
  L82_2 = {}
  L83_2 = L60_2
  L84_2 = L63_2
  L85_2 = L33_2
  L86_2 = L37_2
  L87_2 = L41_2
  L88_2 = L42_2
  L82_2[1] = L83_2
  L82_2[2] = L84_2
  L82_2[3] = L85_2
  L82_2[4] = L86_2
  L82_2[5] = L87_2
  L82_2[6] = L88_2
  L81_2 = L81_2(L82_2)
  L81_2 = L81_2 * L64_2
  L82_2 = math
  L82_2 = L82_2.average
  L83_2 = {}
  L84_2 = L52_2
  L85_2 = L54_2
  L86_2 = L57_2
  L87_2 = L62_2
  L88_2 = L29_2
  L89_2 = L31_2
  L90_2 = L40_2
  L91_2 = L44_2
  L92_2 = L48_2
  L83_2[1] = L84_2
  L83_2[2] = L85_2
  L83_2[3] = L86_2
  L83_2[4] = L87_2
  L83_2[5] = L88_2
  L83_2[6] = L89_2
  L83_2[7] = L90_2
  L83_2[8] = L91_2
  L83_2[9] = L92_2
  L82_2 = L82_2(L83_2)
  L82_2 = L82_2 * L65_2
  L81_2 = L81_2 + L82_2
  L79_2 = L79_2(L80_2, L81_2)
  L80_2 = string
  L80_2 = L80_2.format
  L81_2 = [[

A (D):	 %.1f%%]]
  L82_2 = math
  L82_2 = L82_2.average
  L83_2 = {}
  L84_2 = L62_2
  L85_2 = L32_2
  L86_2 = L33_2
  L87_2 = L38_2
  L88_2 = L39_2
  L83_2[1] = L84_2
  L83_2[2] = L85_2
  L83_2[3] = L86_2
  L83_2[4] = L87_2
  L83_2[5] = L88_2
  L82_2 = L82_2(L83_2)
  L82_2 = L82_2 * L64_2
  L83_2 = math
  L83_2 = L83_2.average
  L84_2 = {}
  L85_2 = L54_2
  L86_2 = L59_2
  L87_2 = L60_2
  L88_2 = L63_2
  L89_2 = L28_2
  L90_2 = L29_2
  L91_2 = L31_2
  L92_2 = L41_2
  L93_2 = L48_2
  L84_2[1] = L85_2
  L84_2[2] = L86_2
  L84_2[3] = L87_2
  L84_2[4] = L88_2
  L84_2[5] = L89_2
  L84_2[6] = L90_2
  L84_2[7] = L91_2
  L84_2[8] = L92_2
  L84_2[9] = L93_2
  L83_2 = L83_2(L84_2)
  L83_2 = L83_2 * L65_2
  L82_2 = L82_2 + L83_2
  L80_2 = L80_2(L81_2, L82_2)
  L81_2 = string
  L81_2 = L81_2.format
  L82_2 = "\tMEZ (A):\t %.1f%%"
  L83_2 = math
  L83_2 = L83_2.average
  L84_2 = {}
  L85_2 = L52_2
  L86_2 = L60_2
  L87_2 = L63_2
  L88_2 = L33_2
  L89_2 = L37_2
  L90_2 = L40_2
  L91_2 = L41_2
  L92_2 = L42_2
  L84_2[1] = L85_2
  L84_2[2] = L86_2
  L84_2[3] = L87_2
  L84_2[4] = L88_2
  L84_2[5] = L89_2
  L84_2[6] = L90_2
  L84_2[7] = L91_2
  L84_2[8] = L92_2
  L83_2 = L83_2(L84_2)
  L83_2 = L83_2 * L64_2
  L84_2 = math
  L84_2 = L84_2.average
  L85_2 = {}
  L86_2 = L53_2
  L87_2 = L54_2
  L88_2 = L57_2
  L89_2 = L29_2
  L90_2 = L31_2
  L91_2 = L35_2
  L92_2 = L44_2
  L93_2 = L48_2
  L85_2[1] = L86_2
  L85_2[2] = L87_2
  L85_2[3] = L88_2
  L85_2[4] = L89_2
  L85_2[5] = L90_2
  L85_2[6] = L91_2
  L85_2[7] = L92_2
  L85_2[8] = L93_2
  L84_2 = L84_2(L85_2)
  L84_2 = L84_2 * L65_2
  L83_2 = L83_2 + L84_2
  L81_2 = L81_2(L82_2, L83_2)
  L82_2 = string
  L82_2 = L82_2.format
  L83_2 = [[

HB (D):	 %.1f%%]]
  L84_2 = math
  L84_2 = L84_2.average
  L85_2 = {}
  L86_2 = L62_2
  L87_2 = L32_2
  L88_2 = L33_2
  L89_2 = L38_2
  L90_2 = L39_2
  L85_2[1] = L86_2
  L85_2[2] = L87_2
  L85_2[3] = L88_2
  L85_2[4] = L89_2
  L85_2[5] = L90_2
  L84_2 = L84_2(L85_2)
  L84_2 = L84_2 * L64_2
  L85_2 = math
  L85_2 = L85_2.average
  L86_2 = {}
  L87_2 = L54_2
  L88_2 = L59_2
  L89_2 = L60_2
  L90_2 = L63_2
  L91_2 = L28_2
  L92_2 = L29_2
  L93_2 = L31_2
  L94_2 = L41_2
  L95_2 = L48_2
  L86_2[1] = L87_2
  L86_2[2] = L88_2
  L86_2[3] = L89_2
  L86_2[4] = L90_2
  L86_2[5] = L91_2
  L86_2[6] = L92_2
  L86_2[7] = L93_2
  L86_2[8] = L94_2
  L86_2[9] = L95_2
  L85_2 = L85_2(L86_2)
  L85_2 = L85_2 * L65_2
  L84_2 = L84_2 + L85_2
  L82_2 = L82_2(L83_2, L84_2)
  L83_2 = string
  L83_2 = L83_2.format
  L84_2 = "\tBBM (S):\t %.1f%%"
  L85_2 = math
  L85_2 = L85_2.average
  L86_2 = {}
  L87_2 = L60_2
  L88_2 = L62_2
  L89_2 = L37_2
  L90_2 = L39_2
  L91_2 = L41_2
  L92_2 = L48_2
  L86_2[1] = L87_2
  L86_2[2] = L88_2
  L86_2[3] = L89_2
  L86_2[4] = L90_2
  L86_2[5] = L91_2
  L86_2[6] = L92_2
  L85_2 = L85_2(L86_2)
  L85_2 = L85_2 * L64_2
  L86_2 = math
  L86_2 = L86_2.average
  L87_2 = {}
  L88_2 = L52_2
  L89_2 = L53_2
  L90_2 = L54_2
  L91_2 = L57_2
  L92_2 = L63_2
  L93_2 = L28_2
  L94_2 = L29_2
  L95_2 = L31_2
  L96_2 = L33_2
  L97_2 = L38_2
  L98_2 = L42_2
  L99_2 = L44_2
  L100_2 = L47_2
  L101_2 = L49_2
  L87_2[1] = L88_2
  L87_2[2] = L89_2
  L87_2[3] = L90_2
  L87_2[4] = L91_2
  L87_2[5] = L92_2
  L87_2[6] = L93_2
  L87_2[7] = L94_2
  L87_2[8] = L95_2
  L87_2[9] = L96_2
  L87_2[10] = L97_2
  L87_2[11] = L98_2
  L87_2[12] = L99_2
  L87_2[13] = L100_2
  L87_2[14] = L101_2
  L86_2 = L86_2(L87_2)
  L86_2 = L86_2 * L65_2
  L85_2 = L85_2 + L86_2
  L83_2 = L83_2(L84_2, L85_2)
  L84_2 = string
  L84_2 = L84_2.format
  L85_2 = [[

RGA (S):	 %.1f%%]]
  L86_2 = math
  L86_2 = L86_2.average
  L87_2 = {}
  L88_2 = L54_2
  L89_2 = L60_2
  L90_2 = L63_2
  L91_2 = L31_2
  L92_2 = L33_2
  L93_2 = L35_2
  L94_2 = L37_2
  L95_2 = L39_2
  L96_2 = L40_2
  L87_2[1] = L88_2
  L87_2[2] = L89_2
  L87_2[3] = L90_2
  L87_2[4] = L91_2
  L87_2[5] = L92_2
  L87_2[6] = L93_2
  L87_2[7] = L94_2
  L87_2[8] = L95_2
  L87_2[9] = L96_2
  L86_2 = L86_2(L87_2)
  L86_2 = L86_2 * L64_2
  L87_2 = math
  L87_2 = L87_2.average
  L88_2 = {}
  L89_2 = L52_2
  L90_2 = L57_2
  L91_2 = L29_2
  L92_2 = L44_2
  L88_2[1] = L89_2
  L88_2[2] = L90_2
  L88_2[3] = L91_2
  L88_2[4] = L92_2
  L87_2 = L87_2(L88_2)
  L87_2 = L87_2 * L65_2
  L86_2 = L86_2 + L87_2
  L84_2 = L84_2(L85_2, L86_2)
  L85_2 = string
  L85_2 = L85_2.format
  L86_2 = "\tCAR (S):\t %.1f%%"
  L87_2 = math
  L87_2 = L87_2.average
  L88_2 = {}
  L89_2 = L60_2
  L90_2 = L62_2
  L91_2 = L33_2
  L92_2 = L38_2
  L93_2 = L39_2
  L94_2 = L41_2
  L95_2 = L48_2
  L88_2[1] = L89_2
  L88_2[2] = L90_2
  L88_2[3] = L91_2
  L88_2[4] = L92_2
  L88_2[5] = L93_2
  L88_2[6] = L94_2
  L88_2[7] = L95_2
  L87_2 = L87_2(L88_2)
  L87_2 = L87_2 * L64_2
  L88_2 = math
  L88_2 = L88_2.average
  L89_2 = {}
  L90_2 = L54_2
  L91_2 = L63_2
  L92_2 = L29_2
  L93_2 = L31_2
  L94_2 = L32_2
  L95_2 = L37_2
  L96_2 = L40_2
  L89_2[1] = L90_2
  L89_2[2] = L91_2
  L89_2[3] = L92_2
  L89_2[4] = L93_2
  L89_2[5] = L94_2
  L89_2[6] = L95_2
  L89_2[7] = L96_2
  L88_2 = L88_2(L89_2)
  L88_2 = L88_2 * L65_2
  L87_2 = L87_2 + L88_2
  L85_2 = L85_2(L86_2, L87_2)
  L86_2 = string
  L86_2 = L86_2.format
  L87_2 = [[

RPM (S):	 %.1f%%]]
  L88_2 = math
  L88_2 = L88_2.average
  L89_2 = {}
  L90_2 = L54_2
  L91_2 = L60_2
  L92_2 = L63_2
  L93_2 = L29_2
  L94_2 = L31_2
  L95_2 = L33_2
  L96_2 = L37_2
  L97_2 = L39_2
  L98_2 = L40_2
  L99_2 = L41_2
  L100_2 = L42_2
  L101_2 = L48_2
  L89_2[1] = L90_2
  L89_2[2] = L91_2
  L89_2[3] = L92_2
  L89_2[4] = L93_2
  L89_2[5] = L94_2
  L89_2[6] = L95_2
  L89_2[7] = L96_2
  L89_2[8] = L97_2
  L89_2[9] = L98_2
  L89_2[10] = L99_2
  L89_2[11] = L100_2
  L89_2[12] = L101_2
  L88_2 = L88_2(L89_2)
  L88_2 = L88_2 * L64_2
  L89_2 = math
  L89_2 = L89_2.average
  L90_2 = {}
  L91_2 = L52_2
  L92_2 = L57_2
  L93_2 = L32_2
  L94_2 = L38_2
  L95_2 = L43_2
  L96_2 = L44_2
  L97_2 = L47_2
  L90_2[1] = L91_2
  L90_2[2] = L92_2
  L90_2[3] = L93_2
  L90_2[4] = L94_2
  L90_2[5] = L95_2
  L90_2[6] = L96_2
  L90_2[7] = L97_2
  L89_2 = L89_2(L90_2)
  L89_2 = L89_2 * L65_2
  L88_2 = L88_2 + L89_2
  L86_2 = L86_2(L87_2, L88_2)
  L87_2 = string
  L87_2 = L87_2.format
  L88_2 = [[

DLP (D):	 %.1f%%]]
  L89_2 = math
  L89_2 = L89_2.average
  L90_2 = {}
  L91_2 = L54_2
  L92_2 = L60_2
  L93_2 = L63_2
  L94_2 = L31_2
  L95_2 = L33_2
  L96_2 = L39_2
  L97_2 = L40_2
  L98_2 = L41_2
  L90_2[1] = L91_2
  L90_2[2] = L92_2
  L90_2[3] = L93_2
  L90_2[4] = L94_2
  L90_2[5] = L95_2
  L90_2[6] = L96_2
  L90_2[7] = L97_2
  L90_2[8] = L98_2
  L89_2 = L89_2(L90_2)
  L89_2 = L89_2 * L64_2
  L90_2 = math
  L90_2 = L90_2.average
  L91_2 = {}
  L92_2 = L62_2
  L93_2 = L29_2
  L94_2 = L38_2
  L95_2 = L44_2
  L91_2[1] = L92_2
  L91_2[2] = L93_2
  L91_2[3] = L94_2
  L91_2[4] = L95_2
  L90_2 = L90_2(L91_2)
  L90_2 = L90_2 * L65_2
  L89_2 = L89_2 + L90_2
  L87_2 = L87_2(L88_2, L89_2)
  L88_2 = string
  L88_2 = L88_2.format
  L89_2 = [[

DLP (S):	 %.1f%%]]
  L90_2 = math
  L90_2 = L90_2.average
  L91_2 = {}
  L92_2 = L54_2
  L93_2 = L60_2
  L94_2 = L63_2
  L95_2 = L31_2
  L96_2 = L33_2
  L97_2 = L39_2
  L98_2 = L40_2
  L91_2[1] = L92_2
  L91_2[2] = L93_2
  L91_2[3] = L94_2
  L91_2[4] = L95_2
  L91_2[5] = L96_2
  L91_2[6] = L97_2
  L91_2[7] = L98_2
  L90_2 = L90_2(L91_2)
  L90_2 = L90_2 * L64_2
  L91_2 = math
  L91_2 = L91_2.average
  L92_2 = {}
  L93_2 = L29_2
  L94_2 = L37_2
  L95_2 = L41_2
  L96_2 = L44_2
  L92_2[1] = L93_2
  L92_2[2] = L94_2
  L92_2[3] = L95_2
  L92_2[4] = L96_2
  L91_2 = L91_2(L92_2)
  L91_2 = L91_2 * L65_2
  L90_2 = L90_2 + L91_2
  L88_2 = L88_2(L89_2, L90_2)
  L68_2 = L68_2 .. L69_2 .. L70_2 .. L71_2 .. L72_2 .. L73_2 .. L74_2 .. L75_2 .. L76_2 .. L77_2 .. L78_2 .. L79_2 .. L80_2 .. L81_2 .. L82_2 .. L83_2 .. L84_2 .. L85_2 .. L86_2 .. L87_2 .. L88_2
  L3_2[3] = L68_2
  L68_2 = string
  L68_2 = L68_2.format
  L69_2 = "WM (D):\t %.1f%%"
  L70_2 = math
  L70_2 = L70_2.average
  L71_2 = {}
  L72_2 = L51_2
  L73_2 = L52_2
  L74_2 = L63_2
  L75_2 = L37_2
  L76_2 = L42_2
  L77_2 = L47_2
  L71_2[1] = L72_2
  L71_2[2] = L73_2
  L71_2[3] = L74_2
  L71_2[4] = L75_2
  L71_2[5] = L76_2
  L71_2[6] = L77_2
  L70_2 = L70_2(L71_2)
  L70_2 = L70_2 * L64_2
  L71_2 = math
  L71_2 = L71_2.average
  L72_2 = {}
  L73_2 = L54_2
  L74_2 = L60_2
  L75_2 = L41_2
  L76_2 = L43_2
  L77_2 = L48_2
  L72_2[1] = L73_2
  L72_2[2] = L74_2
  L72_2[3] = L75_2
  L72_2[4] = L76_2
  L72_2[5] = L77_2
  L71_2 = L71_2(L72_2)
  L71_2 = L71_2 * L65_2
  L70_2 = L70_2 + L71_2
  L68_2 = L68_2(L69_2, L70_2)
  L69_2 = string
  L69_2 = L69_2.format
  L70_2 = "\tIW (S):\t %.1f%%"
  L71_2 = math
  L71_2 = L71_2.average
  L72_2 = {}
  L73_2 = L52_2
  L74_2 = L60_2
  L75_2 = L63_2
  L76_2 = L37_2
  L77_2 = L42_2
  L72_2[1] = L73_2
  L72_2[2] = L74_2
  L72_2[3] = L75_2
  L72_2[4] = L76_2
  L72_2[5] = L77_2
  L71_2 = L71_2(L72_2)
  L71_2 = L71_2 * L64_2
  L72_2 = math
  L72_2 = L72_2.average
  L73_2 = {}
  L74_2 = L51_2
  L75_2 = L54_2
  L76_2 = L57_2
  L77_2 = L31_2
  L78_2 = L33_2
  L79_2 = L40_2
  L80_2 = L41_2
  L81_2 = L43_2
  L82_2 = L47_2
  L83_2 = L48_2
  L73_2[1] = L74_2
  L73_2[2] = L75_2
  L73_2[3] = L76_2
  L73_2[4] = L77_2
  L73_2[5] = L78_2
  L73_2[6] = L79_2
  L73_2[7] = L80_2
  L73_2[8] = L81_2
  L73_2[9] = L82_2
  L73_2[10] = L83_2
  L72_2 = L72_2(L73_2)
  L72_2 = L72_2 * L65_2
  L71_2 = L71_2 + L72_2
  L69_2 = L69_2(L70_2, L71_2)
  L70_2 = string
  L70_2 = L70_2.format
  L71_2 = [[

WM (S):	 %.1f%%]]
  L72_2 = math
  L72_2 = L72_2.average
  L73_2 = {}
  L74_2 = L51_2
  L75_2 = L52_2
  L76_2 = L63_2
  L77_2 = L37_2
  L78_2 = L42_2
  L79_2 = L47_2
  L73_2[1] = L74_2
  L73_2[2] = L75_2
  L73_2[3] = L76_2
  L73_2[4] = L77_2
  L73_2[5] = L78_2
  L73_2[6] = L79_2
  L72_2 = L72_2(L73_2)
  L72_2 = L72_2 * L64_2
  L73_2 = math
  L73_2 = L73_2.average
  L74_2 = {}
  L75_2 = L54_2
  L76_2 = L60_2
  L77_2 = L29_2
  L78_2 = L35_2
  L79_2 = L43_2
  L74_2[1] = L75_2
  L74_2[2] = L76_2
  L74_2[3] = L77_2
  L74_2[4] = L78_2
  L74_2[5] = L79_2
  L73_2 = L73_2(L74_2)
  L73_2 = L73_2 * L65_2
  L72_2 = L72_2 + L73_2
  L70_2 = L70_2(L71_2, L72_2)
  L71_2 = string
  L71_2 = L71_2.format
  L72_2 = "\tIW (A):\t %.1f%%"
  L73_2 = math
  L73_2 = L73_2.average
  L74_2 = {}
  L75_2 = L52_2
  L76_2 = L60_2
  L77_2 = L63_2
  L78_2 = L37_2
  L79_2 = L42_2
  L80_2 = L43_2
  L74_2[1] = L75_2
  L74_2[2] = L76_2
  L74_2[3] = L77_2
  L74_2[4] = L78_2
  L74_2[5] = L79_2
  L74_2[6] = L80_2
  L73_2 = L73_2(L74_2)
  L73_2 = L73_2 * L64_2
  L74_2 = math
  L74_2 = L74_2.average
  L75_2 = {}
  L76_2 = L51_2
  L77_2 = L54_2
  L78_2 = L57_2
  L79_2 = L29_2
  L80_2 = L31_2
  L81_2 = L33_2
  L82_2 = L35_2
  L83_2 = L40_2
  L84_2 = L47_2
  L75_2[1] = L76_2
  L75_2[2] = L77_2
  L75_2[3] = L78_2
  L75_2[4] = L79_2
  L75_2[5] = L80_2
  L75_2[6] = L81_2
  L75_2[7] = L82_2
  L75_2[8] = L83_2
  L75_2[9] = L84_2
  L74_2 = L74_2(L75_2)
  L74_2 = L74_2 * L65_2
  L73_2 = L73_2 + L74_2
  L71_2 = L71_2(L72_2, L73_2)
  L72_2 = string
  L72_2 = L72_2.format
  L73_2 = [[

WM (A):	 %.1f%%]]
  L74_2 = math
  L74_2 = L74_2.average
  L75_2 = {}
  L76_2 = L51_2
  L77_2 = L52_2
  L78_2 = L63_2
  L79_2 = L37_2
  L80_2 = L42_2
  L81_2 = L47_2
  L75_2[1] = L76_2
  L75_2[2] = L77_2
  L75_2[3] = L78_2
  L75_2[4] = L79_2
  L75_2[5] = L80_2
  L75_2[6] = L81_2
  L74_2 = L74_2(L75_2)
  L74_2 = L74_2 * L64_2
  L75_2 = math
  L75_2 = L75_2.average
  L76_2 = {}
  L77_2 = L54_2
  L78_2 = L60_2
  L79_2 = L29_2
  L80_2 = L35_2
  L81_2 = L43_2
  L76_2[1] = L77_2
  L76_2[2] = L78_2
  L76_2[3] = L79_2
  L76_2[4] = L80_2
  L76_2[5] = L81_2
  L75_2 = L75_2(L76_2)
  L75_2 = L75_2 * L65_2
  L74_2 = L74_2 + L75_2
  L72_2 = L72_2(L73_2, L74_2)
  L73_2 = string
  L73_2 = L73_2.format
  L74_2 = "\tIF (S):\t %.1f%%"
  L75_2 = math
  L75_2 = L75_2.average
  L76_2 = {}
  L77_2 = L52_2
  L78_2 = L54_2
  L79_2 = L60_2
  L80_2 = L63_2
  L81_2 = L37_2
  L82_2 = L42_2
  L83_2 = L43_2
  L84_2 = L44_2
  L76_2[1] = L77_2
  L76_2[2] = L78_2
  L76_2[3] = L79_2
  L76_2[4] = L80_2
  L76_2[5] = L81_2
  L76_2[6] = L82_2
  L76_2[7] = L83_2
  L76_2[8] = L84_2
  L75_2 = L75_2(L76_2)
  L75_2 = L75_2 * L64_2
  L76_2 = math
  L76_2 = L76_2.average
  L77_2 = {}
  L78_2 = L53_2
  L79_2 = L57_2
  L80_2 = L29_2
  L81_2 = L31_2
  L82_2 = L35_2
  L83_2 = L40_2
  L84_2 = L47_2
  L77_2[1] = L78_2
  L77_2[2] = L79_2
  L77_2[3] = L80_2
  L77_2[4] = L81_2
  L77_2[5] = L82_2
  L77_2[6] = L83_2
  L77_2[7] = L84_2
  L76_2 = L76_2(L77_2)
  L76_2 = L76_2 * L65_2
  L75_2 = L75_2 + L76_2
  L73_2 = L73_2(L74_2, L75_2)
  L74_2 = string
  L74_2 = L74_2.format
  L75_2 = [[

WP (S):	 %.1f%%]]
  L76_2 = math
  L76_2 = L76_2.average
  L77_2 = {}
  L78_2 = L51_2
  L79_2 = L52_2
  L80_2 = L63_2
  L81_2 = L37_2
  L82_2 = L42_2
  L83_2 = L47_2
  L77_2[1] = L78_2
  L77_2[2] = L79_2
  L77_2[3] = L80_2
  L77_2[4] = L81_2
  L77_2[5] = L82_2
  L77_2[6] = L83_2
  L76_2 = L76_2(L77_2)
  L76_2 = L76_2 * L64_2
  L77_2 = math
  L77_2 = L77_2.average
  L78_2 = {}
  L79_2 = L54_2
  L80_2 = L60_2
  L81_2 = L29_2
  L82_2 = L35_2
  L83_2 = L43_2
  L78_2[1] = L79_2
  L78_2[2] = L80_2
  L78_2[3] = L81_2
  L78_2[4] = L82_2
  L78_2[5] = L83_2
  L77_2 = L77_2(L78_2)
  L77_2 = L77_2 * L65_2
  L76_2 = L76_2 + L77_2
  L74_2 = L74_2(L75_2, L76_2)
  L75_2 = string
  L75_2 = L75_2.format
  L76_2 = "\tIF (A):\t %.1f%%"
  L77_2 = math
  L77_2 = L77_2.average
  L78_2 = {}
  L79_2 = L52_2
  L80_2 = L53_2
  L81_2 = L54_2
  L82_2 = L63_2
  L83_2 = L37_2
  L84_2 = L42_2
  L85_2 = L43_2
  L86_2 = L44_2
  L78_2[1] = L79_2
  L78_2[2] = L80_2
  L78_2[3] = L81_2
  L78_2[4] = L82_2
  L78_2[5] = L83_2
  L78_2[6] = L84_2
  L78_2[7] = L85_2
  L78_2[8] = L86_2
  L77_2 = L77_2(L78_2)
  L77_2 = L77_2 * L64_2
  L78_2 = math
  L78_2 = L78_2.average
  L79_2 = {}
  L80_2 = L57_2
  L81_2 = L60_2
  L82_2 = L29_2
  L83_2 = L31_2
  L84_2 = L35_2
  L85_2 = L47_2
  L79_2[1] = L80_2
  L79_2[2] = L81_2
  L79_2[3] = L82_2
  L79_2[4] = L83_2
  L79_2[5] = L84_2
  L79_2[6] = L85_2
  L78_2 = L78_2(L79_2)
  L78_2 = L78_2 * L65_2
  L77_2 = L77_2 + L78_2
  L75_2 = L75_2(L76_2, L77_2)
  L76_2 = string
  L76_2 = L76_2.format
  L77_2 = [[

WP (A):	 %.1f%%]]
  L78_2 = math
  L78_2 = L78_2.average
  L79_2 = {}
  L80_2 = L51_2
  L81_2 = L52_2
  L82_2 = L63_2
  L83_2 = L37_2
  L84_2 = L42_2
  L85_2 = L47_2
  L79_2[1] = L80_2
  L79_2[2] = L81_2
  L79_2[3] = L82_2
  L79_2[4] = L83_2
  L79_2[5] = L84_2
  L79_2[6] = L85_2
  L78_2 = L78_2(L79_2)
  L78_2 = L78_2 * L64_2
  L79_2 = math
  L79_2 = L79_2.average
  L80_2 = {}
  L81_2 = L54_2
  L82_2 = L60_2
  L83_2 = L29_2
  L84_2 = L35_2
  L85_2 = L43_2
  L80_2[1] = L81_2
  L80_2[2] = L82_2
  L80_2[3] = L83_2
  L80_2[4] = L84_2
  L80_2[5] = L85_2
  L79_2 = L79_2(L80_2)
  L79_2 = L79_2 * L65_2
  L78_2 = L78_2 + L79_2
  L76_2 = L76_2(L77_2, L78_2)
  L77_2 = string
  L77_2 = L77_2.format
  L78_2 = "\tWTM (S):\t %.1f%%"
  L79_2 = math
  L79_2 = L79_2.average
  L80_2 = {}
  L81_2 = L56_2
  L82_2 = L30_2
  L83_2 = L39_2
  L84_2 = L45_2
  L85_2 = L49_2
  L80_2[1] = L81_2
  L80_2[2] = L82_2
  L80_2[3] = L83_2
  L80_2[4] = L84_2
  L80_2[5] = L85_2
  L79_2 = L79_2(L80_2)
  L79_2 = L79_2 * L64_2
  L80_2 = math
  L80_2 = L80_2.average
  L81_2 = {}
  L82_2 = L51_2
  L83_2 = L54_2
  L84_2 = L29_2
  L85_2 = L37_2
  L86_2 = L41_2
  L87_2 = L44_2
  L88_2 = L48_2
  L81_2[1] = L82_2
  L81_2[2] = L83_2
  L81_2[3] = L84_2
  L81_2[4] = L85_2
  L81_2[5] = L86_2
  L81_2[6] = L87_2
  L81_2[7] = L88_2
  L80_2 = L80_2(L81_2)
  L80_2 = L80_2 * L65_2
  L79_2 = L79_2 + L80_2
  L77_2 = L77_2(L78_2, L79_2)
  L78_2 = string
  L78_2 = L78_2.format
  L79_2 = [[

DW (D):	 %.1f%%]]
  L80_2 = math
  L80_2 = L80_2.average
  L81_2 = {}
  L82_2 = L52_2
  L83_2 = L60_2
  L84_2 = L63_2
  L85_2 = L37_2
  L86_2 = L42_2
  L81_2[1] = L82_2
  L81_2[2] = L83_2
  L81_2[3] = L84_2
  L81_2[4] = L85_2
  L81_2[5] = L86_2
  L80_2 = L80_2(L81_2)
  L80_2 = L80_2 * L64_2
  L81_2 = math
  L81_2 = L81_2.average
  L82_2 = {}
  L83_2 = L51_2
  L84_2 = L54_2
  L85_2 = L57_2
  L86_2 = L31_2
  L87_2 = L33_2
  L88_2 = L40_2
  L89_2 = L41_2
  L90_2 = L43_2
  L91_2 = L47_2
  L92_2 = L48_2
  L82_2[1] = L83_2
  L82_2[2] = L84_2
  L82_2[3] = L85_2
  L82_2[4] = L86_2
  L82_2[5] = L87_2
  L82_2[6] = L88_2
  L82_2[7] = L89_2
  L82_2[8] = L90_2
  L82_2[9] = L91_2
  L82_2[10] = L92_2
  L81_2 = L81_2(L82_2)
  L81_2 = L81_2 * L65_2
  L80_2 = L80_2 + L81_2
  L78_2 = L78_2(L79_2, L80_2)
  L79_2 = string
  L79_2 = L79_2.format
  L80_2 = "\tWTM (A):\t %.1f%%"
  L81_2 = math
  L81_2 = L81_2.average
  L82_2 = {}
  L83_2 = L56_2
  L84_2 = L30_2
  L85_2 = L37_2
  L86_2 = L45_2
  L87_2 = L49_2
  L82_2[1] = L83_2
  L82_2[2] = L84_2
  L82_2[3] = L85_2
  L82_2[4] = L86_2
  L82_2[5] = L87_2
  L81_2 = L81_2(L82_2)
  L81_2 = L81_2 * L64_2
  L82_2 = math
  L82_2 = L82_2.average
  L83_2 = {}
  L84_2 = L51_2
  L85_2 = L53_2
  L86_2 = L54_2
  L87_2 = L29_2
  L88_2 = L39_2
  L89_2 = L41_2
  L90_2 = L44_2
  L91_2 = L48_2
  L83_2[1] = L84_2
  L83_2[2] = L85_2
  L83_2[3] = L86_2
  L83_2[4] = L87_2
  L83_2[5] = L88_2
  L83_2[6] = L89_2
  L83_2[7] = L90_2
  L83_2[8] = L91_2
  L82_2 = L82_2(L83_2)
  L82_2 = L82_2 * L65_2
  L81_2 = L81_2 + L82_2
  L79_2 = L79_2(L80_2, L81_2)
  L80_2 = string
  L80_2 = L80_2.format
  L81_2 = [[

DW (S):	 %.1f%%]]
  L82_2 = math
  L82_2 = L82_2.average
  L83_2 = {}
  L84_2 = L52_2
  L85_2 = L60_2
  L86_2 = L63_2
  L87_2 = L37_2
  L88_2 = L42_2
  L89_2 = L43_2
  L83_2[1] = L84_2
  L83_2[2] = L85_2
  L83_2[3] = L86_2
  L83_2[4] = L87_2
  L83_2[5] = L88_2
  L83_2[6] = L89_2
  L82_2 = L82_2(L83_2)
  L82_2 = L82_2 * L64_2
  L83_2 = math
  L83_2 = L83_2.average
  L84_2 = {}
  L85_2 = L51_2
  L86_2 = L54_2
  L87_2 = L57_2
  L88_2 = L29_2
  L89_2 = L31_2
  L90_2 = L33_2
  L91_2 = L35_2
  L92_2 = L40_2
  L93_2 = L47_2
  L84_2[1] = L85_2
  L84_2[2] = L86_2
  L84_2[3] = L87_2
  L84_2[4] = L88_2
  L84_2[5] = L89_2
  L84_2[6] = L90_2
  L84_2[7] = L91_2
  L84_2[8] = L92_2
  L84_2[9] = L93_2
  L83_2 = L83_2(L84_2)
  L83_2 = L83_2 * L65_2
  L82_2 = L82_2 + L83_2
  L80_2 = L80_2(L81_2, L82_2)
  L81_2 = string
  L81_2 = L81_2.format
  L82_2 = "\tRMD (A):\t %.1f%%"
  L83_2 = math
  L83_2 = L83_2.average
  L84_2 = {}
  L85_2 = L53_2
  L86_2 = L29_2
  L87_2 = L31_2
  L88_2 = L32_2
  L89_2 = L33_2
  L90_2 = L37_2
  L91_2 = L44_2
  L84_2[1] = L85_2
  L84_2[2] = L86_2
  L84_2[3] = L87_2
  L84_2[4] = L88_2
  L84_2[5] = L89_2
  L84_2[6] = L90_2
  L84_2[7] = L91_2
  L83_2 = L83_2(L84_2)
  L83_2 = L83_2 * L64_2
  L84_2 = math
  L84_2 = L84_2.average
  L85_2 = {}
  L86_2 = L54_2
  L87_2 = L63_2
  L88_2 = L41_2
  L89_2 = L42_2
  L90_2 = L48_2
  L85_2[1] = L86_2
  L85_2[2] = L87_2
  L85_2[3] = L88_2
  L85_2[4] = L89_2
  L85_2[5] = L90_2
  L84_2 = L84_2(L85_2)
  L84_2 = L84_2 * L65_2
  L83_2 = L83_2 + L84_2
  L81_2 = L81_2(L82_2, L83_2)
  L82_2 = string
  L82_2 = L82_2.format
  L83_2 = [[

W (S):	 %.1f%%]]
  L84_2 = math
  L84_2 = L84_2.average
  L85_2 = {}
  L86_2 = L51_2
  L87_2 = L52_2
  L88_2 = L63_2
  L89_2 = L37_2
  L90_2 = L42_2
  L91_2 = L47_2
  L85_2[1] = L86_2
  L85_2[2] = L87_2
  L85_2[3] = L88_2
  L85_2[4] = L89_2
  L85_2[5] = L90_2
  L85_2[6] = L91_2
  L84_2 = L84_2(L85_2)
  L84_2 = L84_2 * L64_2
  L85_2 = math
  L85_2 = L85_2.average
  L86_2 = {}
  L87_2 = L54_2
  L88_2 = L60_2
  L89_2 = L41_2
  L90_2 = L43_2
  L91_2 = L48_2
  L86_2[1] = L87_2
  L86_2[2] = L88_2
  L86_2[3] = L89_2
  L86_2[4] = L90_2
  L86_2[5] = L91_2
  L85_2 = L85_2(L86_2)
  L85_2 = L85_2 * L65_2
  L84_2 = L84_2 + L85_2
  L82_2 = L82_2(L83_2, L84_2)
  L83_2 = string
  L83_2 = L83_2.format
  L84_2 = [[

W (A):	 %.1f%%]]
  L85_2 = math
  L85_2 = L85_2.average
  L86_2 = {}
  L87_2 = L51_2
  L88_2 = L52_2
  L89_2 = L63_2
  L90_2 = L37_2
  L91_2 = L42_2
  L92_2 = L47_2
  L86_2[1] = L87_2
  L86_2[2] = L88_2
  L86_2[3] = L89_2
  L86_2[4] = L90_2
  L86_2[5] = L91_2
  L86_2[6] = L92_2
  L85_2 = L85_2(L86_2)
  L85_2 = L85_2 * L64_2
  L86_2 = math
  L86_2 = L86_2.average
  L87_2 = {}
  L88_2 = L54_2
  L89_2 = L60_2
  L90_2 = L29_2
  L91_2 = L35_2
  L92_2 = L43_2
  L87_2[1] = L88_2
  L87_2[2] = L89_2
  L87_2[3] = L90_2
  L87_2[4] = L91_2
  L87_2[5] = L92_2
  L86_2 = L86_2(L87_2)
  L86_2 = L86_2 * L65_2
  L85_2 = L85_2 + L86_2
  L83_2 = L83_2(L84_2, L85_2)
  L68_2 = L68_2 .. L69_2 .. L70_2 .. L71_2 .. L72_2 .. L73_2 .. L74_2 .. L75_2 .. L76_2 .. L77_2 .. L78_2 .. L79_2 .. L80_2 .. L81_2 .. L82_2 .. L83_2
  L3_2[4] = L68_2
  L68_2 = string
  L68_2 = L68_2.format
  L69_2 = "AM (S):\t %.1f%%"
  L70_2 = math
  L70_2 = L70_2.average
  L71_2 = {}
  L72_2 = L54_2
  L73_2 = L57_2
  L74_2 = L60_2
  L75_2 = L63_2
  L76_2 = L29_2
  L77_2 = L33_2
  L78_2 = L35_2
  L79_2 = L37_2
  L71_2[1] = L72_2
  L71_2[2] = L73_2
  L71_2[3] = L74_2
  L71_2[4] = L75_2
  L71_2[5] = L76_2
  L71_2[6] = L77_2
  L71_2[7] = L78_2
  L71_2[8] = L79_2
  L70_2 = L70_2(L71_2)
  L70_2 = L70_2 * L64_2
  L71_2 = math
  L71_2 = L71_2.average
  L72_2 = {}
  L73_2 = L52_2
  L74_2 = L31_2
  L75_2 = L40_2
  L76_2 = L43_2
  L72_2[1] = L73_2
  L72_2[2] = L74_2
  L72_2[3] = L75_2
  L72_2[4] = L76_2
  L71_2 = L71_2(L72_2)
  L71_2 = L71_2 * L65_2
  L70_2 = L70_2 + L71_2
  L68_2 = L68_2(L69_2, L70_2)
  L69_2 = string
  L69_2 = L69_2.format
  L70_2 = "\tCF (S):\t %.1f%%"
  L71_2 = math
  L71_2 = L71_2.average
  L72_2 = {}
  L73_2 = L52_2
  L74_2 = L54_2
  L75_2 = L56_2
  L76_2 = L57_2
  L77_2 = L60_2
  L78_2 = L63_2
  L79_2 = L29_2
  L80_2 = L31_2
  L81_2 = L37_2
  L82_2 = L40_2
  L83_2 = L42_2
  L84_2 = L43_2
  L85_2 = L49_2
  L72_2[1] = L73_2
  L72_2[2] = L74_2
  L72_2[3] = L75_2
  L72_2[4] = L76_2
  L72_2[5] = L77_2
  L72_2[6] = L78_2
  L72_2[7] = L79_2
  L72_2[8] = L80_2
  L72_2[9] = L81_2
  L72_2[10] = L82_2
  L72_2[11] = L83_2
  L72_2[12] = L84_2
  L72_2[13] = L85_2
  L71_2 = L71_2(L72_2)
  L71_2 = L71_2 * L64_2
  L72_2 = math
  L72_2 = L72_2.average
  L73_2 = {}
  L74_2 = L53_2
  L75_2 = L39_2
  L76_2 = L41_2
  L77_2 = L44_2
  L78_2 = L45_2
  L79_2 = L47_2
  L80_2 = L48_2
  L73_2[1] = L74_2
  L73_2[2] = L75_2
  L73_2[3] = L76_2
  L73_2[4] = L77_2
  L73_2[5] = L78_2
  L73_2[6] = L79_2
  L73_2[7] = L80_2
  L72_2 = L72_2(L73_2)
  L72_2 = L72_2 * L65_2
  L71_2 = L71_2 + L72_2
  L69_2 = L69_2(L70_2, L71_2)
  L70_2 = string
  L70_2 = L70_2.format
  L71_2 = [[

AM (A):	 %.1f%%]]
  L72_2 = math
  L72_2 = L72_2.average
  L73_2 = {}
  L74_2 = L52_2
  L75_2 = L54_2
  L76_2 = L57_2
  L77_2 = L60_2
  L78_2 = L63_2
  L79_2 = L29_2
  L80_2 = L33_2
  L81_2 = L35_2
  L82_2 = L37_2
  L73_2[1] = L74_2
  L73_2[2] = L75_2
  L73_2[3] = L76_2
  L73_2[4] = L77_2
  L73_2[5] = L78_2
  L73_2[6] = L79_2
  L73_2[7] = L80_2
  L73_2[8] = L81_2
  L73_2[9] = L82_2
  L72_2 = L72_2(L73_2)
  L72_2 = L72_2 * L64_2
  L73_2 = math
  L73_2 = L73_2.average
  L74_2 = {}
  L75_2 = L53_2
  L76_2 = L31_2
  L77_2 = L40_2
  L78_2 = L43_2
  L74_2[1] = L75_2
  L74_2[2] = L76_2
  L74_2[3] = L77_2
  L74_2[4] = L78_2
  L73_2 = L73_2(L74_2)
  L73_2 = L73_2 * L65_2
  L72_2 = L72_2 + L73_2
  L70_2 = L70_2(L71_2, L72_2)
  L71_2 = string
  L71_2 = L71_2.format
  L72_2 = "\tCF (A):\t %.1f%%"
  L73_2 = math
  L73_2 = L73_2.average
  L74_2 = {}
  L75_2 = L52_2
  L76_2 = L53_2
  L77_2 = L54_2
  L78_2 = L56_2
  L79_2 = L63_2
  L80_2 = L29_2
  L81_2 = L31_2
  L82_2 = L37_2
  L83_2 = L42_2
  L84_2 = L43_2
  L85_2 = L49_2
  L74_2[1] = L75_2
  L74_2[2] = L76_2
  L74_2[3] = L77_2
  L74_2[4] = L78_2
  L74_2[5] = L79_2
  L74_2[6] = L80_2
  L74_2[7] = L81_2
  L74_2[8] = L82_2
  L74_2[9] = L83_2
  L74_2[10] = L84_2
  L74_2[11] = L85_2
  L73_2 = L73_2(L74_2)
  L73_2 = L73_2 * L64_2
  L74_2 = math
  L74_2 = L74_2.average
  L75_2 = {}
  L76_2 = L57_2
  L77_2 = L60_2
  L78_2 = L33_2
  L79_2 = L39_2
  L80_2 = L40_2
  L81_2 = L41_2
  L82_2 = L44_2
  L83_2 = L45_2
  L84_2 = L47_2
  L85_2 = L48_2
  L75_2[1] = L76_2
  L75_2[2] = L77_2
  L75_2[3] = L78_2
  L75_2[4] = L79_2
  L75_2[5] = L80_2
  L75_2[6] = L81_2
  L75_2[7] = L82_2
  L75_2[8] = L83_2
  L75_2[9] = L84_2
  L75_2[10] = L85_2
  L74_2 = L74_2(L75_2)
  L74_2 = L74_2 * L65_2
  L73_2 = L73_2 + L74_2
  L71_2 = L71_2(L72_2, L73_2)
  L72_2 = string
  L72_2 = L72_2.format
  L73_2 = [[

SS (A):	 %.1f%%]]
  L74_2 = math
  L74_2 = L74_2.average
  L75_2 = {}
  L76_2 = L52_2
  L77_2 = L53_2
  L78_2 = L54_2
  L79_2 = L29_2
  L80_2 = L31_2
  L81_2 = L37_2
  L82_2 = L42_2
  L75_2[1] = L76_2
  L75_2[2] = L77_2
  L75_2[3] = L78_2
  L75_2[4] = L79_2
  L75_2[5] = L80_2
  L75_2[6] = L81_2
  L75_2[7] = L82_2
  L74_2 = L74_2(L75_2)
  L74_2 = L74_2 * L64_2
  L75_2 = math
  L75_2 = L75_2.average
  L76_2 = {}
  L77_2 = L60_2
  L78_2 = L63_2
  L79_2 = L32_2
  L80_2 = L33_2
  L81_2 = L41_2
  L82_2 = L43_2
  L83_2 = L44_2
  L84_2 = L47_2
  L85_2 = L48_2
  L76_2[1] = L77_2
  L76_2[2] = L78_2
  L76_2[3] = L79_2
  L76_2[4] = L80_2
  L76_2[5] = L81_2
  L76_2[6] = L82_2
  L76_2[7] = L83_2
  L76_2[8] = L84_2
  L76_2[9] = L85_2
  L75_2 = L75_2(L76_2)
  L75_2 = L75_2 * L65_2
  L74_2 = L74_2 + L75_2
  L72_2 = L72_2(L73_2, L74_2)
  L73_2 = string
  L73_2 = L73_2.format
  L74_2 = "\tPF (D):\t %.1f%%"
  L75_2 = math
  L75_2 = L75_2.average
  L76_2 = {}
  L77_2 = L28_2
  L78_2 = L29_2
  L79_2 = L30_2
  L80_2 = L33_2
  L81_2 = L39_2
  L82_2 = L41_2
  L83_2 = L42_2
  L84_2 = L47_2
  L85_2 = L48_2
  L76_2[1] = L77_2
  L76_2[2] = L78_2
  L76_2[3] = L79_2
  L76_2[4] = L80_2
  L76_2[5] = L81_2
  L76_2[6] = L82_2
  L76_2[7] = L83_2
  L76_2[8] = L84_2
  L76_2[9] = L85_2
  L75_2 = L75_2(L76_2)
  L75_2 = L75_2 * L64_2
  L76_2 = math
  L76_2 = L76_2.average
  L77_2 = {}
  L78_2 = L54_2
  L79_2 = L31_2
  L80_2 = L32_2
  L81_2 = L43_2
  L82_2 = L44_2
  L83_2 = L49_2
  L77_2[1] = L78_2
  L77_2[2] = L79_2
  L77_2[3] = L80_2
  L77_2[4] = L81_2
  L77_2[5] = L82_2
  L77_2[6] = L83_2
  L76_2 = L76_2(L77_2)
  L76_2 = L76_2 * L65_2
  L75_2 = L75_2 + L76_2
  L73_2 = L73_2(L74_2, L75_2)
  L74_2 = string
  L74_2 = L74_2.format
  L75_2 = [[

EG (S):	 %.1f%%]]
  L76_2 = math
  L76_2 = L76_2.average
  L77_2 = {}
  L78_2 = L54_2
  L79_2 = L60_2
  L80_2 = L63_2
  L81_2 = L31_2
  L82_2 = L33_2
  L83_2 = L40_2
  L77_2[1] = L78_2
  L77_2[2] = L79_2
  L77_2[3] = L80_2
  L77_2[4] = L81_2
  L77_2[5] = L82_2
  L77_2[6] = L83_2
  L76_2 = L76_2(L77_2)
  L76_2 = L76_2 * L64_2
  L77_2 = math
  L77_2 = L77_2.average
  L78_2 = {}
  L79_2 = L29_2
  L80_2 = L35_2
  L81_2 = L37_2
  L82_2 = L44_2
  L78_2[1] = L79_2
  L78_2[2] = L80_2
  L78_2[3] = L81_2
  L78_2[4] = L82_2
  L77_2 = L77_2(L78_2)
  L77_2 = L77_2 * L65_2
  L76_2 = L76_2 + L77_2
  L74_2 = L74_2(L75_2, L76_2)
  L75_2 = string
  L75_2 = L75_2.format
  L76_2 = "\tPF (S):\t %.1f%%"
  L77_2 = math
  L77_2 = L77_2.average
  L78_2 = {}
  L79_2 = L28_2
  L80_2 = L29_2
  L81_2 = L30_2
  L82_2 = L33_2
  L83_2 = L39_2
  L84_2 = L41_2
  L85_2 = L42_2
  L86_2 = L47_2
  L87_2 = L48_2
  L78_2[1] = L79_2
  L78_2[2] = L80_2
  L78_2[3] = L81_2
  L78_2[4] = L82_2
  L78_2[5] = L83_2
  L78_2[6] = L84_2
  L78_2[7] = L85_2
  L78_2[8] = L86_2
  L78_2[9] = L87_2
  L77_2 = L77_2(L78_2)
  L77_2 = L77_2 * L64_2
  L78_2 = math
  L78_2 = L78_2.average
  L79_2 = {}
  L80_2 = L54_2
  L81_2 = L60_2
  L82_2 = L31_2
  L83_2 = L32_2
  L84_2 = L37_2
  L85_2 = L43_2
  L86_2 = L44_2
  L87_2 = L49_2
  L79_2[1] = L80_2
  L79_2[2] = L81_2
  L79_2[3] = L82_2
  L79_2[4] = L83_2
  L79_2[5] = L84_2
  L79_2[6] = L85_2
  L79_2[7] = L86_2
  L79_2[8] = L87_2
  L78_2 = L78_2(L79_2)
  L78_2 = L78_2 * L65_2
  L77_2 = L77_2 + L78_2
  L75_2 = L75_2(L76_2, L77_2)
  L76_2 = string
  L76_2 = L76_2.format
  L77_2 = [[

T (A):	 %.1f%%]]
  L78_2 = math
  L78_2 = L78_2.average
  L79_2 = {}
  L80_2 = L52_2
  L81_2 = L54_2
  L82_2 = L60_2
  L83_2 = L63_2
  L84_2 = L31_2
  L85_2 = L33_2
  L86_2 = L35_2
  L87_2 = L37_2
  L88_2 = L40_2
  L89_2 = L42_2
  L79_2[1] = L80_2
  L79_2[2] = L81_2
  L79_2[3] = L82_2
  L79_2[4] = L83_2
  L79_2[5] = L84_2
  L79_2[6] = L85_2
  L79_2[7] = L86_2
  L79_2[8] = L87_2
  L79_2[9] = L88_2
  L79_2[10] = L89_2
  L78_2 = L78_2(L79_2)
  L78_2 = L78_2 * L64_2
  L79_2 = math
  L79_2 = L79_2.average
  L80_2 = {}
  L81_2 = L53_2
  L82_2 = L29_2
  L83_2 = L43_2
  L84_2 = L44_2
  L80_2[1] = L81_2
  L80_2[2] = L82_2
  L80_2[3] = L83_2
  L80_2[4] = L84_2
  L79_2 = L79_2(L80_2)
  L79_2 = L79_2 * L65_2
  L78_2 = L78_2 + L79_2
  L76_2 = L76_2(L77_2, L78_2)
  L77_2 = string
  L77_2 = L77_2.format
  L78_2 = "\tPF (A):\t %.1f%%"
  L79_2 = math
  L79_2 = L79_2.average
  L80_2 = {}
  L81_2 = L28_2
  L82_2 = L29_2
  L83_2 = L30_2
  L84_2 = L37_2
  L85_2 = L39_2
  L86_2 = L41_2
  L87_2 = L42_2
  L88_2 = L47_2
  L89_2 = L48_2
  L80_2[1] = L81_2
  L80_2[2] = L82_2
  L80_2[3] = L83_2
  L80_2[4] = L84_2
  L80_2[5] = L85_2
  L80_2[6] = L86_2
  L80_2[7] = L87_2
  L80_2[8] = L88_2
  L80_2[9] = L89_2
  L79_2 = L79_2(L80_2)
  L79_2 = L79_2 * L64_2
  L80_2 = math
  L80_2 = L80_2.average
  L81_2 = {}
  L82_2 = L53_2
  L83_2 = L54_2
  L84_2 = L31_2
  L85_2 = L32_2
  L86_2 = L33_2
  L87_2 = L43_2
  L88_2 = L44_2
  L89_2 = L49_2
  L81_2[1] = L82_2
  L81_2[2] = L83_2
  L81_2[3] = L84_2
  L81_2[4] = L85_2
  L81_2[5] = L86_2
  L81_2[6] = L87_2
  L81_2[7] = L88_2
  L81_2[8] = L89_2
  L80_2 = L80_2(L81_2)
  L80_2 = L80_2 * L65_2
  L79_2 = L79_2 + L80_2
  L77_2 = L77_2(L78_2, L79_2)
  L78_2 = string
  L78_2 = L78_2.format
  L79_2 = [[

		DLF (S):	 %.1f%%]]
  L80_2 = math
  L80_2 = L80_2.average
  L81_2 = {}
  L82_2 = L54_2
  L83_2 = L60_2
  L84_2 = L63_2
  L85_2 = L31_2
  L86_2 = L33_2
  L87_2 = L37_2
  L88_2 = L39_2
  L81_2[1] = L82_2
  L81_2[2] = L83_2
  L81_2[3] = L84_2
  L81_2[4] = L85_2
  L81_2[5] = L86_2
  L81_2[6] = L87_2
  L81_2[7] = L88_2
  L80_2 = L80_2(L81_2)
  L80_2 = L80_2 * L64_2
  L81_2 = math
  L81_2 = L81_2.average
  L82_2 = {}
  L83_2 = L53_2
  L84_2 = L29_2
  L85_2 = L35_2
  L86_2 = L40_2
  L87_2 = L44_2
  L88_2 = L49_2
  L82_2[1] = L83_2
  L82_2[2] = L84_2
  L82_2[3] = L85_2
  L82_2[4] = L86_2
  L82_2[5] = L87_2
  L82_2[6] = L88_2
  L81_2 = L81_2(L82_2)
  L81_2 = L81_2 * L65_2
  L80_2 = L80_2 + L81_2
  L78_2 = L78_2(L79_2, L80_2)
  L79_2 = string
  L79_2 = L79_2.format
  L80_2 = [[

		DLF (A):	 %.1f%%]]
  L81_2 = math
  L81_2 = L81_2.average
  L82_2 = {}
  L83_2 = L54_2
  L84_2 = L60_2
  L85_2 = L63_2
  L86_2 = L31_2
  L87_2 = L33_2
  L88_2 = L37_2
  L89_2 = L39_2
  L82_2[1] = L83_2
  L82_2[2] = L84_2
  L82_2[3] = L85_2
  L82_2[4] = L86_2
  L82_2[5] = L87_2
  L82_2[6] = L88_2
  L82_2[7] = L89_2
  L81_2 = L81_2(L82_2)
  L81_2 = L81_2 * L64_2
  L82_2 = math
  L82_2 = L82_2.average
  L83_2 = {}
  L84_2 = L52_2
  L85_2 = L53_2
  L86_2 = L29_2
  L87_2 = L35_2
  L88_2 = L40_2
  L89_2 = L44_2
  L90_2 = L49_2
  L83_2[1] = L84_2
  L83_2[2] = L85_2
  L83_2[3] = L86_2
  L83_2[4] = L87_2
  L83_2[5] = L88_2
  L83_2[6] = L89_2
  L83_2[7] = L90_2
  L82_2 = L82_2(L83_2)
  L82_2 = L82_2 * L65_2
  L81_2 = L81_2 + L82_2
  L79_2 = L79_2(L80_2, L81_2)
  L80_2 = string
  L80_2 = L80_2.format
  L81_2 = [[

		TM (S):	 %.1f%%]]
  L82_2 = math
  L82_2 = L82_2.average
  L83_2 = {}
  L84_2 = L56_2
  L85_2 = L30_2
  L86_2 = L39_2
  L87_2 = L44_2
  L88_2 = L45_2
  L89_2 = L49_2
  L83_2[1] = L84_2
  L83_2[2] = L85_2
  L83_2[3] = L86_2
  L83_2[4] = L87_2
  L83_2[5] = L88_2
  L83_2[6] = L89_2
  L82_2 = L82_2(L83_2)
  L82_2 = L82_2 * L64_2
  L83_2 = math
  L83_2 = L83_2.average
  L84_2 = {}
  L85_2 = L53_2
  L86_2 = L54_2
  L87_2 = L28_2
  L88_2 = L29_2
  L89_2 = L31_2
  L90_2 = L33_2
  L91_2 = L37_2
  L84_2[1] = L85_2
  L84_2[2] = L86_2
  L84_2[3] = L87_2
  L84_2[4] = L88_2
  L84_2[5] = L89_2
  L84_2[6] = L90_2
  L84_2[7] = L91_2
  L83_2 = L83_2(L84_2)
  L83_2 = L83_2 * L65_2
  L82_2 = L82_2 + L83_2
  L80_2 = L80_2(L81_2, L82_2)
  L81_2 = string
  L81_2 = L81_2.format
  L82_2 = [[

		TM (A):	 %.1f%%]]
  L83_2 = math
  L83_2 = L83_2.average
  L84_2 = {}
  L85_2 = L53_2
  L86_2 = L56_2
  L87_2 = L30_2
  L88_2 = L31_2
  L89_2 = L37_2
  L90_2 = L44_2
  L91_2 = L45_2
  L92_2 = L49_2
  L84_2[1] = L85_2
  L84_2[2] = L86_2
  L84_2[3] = L87_2
  L84_2[4] = L88_2
  L84_2[5] = L89_2
  L84_2[6] = L90_2
  L84_2[7] = L91_2
  L84_2[8] = L92_2
  L83_2 = L83_2(L84_2)
  L83_2 = L83_2 * L64_2
  L84_2 = math
  L84_2 = L84_2.average
  L85_2 = {}
  L86_2 = L54_2
  L87_2 = L28_2
  L88_2 = L29_2
  L89_2 = L33_2
  L90_2 = L39_2
  L85_2[1] = L86_2
  L85_2[2] = L87_2
  L85_2[3] = L88_2
  L85_2[4] = L89_2
  L85_2[5] = L90_2
  L84_2 = L84_2(L85_2)
  L84_2 = L84_2 * L65_2
  L83_2 = L83_2 + L84_2
  L81_2 = L81_2(L82_2, L83_2)
  L82_2 = string
  L82_2 = L82_2.format
  L83_2 = [[

		P (A):	 %.1f%%]]
  L84_2 = math
  L84_2 = L84_2.average
  L85_2 = {}
  L86_2 = L53_2
  L87_2 = L29_2
  L88_2 = L31_2
  L89_2 = L37_2
  L85_2[1] = L86_2
  L85_2[2] = L87_2
  L85_2[3] = L88_2
  L85_2[4] = L89_2
  L84_2 = L84_2(L85_2)
  L84_2 = L84_2 * L64_2
  L85_2 = math
  L85_2 = L85_2.average
  L86_2 = {}
  L87_2 = L54_2
  L88_2 = L56_2
  L89_2 = L63_2
  L90_2 = L33_2
  L91_2 = L42_2
  L86_2[1] = L87_2
  L86_2[2] = L88_2
  L86_2[3] = L89_2
  L86_2[4] = L90_2
  L86_2[5] = L91_2
  L85_2 = L85_2(L86_2)
  L85_2 = L85_2 * L65_2
  L84_2 = L84_2 + L85_2
  L82_2 = L82_2(L83_2, L84_2)
  L83_2 = string
  L83_2 = L83_2.format
  L84_2 = [[

		AF (A):	 %.1f%%]]
  L85_2 = math
  L85_2 = L85_2.average
  L86_2 = {}
  L87_2 = L52_2
  L88_2 = L53_2
  L89_2 = L54_2
  L90_2 = L63_2
  L91_2 = L31_2
  L92_2 = L37_2
  L93_2 = L42_2
  L86_2[1] = L87_2
  L86_2[2] = L88_2
  L86_2[3] = L89_2
  L86_2[4] = L90_2
  L86_2[5] = L91_2
  L86_2[6] = L92_2
  L86_2[7] = L93_2
  L85_2 = L85_2(L86_2)
  L85_2 = L85_2 * L64_2
  L86_2 = math
  L86_2 = L86_2.average
  L87_2 = {}
  L88_2 = L60_2
  L89_2 = L29_2
  L90_2 = L33_2
  L91_2 = L41_2
  L92_2 = L43_2
  L93_2 = L44_2
  L94_2 = L47_2
  L95_2 = L48_2
  L87_2[1] = L88_2
  L87_2[2] = L89_2
  L87_2[3] = L90_2
  L87_2[4] = L91_2
  L87_2[5] = L92_2
  L87_2[6] = L93_2
  L87_2[7] = L94_2
  L87_2[8] = L95_2
  L86_2 = L86_2(L87_2)
  L86_2 = L86_2 * L65_2
  L85_2 = L85_2 + L86_2
  L83_2 = L83_2(L84_2, L85_2)
  L84_2 = string
  L84_2 = L84_2.format
  L85_2 = [[

		FN (S):	 %.1f%%]]
  L86_2 = math
  L86_2 = L86_2.average
  L87_2 = {}
  L88_2 = L52_2
  L89_2 = L54_2
  L90_2 = L60_2
  L91_2 = L63_2
  L92_2 = L31_2
  L93_2 = L33_2
  L94_2 = L37_2
  L95_2 = L40_2
  L96_2 = L42_2
  L97_2 = L43_2
  L87_2[1] = L88_2
  L87_2[2] = L89_2
  L87_2[3] = L90_2
  L87_2[4] = L91_2
  L87_2[5] = L92_2
  L87_2[6] = L93_2
  L87_2[7] = L94_2
  L87_2[8] = L95_2
  L87_2[9] = L96_2
  L87_2[10] = L97_2
  L86_2 = L86_2(L87_2)
  L86_2 = L86_2 * L64_2
  L87_2 = math
  L87_2 = L87_2.average
  L88_2 = {}
  L89_2 = L53_2
  L90_2 = L29_2
  L91_2 = L35_2
  L92_2 = L39_2
  L93_2 = L44_2
  L88_2[1] = L89_2
  L88_2[2] = L90_2
  L88_2[3] = L91_2
  L88_2[4] = L92_2
  L88_2[5] = L93_2
  L87_2 = L87_2(L88_2)
  L87_2 = L87_2 * L65_2
  L86_2 = L86_2 + L87_2
  L84_2 = L84_2(L85_2, L86_2)
  L68_2 = L68_2 .. L69_2 .. L70_2 .. L71_2 .. L72_2 .. L73_2 .. L74_2 .. L75_2 .. L76_2 .. L77_2 .. L78_2 .. L79_2 .. L80_2 .. L81_2 .. L82_2 .. L83_2 .. L84_2
  L3_2[5] = L68_2
  L68_2 = "N/A"
  L69_2 = tonumber
  L70_2 = L2_2.LeftFoot
  L70_2 = L70_2.value
  L69_2 = L69_2(L70_2)
  if L69_2 == 20 then
    L68_2 = "Left"
  end
  L69_2 = tonumber
  L70_2 = L2_2.RightFoot
  L70_2 = L70_2.value
  L69_2 = L69_2(L70_2)
  if L69_2 == 20 then
    L68_2 = "Right"
  end
  L69_2 = L2_2.WeakerFoot
  if L69_2 < 5 then
    L69_2 = L68_2
    L70_2 = " Only"
    L68_2 = L69_2 .. L70_2
  end
  L69_2 = L2_2.WeakerFoot
  if 14 < L69_2 then
    L68_2 = "Either"
  end
  L69_2 = tonumber
  L70_2 = L2_2.RightFoot
  L70_2 = L70_2.value
  L69_2 = L69_2(L70_2)
  if L69_2 == 20 then
    L69_2 = tonumber
    L70_2 = L2_2.LeftFoot
    L70_2 = L70_2.value
    L69_2 = L69_2(L70_2)
    if L69_2 == 20 then
      L68_2 = "Either"
    end
  end
  L3_2[6] = L68_2
  L69_2 = string
  L69_2 = L69_2.format
  L70_2 = "%d cm"
  L71_2 = tonumber
  L72_2 = L2_2.Height
  L72_2 = L72_2.value
  L71_2, L72_2, L73_2, L74_2, L75_2, L76_2, L77_2, L78_2, L79_2, L80_2, L81_2, L82_2, L83_2, L84_2, L85_2, L86_2, L87_2, L88_2, L89_2, L90_2, L91_2, L92_2, L93_2, L94_2, L95_2, L96_2, L97_2, L98_2, L99_2, L100_2, L101_2, L102_2, L103_2, L104_2, L105_2, L106_2, L107_2, L108_2, L109_2, L110_2, L111_2 = L71_2(L72_2)
  L69_2 = L69_2(L70_2, L71_2, L72_2, L73_2, L74_2, L75_2, L76_2, L77_2, L78_2, L79_2, L80_2, L81_2, L82_2, L83_2, L84_2, L85_2, L86_2, L87_2, L88_2, L89_2, L90_2, L91_2, L92_2, L93_2, L94_2, L95_2, L96_2, L97_2, L98_2, L99_2, L100_2, L101_2, L102_2, L103_2, L104_2, L105_2, L106_2, L107_2, L108_2, L109_2, L110_2, L111_2)
  L3_2[7] = L69_2
  L69_2 = string
  L69_2 = L69_2.format
  L70_2 = "%d kg"
  L71_2 = tonumber
  L72_2 = L2_2.Weight
  L72_2 = L72_2.value
  L71_2, L72_2, L73_2, L74_2, L75_2, L76_2, L77_2, L78_2, L79_2, L80_2, L81_2, L82_2, L83_2, L84_2, L85_2, L86_2, L87_2, L88_2, L89_2, L90_2, L91_2, L92_2, L93_2, L94_2, L95_2, L96_2, L97_2, L98_2, L99_2, L100_2, L101_2, L102_2, L103_2, L104_2, L105_2, L106_2, L107_2, L108_2, L109_2, L110_2, L111_2 = L71_2(L72_2)
  L69_2 = L69_2(L70_2, L71_2, L72_2, L73_2, L74_2, L75_2, L76_2, L77_2, L78_2, L79_2, L80_2, L81_2, L82_2, L83_2, L84_2, L85_2, L86_2, L87_2, L88_2, L89_2, L90_2, L91_2, L92_2, L93_2, L94_2, L95_2, L96_2, L97_2, L98_2, L99_2, L100_2, L101_2, L102_2, L103_2, L104_2, L105_2, L106_2, L107_2, L108_2, L109_2, L110_2, L111_2)
  L3_2[8] = L69_2
  L69_2 = string
  L69_2 = L69_2.format
  L70_2 = "%.1f / 10.0"
  L71_2 = math
  L71_2 = L71_2.average
  L72_2 = {}
  L73_2 = L34_2
  L74_2 = L5_2
  L75_2 = L8_2
  L72_2[1] = L73_2
  L72_2[2] = L74_2
  L72_2[3] = L75_2
  L71_2 = L71_2(L72_2)
  L71_2 = L71_2 / 2
  L69_2 = L69_2(L70_2, L71_2)
  L3_2[9] = L69_2
  L69_2 = string
  L69_2 = L69_2.format
  L70_2 = "%.0f%%"
  L71_2 = math
  L71_2 = L71_2.average
  L72_2 = {}
  L73_2 = L30_2
  L74_2 = L31_2
  L75_2 = L32_2
  L76_2 = L34_2
  L77_2 = L39_2
  L72_2[1] = L73_2
  L72_2[2] = L74_2
  L72_2[3] = L75_2
  L72_2[4] = L76_2
  L72_2[5] = L77_2
  L71_2 = L71_2(L72_2)
  L71_2 = L71_2 * 5
  L69_2 = L69_2(L70_2, L71_2)
  L3_2[10] = L69_2
  L69_2 = string
  L69_2 = L69_2.format
  L70_2 = "%s (ID: %d)"
  L71_2 = L66_2
  L72_2 = L67_2
  L69_2 = L69_2(L70_2, L71_2, L72_2)
  L3_2[11] = L69_2
  L69_2 = roleAnalyzer
  L70_2 = L3_2
  return L69_2(L70_2)
end

roleScores = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "roleScores"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L2_2 = getAddressSafe
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isPerson
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_17
    end
  end
  L3_2 = readQword
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L2_2 = L3_2
  ::lbl_17::
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isPerson
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_30
    end
  end
  L3_2 = readQword
  L4_2 = "ptrPerson"
  L3_2 = L3_2(L4_2)
  L2_2 = L3_2
  ::lbl_30::
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isPerson
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L3_2 = readQword
  L4_2 = pero
  L4_2 = L4_2.Pflc
  L4_2 = L2_2 + L4_2
  L3_2 = L3_2(L4_2)
  if L3_2 == nil or L3_2 == 0 then
    L4_2 = nil
    return L4_2
  end
  L4_2 = getRTTIClassName
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L4_2 = L4_2 == "db::FULL_CONTRACT"
  if not L4_2 then
    L5_2 = nil
    return L5_2
  end
  L5_2 = getAddressSafe
  L6_2 = pero
  L6_2 = L6_2.Pccb
  L6_2 = L3_2 + L6_2
  L5_2 = L5_2(L6_2)
  if L5_2 == nil or L5_2 == 0 then
    L6_2 = nil
    return L6_2
  end
  L6_2 = getAddressSafe
  L7_2 = pero
  L7_2 = L7_2.Pccb
  L7_2 = L3_2 + L7_2
  L7_2 = L7_2 + 8
  L6_2 = L6_2(L7_2)
  L7_2 = readQword
  L8_2 = L5_2
  L7_2 = L7_2(L8_2)
  L8_2 = readQword
  L9_2 = L6_2
  L8_2 = L8_2(L9_2)
  L9_2 = nil
  L10_2 = 8
  L11_2 = forEach
  L12_2 = L7_2
  L13_2 = L8_2
  L14_2 = 8
  
  function L15_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L2_3 = Table
    L2_3 = L2_3.MaxShowItem
    if A0_3 > L2_3 then
      L2_3 = false
      return L2_3
    end
    L2_3 = readSmallInteger
    L3_3 = A1_3 + 6
    L2_3 = L2_3(L3_3)
    L3_3 = tonumber
    L4_3 = A1_2
    L3_3 = L3_3(L4_3)
    if L2_3 == L3_3 then
      L3_3 = readBytes
      L4_3 = A1_3
      L5_3 = L10_2
      L6_3 = true
      L3_3 = L3_3(L4_3, L5_3, L6_3)
      L9_2 = L3_3
      L3_3 = removeItemFromTable
      L4_3 = L5_2
      L5_3 = L6_2
      L6_3 = L9_2
      L7_3 = L10_2
      L3_3(L4_3, L5_3, L6_3, L7_3)
      L3_3 = false
      return L3_3
    end
  end
  
  L11_2(L12_2, L13_2, L14_2, L15_2)
end

removePersonClausesBonuses = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "removePersonClausesBonuses"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = getAddressSafe
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isPerson
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_17
    end
  end
  L3_2 = readQword
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L2_2 = L3_2
  ::lbl_17::
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isPerson
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_30
    end
  end
  L3_2 = readQword
  L4_2 = "ptrPerson"
  L3_2 = L3_2(L4_2)
  L2_2 = L3_2
  ::lbl_30::
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isPerson
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L3_2 = readQword
  L4_2 = pero
  L4_2 = L4_2.Pflc
  L4_2 = L2_2 + L4_2
  L3_2 = L3_2(L4_2)
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = getRTTIClassName
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 == "db::FULL_CONTRACT" then
      goto lbl_56
    end
  end
  L4_2 = nil
  do return L4_2 end
  ::lbl_56::
  if A1_2 == nil or A1_2 == 0 then
    A1_2 = true
  end
  L4_2 = writeBit
  L5_2 = pero
  L5_2 = L5_2.Pirc
  L5_2 = L3_2 + L5_2
  L6_2 = 3
  L7_2 = A1_2
  return L4_2(L5_2, L6_2, L7_2)
end

lifetimeContract = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "lifetimeContract"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = getAddressSafe
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPerson
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_17
    end
  end
  L2_2 = readQword
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_17::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPerson
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_30
    end
  end
  L2_2 = readQword
  L3_2 = "ptrPerson"
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_30::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPerson
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L2_2 = readQword
  L3_2 = pero
  L3_2 = L3_2.Pflc
  L3_2 = L1_2 + L3_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = getRTTIClassName
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 == "db::FULL_CONTRACT" then
      goto lbl_56
    end
  end
  L3_2 = nil
  do return L3_2 end
  ::lbl_56::
  L3_2 = getPersonData
  L4_2 = L1_2
  L3_2, L4_2 = L3_2(L4_2)
  L5_2 = isPlayer
  L6_2 = L1_2
  L5_2 = L5_2(L6_2)
  if L5_2 then
    L5_2 = getPlayerFromPerson
    L6_2 = L1_2
    L5_2 = L5_2(L6_2)
    L6_2 = terminateLoan
    L7_2 = L1_2
    L6_2(L7_2)
    L6_2 = getPlayerTeam
    L7_2 = L1_2
    L6_2 = L6_2(L7_2)
    if L6_2 ~= nil and L6_2 ~= 0 then
      L7_2 = isTeam
      L8_2 = L6_2
      L7_2 = L7_2(L8_2)
      if L7_2 then
        goto lbl_83
      end
    end
    do return end
    ::lbl_83::
    L7_2 = removePlayerFromTeam
    L8_2 = L6_2
    L9_2 = L5_2
    L7_2(L8_2, L9_2)
    L7_2 = writeQword
    L8_2 = plao
    L8_2 = L8_2.Pctm
    L8_2 = L5_2 + L8_2
    L9_2 = 0
    L7_2(L8_2, L9_2)
  end
  L5_2 = isStaff
  L6_2 = L1_2
  L5_2 = L5_2(L6_2)
  if L5_2 then
    L5_2 = getPlayerFromPerson
    L6_2 = L1_2
    L5_2 = L5_2(L6_2)
    L6_2 = L4_2.FullContractJob
    L7_2 = getPersonClub
    L8_2 = L1_2
    L7_2 = L7_2(L8_2)
    L8_2 = removeStaffFromTeam
    L9_2 = L7_2
    L10_2 = L5_2
    L11_2 = L6_2
    L8_2(L9_2, L10_2, L11_2)
  end
  L5_2 = writeQword
  L6_2 = L3_2.FullContract
  L7_2 = 0
  L5_2(L6_2, L7_2)
  L5_2 = writeQword
  L6_2 = L3_2.LoanContract
  L7_2 = 0
  L5_2(L6_2, L7_2)
  L5_2 = writeQword
  L6_2 = L3_2.BClubContract
  L7_2 = 0
  L5_2(L6_2, L7_2)
  L5_2 = writeQword
  L6_2 = L3_2.NationContract
  L7_2 = 0
  L5_2(L6_2, L7_2)
end

terminateContract = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "terminateContract"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = getAddressSafe
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPlayer
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_17
    end
  end
  L2_2 = readQword
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_17::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPlayer
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_30
    end
  end
  L2_2 = readQword
  L3_2 = "ptrPerson"
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_30::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPlayer
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L2_2 = isOnLoan
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    return
  end
  L2_2 = readQword
  L3_2 = pero
  L3_2 = L3_2.Pflc
  L3_2 = L1_2 + L3_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = getRTTIClassName
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 == "db::FULL_CONTRACT" then
      goto lbl_62
    end
  end
  L3_2 = nil
  do return L3_2 end
  ::lbl_62::
  L3_2 = getPersonData
  L4_2 = L1_2
  L3_2, L4_2 = L3_2(L4_2)
  L5_2 = getPlayerFromPerson
  L6_2 = L1_2
  L5_2 = L5_2(L6_2)
  L6_2 = getPlayerTeam
  L7_2 = L1_2
  L6_2 = L6_2(L7_2)
  L7_2 = L4_2.BClubContract
  if L7_2 ~= 0 then
    L7_2 = readQword
    L8_2 = L4_2.BClubContract
    L9_2 = pero
    L9_2 = L9_2.Pcti
    L8_2 = L8_2 + L9_2
    L7_2 = L7_2(L8_2)
    L6_2 = L7_2
  end
  L7_2 = readPointer
  L8_2 = plao
  L8_2 = L8_2.Pctm
  L8_2 = L5_2 + L8_2
  L7_2 = L7_2(L8_2)
  L8_2 = removePlayerFromTeam
  L9_2 = L7_2
  L10_2 = L5_2
  L8_2(L9_2, L10_2)
  L8_2 = writeQword
  L9_2 = plao
  L9_2 = L9_2.Pctm
  L9_2 = L5_2 + L9_2
  L10_2 = L6_2
  L8_2(L9_2, L10_2)
  L8_2 = writeQword
  L9_2 = L3_2.LoanContract
  L10_2 = 0
  L8_2(L9_2, L10_2)
end

terminateLoan = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "terminateLoan"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = getAddressSafe
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPerson
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_17
    end
  end
  L2_2 = readQword
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_17::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPerson
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_30
    end
  end
  L2_2 = readQword
  L3_2 = "ptrPerson"
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_30::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPerson
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L2_2 = readQword
  L3_2 = pero
  L3_2 = L3_2.Pflc
  L3_2 = L1_2 + L3_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = getRTTIClassName
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 == "db::FULL_CONTRACT" then
      goto lbl_56
    end
  end
  L3_2 = nil
  do return L3_2 end
  ::lbl_56::
  L3_2 = writeInteger
  L4_2 = pero
  L4_2 = L4_2.Pcsd
  L4_2 = L2_2 + L4_2
  L5_2 = readInteger
  L6_2 = getAddressSafe
  L7_2 = "datTimeRoot"
  L6_2, L7_2 = L6_2(L7_2)
  L5_2, L6_2, L7_2 = L5_2(L6_2, L7_2)
  L3_2(L4_2, L5_2, L6_2, L7_2)
end

currentlySigned = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "currentlySigned"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = getAddressSafe
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPerson
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_17
    end
  end
  L2_2 = readQword
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_17::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPerson
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_30
    end
  end
  L2_2 = readQword
  L3_2 = "ptrPerson"
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_30::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPerson
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L2_2 = readQword
  L3_2 = pero
  L3_2 = L3_2.Pflc
  L3_2 = L1_2 + L3_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = getRTTIClassName
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 == "db::FULL_CONTRACT" then
      goto lbl_56
    end
  end
  L3_2 = nil
  do return L3_2 end
  ::lbl_56::
  L3_2 = writeInteger
  L4_2 = pero
  L4_2 = L4_2.Pcex
  L4_2 = L2_2 + L4_2
  L5_2 = readInteger
  L6_2 = getAddressSafe
  L7_2 = "datTimeRoot"
  L6_2, L7_2 = L6_2(L7_2)
  L5_2, L6_2, L7_2 = L5_2(L6_2, L7_2)
  L3_2(L4_2, L5_2, L6_2, L7_2)
end

contractExpired = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "contractExpired"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = getAddressSafe
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isPlayer
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_17
    end
  end
  L3_2 = readQword
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L2_2 = L3_2
  ::lbl_17::
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isPlayer
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_30
    end
  end
  L3_2 = readQword
  L4_2 = "ptrPerson"
  L3_2 = L3_2(L4_2)
  L2_2 = L3_2
  ::lbl_30::
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isPlayer
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L3_2 = readQword
  L4_2 = pero
  L4_2 = L4_2.Pagt
  L4_2 = L2_2 + L4_2
  L3_2 = L3_2(L4_2)
  if L3_2 == nil or L3_2 == 0 then
    L4_2 = nil
    return L4_2
  end
  L4_2 = nil
  if A1_2 then
    L5_2 = getManagerPtr
    L5_2 = L5_2()
    L4_2 = L5_2
  else
    L5_2 = getPersonClubTeam
    L6_2 = L2_2
    L5_2 = L5_2(L6_2)
    if L5_2 == nil or L5_2 == 0 then
      L6_2 = nil
      return L6_2
    end
    L6_2 = getTeamManager
    L7_2 = L5_2
    L6_2 = L6_2(L7_2)
    L4_2 = L6_2
  end
  if L4_2 == nil or L4_2 == 0 then
    L5_2 = nil
    return L5_2
  end
  L5_2 = getPersonFromPlayer
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  L4_2 = L5_2
  L5_2 = readQword
  L6_2 = agto
  L6_2 = L6_2.Anec
  L6_2 = L3_2 + L6_2
  L5_2 = L5_2(L6_2)
  if L5_2 == nil or L5_2 == 0 then
    L6_2 = nil
    return L6_2
  end
  L6_2 = readQword
  L7_2 = L5_2
  L6_2 = L6_2(L7_2)
  if L6_2 == nil or L6_2 == 0 then
    L7_2 = nil
    return L7_2
  end
  L7_2 = readQword
  L8_2 = L5_2 + 8
  L7_2 = L7_2(L8_2)
  if L7_2 == nil or L7_2 == 0 then
    L8_2 = nil
    return L8_2
  end
  L8_2 = forEach
  L9_2 = L6_2
  L10_2 = L7_2
  L11_2 = 16
  
  function L12_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3
    L2_3 = Table
    L2_3 = L2_3.MaxShowItem
    if A0_3 > L2_3 then
      L2_3 = false
      return L2_3
    end
    L2_3 = readQword
    L3_3 = A1_3
    L2_3 = L2_3(L3_3)
    L3_3 = L4_2
    if L2_3 == L3_3 then
      L3_3 = writeByte
      L4_3 = A1_3 + 11
      L5_3 = 1
      L3_3(L4_3, L5_3)
      L3_3 = writeSmallInteger
      L4_3 = A1_3 + 8
      L5_3 = 6
      L3_3(L4_3, L5_3)
      L3_3 = writeByte
      L4_3 = A1_3 + 12
      L5_3 = 100
      L3_3(L4_3, L5_3)
      L3_3 = writeByte
      L4_3 = A1_3 + 13
      L5_3 = 79
      L3_3(L4_3, L5_3)
    end
  end
  
  L8_2(L9_2, L10_2, L11_2, L12_2)
  return
end

playerAgentAffection = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "playerAgentAffection"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = getAddressSafe
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isManager
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_17
    end
  end
  L2_2 = readQword
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_17::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isManager
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_30
    end
  end
  L2_2 = readQword
  L3_2 = "ptrPerson"
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_30::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isManager
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L2_2 = readQword
  L3_2 = "ptrHumanStaff"
  L2_2 = L2_2(L3_2)
  if L2_2 == nil or L2_2 == 0 then
    L3_2 = nil
    return L3_2
  end
  L3_2 = getAddressSafe
  L4_2 = mano
  L4_2 = L4_2.Pprt
  L4_2 = L2_2 + L4_2
  L3_2 = L3_2(L4_2)
  if L3_2 == nil or L3_2 == 0 then
    return
  end
  L4_2 = readQword
  L5_2 = L3_2 + 0
  L4_2 = L4_2(L5_2)
  L5_2 = readQword
  L6_2 = L3_2 + 8
  L5_2 = L5_2(L6_2)
  if L4_2 == nil or L5_2 == nil then
    return
  end
  L6_2 = forEach
  L7_2 = L4_2
  L8_2 = L5_2
  L9_2 = 8
  
  function L10_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3
    L2_3 = readQword
    L3_3 = A1_3
    L2_3 = L2_3(L3_3)
    L3_3 = writeSmallInteger
    L4_3 = L2_3 + 21
    L5_3 = 10000
    L3_3(L4_3, L5_3)
  end
  
  L6_2(L7_2, L8_2, L9_2, L10_2)
end

playerPartnerships = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "playerPartnerships"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = readQword
  L2_2 = "ptrPerson"
  L1_2 = L1_2(L2_2)
  if L1_2 == nil or L1_2 == 0 then
    L2_2 = nil
    return L2_2
  end
  if A0_2 == nil or A0_2 == 0 then
    A0_2 = true
  end
  L2_2 = writeBit
  L3_2 = pero
  L3_2 = L3_2.Pfl2
  L3_2 = L1_2 + L3_2
  L4_2 = 5
  L5_2 = A0_2
  return L2_2(L3_2, L4_2, L5_2)
end

freezePersonAttributes = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "freezePersonAttributes"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = readQword
  L2_2 = "ptrPerson"
  L1_2 = L1_2(L2_2)
  if L1_2 == nil or L1_2 == 0 then
    L2_2 = nil
    return L2_2
  end
  L2_2 = readQword
  L3_2 = "ptrHumanStaff"
  L2_2 = L2_2(L3_2)
  if L2_2 == nil or L2_2 == 0 then
    L3_2 = nil
    return L3_2
  end
  if A0_2 == nil or A0_2 == 0 then
    A0_2 = true
  end
  L3_2 = writeBit
  L4_2 = mano
  L4_2 = L4_2.Pfl1
  L4_2 = L2_2 + L4_2
  L5_2 = 0
  L6_2 = A0_2
  return L3_2(L4_2, L5_2, L6_2)
end

allPlayersInterested = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "allPlayersInterested"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = readQword
  L2_2 = "ptrPerson"
  L1_2 = L1_2(L2_2)
  if L1_2 == nil or L1_2 == 0 then
    L2_2 = nil
    return L2_2
  end
  L2_2 = readQword
  L3_2 = "ptrHumanStaff"
  L2_2 = L2_2(L3_2)
  if L2_2 == nil or L2_2 == 0 then
    L3_2 = nil
    return L3_2
  end
  if A0_2 == nil or A0_2 == 0 then
    A0_2 = true
  end
  L3_2 = writeBit
  L4_2 = mano
  L4_2 = L4_2.Pfl1
  L4_2 = L2_2 + L4_2
  L5_2 = 1
  L6_2 = A0_2
  return L3_2(L4_2, L5_2, L6_2)
end

becomeUnsackable = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "becomeUnsackable"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = readQword
  L2_2 = "ptrPerson"
  L1_2 = L1_2(L2_2)
  if L1_2 == nil or L1_2 == 0 then
    L2_2 = nil
    return L2_2
  end
  L2_2 = readQword
  L3_2 = "ptrHumanStaff"
  L2_2 = L2_2(L3_2)
  if L2_2 == nil or L2_2 == 0 then
    L3_2 = nil
    return L3_2
  end
  if A0_2 == nil or A0_2 == 0 then
    A0_2 = true
  end
  L3_2 = writeBit
  L4_2 = mano
  L4_2 = L4_2.Pfl1
  L4_2 = L2_2 + L4_2
  L5_2 = 2
  L6_2 = A0_2
  return L3_2(L4_2, L5_2, L6_2)
end

unlimitedScouting = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "unlimitedScouting"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = readQword
  L2_2 = "ptrPerson"
  L1_2 = L1_2(L2_2)
  if L1_2 == nil or L1_2 == 0 then
    L2_2 = nil
    return L2_2
  end
  L2_2 = readQword
  L3_2 = "ptrHumanStaff"
  L2_2 = L2_2(L3_2)
  if L2_2 == nil or L2_2 == 0 then
    L3_2 = nil
    return L3_2
  end
  if A0_2 == nil or A0_2 == 0 then
    A0_2 = true
  end
  L3_2 = writeBit
  L4_2 = mano
  L4_2 = L4_2.Pfl1
  L4_2 = L2_2 + L4_2
  L5_2 = 4
  L6_2 = A0_2
  return L3_2(L4_2, L5_2, L6_2)
end

attributeMasking = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "attributeMasking"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = readQword
  L2_2 = "ptrPerson"
  L1_2 = L1_2(L2_2)
  if L1_2 == nil or L1_2 == 0 then
    L2_2 = nil
    return L2_2
  end
  L2_2 = readQword
  L3_2 = "ptrHumanStaff"
  L2_2 = L2_2(L3_2)
  if L2_2 == nil or L2_2 == 0 then
    L3_2 = nil
    return L3_2
  end
  if A0_2 == nil or A0_2 == 0 then
    A0_2 = true
  end
  L3_2 = writeBit
  L4_2 = mano
  L4_2 = L4_2.Pfl1
  L4_2 = L2_2 + L4_2
  L5_2 = 5
  L6_2 = A0_2
  return L3_2(L4_2, L5_2, L6_2)
end

treatInjuredPlayer = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "treatInjuredPlayer"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = readQword
  L2_2 = "ptrPerson"
  L1_2 = L1_2(L2_2)
  if L1_2 == nil or L1_2 == 0 then
    L2_2 = nil
    return L2_2
  end
  L2_2 = readQword
  L3_2 = "ptrHumanStaff"
  L2_2 = L2_2(L3_2)
  if L2_2 == nil or L2_2 == 0 then
    L3_2 = nil
    return L3_2
  end
  if A0_2 == nil or A0_2 == 0 then
    A0_2 = true
  end
  L3_2 = writeBit
  L4_2 = mano
  L4_2 = L4_2.Pfl1
  L4_2 = L2_2 + L4_2
  L5_2 = 6
  L6_2 = A0_2
  return L3_2(L4_2, L5_2, L6_2)
end

poisonOpponents = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "poisonOpponents"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = readQword
  L2_2 = "ptrPerson"
  L1_2 = L1_2(L2_2)
  if L1_2 == nil or L1_2 == 0 then
    L2_2 = nil
    return L2_2
  end
  L2_2 = readQword
  L3_2 = "ptrHumanStaff"
  L2_2 = L2_2(L3_2)
  if L2_2 == nil or L2_2 == 0 then
    L3_2 = nil
    return L3_2
  end
  if A0_2 == nil or A0_2 == 0 then
    A0_2 = true
  end
  L3_2 = writeBit
  L4_2 = mano
  L4_2 = L4_2.Pfl1
  L4_2 = L2_2 + L4_2
  L5_2 = 7
  L6_2 = A0_2
  return L3_2(L4_2, L5_2, L6_2)
end

lifetimePlayerContract = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "lifetimePlayerContract"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = readQword
  L2_2 = "ptrPerson"
  L1_2 = L1_2(L2_2)
  if L1_2 == nil or L1_2 == 0 then
    L2_2 = nil
    return L2_2
  end
  L2_2 = readQword
  L3_2 = "ptrHumanStaff"
  L2_2 = L2_2(L3_2)
  if L2_2 == nil or L2_2 == 0 then
    L3_2 = nil
    return L3_2
  end
  if A0_2 == nil or A0_2 == 0 then
    A0_2 = true
  end
  L3_2 = writeBit
  L4_2 = mano
  L4_2 = L4_2.Pfl2
  L4_2 = L2_2 + L4_2
  L5_2 = 0
  L6_2 = A0_2
  return L3_2(L4_2, L5_2, L6_2)
end

squadRegistrationAnytime = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "squadRegistrationAnytime"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = readQword
  L2_2 = "ptrPerson"
  L1_2 = L1_2(L2_2)
  if L1_2 == nil or L1_2 == 0 then
    L2_2 = nil
    return L2_2
  end
  L2_2 = readQword
  L3_2 = "ptrHumanStaff"
  L2_2 = L2_2(L3_2)
  if L2_2 == nil or L2_2 == 0 then
    L3_2 = nil
    return L3_2
  end
  if A0_2 == nil or A0_2 == 0 then
    A0_2 = true
  end
  L3_2 = writeBit
  L4_2 = mano
  L4_2 = L4_2.Pfl2
  L4_2 = L2_2 + L4_2
  L5_2 = 1
  L6_2 = A0_2
  return L3_2(L4_2, L5_2, L6_2)
end

squadNumbersAnytime = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "squadNumbersAnytime"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = readQword
  L2_2 = "ptrPerson"
  L1_2 = L1_2(L2_2)
  if L1_2 == nil or L1_2 == 0 then
    L2_2 = nil
    return L2_2
  end
  L2_2 = readQword
  L3_2 = "ptrHumanStaff"
  L2_2 = L2_2(L3_2)
  if L2_2 == nil or L2_2 == 0 then
    L3_2 = nil
    return L3_2
  end
  if A0_2 == nil or A0_2 == 0 then
    A0_2 = true
  end
  L3_2 = writeBit
  L4_2 = mano
  L4_2 = L4_2.Pfl2
  L4_2 = L2_2 + L4_2
  L5_2 = 3
  L6_2 = A0_2
  return L3_2(L4_2, L5_2, L6_2)
end

thatJobIsMine = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "thatJobIsMine"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2
  L0_2 = readQword
  L1_2 = "ptrPerson"
  L0_2 = L0_2(L1_2)
  if L0_2 == nil or L0_2 == 0 then
    L1_2 = nil
    return L1_2
  end
  L1_2 = readQword
  L2_2 = "ptrHumanStaff"
  L1_2 = L1_2(L2_2)
  if L1_2 == nil or L1_2 == 0 then
    L2_2 = nil
    return L2_2
  end
  L2_2 = readQword
  L3_2 = pero
  L3_2 = L3_2.Pflc
  L3_2 = L0_2 + L3_2
  L2_2 = L2_2(L3_2)
  L3_2 = "Unemployed"
  if L2_2 ~= 0 then
    L4_2 = getObjectName
    L5_2 = readQword
    L6_2 = pero
    L6_2 = L6_2.Pcti
    L6_2 = L2_2 + L6_2
    L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2 = L5_2(L6_2)
    L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2)
    L3_2 = L4_2
  end
  L4_2 = getObjectName
  L5_2 = L0_2
  L4_2 = L4_2(L5_2)
  L5_2 = readInteger
  L6_2 = objo
  L6_2 = L6_2.Duni
  L6_2 = L0_2 + L6_2
  L5_2 = L5_2(L6_2)
  L6_2 = tostring
  L7_2 = readBit
  L8_2 = mano
  L8_2 = L8_2.Pfl1
  L8_2 = L1_2 + L8_2
  L9_2 = 0
  L7_2 = L7_2(L8_2, L9_2)
  L7_2 = L7_2 == 1
  L6_2 = L6_2(L7_2)
  L7_2 = tostring
  L8_2 = readBit
  L9_2 = mano
  L9_2 = L9_2.Pfl1
  L9_2 = L1_2 + L9_2
  L10_2 = 1
  L8_2 = L8_2(L9_2, L10_2)
  L8_2 = L8_2 == 1
  L7_2 = L7_2(L8_2)
  L8_2 = tostring
  L9_2 = readBit
  L10_2 = mano
  L10_2 = L10_2.Pfl1
  L10_2 = L1_2 + L10_2
  L11_2 = 2
  L9_2 = L9_2(L10_2, L11_2)
  L9_2 = L9_2 == 1
  L8_2 = L8_2(L9_2)
  L9_2 = tostring
  L10_2 = readBit
  L11_2 = mano
  L11_2 = L11_2.Pfl1
  L11_2 = L1_2 + L11_2
  L12_2 = 4
  L10_2 = L10_2(L11_2, L12_2)
  L10_2 = L10_2 == 1
  L9_2 = L9_2(L10_2)
  L10_2 = tostring
  L11_2 = readBit
  L12_2 = mano
  L12_2 = L12_2.Pfl2
  L12_2 = L1_2 + L12_2
  L13_2 = 0
  L11_2 = L11_2(L12_2, L13_2)
  L11_2 = L11_2 == 1
  L10_2 = L10_2(L11_2)
  L11_2 = tostring
  L12_2 = readBit
  L13_2 = mano
  L13_2 = L13_2.Pfl2
  L13_2 = L1_2 + L13_2
  L14_2 = 1
  L12_2 = L12_2(L13_2, L14_2)
  L12_2 = L12_2 == 1
  L11_2 = L11_2(L12_2)
  L12_2 = tostring
  L13_2 = readBit
  L14_2 = mano
  L14_2 = L14_2.Pfl2
  L14_2 = L1_2 + L14_2
  L15_2 = 3
  L13_2 = L13_2(L14_2, L15_2)
  L13_2 = L13_2 == 1
  L12_2 = L12_2(L13_2)
  L13_2 = tostring
  L14_2 = readBit
  L15_2 = pero
  L15_2 = L15_2.Pfl2
  L15_2 = L0_2 + L15_2
  L16_2 = 5
  L14_2 = L14_2(L15_2, L16_2)
  L14_2 = L14_2 == 1
  L13_2 = L13_2(L14_2)
  L14_2 = MessageDialog
  L15_2 = string
  L15_2 = L15_2.format
  L16_2 = [[
		%s (ID: %d)
		%s
		-----------------------------
		All Players Interested: [%s]
		Become Unsackable: [%s]
		Unlimited Scouting: [%s]
		Attribute Masking: [%s]
		Squad Registration Anytime: [%s]
		Squad Numbers Anytime: [%s]
		That Job Is Mine: [%s]
		Freeze Attributes: [%s]
		]]
  L17_2 = L4_2
  L18_2 = L5_2
  L19_2 = L3_2
  L20_2 = L6_2
  L21_2 = L7_2
  L22_2 = L8_2
  L23_2 = L9_2
  L24_2 = L10_2
  L25_2 = L11_2
  L26_2 = L12_2
  L27_2 = L13_2
  L15_2 = L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2)
  L16_2 = 2
  L14_2(L15_2, L16_2)
  return
end

viewManagerStatus = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "viewManagerStatus"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = getAddressSafe
  L2_2 = addr
  L1_2 = L1_2(L2_2)
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPlayer
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_17
    end
  end
  L2_2 = readQword
  L3_2 = addr
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_17::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPlayer
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_30
    end
  end
  L2_2 = readQword
  L3_2 = "ptrPerson"
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_30::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPlayer
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L2_2 = getPlayerData
  L2_2 = L2_2()
  if L2_2 == nil or L2_2 == 0 then
    L3_2 = nil
    return L3_2
  end
  L3_2 = os
  L3_2 = L3_2.clock
  L3_2 = L3_2()
  L4_2 = L2_2.Adaptability
  L5_2 = A0_2[1]
  L4_2.Value = L5_2
  L4_2 = L2_2.Ambition
  L5_2 = A0_2[2]
  L4_2.Value = L5_2
  L4_2 = L2_2.Loyalty
  L5_2 = A0_2[3]
  L4_2.Value = L5_2
  L4_2 = L2_2.Pressure
  L5_2 = A0_2[4]
  L4_2.Value = L5_2
  L4_2 = L2_2.Professionalism
  L5_2 = A0_2[5]
  L4_2.Value = L5_2
  L4_2 = L2_2.Sportmanship
  L5_2 = A0_2[6]
  L4_2.Value = L5_2
  L4_2 = L2_2.Temperament
  L5_2 = A0_2[7]
  L4_2.Value = L5_2
  L4_2 = L2_2.Controversy
  L5_2 = A0_2[8]
  L4_2.Value = L5_2
  L4_2 = L2_2.AerialAbility
  L5_2 = A0_2[9]
  L4_2.Value = L5_2
  L4_2 = L2_2.CommandOfArea
  L5_2 = A0_2[10]
  L4_2.Value = L5_2
  L4_2 = L2_2.Communication
  L5_2 = A0_2[11]
  L4_2.Value = L5_2
  L4_2 = L2_2.Eccentricity
  L5_2 = A0_2[12]
  L4_2.Value = L5_2
  L4_2 = L2_2.Handling
  L5_2 = A0_2[13]
  L4_2.Value = L5_2
  L4_2 = L2_2.Kicking
  L5_2 = A0_2[14]
  L4_2.Value = L5_2
  L4_2 = L2_2.OneOnOnes
  L5_2 = A0_2[15]
  L4_2.Value = L5_2
  L4_2 = L2_2.TendencyToPunch
  L5_2 = A0_2[16]
  L4_2.Value = L5_2
  L4_2 = L2_2.Reflexes
  L5_2 = A0_2[17]
  L4_2.Value = L5_2
  L4_2 = L2_2.RushingOut
  L5_2 = A0_2[18]
  L4_2.Value = L5_2
  L4_2 = L2_2.Throwing
  L5_2 = A0_2[19]
  L4_2.Value = L5_2
  L4_2 = L2_2.Aggression
  L5_2 = A0_2[20]
  L4_2.Value = L5_2
  L4_2 = L2_2.Anticipation
  L5_2 = A0_2[21]
  L4_2.Value = L5_2
  L4_2 = L2_2.Bravery
  L5_2 = A0_2[22]
  L4_2.Value = L5_2
  L4_2 = L2_2.Composure
  L5_2 = A0_2[23]
  L4_2.Value = L5_2
  L4_2 = L2_2.Concentration
  L5_2 = A0_2[24]
  L4_2.Value = L5_2
  L4_2 = L2_2.Decisions
  L5_2 = A0_2[25]
  L4_2.Value = L5_2
  L4_2 = L2_2.Determination
  L5_2 = A0_2[26]
  L4_2.Value = L5_2
  L4_2 = L2_2.Flair
  L5_2 = A0_2[27]
  L4_2.Value = L5_2
  L4_2 = L2_2.Leadership
  L5_2 = A0_2[28]
  L4_2.Value = L5_2
  L4_2 = L2_2.OffTheBall
  L5_2 = A0_2[29]
  L4_2.Value = L5_2
  L4_2 = L2_2.Positioning
  L5_2 = A0_2[30]
  L4_2.Value = L5_2
  L4_2 = L2_2.Teamwork
  L5_2 = A0_2[31]
  L4_2.Value = L5_2
  L4_2 = L2_2.Vision
  L5_2 = A0_2[32]
  L4_2.Value = L5_2
  L4_2 = L2_2.Workrate
  L5_2 = A0_2[33]
  L4_2.Value = L5_2
  L4_2 = L2_2.Acceleration
  L5_2 = A0_2[34]
  L4_2.Value = L5_2
  L4_2 = L2_2.Agility
  L5_2 = A0_2[35]
  L4_2.Value = L5_2
  L4_2 = L2_2.Balance
  L5_2 = A0_2[36]
  L4_2.Value = L5_2
  L4_2 = L2_2.Jumping
  L5_2 = A0_2[37]
  L4_2.Value = L5_2
  L4_2 = L2_2.NaturalFitness
  L5_2 = A0_2[38]
  L4_2.Value = L5_2
  L4_2 = L2_2.Pace
  L5_2 = A0_2[39]
  L4_2.Value = L5_2
  L4_2 = L2_2.Stamina
  L5_2 = A0_2[40]
  L4_2.Value = L5_2
  L4_2 = L2_2.Strength
  L5_2 = A0_2[41]
  L4_2.Value = L5_2
  L4_2 = L2_2.Corners
  L5_2 = A0_2[42]
  L4_2.Value = L5_2
  L4_2 = L2_2.Crossing
  L5_2 = A0_2[43]
  L4_2.Value = L5_2
  L4_2 = L2_2.Dribbling
  L5_2 = A0_2[44]
  L4_2.Value = L5_2
  L4_2 = L2_2.Finishing
  L5_2 = A0_2[45]
  L4_2.Value = L5_2
  L4_2 = L2_2.FirstTouch
  L5_2 = A0_2[46]
  L4_2.Value = L5_2
  L4_2 = L2_2.Freekicks
  L5_2 = A0_2[47]
  L4_2.Value = L5_2
  L4_2 = L2_2.Heading
  L5_2 = A0_2[48]
  L4_2.Value = L5_2
  L4_2 = L2_2.LongShots
  L5_2 = A0_2[49]
  L4_2.Value = L5_2
  L4_2 = L2_2.Longthrows
  L5_2 = A0_2[50]
  L4_2.Value = L5_2
  L4_2 = L2_2.Marking
  L5_2 = A0_2[51]
  L4_2.Value = L5_2
  L4_2 = L2_2.Passing
  L5_2 = A0_2[52]
  L4_2.Value = L5_2
  L4_2 = L2_2.PenaltyTaking
  L5_2 = A0_2[53]
  L4_2.Value = L5_2
  L4_2 = L2_2.Tackling
  L5_2 = A0_2[54]
  L4_2.Value = L5_2
  L4_2 = L2_2.Technique
  L5_2 = A0_2[55]
  L4_2.Value = L5_2
  L4_2 = L2_2.Consistency
  L5_2 = A0_2[56]
  L4_2.Value = L5_2
  L4_2 = L2_2.Dirtiness
  L5_2 = A0_2[57]
  L4_2.Value = L5_2
  L4_2 = L2_2.ImportantMatches
  L5_2 = A0_2[58]
  L4_2.Value = L5_2
  L4_2 = L2_2.InjuryProness
  L5_2 = A0_2[59]
  L4_2.Value = L5_2
  L4_2 = L2_2.Versatility
  L5_2 = A0_2[60]
  L4_2.Value = L5_2
  L4_2 = L2_2.CA
  L5_2 = A0_2[61]
  L4_2.Value = L5_2
  L4_2 = L2_2.PA
  L5_2 = A0_2[62]
  L4_2.Value = L5_2
  L4_2 = L2_2.LeftFoot
  L5_2 = A0_2[63]
  L4_2.Value = L5_2
  L4_2 = L2_2.RightFoot
  L5_2 = A0_2[64]
  L4_2.Value = L5_2
  L4_2 = L2_2.POS_GK
  L5_2 = A0_2[65]
  L4_2.Value = L5_2
  L4_2 = L2_2.POS_DL
  L5_2 = A0_2[66]
  L4_2.Value = L5_2
  L4_2 = L2_2.POS_DC
  L5_2 = A0_2[67]
  L4_2.Value = L5_2
  L4_2 = L2_2.POS_DR
  L5_2 = A0_2[68]
  L4_2.Value = L5_2
  L4_2 = L2_2.POS_WBL
  L5_2 = A0_2[69]
  L4_2.Value = L5_2
  L4_2 = L2_2.POS_WBR
  L5_2 = A0_2[70]
  L4_2.Value = L5_2
  L4_2 = L2_2.POS_DM
  L5_2 = A0_2[71]
  L4_2.Value = L5_2
  L4_2 = L2_2.POS_ML
  L5_2 = A0_2[72]
  L4_2.Value = L5_2
  L4_2 = L2_2.POS_MC
  L5_2 = A0_2[73]
  L4_2.Value = L5_2
  L4_2 = L2_2.POS_MR
  L5_2 = A0_2[74]
  L4_2.Value = L5_2
  L4_2 = L2_2.POS_AML
  L5_2 = A0_2[75]
  L4_2.Value = L5_2
  L4_2 = L2_2.POS_AMC
  L5_2 = A0_2[76]
  L4_2.Value = L5_2
  L4_2 = L2_2.POS_AMR
  L5_2 = A0_2[77]
  L4_2.Value = L5_2
  L4_2 = L2_2.POS_STC
  L5_2 = A0_2[78]
  L4_2.Value = L5_2
  L4_2 = L2_2.Height
  L5_2 = A0_2[79]
  L4_2.Value = L5_2
  L4_2 = L2_2.Weight
  L5_2 = A0_2[80]
  L4_2.Value = L5_2
  L4_2 = writeQword
  L5_2 = plao
  L5_2 = L5_2.Pprm
  L5_2 = L1_2 + L5_2
  L6_2 = A0_2[81]
  L4_2(L5_2, L6_2)
  L4_2 = MessageDialog
  L5_2 = string
  L5_2 = L5_2.format
  L6_2 = [[
  Operation Success!
  Elapsed time is: %.3f s
  ]]
  L7_2 = os
  L7_2 = L7_2.clock
  L7_2 = L7_2()
  L7_2 = L7_2 - L3_2
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = 2
  return L4_2(L5_2, L6_2)
end

clonePlayer = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "clonePlayer"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = getAddressSafe
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isAward
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_17
    end
  end
  L2_2 = readQword
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_17::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isAward
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_30
    end
  end
  L2_2 = readQword
  L3_2 = "ptrAward"
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_30::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isAward
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L2_2 = getAddressSafe
  L3_2 = readQword
  L4_2 = awro
  L4_2 = L4_2.AWna
  L4_2 = L1_2 + L4_2
  L3_2 = L3_2(L4_2)
  L3_2 = L3_2 + 4
  L2_2 = L2_2(L3_2)
  L3_2 = getAddressSafe
  L4_2 = readQword
  L5_2 = awro
  L5_2 = L5_2.AWsn
  L5_2 = L1_2 + L5_2
  L4_2 = L4_2(L5_2)
  L4_2 = L4_2 + 4
  L3_2 = L3_2(L4_2)
  L4_2 = changeString
  L5_2 = L2_2
  L6_2 = "Full Name"
  L4_2(L5_2, L6_2)
  L4_2 = changeString
  L5_2 = L3_2
  L6_2 = "Short Name"
  L4_2(L5_2, L6_2)
  return
end

changeAwardName = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "changeAwardName"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = getAddressSafe
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isAward
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_17
    end
  end
  L2_2 = readQword
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_17::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isAward
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_30
    end
  end
  L2_2 = readQword
  L3_2 = "ptrAward"
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_30::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isAward
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L2_2 = changeComp
  L3_2 = awro
  L3_2 = L3_2.AWmi
  L3_2 = L1_2 + L3_2
  L2_2(L3_2)
  return
end

changeAwardComp = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "changeAwardComp"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = getAddressSafe
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isAward
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_17
    end
  end
  L2_2 = readQword
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_17::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isAward
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_30
    end
  end
  L2_2 = readQword
  L3_2 = "ptrAward"
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_30::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isAward
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L2_2 = changeContinent
  L3_2 = awro
  L3_2 = L3_2.AWci
  L3_2 = L1_2 + L3_2
  L2_2(L3_2)
  return
end

changeAwardContinent = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "changeAwardContinent"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = getAddressSafe
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isAward
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_17
    end
  end
  L2_2 = readQword
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_17::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isAward
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_30
    end
  end
  L2_2 = readQword
  L3_2 = "ptrAward"
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_30::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isAward
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L2_2 = changeNation
  L3_2 = awro
  L3_2 = L3_2.AWni
  L3_2 = L1_2 + L3_2
  L2_2(L3_2)
  return
end

changeAwardNation = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "changeAwardNation"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = getAddressSafe
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isComp
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_17
    end
  end
  L2_2 = readQword
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_17::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isComp
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_30
    end
  end
  L2_2 = readQword
  L3_2 = "ptrComp"
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_30::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isComp
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L2_2 = getAddressSafe
  L3_2 = readQword
  L4_2 = cmpo
  L4_2 = L4_2.Cnam
  L4_2 = L1_2 + L4_2
  L3_2 = L3_2(L4_2)
  L3_2 = L3_2 + 4
  L2_2 = L2_2(L3_2)
  L3_2 = getAddressSafe
  L4_2 = readQword
  L5_2 = cmpo
  L5_2 = L5_2.Csnm
  L5_2 = L1_2 + L5_2
  L4_2 = L4_2(L5_2)
  L4_2 = L4_2 + 4
  L3_2 = L3_2(L4_2)
  L4_2 = getAddressSafe
  L5_2 = readQword
  L6_2 = cmpo
  L6_2 = L6_2.C3ln
  L6_2 = L1_2 + L6_2
  L5_2 = L5_2(L6_2)
  L5_2 = L5_2 + 4
  L4_2 = L4_2(L5_2)
  L5_2 = changeString
  L6_2 = L2_2
  L7_2 = "Full Name"
  L5_2(L6_2, L7_2)
  L5_2 = changeString
  L6_2 = L3_2
  L7_2 = "Short Name"
  L5_2(L6_2, L7_2)
  L5_2 = changeString
  L6_2 = L4_2
  L7_2 = "Three Letter Name"
  L5_2(L6_2, L7_2)
  return
end

changeCompName = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "changeCompName"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = getAddressSafe
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isStadium
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_17
    end
  end
  L2_2 = readQword
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_17::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isStadium
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_30
    end
  end
  L2_2 = readQword
  L3_2 = "ptrStadium"
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_30::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isStadium
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L2_2 = getAddressSafe
  L3_2 = readQword
  L4_2 = stao
  L4_2 = L4_2.Snam
  L4_2 = L1_2 + L4_2
  L3_2 = L3_2(L4_2)
  L3_2 = L3_2 + 4
  L2_2 = L2_2(L3_2)
  L3_2 = changeString
  L4_2 = L2_2
  L5_2 = "Name"
  return L3_2(L4_2, L5_2)
end

changeStadiumName = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "changeStadiumName"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = getAddressSafe
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = getRTTIClassName
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 == "db::DERBY" then
      goto lbl_17
    end
  end
  L2_2 = readQword
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_17::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = getRTTIClassName
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 == "db::DERBY" then
      goto lbl_30
    end
  end
  L2_2 = readQword
  L3_2 = "ptrDerby"
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_30::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = getRTTIClassName
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 == "db::DERBY" then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L2_2 = getAddressSafe
  L3_2 = readQword
  L4_2 = drbr
  L4_2 = L4_2.Dnam
  L4_2 = L1_2 + L4_2
  L3_2 = L3_2(L4_2)
  L3_2 = L3_2 + 4
  L2_2 = L2_2(L3_2)
  L3_2 = getAddressSafe
  L4_2 = readQword
  L5_2 = drbr
  L5_2 = L5_2.Dsnm
  L5_2 = L1_2 + L5_2
  L4_2 = L4_2(L5_2)
  L4_2 = L4_2 + 4
  L3_2 = L3_2(L4_2)
  L4_2 = getAddressSafe
  L5_2 = readQword
  L6_2 = drbr
  L6_2 = L6_2.Danm
  L6_2 = L1_2 + L6_2
  L5_2 = L5_2(L6_2)
  L5_2 = L5_2 + 4
  L4_2 = L4_2(L5_2)
  L5_2 = getAddressSafe
  L6_2 = readQword
  L7_2 = drbr
  L7_2 = L7_2.Dasn
  L7_2 = L1_2 + L7_2
  L6_2 = L6_2(L7_2)
  L6_2 = L6_2 + 4
  L5_2 = L5_2(L6_2)
  L6_2 = changeString
  L7_2 = L2_2
  L8_2 = "Name"
  L6_2(L7_2, L8_2)
  L6_2 = changeString
  L7_2 = L3_2
  L8_2 = "Short Name"
  L6_2(L7_2, L8_2)
  L6_2 = changeString
  L7_2 = L4_2
  L8_2 = "Alternative Name"
  L6_2(L7_2, L8_2)
  L6_2 = changeString
  L7_2 = L5_2
  L8_2 = "Alternative Short Name"
  L6_2(L7_2, L8_2)
  return
end

changeDerbyName = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "changeDerbyName"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = getAddressSafe
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = getRTTIClassName
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 == "db::DERBY" then
      goto lbl_17
    end
  end
  L3_2 = readQword
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L2_2 = L3_2
  ::lbl_17::
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = getRTTIClassName
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 == "db::DERBY" then
      goto lbl_30
    end
  end
  L3_2 = readQword
  L4_2 = "ptrDerby"
  L3_2 = L3_2(L4_2)
  L2_2 = L3_2
  ::lbl_30::
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = getRTTIClassName
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 == "db::DERBY" then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L3_2 = createCustomSelectionList
  L4_2 = "Team List"
  L5_2 = TeamTableStart
  L6_2 = TeamTableEnd
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  if L3_2 == nil then
    return
  end
  if A1_2 == 1 then
    L4_2 = writeQword
    L5_2 = drbr
    L5_2 = L5_2.Dtm1
    L5_2 = L2_2 + L5_2
    L6_2 = L3_2
    L4_2(L5_2, L6_2)
    return
  elseif A1_2 == 2 then
    L4_2 = writeQword
    L5_2 = drbr
    L5_2 = L5_2.Dtm2
    L5_2 = L2_2 + L5_2
    L6_2 = L3_2
    L4_2(L5_2, L6_2)
    return
  else
    return
  end
end

changeDerbyTeam = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "changeDerbyTeam"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = getAddressSafe
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = getRTTIClassName
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 == "db::DERBY" then
      goto lbl_17
    end
  end
  L2_2 = readQword
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_17::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = getRTTIClassName
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 == "db::DERBY" then
      goto lbl_30
    end
  end
  L2_2 = readQword
  L3_2 = "ptrDerby"
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_30::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = getRTTIClassName
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 == "db::DERBY" then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L2_2 = createCustomSelectionList
  L3_2 = "Competition List"
  L4_2 = CompTableStart
  L5_2 = CompTableEnd
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  if L2_2 == nil then
    return
  end
  L3_2 = writeQword
  L4_2 = drbr
  L4_2 = L4_2.Dfmc
  L4_2 = L1_2 + L4_2
  L5_2 = L2_2
  L3_2(L4_2, L5_2)
  return
end

changeDerbyComp = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "changeDerbyComp"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = getAddressSafe
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = getRTTIClassName
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 == "db::DERBY" then
      goto lbl_17
    end
  end
  L2_2 = readQword
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_17::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = getRTTIClassName
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 == "db::DERBY" then
      goto lbl_30
    end
  end
  L2_2 = readQword
  L3_2 = "ptrDerby"
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_30::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = getRTTIClassName
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 == "db::DERBY" then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L2_2 = createCustomSelectionList
  L3_2 = "Stadium List"
  L4_2 = StadiumTableStart
  L5_2 = StadiumTableEnd
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  if L2_2 == nil then
    return
  end
  L3_2 = writeQword
  L4_2 = drbr
  L4_2 = L4_2.Dfms
  L4_2 = L1_2 + L4_2
  L5_2 = L2_2
  L3_2(L4_2, L5_2)
  return
end

changeDerbyStadium = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "changeDerbyStadium"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = getAddressSafe
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 == nil then
    return
  end
  L2_2 = createCustomSelectionList
  L3_2 = "City List"
  L4_2 = CityTableStart
  L5_2 = CityTableEnd
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  if L2_2 == nil then
    return
  end
  L3_2 = writeQword
  L4_2 = L1_2
  L5_2 = L2_2
  L3_2(L4_2, L5_2)
  return
end

changeCity = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "changeCity"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = getAddressSafe
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 == nil then
    return
  end
  L2_2 = createCustomSelectionList
  L3_2 = "Competition List"
  L4_2 = CompTableStart
  L5_2 = CompTableEnd
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  if L2_2 == nil then
    return
  end
  L3_2 = writeQword
  L4_2 = L1_2
  L5_2 = L2_2
  L3_2(L4_2, L5_2)
  return
end

changeComp = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "changeComp"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = getAddressSafe
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 == nil then
    return
  end
  L2_2 = createCustomSelectionList
  L3_2 = "Continent List"
  L4_2 = ContinentTableStart
  L5_2 = ContinentTableEnd
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  if L2_2 == nil then
    return
  end
  L3_2 = writeQword
  L4_2 = L1_2
  L5_2 = L2_2
  L3_2(L4_2, L5_2)
  return
end

changeContinent = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "changeContinent"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = getAddressSafe
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 == nil then
    return
  end
  L2_2 = createCustomSelectionList
  L3_2 = "Nation List"
  L4_2 = NationTableStart
  L5_2 = NationTableEnd
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  if L2_2 == nil then
    return
  end
  L3_2 = writeQword
  L4_2 = L1_2
  L5_2 = L2_2
  L3_2(L4_2, L5_2)
  return
end

changeNation = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "changeNation"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = getAddressSafe
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 == nil then
    return
  end
  L2_2 = createCustomSelectionList
  L3_2 = "Stadium List"
  L4_2 = StadiumTableStart
  L5_2 = StadiumTableEnd
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  if L2_2 == nil then
    return
  end
  L3_2 = writeQword
  L4_2 = L1_2
  L5_2 = L2_2
  L3_2(L4_2, L5_2)
  return
end

changeStadium = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "changeStadium"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L3_2 = readQword
  L4_2 = "ptrClub"
  L3_2 = L3_2(L4_2)
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isClub
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_14
    end
  end
  do return end
  ::lbl_14::
  L4_2 = getAddressSafe
  L5_2 = A1_2
  L4_2 = L4_2(L5_2)
  L5_2 = nil
  L6_2 = nil
  L7_2 = nil
  L8_2 = A0_2
  if L8_2 ~= nil then
    L9_2 = createRecord
    L10_2 = A0_2
    L11_2 = "Setup >"
    L12_2 = vtGrouped
    L13_2 = L4_2
    L14_2 = nil
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
    L5_2 = L9_2
    L5_2.options = "[moHideChildren,moDeactivateChildrenAsWell]"
    L9_2 = Color
    L9_2 = L9_2.Child1
    L5_2.Color = L9_2
    L5_2.DontSave = true
    L9_2 = getAddressList
    L9_2 = L9_2()
    L9_2 = L9_2.createMemoryRecord
    L9_2 = L9_2()
    L6_2 = L9_2
    L9_2 = L6_2.appendToEntry
    L10_2 = L5_2
    L9_2(L10_2)
    L6_2.address = "+0"
    L9_2 = vtString
    L6_2.Type = L9_2
    L9_2 = L6_2.String
    L9_2.Size = 255
    L6_2.OffsetCount = 2
    L9_2 = L6_2.Offset
    L10_2 = cluo
    L10_2 = L10_2.Csnm
    L9_2[1] = L10_2
    L9_2 = L6_2.Offset
    L9_2[0] = 4
    L6_2.Description = "Main Club"
    L9_2 = Color
    L9_2 = L9_2.Pointer
    L6_2.Color = L9_2
    L6_2.DropDownReadOnly = true
    L9_2 = L6_2.DropDownList
    L9_2.Text = "*:"
    L9_2 = writeQword
    L10_2 = L4_2
    L11_2 = L3_2
    L9_2(L10_2, L11_2)
    L9_2 = createRecord
    L10_2 = L6_2
    L11_2 = "[X] <- Change Club"
    L12_2 = vtGrouped
    L13_2 = nil
    L14_2 = nil
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
    L7_2 = L9_2
    L9_2 = Color
    L9_2 = L9_2.SetFocus
    L7_2.Color = L9_2
    
    function L9_2(A0_3, A1_3, A2_3)
      local L3_3, L4_3, L5_3, L6_3
      L3_3 = createCustomSelectionList
      L4_3 = Table
      L4_3 = L4_3.Language
      L4_3 = L4_3[90052]
      L5_3 = ClubTableStart
      L6_3 = ClubTableEnd
      L3_3 = L3_3(L4_3, L5_3, L6_3)
      if L3_3 == nil then
        return
      end
      L4_3 = writeQword
      L5_3 = L4_2
      L6_3 = L3_3
      L4_3(L5_3, L6_3)
      L4_3 = false
      return L4_3
    end
    
    L7_2.OnActivate = L9_2
    L9_2 = getAddressList
    L9_2 = L9_2()
    L9_2 = L9_2.createMemoryRecord
    L9_2 = L9_2()
    L6_2 = L9_2
    L9_2 = L6_2.appendToEntry
    L10_2 = L5_2
    L9_2(L10_2)
    L6_2.address = "+8"
    L9_2 = vtString
    L6_2.Type = L9_2
    L9_2 = L6_2.String
    L9_2.Size = 255
    L6_2.OffsetCount = 2
    L9_2 = L6_2.Offset
    L10_2 = cluo
    L10_2 = L10_2.Csnm
    L9_2[1] = L10_2
    L9_2 = L6_2.Offset
    L9_2[0] = 4
    L6_2.Description = "Affiliated Club"
    L9_2 = Color
    L9_2 = L9_2.Pointer
    L6_2.Color = L9_2
    L6_2.DropDownReadOnly = true
    L9_2 = L6_2.DropDownList
    L9_2.Text = "*:"
    L9_2 = writeQword
    L10_2 = L4_2 + 8
    L11_2 = L3_2
    L9_2(L10_2, L11_2)
    L9_2 = createRecord
    L10_2 = L6_2
    L11_2 = "[X] <- Change Club"
    L12_2 = vtGrouped
    L13_2 = nil
    L14_2 = nil
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
    L7_2 = L9_2
    L9_2 = Color
    L9_2 = L9_2.SetFocus
    L7_2.Color = L9_2
    
    function L9_2(A0_3, A1_3, A2_3)
      local L3_3, L4_3, L5_3, L6_3
      L3_3 = createCustomSelectionList
      L4_3 = Table
      L4_3 = L4_3.Language
      L4_3 = L4_3[90052]
      L5_3 = ClubTableStart
      L6_3 = ClubTableEnd
      L3_3 = L3_3(L4_3, L5_3, L6_3)
      if L3_3 == nil then
        return
      end
      L4_3 = writeQword
      L5_3 = L4_2
      L5_3 = L5_3 + 8
      L6_3 = L3_3
      L4_3(L5_3, L6_3)
      L4_3 = false
      return L4_3
    end
    
    L7_2.OnActivate = L9_2
    L9_2 = createRecord
    L10_2 = L5_2
    L11_2 = Table
    L11_2 = L11_2.Language
    L11_2 = L11_2[17813]
    L12_2 = vtCustom
    L13_2 = "+20"
    L14_2 = nil
    L15_2 = "FM Date"
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
    L6_2 = L9_2
    L9_2 = Color
    L9_2 = L9_2.Text
    L6_2.Color = L9_2
    L6_2.DropDownReadOnly = true
    L9_2 = L6_2.DropDownList
    L9_2.Text = "*:"
    
    function L9_2(A0_3, A1_3, A2_3)
      local L3_3, L4_3, L5_3
      L3_3 = changeDate
      L4_3 = A0_3.getCurrentAddress
      L4_3 = L4_3()
      L5_3 = A0_3.getDescription
      L5_3 = L5_3()
      L3_3(L4_3, L5_3)
      L3_3 = false
      return L3_3
    end
    
    L6_2.OnActivate = L9_2
    L9_2 = writeInteger
    L10_2 = L4_2 + 32
    L11_2 = readInteger
    L12_2 = getAddressSafe
    L13_2 = "datTimeRoot"
    L12_2, L13_2, L14_2, L15_2 = L12_2(L13_2)
    L11_2, L12_2, L13_2, L14_2, L15_2 = L11_2(L12_2, L13_2, L14_2, L15_2)
    L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
    L9_2 = createRecord
    L10_2 = L5_2
    L11_2 = Table
    L11_2 = L11_2.Language
    L11_2 = L11_2[17814]
    L12_2 = vtCustom
    L13_2 = "+24"
    L14_2 = nil
    L15_2 = "FM Date"
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
    L6_2 = L9_2
    L9_2 = Color
    L9_2 = L9_2.Text
    L6_2.Color = L9_2
    L6_2.DropDownReadOnly = true
    L9_2 = L6_2.DropDownList
    L9_2.Text = "*:"
    
    function L9_2(A0_3, A1_3, A2_3)
      local L3_3, L4_3, L5_3
      L3_3 = changeDate
      L4_3 = A0_3.getCurrentAddress
      L4_3 = L4_3()
      L5_3 = A0_3.getDescription
      L5_3 = L5_3()
      L3_3(L4_3, L5_3)
      L3_3 = false
      return L3_3
    end
    
    L6_2.OnActivate = L9_2
    L9_2 = writeInteger
    L10_2 = L4_2 + 36
    L11_2 = 124518401
    L9_2(L10_2, L11_2)
    L9_2 = createRecord
    L10_2 = L5_2
    L11_2 = "Affiliation Type"
    L12_2 = vtByte
    L13_2 = "+2C"
    L14_2 = nil
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
    L6_2 = L9_2
    L9_2 = Color
    L9_2 = L9_2.Text
    L6_2.Color = L9_2
    L6_2.DropDownReadOnly = true
    L6_2.DropDownDescriptionOnly = true
    L6_2.DisplayAsDropDownListItem = true
    L9_2 = L6_2.DropDownList
    L10_2 = typeOptionStringMaps
    L10_2 = L10_2.affiliationType
    L9_2.Text = L10_2
    L6_2.Value = 1
    L9_2 = createRecord
    L10_2 = L5_2
    L11_2 = "Player Move Freely"
    L12_2 = vtBinary
    L13_2 = "+1C"
    L14_2 = nil
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
    L6_2 = L9_2
    L9_2 = Color
    L9_2 = L9_2.Text
    L6_2.Color = L9_2
    L6_2.DropDownReadOnly = true
    L6_2.DropDownDescriptionOnly = true
    L6_2.DisplayAsDropDownListItem = true
    L9_2 = L6_2.DropDownList
    L10_2 = typeOptionStringMaps
    L10_2 = L10_2.binaryOptionType
    L9_2.Text = L10_2
    L9_2 = L6_2.Binary
    L9_2.Size = 1
    L9_2 = L6_2.Binary
    L9_2.Startbit = 1
    L9_2 = createRecord
    L10_2 = L5_2
    L11_2 = "Player Go On Loan"
    L12_2 = vtBinary
    L13_2 = "+1C"
    L14_2 = nil
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
    L6_2 = L9_2
    L9_2 = Color
    L9_2 = L9_2.Text
    L6_2.Color = L9_2
    L6_2.DropDownReadOnly = true
    L6_2.DropDownDescriptionOnly = true
    L6_2.DisplayAsDropDownListItem = true
    L9_2 = L6_2.DropDownList
    L10_2 = typeOptionStringMaps
    L10_2 = L10_2.binaryOptionType
    L9_2.Text = L10_2
    L9_2 = L6_2.Binary
    L9_2.Size = 1
    L9_2 = L6_2.Binary
    L9_2.Startbit = 2
    L9_2 = createRecord
    L10_2 = L5_2
    L11_2 = "First Option To Buy"
    L12_2 = vtBinary
    L13_2 = "+1C"
    L14_2 = nil
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
    L6_2 = L9_2
    L9_2 = Color
    L9_2 = L9_2.Text
    L6_2.Color = L9_2
    L6_2.DropDownReadOnly = true
    L6_2.DropDownDescriptionOnly = true
    L6_2.DisplayAsDropDownListItem = true
    L9_2 = L6_2.DropDownList
    L10_2 = typeOptionStringMaps
    L10_2 = L10_2.binaryOptionType
    L9_2.Text = L10_2
    L9_2 = L6_2.Binary
    L9_2.Size = 1
    L9_2 = L6_2.Binary
    L9_2.Startbit = 3
    L9_2 = createRecord
    L10_2 = L5_2
    L11_2 = "Uses Same Kit"
    L12_2 = vtBinary
    L13_2 = "+1E"
    L14_2 = nil
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
    L6_2 = L9_2
    L9_2 = Color
    L9_2 = L9_2.Text
    L6_2.Color = L9_2
    L6_2.DropDownReadOnly = true
    L6_2.DropDownDescriptionOnly = true
    L6_2.DisplayAsDropDownListItem = true
    L9_2 = L6_2.DropDownList
    L10_2 = typeOptionStringMaps
    L10_2 = L10_2.binaryOptionType
    L9_2.Text = L10_2
    L9_2 = L6_2.Binary
    L9_2.Size = 1
    L9_2 = L6_2.Binary
    L9_2.Startbit = 7
    L9_2 = createRecord
    L10_2 = L5_2
    L11_2 = "Play Friendlies"
    L12_2 = vtBinary
    L13_2 = "+1C"
    L14_2 = nil
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
    L6_2 = L9_2
    L9_2 = Color
    L9_2 = L9_2.Text
    L6_2.Color = L9_2
    L6_2.DropDownReadOnly = true
    L6_2.DropDownDescriptionOnly = true
    L6_2.DisplayAsDropDownListItem = true
    L9_2 = L6_2.DropDownList
    L10_2 = typeOptionStringMaps
    L10_2 = L10_2.binaryOptionType
    L9_2.Text = L10_2
    L9_2 = L6_2.Binary
    L9_2.Size = 1
    L9_2 = L6_2.Binary
    L9_2.Startbit = 4
    L9_2 = tonumber
    L10_2 = L6_2.Value
    L9_2 = L9_2(L10_2)
    if L9_2 == 1 then
      L9_2 = createRecord
      L10_2 = L6_2
      L11_2 = "Percentage Chance Of Friendly Each Year"
      L12_2 = vtByte
      L13_2 = "+13"
      L14_2 = nil
      L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
      L7_2 = L9_2
      L9_2 = Color
      L9_2 = L9_2.Text
      L7_2.Color = L9_2
      L7_2.ShowAsSigned = true
    end
    L9_2 = createRecord
    L10_2 = L5_2
    L11_2 = "Same Board"
    L12_2 = vtBinary
    L13_2 = "+1C"
    L14_2 = nil
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
    L6_2 = L9_2
    L9_2 = Color
    L9_2 = L9_2.Text
    L6_2.Color = L9_2
    L6_2.DropDownReadOnly = true
    L6_2.DropDownDescriptionOnly = true
    L6_2.DisplayAsDropDownListItem = true
    L9_2 = L6_2.DropDownList
    L10_2 = typeOptionStringMaps
    L10_2 = L10_2.binaryOptionType
    L9_2.Text = L10_2
    L9_2 = L6_2.Binary
    L9_2.Size = 1
    L9_2 = L6_2.Binary
    L9_2.Startbit = 7
    L9_2 = tonumber
    L10_2 = L6_2.Value
    L9_2 = L9_2(L10_2)
    if L9_2 == 1 then
      L9_2 = createRecord
      L10_2 = L6_2
      L11_2 = "Sends Youth Players To Gain Experience"
      L12_2 = vtBinary
      L13_2 = "+2"
      L14_2 = nil
      L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
      L7_2 = L9_2
      L9_2 = Color
      L9_2 = L9_2.Text
      L7_2.Color = L9_2
      L7_2.DropDownReadOnly = true
      L7_2.DropDownDescriptionOnly = true
      L7_2.DisplayAsDropDownListItem = true
      L9_2 = L7_2.DropDownList
      L10_2 = typeOptionStringMaps
      L10_2 = L10_2.binaryOptionType
      L9_2.Text = L10_2
      L9_2 = L7_2.Binary
      L9_2.Size = 1
      L9_2 = L7_2.Binary
      L9_2.Startbit = 3
      L9_2 = createRecord
      L10_2 = L6_2
      L11_2 = "Link Used To Showcase Reserve Players"
      L12_2 = vtBinary
      L13_2 = "+2"
      L14_2 = nil
      L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
      L7_2 = L9_2
      L9_2 = Color
      L9_2 = L9_2.Text
      L7_2.Color = L9_2
      L7_2.DropDownReadOnly = true
      L7_2.DropDownDescriptionOnly = true
      L7_2.DisplayAsDropDownListItem = true
      L9_2 = L7_2.DropDownList
      L10_2 = typeOptionStringMaps
      L10_2 = L10_2.binaryOptionType
      L9_2.Text = L10_2
      L9_2 = L7_2.Binary
      L9_2.Size = 1
      L9_2 = L7_2.Binary
      L9_2.Startbit = 4
      L9_2 = createRecord
      L10_2 = L6_2
      L11_2 = "Sends First Team Players To Aid Affiliate Club With Promotion"
      L12_2 = vtBinary
      L13_2 = "+2"
      L14_2 = nil
      L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
      L7_2 = L9_2
      L9_2 = Color
      L9_2 = L9_2.Text
      L7_2.Color = L9_2
      L7_2.DropDownReadOnly = true
      L7_2.DropDownDescriptionOnly = true
      L7_2.DisplayAsDropDownListItem = true
      L9_2 = L7_2.DropDownList
      L10_2 = typeOptionStringMaps
      L10_2 = L10_2.binaryOptionType
      L9_2.Text = L10_2
      L9_2 = L7_2.Binary
      L9_2.Size = 1
      L9_2 = L7_2.Binary
      L9_2.Startbit = 5
      L9_2 = createRecord
      L10_2 = L6_2
      L11_2 = "Percentage Of Loan Player Wage Paid By Parent Club"
      L12_2 = vtByte
      L13_2 = "+16"
      L14_2 = nil
      L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
      L7_2 = L9_2
      L9_2 = Color
      L9_2 = L9_2.Text
      L7_2.Color = L9_2
      L7_2.ShowAsSigned = true
    end
    L9_2 = createRecord
    L10_2 = L5_2
    L11_2 = "Financial Help"
    L12_2 = vtBinary
    L13_2 = "+1D"
    L14_2 = nil
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
    L6_2 = L9_2
    L9_2 = Color
    L9_2 = L9_2.Text
    L6_2.Color = L9_2
    L6_2.DropDownReadOnly = true
    L6_2.DropDownDescriptionOnly = true
    L6_2.DisplayAsDropDownListItem = true
    L9_2 = L6_2.DropDownList
    L10_2 = typeOptionStringMaps
    L10_2 = L10_2.binaryOptionType
    L9_2.Text = L10_2
    L9_2 = L6_2.Binary
    L9_2.Size = 1
    L9_2 = L6_2.Binary
    L9_2.Startbit = 1
    L9_2 = createRecord
    L10_2 = L6_2
    L11_2 = "Yearly Fee"
    L12_2 = vtCustom
    L13_2 = "-D"
    L14_2 = nil
    L15_2 = Table
    L15_2 = L15_2.CurrencyType
    L15_2 = L15_2.shortname
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
    L7_2 = L9_2
    L9_2 = Color
    L9_2 = L9_2.Text
    L7_2.Color = L9_2
    L7_2.ShowAsSigned = true
    L9_2 = createRecord
    L10_2 = L5_2
    L11_2 = "Permanent Deal"
    L12_2 = vtBinary
    L13_2 = "+1C"
    L14_2 = nil
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
    L6_2 = L9_2
    L9_2 = Color
    L9_2 = L9_2.Text
    L6_2.Color = L9_2
    L6_2.DropDownReadOnly = true
    L6_2.DropDownDescriptionOnly = true
    L6_2.DisplayAsDropDownListItem = true
    L9_2 = L6_2.DropDownList
    L10_2 = typeOptionStringMaps
    L10_2 = L10_2.binaryOptionType
    L9_2.Text = L10_2
    L9_2 = L6_2.Binary
    L9_2.Size = 1
    L9_2 = L6_2.Binary
    L9_2.Startbit = 6
    L9_2 = createRecord
    L10_2 = L5_2
    L11_2 = "Youth Players Training"
    L12_2 = vtBinary
    L13_2 = "+1C"
    L14_2 = nil
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
    L6_2 = L9_2
    L9_2 = Color
    L9_2 = L9_2.Text
    L6_2.Color = L9_2
    L6_2.DropDownReadOnly = true
    L6_2.DropDownDescriptionOnly = true
    L6_2.DisplayAsDropDownListItem = true
    L9_2 = L6_2.DropDownList
    L10_2 = typeOptionStringMaps
    L10_2 = L10_2.binaryOptionType
    L9_2.Text = L10_2
    L9_2 = L6_2.Binary
    L9_2.Size = 1
    L9_2 = L6_2.Binary
    L9_2.Startbit = 5
    L9_2 = createRecord
    L10_2 = L5_2
    L11_2 = "Help With Facilities"
    L12_2 = vtBinary
    L13_2 = "+1D"
    L14_2 = nil
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
    L6_2 = L9_2
    L9_2 = Color
    L9_2 = L9_2.Text
    L6_2.Color = L9_2
    L6_2.DropDownReadOnly = true
    L6_2.DropDownDescriptionOnly = true
    L6_2.DisplayAsDropDownListItem = true
    L9_2 = L6_2.DropDownList
    L10_2 = typeOptionStringMaps
    L10_2 = L10_2.binaryOptionType
    L9_2.Text = L10_2
    L9_2 = L6_2.Binary
    L9_2.Size = 1
    L9_2 = L6_2.Binary
    L9_2.Startbit = 2
    L9_2 = createRecord
    L10_2 = L5_2
    L11_2 = "Marketing Relations"
    L12_2 = vtBinary
    L13_2 = "+1D"
    L14_2 = nil
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
    L6_2 = L9_2
    L9_2 = Color
    L9_2 = L9_2.Text
    L6_2.Color = L9_2
    L6_2.DropDownReadOnly = true
    L6_2.DropDownDescriptionOnly = true
    L6_2.DisplayAsDropDownListItem = true
    L9_2 = L6_2.DropDownList
    L10_2 = typeOptionStringMaps
    L10_2 = L10_2.binaryOptionType
    L9_2.Text = L10_2
    L9_2 = L6_2.Binary
    L9_2.Size = 1
    L9_2 = L6_2.Binary
    L9_2.Startbit = 5
    L9_2 = createRecord
    L10_2 = L5_2
    L11_2 = "Scouting Knowledge Shared"
    L12_2 = vtBinary
    L13_2 = "+1D"
    L14_2 = nil
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
    L6_2 = L9_2
    L9_2 = Color
    L9_2 = L9_2.Text
    L6_2.Color = L9_2
    L6_2.DropDownReadOnly = true
    L6_2.DropDownDescriptionOnly = true
    L6_2.DisplayAsDropDownListItem = true
    L9_2 = L6_2.DropDownList
    L10_2 = typeOptionStringMaps
    L10_2 = L10_2.binaryOptionType
    L9_2.Text = L10_2
    L9_2 = L6_2.Binary
    L9_2.Size = 1
    L9_2 = L6_2.Binary
    L9_2.Startbit = 6
    L9_2 = createRecord
    L10_2 = L5_2
    L11_2 = "Cannot Play In Same Division"
    L12_2 = vtBinary
    L13_2 = "+1D"
    L14_2 = nil
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
    L6_2 = L9_2
    L9_2 = Color
    L9_2 = L9_2.Text
    L6_2.Color = L9_2
    L6_2.DropDownReadOnly = true
    L6_2.DropDownDescriptionOnly = true
    L6_2.DisplayAsDropDownListItem = true
    L9_2 = L6_2.DropDownList
    L10_2 = typeOptionStringMaps
    L10_2 = L10_2.binaryOptionType
    L9_2.Text = L10_2
    L9_2 = L6_2.Binary
    L9_2.Size = 1
    L9_2 = L6_2.Binary
    L9_2.Startbit = 7
    L9_2 = createRecord
    L10_2 = L5_2
    L11_2 = "Uses All Parent Club Facilities"
    L12_2 = vtBinary
    L13_2 = "+1E"
    L14_2 = nil
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
    L6_2 = L9_2
    L9_2 = Color
    L9_2 = L9_2.Text
    L6_2.Color = L9_2
    L6_2.DropDownReadOnly = true
    L6_2.DropDownDescriptionOnly = true
    L6_2.DisplayAsDropDownListItem = true
    L9_2 = L6_2.DropDownList
    L10_2 = typeOptionStringMaps
    L10_2 = L10_2.binaryOptionType
    L9_2.Text = L10_2
    L9_2 = L6_2.Binary
    L9_2.Size = 1
    L9_2 = L6_2.Binary
    L9_2.Startbit = 0
    L9_2 = createRecord
    L10_2 = L5_2
    L11_2 = "Loan Players from Sub Team"
    L12_2 = vtBinary
    L13_2 = "+1E"
    L14_2 = nil
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
    L6_2 = L9_2
    L9_2 = Color
    L9_2 = L9_2.Text
    L6_2.Color = L9_2
    L6_2.DropDownReadOnly = true
    L6_2.DropDownDescriptionOnly = true
    L6_2.DisplayAsDropDownListItem = true
    L9_2 = L6_2.DropDownList
    L10_2 = typeOptionStringMaps
    L10_2 = L10_2.binaryOptionType
    L9_2.Text = L10_2
    L9_2 = L6_2.Binary
    L9_2.Size = 1
    L9_2 = L6_2.Binary
    L9_2.Startbit = 1
    L9_2 = createRecord
    L10_2 = L5_2
    L11_2 = "Uses Sub Team Training Facilities"
    L12_2 = vtBinary
    L13_2 = "+1E"
    L14_2 = nil
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
    L6_2 = L9_2
    L9_2 = Color
    L9_2 = L9_2.Text
    L6_2.Color = L9_2
    L6_2.DropDownReadOnly = true
    L6_2.DropDownDescriptionOnly = true
    L6_2.DisplayAsDropDownListItem = true
    L9_2 = L6_2.DropDownList
    L10_2 = typeOptionStringMaps
    L10_2 = L10_2.binaryOptionType
    L9_2.Text = L10_2
    L9_2 = L6_2.Binary
    L9_2.Size = 1
    L9_2 = L6_2.Binary
    L9_2.Startbit = 2
    L9_2 = createRecord
    L10_2 = L5_2
    L11_2 = "Maximum No. Players Loaned"
    L12_2 = vtByte
    L13_2 = "+30"
    L14_2 = nil
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
    L6_2 = L9_2
    L9_2 = Color
    L9_2 = L9_2.Text
    L6_2.Color = L9_2
    L6_2.ShowAsSigned = true
    L9_2 = createRecord
    L10_2 = A0_2
    L11_2 = "----------------------------------------------------------------------------------------------------------------------------------"
    L12_2 = vtGrouped
    L13_2 = nil
    L14_2 = nil
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
    L5_2 = L9_2
    L9_2 = Color
    L9_2 = L9_2.SeparatorSmall
    L5_2.Color = L9_2
    L5_2.DontSave = true
    L9_2 = createRecord
    L10_2 = A0_2
    L11_2 = "Apply"
    L12_2 = vtGrouped
    L13_2 = nil
    L14_2 = nil
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
    L5_2 = L9_2
    L9_2 = Color
    L9_2 = L9_2.SwitchOn
    L5_2.Color = L9_2
    L5_2.DontSave = true
    
    function L9_2(A0_3, A1_3, A2_3)
      local L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3
      L3_3 = os
      L3_3 = L3_3.clock
      L3_3 = L3_3()
      L4_3 = getAddressSafe
      L5_3 = L3_2
      L6_3 = cluo
      L6_3 = L6_3.Cafl
      L5_3 = L5_3 + L6_3
      L4_3 = L4_3(L5_3)
      L5_3 = readQword
      L6_3 = L4_3
      L5_3 = L5_3(L6_3)
      L6_3 = readQword
      L7_3 = L4_3 + 8
      L6_3 = L6_3(L7_3)
      L7_3 = L6_3 - L5_3
      L7_3 = L7_3 / 8
      if L7_3 == 0 then
        return
      end
      L8_3 = readInteger
      L9_3 = L3_2
      L10_3 = objo
      L10_3 = L10_3.Duni
      L9_3 = L9_3 + L10_3
      L8_3 = L8_3(L9_3)
      L9_3 = {}
      L10_3 = A2_2
      L11_3 = forEach
      L12_3 = L5_3
      L13_3 = L6_3
      L14_3 = 8
      
      function L15_3(A0_4, A1_4)
        local L2_4, L3_4
        L2_4 = readQword
        L3_4 = A1_4
        L2_4 = L2_4(L3_4)
        L9_3[A0_4] = L2_4
      end
      
      L11_3(L12_3, L13_3, L14_3, L15_3)
      L11_3 = string
      L11_3 = L11_3.format
      L12_3 = "club_%d_Cafl"
      L13_3 = L8_3
      L11_3 = L11_3(L12_3, L13_3)
      L12_3 = customAlloc
      L13_3 = L11_3
      L14_3 = 4096
      L12_3(L13_3, L14_3)
      L12_3 = string
      L12_3 = L12_3.format
      L13_3 = "%s_Items"
      L14_3 = L11_3
      L12_3 = L12_3(L13_3, L14_3)
      L13_3 = customAlloc
      L14_3 = L12_3
      L15_3 = 4096
      L13_3(L14_3, L15_3)
      L13_3 = table
      L13_3 = L13_3.insert
      L14_3 = L9_3
      L15_3 = L4_2
      L13_3(L14_3, L15_3)
      L13_3 = addNewItemToStack
      L14_3 = L4_3
      L15_3 = L11_3
      L16_3 = L12_3
      L17_3 = L9_3
      L18_3 = L10_3
      L13_3(L14_3, L15_3, L16_3, L17_3, L18_3)
      L13_3 = getAddressList
      L13_3 = L13_3()
      L13_3 = L13_3.getMemoryRecordByID
      L14_3 = 12885
      L13_3 = L13_3(L14_3)
      L14_3 = L13_3.Active
      if L14_3 then
        L14_3 = enableClubAffiliationsRecords
        L15_3 = 2
        L14_3(L15_3)
      end
      L14_3 = MessageDialog
      L15_3 = string
      L15_3 = L15_3.format
      L16_3 = [[
			Operation Success!
			Elapsed time is: %.3f s
			]]
      L17_3 = os
      L17_3 = L17_3.clock
      L17_3 = L17_3()
      L17_3 = L17_3 - L3_3
      L15_3 = L15_3(L16_3, L17_3)
      L16_3 = 2
      L14_3(L15_3, L16_3)
      L14_3 = false
      return L14_3
    end
    
    L5_2.OnActivate = L9_2
  end
  return
end

addClubAffiliations = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "addClubAffiliations"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L3_2 = getAddressSafe
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isNation
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_17
    end
  end
  L4_2 = readQword
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L3_2 = L4_2
  ::lbl_17::
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isNation
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_30
    end
  end
  L4_2 = readQword
  L5_2 = "ptrNation"
  L4_2 = L4_2(L5_2)
  L3_2 = L4_2
  ::lbl_30::
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isNation
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L4_2 = os
  L4_2 = L4_2.clock
  L4_2 = L4_2()
  L5_2 = getAddressSafe
  L6_2 = L3_2 + A1_2
  L5_2 = L5_2(L6_2)
  L6_2 = readQword
  L7_2 = L5_2
  L6_2 = L6_2(L7_2)
  L7_2 = readQword
  L8_2 = L5_2 + 8
  L7_2 = L7_2(L8_2)
  L8_2 = L7_2 - L6_2
  L8_2 = L8_2 / 8
  if L8_2 == 0 then
    return
  end
  L9_2 = readInteger
  L10_2 = objo
  L10_2 = L10_2.Duni
  L10_2 = L3_2 + L10_2
  L9_2 = L9_2(L10_2)
  L10_2 = {}
  L11_2 = 64
  L12_2 = forEach
  L13_2 = L6_2
  L14_2 = L7_2
  L15_2 = 8
  
  function L16_2(A0_3, A1_3)
    local L2_3, L3_3
    L2_3 = readQword
    L3_3 = A1_3
    L2_3 = L2_3(L3_3)
    L10_2[A0_3] = L2_3
  end
  
  L12_2(L13_2, L14_2, L15_2, L16_2)
  L12_2 = string
  L12_2 = L12_2.format
  L13_2 = "nation_%d_Nnfr"
  L14_2 = L9_2
  L12_2 = L12_2(L13_2, L14_2)
  L13_2 = customAlloc
  L14_2 = L12_2
  L15_2 = 4096
  L13_2(L14_2, L15_2)
  L13_2 = string
  L13_2 = L13_2.format
  L14_2 = "%s_Items"
  L15_2 = L12_2
  L13_2 = L13_2(L14_2, L15_2)
  L14_2 = customAlloc
  L15_2 = L13_2
  L16_2 = 4096
  L14_2(L15_2, L16_2)
  L14_2 = table
  L14_2 = L14_2.insert
  L15_2 = L10_2
  L16_2 = L10_2[1]
  L14_2(L15_2, L16_2)
  L14_2 = addNewItemToStack
  L15_2 = L5_2
  L16_2 = L12_2
  L17_2 = L13_2
  L18_2 = L10_2
  L19_2 = L11_2
  L14_2(L15_2, L16_2, L17_2, L18_2, L19_2)
  if A2_2 then
    L14_2 = MessageDialog
    L15_2 = string
    L15_2 = L15_2.format
    L16_2 = [[
		Operation Success!
		Elapsed time is: %.3f s
		]]
    L17_2 = os
    L17_2 = L17_2.clock
    L17_2 = L17_2()
    L17_2 = L17_2 - L4_2
    L15_2 = L15_2(L16_2, L17_2)
    L16_2 = 2
    return L14_2(L15_2, L16_2)
  end
  return
end

addNationForeignRules = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "addNationForeignRules"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L2_2 = readQword
  L3_2 = "ptrClub"
  L2_2 = L2_2(L3_2)
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isClub
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_14
    end
  end
  do return end
  ::lbl_14::
  L3_2 = getAddressSafe
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L4_2 = os
  L4_2 = L4_2.clock
  L4_2 = L4_2()
  L5_2 = readQword
  L6_2 = cluo
  L6_2 = L6_2.Coin
  L6_2 = L2_2 + L6_2
  L5_2 = L5_2(L6_2)
  L6_2 = readQword
  L7_2 = L5_2
  L6_2 = L6_2(L7_2)
  L7_2 = readQword
  L8_2 = L5_2 + 8
  L7_2 = L7_2(L8_2)
  L8_2 = L7_2 - L6_2
  L8_2 = L8_2 / 8
  if L8_2 == 0 then
    return
  end
  L9_2 = readInteger
  L10_2 = objo
  L10_2 = L10_2.Duni
  L10_2 = L2_2 + L10_2
  L9_2 = L9_2(L10_2)
  L10_2 = {}
  L11_2 = A1_2
  L12_2 = forEach
  L13_2 = L6_2
  L14_2 = L7_2
  L15_2 = 8
  
  function L16_2(A0_3, A1_3)
    local L2_3, L3_3
    L2_3 = readQword
    L3_3 = A1_3
    L2_3 = L2_3(L3_3)
    L10_2[A0_3] = L2_3
  end
  
  L12_2(L13_2, L14_2, L15_2, L16_2)
  L12_2 = string
  L12_2 = L12_2.format
  L13_2 = "club_%d_Coin"
  L14_2 = L9_2
  L12_2 = L12_2(L13_2, L14_2)
  L13_2 = customAlloc
  L14_2 = L12_2
  L15_2 = 4096
  L13_2(L14_2, L15_2)
  L13_2 = string
  L13_2 = L13_2.format
  L14_2 = "%s_Items"
  L15_2 = L12_2
  L13_2 = L13_2(L14_2, L15_2)
  L14_2 = customAlloc
  L15_2 = L13_2
  L16_2 = 4096
  L14_2(L15_2, L16_2)
  L14_2 = table
  L14_2 = L14_2.insert
  L15_2 = L10_2
  L16_2 = L3_2
  L14_2(L15_2, L16_2)
  L14_2 = addNewItemToStack
  L15_2 = L5_2
  L16_2 = L12_2
  L17_2 = L13_2
  L18_2 = L10_2
  L19_2 = L11_2
  L14_2(L15_2, L16_2, L17_2, L18_2, L19_2)
  L14_2 = MessageDialog
  L15_2 = string
  L15_2 = L15_2.format
  L16_2 = [[
	Operation Success!
	Elapsed time is: %.3f s
	]]
  L17_2 = os
  L17_2 = L17_2.clock
  L17_2 = L17_2()
  L17_2 = L17_2 - L4_2
  L15_2 = L15_2(L16_2, L17_2)
  L16_2 = 2
  return L14_2(L15_2, L16_2)
end

addClubSponsorship = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "addClubSponsorship"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L2_2 = readQword
  L3_2 = "ptrPerson"
  L2_2 = L2_2(L3_2)
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isPerson
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_14
    end
  end
  do return end
  ::lbl_14::
  L3_2 = getAddressSafe
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L4_2 = os
  L4_2 = L4_2.clock
  L4_2 = L4_2()
  L5_2 = readQword
  L6_2 = pero
  L6_2 = L6_2.Pcpl
  L6_2 = L2_2 + L6_2
  L5_2 = L5_2(L6_2)
  L6_2 = readQword
  L7_2 = L5_2
  L6_2 = L6_2(L7_2)
  L7_2 = readQword
  L8_2 = L5_2 + 8
  L7_2 = L7_2(L8_2)
  L8_2 = L7_2 - L6_2
  L8_2 = L8_2 / 8
  if L8_2 == 0 then
    return
  end
  L9_2 = readInteger
  L10_2 = objo
  L10_2 = L10_2.Duni
  L10_2 = L2_2 + L10_2
  L9_2 = L9_2(L10_2)
  L10_2 = {}
  L11_2 = A1_2
  L12_2 = forEach
  L13_2 = L6_2
  L14_2 = L7_2
  L15_2 = 8
  
  function L16_2(A0_3, A1_3)
    local L2_3, L3_3
    L2_3 = readQword
    L3_3 = A1_3
    L2_3 = L2_3(L3_3)
    L10_2[A0_3] = L2_3
  end
  
  L12_2(L13_2, L14_2, L15_2, L16_2)
  L12_2 = string
  L12_2 = L12_2.format
  L13_2 = "pers_%d_Pcpl"
  L14_2 = L9_2
  L12_2 = L12_2(L13_2, L14_2)
  L13_2 = customAlloc
  L14_2 = L12_2
  L15_2 = 4096
  L13_2(L14_2, L15_2)
  L13_2 = string
  L13_2 = L13_2.format
  L14_2 = "%s_Items"
  L15_2 = L12_2
  L13_2 = L13_2(L14_2, L15_2)
  L14_2 = customAlloc
  L15_2 = L13_2
  L16_2 = 4096
  L14_2(L15_2, L16_2)
  L14_2 = table
  L14_2 = L14_2.insert
  L15_2 = L10_2
  L16_2 = L3_2
  L14_2(L15_2, L16_2)
  L14_2 = addNewItemToStack
  L15_2 = L5_2
  L16_2 = L12_2
  L17_2 = L13_2
  L18_2 = L10_2
  L19_2 = L11_2
  L14_2(L15_2, L16_2, L17_2, L18_2, L19_2)
  L14_2 = MessageDialog
  L15_2 = string
  L15_2 = L15_2.format
  L16_2 = [[
	Operation Success!
	Elapsed time is: %.3f s
	]]
  L17_2 = os
  L17_2 = L17_2.clock
  L17_2 = L17_2()
  L17_2 = L17_2 - L4_2
  L15_2 = L15_2(L16_2, L17_2)
  L16_2 = 2
  return L14_2(L15_2, L16_2)
end

addCareerPlans = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "addCareerPlans"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L2_2 = readQword
  L3_2 = "ptrPerson"
  L2_2 = L2_2(L3_2)
  if L2_2 ~= nil and L2_2 ~= 0 then
    L3_2 = isPerson
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_14
    end
  end
  do return end
  ::lbl_14::
  L3_2 = getAddressSafe
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L4_2 = os
  L4_2 = L4_2.clock
  L4_2 = L4_2()
  L5_2 = readQword
  L6_2 = pero
  L6_2 = L6_2.Ppdt
  L6_2 = L2_2 + L6_2
  L5_2 = L5_2(L6_2)
  L6_2 = readQword
  L7_2 = L5_2
  L6_2 = L6_2(L7_2)
  L7_2 = readQword
  L8_2 = L5_2 + 8
  L7_2 = L7_2(L8_2)
  L8_2 = L7_2 - L6_2
  L8_2 = L8_2 / 8
  if L8_2 == 0 then
    return
  end
  L9_2 = readInteger
  L10_2 = objo
  L10_2 = L10_2.Duni
  L10_2 = L2_2 + L10_2
  L9_2 = L9_2(L10_2)
  L10_2 = {}
  L11_2 = A1_2
  L12_2 = forEach
  L13_2 = L6_2
  L14_2 = L7_2
  L15_2 = A1_2
  
  function L16_2(A0_3, A1_3)
    local L2_3, L3_3
    L2_3 = getAddressSafe
    L3_3 = A1_3
    L2_3 = L2_3(L3_3)
    L10_2[A0_3] = L2_3
  end
  
  L12_2(L13_2, L14_2, L15_2, L16_2)
  L12_2 = string
  L12_2 = L12_2.format
  L13_2 = "pers_%d_Rprl"
  L14_2 = L9_2
  L12_2 = L12_2(L13_2, L14_2)
  L13_2 = customAlloc
  L14_2 = L12_2
  L15_2 = 4096
  L13_2(L14_2, L15_2)
  L13_2 = string
  L13_2 = L13_2.format
  L14_2 = "%s_Items"
  L15_2 = L12_2
  L13_2 = L13_2(L14_2, L15_2)
  L14_2 = customAlloc
  L15_2 = L13_2
  L16_2 = 4096
  L14_2(L15_2, L16_2)
  L14_2 = table
  L14_2 = L14_2.insert
  L15_2 = L10_2
  L16_2 = L3_2
  L14_2(L15_2, L16_2)
  L14_2 = addNewItemToStack
  L15_2 = L5_2
  L16_2 = L12_2
  L17_2 = nil
  L18_2 = L10_2
  L19_2 = L11_2
  L20_2 = 2
  L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
  L14_2 = MessageDialog
  L15_2 = string
  L15_2 = L15_2.format
  L16_2 = [[
	Operation Success!
	Elapsed time is: %.3f s
	]]
  L17_2 = os
  L17_2 = L17_2.clock
  L17_2 = L17_2()
  L17_2 = L17_2 - L4_2
  L15_2 = L15_2(L16_2, L17_2)
  L16_2 = 2
  return L14_2(L15_2, L16_2)
end

addPersonRelation = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "addPersonRelation"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2
  if A0_2 ~= nil and A0_2 ~= 0 and A1_2 ~= nil then
    L4_2 = formSearchDatabaseSingle
    
    function L5_2(A0_3, A1_3)
      local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
      L2_3 = A0_3.Control
      L2_3 = L2_3[0]
      L2_3 = L2_3.Control
      L2_3 = L2_3[1]
      if L2_3 == nil then
        return
      end
      L3_3 = L2_3.ItemIndex
      if L3_3 == -1 then
        return
      end
      L4_3 = A1_3[L3_3]
      L4_3 = L4_3.addr
      if L4_3 ~= nil then
        L5_3 = readPointer
        L6_3 = A0_2
        L5_3 = L5_3(L6_3)
        if L4_3 ~= L5_3 then
          goto lbl_22
        end
      end
      do return end
      ::lbl_22::
      L5_3 = writePointer
      L6_3 = A0_2
      L7_3 = L4_3
      L5_3(L6_3, L7_3)
    end
    
    L6_2 = A1_2
    L7_2 = TrID
    L7_2 = L7_2[229829]
    L4_2(L5_2, L6_2, L7_2)
    if A2_2 and A3_2 ~= nil then
      A3_2.Address = 1
    end
  end
  return
end

changeObject = L8_1

function L8_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L0_2 = 0
  L1_2 = os
  L1_2 = L1_2.clock
  L1_2 = L1_2()
  L2_2 = ClubTableEnd
  L3_2 = ClubTableStart
  L2_2 = L2_2 - L3_2
  L2_2 = L2_2 / 8
  L3_2 = MassEditManager
  L3_2 = L3_2.ProgressBar
  L3_2.Min = 0
  L3_2.Max = L2_2
  L3_2.Step = 1
  L3_2.Position = 0
  L4_2 = forEach
  L5_2 = ClubTableStart
  L6_2 = ClubTableEnd
  L7_2 = 8
  
  function L8_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3
    L2_3 = L3_2.stepIt
    L2_3()
    L2_3 = L0_2
    L2_3 = L2_3 + 1
    if 100 < L2_3 then
      return
    end
    L2_3 = readQword
    L3_3 = A1_3
    L2_3 = L2_3(L3_3)
    if L2_3 ~= nil and L2_3 ~= 0 then
      L3_3 = isClub
      L4_3 = L2_3
      L3_3 = L3_3(L4_3)
      if L3_3 then
        goto lbl_21
      end
    end
    do return end
    ::lbl_21::
    L3_3 = readQword
    L4_3 = cluo
    L4_3 = L4_3.Cfin
    L4_3 = L2_3 + L4_3
    L3_3 = L3_3(L4_3)
    if L3_3 ~= nil and L3_3 ~= 0 then
      L4_3 = getRTTIClassName
      L5_3 = L3_3
      L4_3 = L4_3(L5_3)
      if L4_3 ~= "db::CLUB_FINANCE_BASE" then
        goto lbl_36
      end
    end
    do return end
    ::lbl_36::
    L4_3 = getClubData
    L5_3 = L2_3
    L4_3 = L4_3(L5_3)
    ClubData = L4_3
    L4_3 = MassEditManager
    L4_3 = L4_3.ftebCnti
    L4_3 = L4_3.Text
    L5_3 = #L4_3
    if L5_3 ~= 0 then
      L5_3 = ClubData
      L5_3 = L5_3.Cnti
      L6_3 = L5_3
      L5_3 = L5_3.Value
      L5_3 = L5_3(L6_3)
      if L5_3 ~= L4_3 then
        return
      end
    end
    L5_3 = MassEditManager
    L5_3 = L5_3.ftebCdiv
    L5_3 = L5_3.Text
    L6_3 = #L5_3
    if L6_3 ~= 0 then
      L6_3 = ClubData
      L6_3 = L6_3.Cdiv
      L7_3 = L6_3
      L6_3 = L6_3.Value
      L6_3 = L6_3(L7_3)
      if L6_3 ~= L5_3 then
        return
      end
    end
    L6_3 = MassEditManager
    L6_3 = L6_3.ftebCrep
    L6_3 = L6_3.Text
    L7_3 = #L6_3
    if L7_3 ~= 0 then
      L7_3 = MassEditManager
      L7_3 = L7_3.ftcbCrep
      L7_3 = L7_3.ItemIndex
      if L7_3 == 0 then
        L7_3 = ClubData
        L7_3 = L7_3.Crep
        L8_3 = L7_3
        L7_3 = L7_3.Value
        L7_3 = L7_3(L8_3)
        if not (L6_3 <= L7_3) then
          return
        end
      else
        L7_3 = MassEditManager
        L7_3 = L7_3.ftcbCrep
        L7_3 = L7_3.ItemIndex
        if L7_3 == 1 then
          L7_3 = ClubData
          L7_3 = L7_3.Crep
          L8_3 = L7_3
          L7_3 = L7_3.Value
          L7_3 = L7_3(L8_3)
          if not (L6_3 >= L7_3) then
            return
          end
        else
          L7_3 = MassEditManager
          L7_3 = L7_3.ftcbCrep
          L7_3 = L7_3.ItemIndex
          if L7_3 == 2 then
            L7_3 = ClubData
            L7_3 = L7_3.Crep
            L8_3 = L7_3
            L7_3 = L7_3.Value
            L7_3 = L7_3(L8_3)
            if L7_3 ~= L6_3 then
              return
            end
          else
            return
          end
        end
      end
    end
    L7_3 = #L4_3
    if L7_3 == 0 then
      L7_3 = #L5_3
      if L7_3 == 0 then
        L7_3 = #L6_3
        if L7_3 == 0 then
          L7_3 = false
          return L7_3
        end
      end
    end
    L7_3 = nil
    L8_3 = nil
    L9_3 = nil
    L10_3 = MassEditManager
    L10_3 = L10_3.cbCprs
    L8_3 = L10_3.ItemIndex
    if L8_3 ~= 0 then
      L10_3 = ClubData
      L10_3 = L10_3.Cprs
      L11_3 = L10_3
      L10_3 = L10_3.Edit
      L12_3 = L8_3
      L10_3(L11_3, L12_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.ebCmle
    L8_3 = L10_3.Text
    L10_3 = MassEditManager
    L10_3 = L10_3.cbCmle
    L9_3 = L10_3.ItemIndex
    L10_3 = #L8_3
    if L10_3 ~= 0 and L9_3 ~= 0 then
      L10_3 = ClubData
      L10_3 = L10_3.Cmle
      L11_3 = L10_3
      L10_3 = L10_3.Value
      L10_3 = L10_3(L11_3)
      L7_3 = L10_3
      L10_3 = ClubData
      L10_3 = L10_3.Cmle
      L11_3 = L10_3
      L10_3 = L10_3.Edit
      L12_3 = massEditCondition
      L13_3 = L9_3
      L14_3 = L7_3
      L15_3 = L8_3
      L16_3 = 1
      L17_3 = 20
      L12_3, L13_3, L14_3, L15_3, L16_3, L17_3 = L12_3(L13_3, L14_3, L15_3, L16_3, L17_3)
      L10_3(L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.ebCrep
    L8_3 = L10_3.Text
    L10_3 = MassEditManager
    L10_3 = L10_3.cbCrep
    L9_3 = L10_3.ItemIndex
    L10_3 = #L8_3
    if L10_3 ~= 0 and L9_3 ~= 0 then
      L10_3 = ClubData
      L10_3 = L10_3.Crep
      L11_3 = L10_3
      L10_3 = L10_3.Value
      L10_3 = L10_3(L11_3)
      L7_3 = L10_3
      L10_3 = ClubData
      L10_3 = L10_3.Crep
      L11_3 = L10_3
      L10_3 = L10_3.Edit
      L12_3 = massEditCondition
      L13_3 = L9_3
      L14_3 = L7_3
      L15_3 = L8_3
      L16_3 = 1
      L17_3 = 10000
      L12_3, L13_3, L14_3, L15_3, L16_3, L17_3 = L12_3(L13_3, L14_3, L15_3, L16_3, L17_3)
      L10_3(L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.ebCatd
    L8_3 = L10_3.Text
    L10_3 = MassEditManager
    L10_3 = L10_3.cbCatd
    L9_3 = L10_3.ItemIndex
    L10_3 = #L8_3
    if L10_3 ~= 0 and L9_3 ~= 0 then
      L10_3 = ClubData
      L10_3 = L10_3.Catd
      L11_3 = L10_3
      L10_3 = L10_3.Value
      L10_3 = L10_3(L11_3)
      L7_3 = L10_3
      L10_3 = ClubData
      L10_3 = L10_3.Catd
      L11_3 = L10_3
      L10_3 = L10_3.Edit
      L12_3 = massEditCondition
      L13_3 = L9_3
      L14_3 = L7_3
      L15_3 = L8_3
      L16_3 = 1
      L17_3 = 1000000
      L12_3, L13_3, L14_3, L15_3, L16_3, L17_3 = L12_3(L13_3, L14_3, L15_3, L16_3, L17_3)
      L10_3(L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.ebCmna
    L8_3 = L10_3.Text
    L10_3 = MassEditManager
    L10_3 = L10_3.cbCmna
    L9_3 = L10_3.ItemIndex
    L10_3 = #L8_3
    if L10_3 ~= 0 and L9_3 ~= 0 then
      L10_3 = ClubData
      L10_3 = L10_3.Cmna
      L11_3 = L10_3
      L10_3 = L10_3.Value
      L10_3 = L10_3(L11_3)
      L7_3 = L10_3
      L10_3 = ClubData
      L10_3 = L10_3.Cmna
      L11_3 = L10_3
      L10_3 = L10_3.Edit
      L12_3 = massEditCondition
      L13_3 = L9_3
      L14_3 = L7_3
      L15_3 = L8_3
      L16_3 = 1
      L17_3 = 1000000
      L12_3, L13_3, L14_3, L15_3, L16_3, L17_3 = L12_3(L13_3, L14_3, L15_3, L16_3, L17_3)
      L10_3(L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.ebCmxa
    L8_3 = L10_3.Text
    L10_3 = MassEditManager
    L10_3 = L10_3.cbCmxa
    L9_3 = L10_3.ItemIndex
    L10_3 = #L8_3
    if L10_3 ~= 0 and L9_3 ~= 0 then
      L10_3 = ClubData
      L10_3 = L10_3.Cmxa
      L11_3 = L10_3
      L10_3 = L10_3.Value
      L10_3 = L10_3(L11_3)
      L7_3 = L10_3
      L10_3 = ClubData
      L10_3 = L10_3.Cmxa
      L11_3 = L10_3
      L10_3 = L10_3.Edit
      L12_3 = massEditCondition
      L13_3 = L9_3
      L14_3 = L7_3
      L15_3 = L8_3
      L16_3 = 1
      L17_3 = 1000000
      L12_3, L13_3, L14_3, L15_3, L16_3, L17_3 = L12_3(L13_3, L14_3, L15_3, L16_3, L17_3)
      L10_3(L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.ebCtlv
    L8_3 = L10_3.Text
    L10_3 = MassEditManager
    L10_3 = L10_3.cbCtlv
    L9_3 = L10_3.ItemIndex
    L10_3 = #L8_3
    if L10_3 ~= 0 and L9_3 ~= 0 then
      L10_3 = ClubData
      L10_3 = L10_3.Ctlv
      L11_3 = L10_3
      L10_3 = L10_3.Value
      L10_3 = L10_3(L11_3)
      L7_3 = L10_3
      L10_3 = ClubData
      L10_3 = L10_3.Ctlv
      L11_3 = L10_3
      L10_3 = L10_3.Edit
      L12_3 = massEditCondition
      L13_3 = L9_3
      L14_3 = L7_3
      L15_3 = L8_3
      L16_3 = 1
      L17_3 = 20
      L12_3, L13_3, L14_3, L15_3, L16_3, L17_3 = L12_3(L13_3, L14_3, L15_3, L16_3, L17_3)
      L10_3(L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.ebCytv
    L8_3 = L10_3.Text
    L10_3 = MassEditManager
    L10_3 = L10_3.cbCytv
    L9_3 = L10_3.ItemIndex
    L10_3 = #L8_3
    if L10_3 ~= 0 and L9_3 ~= 0 then
      L10_3 = ClubData
      L10_3 = L10_3.Cytv
      L11_3 = L10_3
      L10_3 = L10_3.Value
      L10_3 = L10_3(L11_3)
      L7_3 = L10_3
      L10_3 = ClubData
      L10_3 = L10_3.Cytv
      L11_3 = L10_3
      L10_3 = L10_3.Edit
      L12_3 = massEditCondition
      L13_3 = L9_3
      L14_3 = L7_3
      L15_3 = L8_3
      L16_3 = 1
      L17_3 = 20
      L12_3, L13_3, L14_3, L15_3, L16_3, L17_3 = L12_3(L13_3, L14_3, L15_3, L16_3, L17_3)
      L10_3(L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.ebCyfb
    L8_3 = L10_3.Text
    L10_3 = MassEditManager
    L10_3 = L10_3.cbCyfb
    L9_3 = L10_3.ItemIndex
    L10_3 = #L8_3
    if L10_3 ~= 0 and L9_3 ~= 0 then
      L10_3 = ClubData
      L10_3 = L10_3.Cyfb
      L11_3 = L10_3
      L10_3 = L10_3.Value
      L10_3 = L10_3(L11_3)
      L7_3 = L10_3
      L10_3 = ClubData
      L10_3 = L10_3.Cyfb
      L11_3 = L10_3
      L10_3 = L10_3.Edit
      L12_3 = massEditCondition
      L13_3 = L9_3
      L14_3 = L7_3
      L15_3 = L8_3
      L16_3 = 1
      L17_3 = 20
      L12_3, L13_3, L14_3, L15_3, L16_3, L17_3 = L12_3(L13_3, L14_3, L15_3, L16_3, L17_3)
      L10_3(L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.ebCrcb
    L8_3 = L10_3.Text
    L10_3 = MassEditManager
    L10_3 = L10_3.cbCrcb
    L9_3 = L10_3.ItemIndex
    L10_3 = #L8_3
    if L10_3 ~= 0 and L9_3 ~= 0 then
      L10_3 = ClubData
      L10_3 = L10_3.Crcb
      L11_3 = L10_3
      L10_3 = L10_3.Value
      L10_3 = L10_3(L11_3)
      L7_3 = L10_3
      L10_3 = ClubData
      L10_3 = L10_3.Crcb
      L11_3 = L10_3
      L10_3 = L10_3.Edit
      L12_3 = massEditCondition
      L13_3 = L9_3
      L14_3 = L7_3
      L15_3 = L8_3
      L16_3 = 1
      L17_3 = 20
      L12_3, L13_3, L14_3, L15_3, L16_3, L17_3 = L12_3(L13_3, L14_3, L15_3, L16_3, L17_3)
      L10_3(L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.ebCyim
    L8_3 = L10_3.Text
    L10_3 = MassEditManager
    L10_3 = L10_3.cbCyim
    L9_3 = L10_3.ItemIndex
    L10_3 = #L8_3
    if L10_3 ~= 0 and L9_3 ~= 0 then
      L10_3 = ClubData
      L10_3 = L10_3.Cyim
      L11_3 = L10_3
      L10_3 = L10_3.Value
      L10_3 = L10_3(L11_3)
      L7_3 = L10_3
      L10_3 = ClubData
      L10_3 = L10_3.Cyim
      L11_3 = L10_3
      L10_3 = L10_3.Edit
      L12_3 = massEditCondition
      L13_3 = L9_3
      L14_3 = L7_3
      L15_3 = L8_3
      L16_3 = 1
      L17_3 = 20
      L12_3, L13_3, L14_3, L15_3, L16_3, L17_3 = L12_3(L13_3, L14_3, L15_3, L16_3, L17_3)
      L10_3(L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.ebCcfE
    L8_3 = L10_3.Text
    L10_3 = MassEditManager
    L10_3 = L10_3.cbCcfE
    L9_3 = L10_3.ItemIndex
    L10_3 = #L8_3
    if L10_3 ~= 0 and L9_3 ~= 0 then
      L10_3 = ClubData
      L10_3 = L10_3.Ccfe
      L11_3 = L10_3
      L10_3 = L10_3.Value
      L10_3 = L10_3(L11_3)
      L7_3 = L10_3
      L10_3 = ClubData
      L10_3 = L10_3.Ccfe
      L11_3 = L10_3
      L10_3 = L10_3.Edit
      L12_3 = massEditCondition
      L13_3 = L9_3
      L14_3 = L7_3
      L15_3 = L8_3
      L16_3 = 1
      L17_3 = 20
      L12_3, L13_3, L14_3, L15_3, L16_3, L17_3 = L12_3(L13_3, L14_3, L15_3, L16_3, L17_3)
      L10_3(L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.ebCcba
    L8_3 = L10_3.Text
    L10_3 = MassEditManager
    L10_3 = L10_3.cbCcba
    L9_3 = L10_3.ItemIndex
    L10_3 = #L8_3
    if L10_3 ~= 0 and L9_3 ~= 0 then
      L10_3 = ClubData
      L10_3 = L10_3.Ccba
      L11_3 = L10_3
      L10_3 = L10_3.Value
      L10_3 = L10_3(L11_3)
      L7_3 = L10_3
      L10_3 = ClubData
      L10_3 = L10_3.Ccba
      L11_3 = L10_3
      L10_3 = L10_3.Edit
      L12_3 = massEditCondition
      L13_3 = L9_3
      L14_3 = L7_3
      L15_3 = L8_3
      L16_3 = 0
      L17_3 = 1000000000
      L12_3, L13_3, L14_3, L15_3, L16_3, L17_3 = L12_3(L13_3, L14_3, L15_3, L16_3, L17_3)
      L10_3(L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.ebCtbu
    L8_3 = L10_3.Text
    L10_3 = MassEditManager
    L10_3 = L10_3.cbCtbu
    L9_3 = L10_3.ItemIndex
    L10_3 = #L8_3
    if L10_3 ~= 0 and L9_3 ~= 0 then
      L10_3 = ClubData
      L10_3 = L10_3.Ctbc
      L11_3 = L10_3
      L10_3 = L10_3.Value
      L10_3 = L10_3(L11_3)
      L7_3 = L10_3
      L10_3 = ClubData
      L10_3 = L10_3.Ctbc
      L11_3 = L10_3
      L10_3 = L10_3.Edit
      L12_3 = massEditCondition
      L13_3 = L9_3
      L14_3 = L7_3
      L15_3 = L8_3
      L16_3 = 0
      L17_3 = 1000000000
      L12_3, L13_3, L14_3, L15_3, L16_3, L17_3 = L12_3(L13_3, L14_3, L15_3, L16_3, L17_3)
      L10_3(L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.ebCrmb
    L8_3 = L10_3.Text
    L10_3 = MassEditManager
    L10_3 = L10_3.cbCrmb
    L9_3 = L10_3.ItemIndex
    L10_3 = #L8_3
    if L10_3 ~= 0 and L9_3 ~= 0 then
      L10_3 = ClubData
      L10_3 = L10_3.Crmb
      L11_3 = L10_3
      L10_3 = L10_3.Value
      L10_3 = L10_3(L11_3)
      L7_3 = L10_3
      L10_3 = ClubData
      L10_3 = L10_3.Crmb
      L11_3 = L10_3
      L10_3 = L10_3.Edit
      L12_3 = massEditCondition
      L13_3 = L9_3
      L14_3 = L7_3
      L15_3 = L8_3
      L16_3 = 0
      L17_3 = 1000000000
      L12_3, L13_3, L14_3, L15_3, L16_3, L17_3 = L12_3(L13_3, L14_3, L15_3, L16_3, L17_3)
      L10_3(L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.ebCmtp
    L8_3 = L10_3.Text
    L10_3 = MassEditManager
    L10_3 = L10_3.cbCmtp
    L9_3 = L10_3.ItemIndex
    L10_3 = #L8_3
    if L10_3 ~= 0 and L9_3 ~= 0 then
      L10_3 = ClubData
      L10_3 = L10_3.Cmtp
      L11_3 = L10_3
      L10_3 = L10_3.Value
      L10_3 = L10_3(L11_3)
      L7_3 = L10_3
      L10_3 = ClubData
      L10_3 = L10_3.Cmtp
      L11_3 = L10_3
      L10_3 = L10_3.Edit
      L12_3 = massEditCondition
      L13_3 = L9_3
      L14_3 = L7_3
      L15_3 = L8_3
      L16_3 = 1
      L17_3 = 300
      L12_3, L13_3, L14_3, L15_3, L16_3, L17_3 = L12_3(L13_3, L14_3, L15_3, L16_3, L17_3)
      L10_3(L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.ebCasp
    L8_3 = L10_3.Text
    L10_3 = MassEditManager
    L10_3 = L10_3.cbCasp
    L9_3 = L10_3.ItemIndex
    L10_3 = #L8_3
    if L10_3 ~= 0 and L9_3 ~= 0 then
      L10_3 = ClubData
      L10_3 = L10_3.Casp
      L11_3 = L10_3
      L10_3 = L10_3.Value
      L10_3 = L10_3(L11_3)
      L7_3 = L10_3
      L10_3 = ClubData
      L10_3 = L10_3.Casp
      L11_3 = L10_3
      L10_3 = L10_3.Edit
      L12_3 = massEditCondition
      L13_3 = L9_3
      L14_3 = L7_3
      L15_3 = L8_3
      L16_3 = 1
      L17_3 = 10000
      L12_3, L13_3, L14_3, L15_3, L16_3, L17_3 = L12_3(L13_3, L14_3, L15_3, L16_3, L17_3)
      L10_3(L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.ebCsth
    L8_3 = L10_3.Text
    L10_3 = MassEditManager
    L10_3 = L10_3.cbCsth
    L9_3 = L10_3.ItemIndex
    L10_3 = #L8_3
    if L10_3 ~= 0 and L9_3 ~= 0 then
      L10_3 = ClubData
      L10_3 = L10_3.Csth
      L11_3 = L10_3
      L10_3 = L10_3.Value
      L10_3 = L10_3(L11_3)
      L7_3 = L10_3
      L10_3 = ClubData
      L10_3 = L10_3.Csth
      L11_3 = L10_3
      L10_3 = L10_3.Edit
      L12_3 = massEditCondition
      L13_3 = L9_3
      L14_3 = L7_3
      L15_3 = L8_3
      L16_3 = 1
      L17_3 = 200000
      L12_3, L13_3, L14_3, L15_3, L16_3, L17_3 = L12_3(L13_3, L14_3, L15_3, L16_3, L17_3)
      L10_3(L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.cbChsd
    L8_3 = L10_3.ItemIndex
    if L8_3 ~= 0 then
      L10_3 = ClubData
      L10_3 = L10_3.Chsd
      L11_3 = L10_3
      L10_3 = L10_3.Edit
      L12_3 = L8_3
      L10_3(L11_3, L12_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.obCadm
    L8_3 = L10_3.Checked
    if L8_3 then
      L10_3 = ClubData
      L10_3 = L10_3.Cadm
      L11_3 = L10_3
      L10_3 = L10_3.Edit
      L12_3 = L8_3
      L10_3(L11_3, L12_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.obCp01
    L8_3 = L10_3.Checked
    if L8_3 then
      L10_3 = maxTacticalFamiliarity
      L11_3 = L2_3
      L12_3 = false
      L10_3(L11_3, L12_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.obCp02
    L8_3 = L10_3.Checked
    if L8_3 then
      L10_3 = maxTeamCohesion
      L11_3 = L2_3
      L12_3 = false
      L10_3(L11_3, L12_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.obCp03
    L8_3 = L10_3.Checked
    if L8_3 then
      L10_3 = clubNoTransferActivity
      L11_3 = L2_3
      L12_3 = false
      L10_3(L11_3, L12_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.obCp04
    L8_3 = L10_3.Checked
    if L8_3 then
      L10_3 = matchTeamCA_PA
      L11_3 = L2_3
      L12_3 = 1
      L13_3 = false
      L10_3(L11_3, L12_3, L13_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.obCp05
    L8_3 = L10_3.Checked
    if L8_3 then
      L10_3 = hackTeamProfessionalism
      L11_3 = L2_3
      L12_3 = true
      L13_3 = false
      L10_3(L11_3, L12_3, L13_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.obCp06
    L8_3 = L10_3.Checked
    if L8_3 then
      L10_3 = removeTeamInjuries
      L11_3 = L2_3
      L12_3 = 10000
      L13_3 = false
      L10_3(L11_3, L12_3, L13_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.obCp07
    L8_3 = L10_3.Checked
    if L8_3 then
      L10_3 = removeTeamInjuries
      L11_3 = L2_3
      L12_3 = 25000
      L13_3 = false
      L10_3(L11_3, L12_3, L13_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.obCp08
    L8_3 = L10_3.Checked
    if L8_3 then
      L10_3 = destroyTeam
      L11_3 = L2_3
      L12_3 = false
      L10_3(L11_3, L12_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.obCp09
    L8_3 = L10_3.Checked
    if L8_3 then
      L10_3 = registerTeam
      L11_3 = L2_3
      L12_3 = 8
      L13_3 = false
      L14_3 = false
      L10_3(L11_3, L12_3, L13_3, L14_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.obCp10
    L8_3 = L10_3.Checked
    if L8_3 then
      L10_3 = registerTeam
      L11_3 = L2_3
      L12_3 = 0
      L13_3 = false
      L14_3 = false
      L10_3(L11_3, L12_3, L13_3, L14_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.obCp11
    L8_3 = L10_3.Checked
    if L8_3 then
      L10_3 = registerTeam
      L11_3 = L2_3
      L12_3 = 3
      L13_3 = false
      L14_3 = false
      L10_3(L11_3, L12_3, L13_3, L14_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.obCp12
    L8_3 = L10_3.Checked
    if L8_3 then
      L10_3 = wageAdjustmentAllPlayers
      L11_3 = L2_3
      L12_3 = 1
      L13_3 = false
      L10_3(L11_3, L12_3, L13_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.obCp13
    L8_3 = L10_3.Checked
    if L8_3 then
      L10_3 = wageAdjustmentAllPlayers
      L11_3 = L2_3
      L12_3 = 2
      L13_3 = false
      L10_3(L11_3, L12_3, L13_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.obCp14
    L8_3 = L10_3.Checked
    if L8_3 then
      L10_3 = cutAllPlayersWage
      L11_3 = L2_3
      L12_3 = 25
      L13_3 = false
      L10_3(L11_3, L12_3, L13_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.obCp15
    L8_3 = L10_3.Checked
    if L8_3 then
      L10_3 = cutAllPlayersWage
      L11_3 = L2_3
      L12_3 = 50
      L13_3 = false
      L10_3(L11_3, L12_3, L13_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.obCp16
    L8_3 = L10_3.Checked
    if L8_3 then
      L10_3 = cutAllPlayersWage
      L11_3 = L2_3
      L12_3 = 75
      L13_3 = false
      L10_3(L11_3, L12_3, L13_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.obCp17
    L8_3 = L10_3.Checked
    if L8_3 then
      L10_3 = extendAllPlayersContract
      L11_3 = L2_3
      L12_3 = 1
      L13_3 = 2
      L14_3 = false
      L10_3(L11_3, L12_3, L13_3, L14_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.obCp18
    L8_3 = L10_3.Checked
    if L8_3 then
      L10_3 = extendAllPlayersContract
      L11_3 = L2_3
      L12_3 = 5
      L13_3 = 2
      L14_3 = false
      L10_3(L11_3, L12_3, L13_3, L14_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.obCp19
    L8_3 = L10_3.Checked
    if L8_3 then
      L10_3 = extendAllPlayersContract
      L11_3 = L2_3
      L12_3 = 10
      L13_3 = 2
      L14_3 = false
      L10_3(L11_3, L12_3, L13_3, L14_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.obCp20
    L8_3 = L10_3.Checked
    if L8_3 then
      L10_3 = extendAllPlayersContract
      L11_3 = L2_3
      L12_3 = 50
      L13_3 = 2
      L14_3 = false
      L10_3(L11_3, L12_3, L13_3, L14_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.obCp21
    L8_3 = L10_3.Checked
    if L8_3 then
      L10_3 = lifetimeContractAllPlayers
      L11_3 = L2_3
      L12_3 = true
      L13_3 = false
      L10_3(L11_3, L12_3, L13_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.obCp22
    L8_3 = L10_3.Checked
    if L8_3 then
      L10_3 = wageAdjustmentAllStaff
      L11_3 = L2_3
      L12_3 = 1
      L13_3 = false
      L10_3(L11_3, L12_3, L13_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.obCp23
    L8_3 = L10_3.Checked
    if L8_3 then
      L10_3 = wageAdjustmentAllStaff
      L11_3 = L2_3
      L12_3 = 2
      L13_3 = false
      L10_3(L11_3, L12_3, L13_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.obCp24
    L8_3 = L10_3.Checked
    if L8_3 then
      L10_3 = cutAllStaffWage
      L11_3 = L2_3
      L12_3 = 25
      L13_3 = false
      L10_3(L11_3, L12_3, L13_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.obCp25
    L8_3 = L10_3.Checked
    if L8_3 then
      L10_3 = cutAllStaffWage
      L11_3 = L2_3
      L12_3 = 50
      L13_3 = false
      L10_3(L11_3, L12_3, L13_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.obCp26
    L8_3 = L10_3.Checked
    if L8_3 then
      L10_3 = cutAllStaffWage
      L11_3 = L2_3
      L12_3 = 75
      L13_3 = false
      L10_3(L11_3, L12_3, L13_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.obCp27
    L8_3 = L10_3.Checked
    if L8_3 then
      L10_3 = extendAllStaffContract
      L11_3 = L2_3
      L12_3 = 1
      L13_3 = 2
      L14_3 = false
      L10_3(L11_3, L12_3, L13_3, L14_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.obCp28
    L8_3 = L10_3.Checked
    if L8_3 then
      L10_3 = extendAllStaffContract
      L11_3 = L2_3
      L12_3 = 5
      L13_3 = 2
      L14_3 = false
      L10_3(L11_3, L12_3, L13_3, L14_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.obCp29
    L8_3 = L10_3.Checked
    if L8_3 then
      L10_3 = extendAllStaffContract
      L11_3 = L2_3
      L12_3 = 10
      L13_3 = 2
      L14_3 = false
      L10_3(L11_3, L12_3, L13_3, L14_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.obCp30
    L8_3 = L10_3.Checked
    if L8_3 then
      L10_3 = extendAllStaffContract
      L11_3 = L2_3
      L12_3 = 50
      L13_3 = 2
      L14_3 = false
      L10_3(L11_3, L12_3, L13_3, L14_3)
    end
    L10_3 = MassEditManager
    L10_3 = L10_3.obCp31
    L8_3 = L10_3.Checked
    if L8_3 then
      L10_3 = lifetimeContractAllStaff
      L11_3 = L2_3
      L12_3 = true
      L13_3 = false
      L10_3(L11_3, L12_3, L13_3)
    end
    L10_3 = L0_2
    L10_3 = L10_3 + 1
    L0_2 = L10_3
  end
  
  L4_2(L5_2, L6_2, L7_2, L8_2)
  L3_2.Position = 0
  L4_2 = MessageDialog
  L5_2 = string
  L5_2 = L5_2.format
  L6_2 = [[
  Item(s) edited : %d
  Elapsed time is: %.3f s
  ]]
  L7_2 = L0_2
  L8_2 = os
  L8_2 = L8_2.clock
  L8_2 = L8_2()
  L8_2 = L8_2 - L1_2
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L6_2 = 2
  return L4_2(L5_2, L6_2)
end

massEditClubs = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "massEditClubs"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L2_2 = getAddressSafe
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 == nil or L2_2 == 0 then
    return
  end
  L3_2 = getAddressSafe
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  if L3_2 == nil or L3_2 == 0 then
    return
  end
  L4_2 = getClubFromTeam
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  if L4_2 == nil or L4_2 == 0 then
    return
  end
  L5_2 = getClubFromTeam
  L6_2 = L3_2
  L5_2 = L5_2(L6_2)
  if L5_2 == nil or L5_2 == 0 then
    return
  end
  L6_2 = typeOptionMaps
  L6_2 = L6_2.teamType
  L7_2 = readByte
  L8_2 = teao
  L8_2 = L8_2.Ttyp
  L8_2 = L2_2 + L8_2
  L7_2 = L7_2(L8_2)
  L6_2 = L6_2[L7_2]
  if L6_2 == 0 then
    return
  end
  L7_2 = os
  L7_2 = L7_2.clock
  L7_2 = L7_2()
  L8_2 = getClubNation
  L9_2 = L4_2
  L8_2 = L8_2(L9_2)
  L9_2 = getClubNation
  L10_2 = L5_2
  L9_2 = L9_2(L10_2)
  L10_2 = getCompetitionFromTeam
  L11_2 = L2_2
  L10_2 = L10_2(L11_2)
  L11_2 = getCompetitionFromTeam
  L12_2 = L3_2
  L11_2 = L11_2(L12_2)
  L12_2 = writeQword
  L13_2 = cluo
  L13_2 = L13_2.Cnti
  L13_2 = L4_2 + L13_2
  L14_2 = L9_2
  L12_2(L13_2, L14_2)
  L12_2 = writeQword
  L13_2 = cluo
  L13_2 = L13_2.Cccn
  L13_2 = L4_2 + L13_2
  L14_2 = L9_2
  L12_2(L13_2, L14_2)
  L12_2 = writeQword
  L13_2 = teao
  L13_2 = L13_2.Tdvi
  L13_2 = L2_2 + L13_2
  L14_2 = L11_2
  L12_2(L13_2, L14_2)
  L12_2 = writeQword
  L13_2 = cluo
  L13_2 = L13_2.Cnti
  L13_2 = L5_2 + L13_2
  L14_2 = L8_2
  L12_2(L13_2, L14_2)
  L12_2 = writeQword
  L13_2 = cluo
  L13_2 = L13_2.Cccn
  L13_2 = L5_2 + L13_2
  L14_2 = L8_2
  L12_2(L13_2, L14_2)
  L12_2 = writeQword
  L13_2 = teao
  L13_2 = L13_2.Tdvi
  L13_2 = L3_2 + L13_2
  L14_2 = L10_2
  L12_2(L13_2, L14_2)
  L12_2 = MessageDialog
  L13_2 = string
  L13_2 = L13_2.format
  L14_2 = [[
  Operation Success!
  Elapsed time is: %.3f s
  ]]
  L15_2 = os
  L15_2 = L15_2.clock
  L15_2 = L15_2()
  L15_2 = L15_2 - L7_2
  L13_2 = L13_2(L14_2, L15_2)
  L14_2 = 2
  return L12_2(L13_2, L14_2)
end

SwapClub = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "SwapClub"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2
  if A0_2 == true and A1_2 == false then
    L2_2 = false
    return L2_2
  elseif A0_2 == true and A1_2 == true then
    L2_2 = true
    return L2_2
  elseif A0_2 == false and A1_2 == true then
    L2_2 = true
    return L2_2
  elseif A0_2 == false and A1_2 == false then
    L2_2 = true
    return L2_2
  end
end

checkExclusivePresets = L8_1

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = getAddressList
  L2_2 = L2_2()
  L2_2 = L2_2.getMemoryRecordByID
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= nil then
    L3_2 = 5
    L4_2 = tableVersion
    if L3_2 ~= L4_2 then
      function L4_2(A0_3, A1_3, A2_3)
        local L3_3
        
        L3_3 = true
        return L3_3
      end
      
      L2_2.OnActivate = L4_2
      
      function L4_2(A0_3, A1_3, A2_3)
        local L3_3
        L3_3 = true
        return L3_3
      end
      
      L2_2.OnDeactivate = L4_2
      return
    end
    L4_2 = scriptDisable
    if L4_2 == nil then
      L4_2 = {}
      scriptDisable = L4_2
    end
    L4_2 = nil
    L5_2 = getExclusivePresets
    L5_2 = L5_2()
    L6_2 = L5_2[A1_2]
    if L6_2 == nil then
      return
    end
    L6_2 = L5_2[A1_2]
    L6_2 = L6_2.Script
    L7_2 = L5_2[A1_2]
    L7_2 = L7_2.Premium
    
    function L8_2(A0_3, A1_3, A2_3)
      local L3_3, L4_3, L5_3, L6_3
      L3_3 = A0_3.Active
      if L3_3 then
        L3_3 = checkExclusivePresets
        L4_3 = L7_2
        L5_3 = tableIsPremium
        L3_3 = L3_3(L4_3, L5_3)
        if L3_3 then
          L3_3 = scriptDisable
          L4_3 = A1_2
          L5_3 = autoAssemble
          L6_3 = L6_2
          L5_3, L6_3 = L5_3(L6_3)
          L3_3[L4_3] = L6_3
          L4_2 = L5_3
        else
          L3_3 = exclusiveFeature
          L4_3 = A0_3
          L3_3(L4_3)
        end
      end
      L3_3 = true
      return L3_3
    end
    
    L2_2.OnActivate = L8_2
    
    function L8_2(A0_3, A1_3, A2_3)
      local L3_3, L4_3, L5_3, L6_3
      L3_3 = A0_3.Active
      if not L3_3 then
        L3_3 = checkExclusivePresets
        L4_3 = L7_2
        L5_3 = tableIsPremium
        L3_3 = L3_3(L4_3, L5_3)
        if L3_3 then
          L3_3 = autoAssemble
          L4_3 = L6_2
          L5_3 = scriptDisable
          L6_3 = A1_2
          L5_3 = L5_3[L6_3]
          L3_3(L4_3, L5_3)
          L3_3 = scriptDisable
          L4_3 = A1_2
          L3_3[L4_3] = nil
        end
      end
      L3_3 = true
      return L3_3
    end
    
    L2_2.OnDeactivate = L8_2
  end
  return
end

enableExclusivePresets = L8_1

function L8_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = {}
  L0_2[0] = [[
// 26.1.1
// 41 0F B7 ?? xx xx 00 00 66
// xx xx > plao.Pcab
[ENABLE]
aobscanmodule(glpr_acpd, $expectedModule, 41 0F B7 87 64 02 00 00 66 01)
alloc(newmem,$1000,glpr_acpd)
label(exit)
label(return)

label(fnItemSelector)
label(lbLoopItemSelector)
label(lbRetItemSelector)

label(fnItemSelection)
label(lbSelectComp)
label(lbSelectContinent)
label(lbSelectNation)
label(lbSelectPerson)
label(lbSelectTeam)
label(lbRetItemSelection)

label(fnAgeFilter)
label(lbSkipAgeFilter)
label(lbRetAgeFilter)

label(fnRolesFilter)
label(fnRoles_0)
label(fnRoles_1)
label(fnRoles_2)
label(fnRoles_3)
label(fnRoles_4)
label(lbRetRolesFilter)

label(fnAttributesBooster)
label(lbAttributesMult)
label(lbRetAttributesBooster)

label(fnTrainingPtsMult)
label(lbRetTrainingPtsMult)

label(xxetbzjy)

newmem:
  movzx eax,word ptr [r15+00000264]
  push rax
  push rbx
	push rdx
	push r10
	push r11
	push r12

  movzx ebx,word ptr [r15+00000266]

  cmp eax,ebx
  je exit
	
	xor r10,r10

	// Get Person Pointer
  mov r11,[r15+8]
	mov edx,[r11+4]

  mov r10d,$playerOffset
	sub r10d,8
	cmp edx,r10d
	je @f

  mov r10d,$playerStaffOffset
	sub r10d,8
	cmp edx,r10d
	je @f

	jmp exit
	
@@:
  mov r11,r15
	add r11,r10
	add r11,8

  test r11,r11
  je exit

	mov r12,xxetbzjy

	call fnItemSelector

exit:
	pop r12
	pop r11
	pop r10
	pop rdx
  pop rbx
  pop rax
  
	jmp return
	
// rax		Item Base Pointer (Temp)
// rdx		Is Active / Item Type Flag
// rsi		Item's Unique ID
// r8			Counter

// r11    Person Pointer
// r12		Item Base Pointer
// r13		Item Pointer

// r15		Player Pointer
// rdi		Training Points
fnItemSelector:
  push rax
	push rdx
	push rsi
	push r8
  push r13

	xor rax,rax

	xor rdx,rdx
	xor rsi,rsi

	xor r8,r8
	xor r13,r13

	mov r8b,0

	lea rax,[r12]

lbLoopItemSelector:
	mov	r13,[rax+r8*8]
	cmp r13,0
	je lbRetItemSelector

	mov dl,[r13]		// Is Active ?
	cmp dl,0
	je lbRetItemSelector

	mov esi,[r13+2] // Has Unique ID ?
	cmp esi,0
	je lbRetItemSelector

	mov dl,[r13+1]	// Item Type

	call fnItemSelection

lbRetItemSelector:
	inc r8b
	cmp r8b,[r12+100]
	jb lbLoopItemSelector

  pop r13
	pop r8

	pop rsi
	pop rdx

  pop rax

	ret

// rax		Offsets
// rbx		Offsets, Entity
// rcx		Club's Team
// r8			Object Base Pointer

// rdx		Item Type
// r12		Item Base Pointer

// r15		Player Pointer
// rdi		Training Points
fnItemSelection:
  push rax
  push rbx
  push rcx
	push r8

	cmp dl,01									// Item Type : Person
	je lbSelectPerson

	cmp dl,05									// Item Type : Continent
	je lbSelectContinent
	
	cmp dl,09									// Item Type : Nation
	je lbSelectNation

	cmp dl,18									// Item Type : Team
  je lbSelectTeam

	cmp dl,19									// Item Type : Competition
	je lbSelectComp

	jmp lbRetItemSelection

lbSelectComp:
	xor rax,rax
	xor rcx,rcx
	xor r8,r8

  mov eax,$plao.Pctm

  mov rcx,[r15+eax]
  test rcx,rcx
  je lbRetItemSelection

  xor eax,eax
  mov eax,$teao.Tdvi

  mov r8,[rcx+eax]
  test r8,r8
  je lbRetItemSelection

  mov eax,[r8+0C]

  cmp eax,esi
  jne lbRetItemSelection

  call fnAgeFilter

	jmp lbRetItemSelection

lbSelectContinent:
	xor rax,rax
	xor rbx,rbx
	xor rcx,rcx
	xor r8,r8

  mov eax,$plao.Pctm

  mov rcx,[r15+eax]
  test rcx,rcx
  je lbRetItemSelection

  xor eax,eax
  mov eax,$teao.Tclu

  mov rbx,[rcx+eax]
  test rbx,rbx
  je lbRetItemSelection

  xor eax,eax
  mov eax,$cluo.Cnti

  mov rbx,[rbx+eax]
  test rbx,rbx
  je lbRetItemSelection

  xor eax,eax
  mov eax,$nato.Ncti

  mov r8,[rbx+eax]
  test r8,r8
  je lbRetItemSelection

  mov eax,[r8+0C]

  cmp eax,esi
  jne lbRetItemSelection

  call fnAgeFilter

	jmp lbRetItemSelection

lbSelectNation:
	xor rax,rax
	xor rbx,rbx
	xor rcx,rcx
	xor r8,r8

  mov eax,$plao.Pctm

  mov rcx,[r15+eax]
  test rcx,rcx
  je lbRetItemSelection

  xor eax,eax
  mov eax,$teao.Tclu

  mov rbx,[rcx+eax]
  test rbx,rbx
  je lbRetItemSelection

  xor eax,eax
  mov eax,$cluo.Cnti

  mov r8,[rbx+eax]
  test r8,r8
  je lbRetItemSelection

  mov eax,[r8+0C]

  cmp eax,esi
  jne lbRetItemSelection

  call fnAgeFilter

	jmp lbRetItemSelection

lbSelectPerson:
	xor rax,rax

  mov eax,[r11+0C]

  cmp eax,esi
  jne lbRetItemSelection

  call fnAttributesBooster

	jmp lbRetItemSelection

lbSelectTeam:
	xor rax,rax
	xor r8,r8

  mov eax,$plao.Pctm

  mov r8,[r15+eax]
  test r8,r8
  je lbRetItemSelection

  mov eax,[r8+0C]

  cmp eax,esi
  jne lbRetItemSelection

  call fnAgeFilter

	jmp lbRetItemSelection

lbRetItemSelection:
  pop r8
  pop rcx
	pop rbx
  pop rax

	ret

// Age Filter
fnAgeFilter:
  push rax
  push rbx
  push rdx
  push r10
	
	mov al,[r13+06]
	cmp al,0
	je lbSkipAgeFilter
	
	// Person Birth Year
  mov edx,$pero.Pdob
	movzx eax,word ptr [r11+edx+2]
	
	// Current Year
  mov rdx,datTimeRoot
	movzx ebx,word ptr [rdx+2]
	
	sub bx,ax
	
	xor r10,r10
	mov r10w,bx	
	
	// Person Birth Day
  mov edx,$pero.Pdob
	movzx eax,word ptr [r11+edx]
	and eax,000001FF
	
	// Current Day
  mov rdx,datTimeRoot
	movzx ebx,word ptr [rdx]
	and ebx,000001FF
	
	cmp ebx,eax
	jg @f
	
	dec r10w

@@:	
	mov al,[r13+06]
	cmp r10b,al	
	jg lbRetAgeFilter
	
lbSkipAgeFilter:	
	call fnRolesFilter
	
lbRetAgeFilter:
  pop r10
  pop rdx
  pop rbx
  pop rax

	ret
	
// Roles Filter
fnRolesFilter:
	push rax
	push r8
	push r10

	xor r8,r8
	xor r10,r10

	mov r10b,[r13+08]
  mov r8d,$plao.Ppos

  xor eax,eax
  mov al,[r13+07]

	cmp al,0
	je fnRoles_0

	cmp al,1
	je fnRoles_1

	cmp al,2
	je fnRoles_2

	cmp al,3
	je fnRoles_3

	cmp al,4
	je fnRoles_4

	jmp lbRetRolesFilter

fnRoles_1:
	cmp byte ptr [r15+r8+0],r10b
	jnl fnRoles_0

	cmp byte ptr [r15+r8+3],r10b
	jnl fnRoles_0

	jmp lbRetRolesFilter

fnRoles_2:
	cmp byte ptr [r15+r8+5],r10b
	jnl fnRoles_0

	cmp byte ptr [r15+r8+7],r10b
	jnl fnRoles_0

	cmp byte ptr [r15+r8+A],r10b
	jnl fnRoles_0

	jmp lbRetRolesFilter

fnRoles_3:
	cmp byte ptr [r15+r8+2],r10b
	jnl fnRoles_0

	cmp byte ptr [r15+r8+4],r10b
	jnl fnRoles_0

	cmp byte ptr [r15+r8+6],r10b
	jnl fnRoles_0

	cmp byte ptr [r15+r8+8],r10b
	jnl fnRoles_0

	cmp byte ptr [r15+r8+9],r10b
	jnl fnRoles_0

	cmp byte ptr [r15+r8+B],r10b
	jnl fnRoles_0

	cmp byte ptr [r15+r8+D],r10b
	jnl fnRoles_0

	cmp byte ptr [r15+r8+E],r10b
	jnl fnRoles_0

	jmp lbRetRolesFilter

fnRoles_4:
	cmp byte ptr [r15+r8+C],r10b
	jl lbRetRolesFilter

fnRoles_0:
	call fnAttributesBooster

lbRetRolesFilter:
	pop r10
	pop r8
	pop rax
	ret

// Priority Attributes
fnAttributesBooster:
	push rax
	push rbx
	push rdx
	
  xor rax,rax
  xor rbx,rbx
	xor rdx,rdx

  mov al,[r13+0A]
  cmp al,0
  je lbRetAttributesBooster

  mov al,[r13+09]
	
  cmp al,1
  jg @f
  mov dl,62
  mov bl,2
  jmp lbAttributesMult

@@:
  cmp al,2
  jg @f
  mov dl,60
  mov bl,3
  jmp lbAttributesMult

@@:	
  cmp al,3
  jg @f
  mov dl,5F
  mov bl,5
  jmp lbAttributesMult

@@:
  cmp al,5
  jg @f
  mov dl,5A
  mov bl,A
  jmp lbAttributesMult

@@:
  cmp al,7
  jg @f
  mov dl,55
  mov bl,F
  jmp lbAttributesMult

@@:
  mov dl,50
  mov bl,14

lbAttributesMult:
  xor rax,rax

  mov ax,[r13+0B]
  cmp ax,0
  je @f
  cmp byte ptr [r15+eax],dl
  jg @f
  add byte ptr [r15+eax],bl

@@:
  mov ax,[r13+0D]
  cmp ax,0
  je @f
  cmp byte ptr [r15+eax],dl
  jg @f
  add byte ptr [r15+eax],bl

@@:
  mov ax,[r13+0F]
  cmp ax,0
  je @f
  cmp byte ptr [r15+eax],dl
  jg @f
  add byte ptr [r15+eax],bl

@@:
  mov ax,[r13+11]
  cmp ax,0
  je @f
  cmp byte ptr [r15+eax],dl
  jg @f
  add byte ptr [r15+eax],bl

@@:
  mov ax,[r13+13]
  cmp ax,0
  je @f
  cmp byte ptr [r15+eax],dl
  jg @f
  add byte ptr [r15+eax],bl

lbRetAttributesBooster:
	call fnTrainingPtsMult

  pop rdx
  pop rbx
  pop rax

	ret

// Training Points Multiplier
// rdi		Training Points
fnTrainingPtsMult:
	push rax

  xor rax,rax

  cmp di,FFFF
  jne @f

  mov di,1

@@:
  cmp di,0
  jne @f

  mov di,1

@@:
  mov ax,di

	xor di,di
	mov dil,[r13+09]

  imul ax,di

  //cmp ax,7F
  //jg lbRetTrainingPtsMult

  mov di,ax

lbRetTrainingPtsMult:
	pop rax

  ret

xxetbzjy:
	dq 0

glpr_acpd:
  jmp newmem
  nop 3
return:

registersymbol(glpr_acpd)
registersymbol(xxetbzjy)

[DISABLE]
glpr_acpd:
  db 41 0F B7 87 64 02 00 00

unregistersymbol(*)
dealloc(*)
]]
  L0_2[1] = [[
// 26.1.1
[ENABLE]
aobscanmodule(glpr_fbr1, $expectedModule, 83 00 00 00 01 48 89 ?? ?? 03 00 00) //  83 00 00 00 01 48 89 ?? ?? 03 00 00
aobscanmodule(glpr_fbr2, $expectedModule, 0F B6 4E 6B 01 C1) // 0F B6 ?? 6B ?? C1 ??
alloc(newmem,$1000,glpr_fbr1)
registersymbol(glpr_fbr0,glpr_fbr1,glpr_fbr2)
newmem:
glpr_fbr0:
  readmem(glpr_fbr1+1A,6)
  readmem(glpr_fbr2+0D,2)
glpr_fbr1+1A:
  nop 6
glpr_fbr2+0D:
  nop 2
[DISABLE]
glpr_fbr1+1A:
  readmem(glpr_fbr0,6)
glpr_fbr2+06:
  readmem(glpr_fbr0+06,2)
unregistersymbol(*)
dealloc(*)
]]
  L0_2[2] = "// 26.1.3\n// 0F BF 80 xx xx 00 00 B9\n// xx -> Player PA Offset\n[ENABLE]\naobscanmodule(glpr_gdgn, $expectedModule, 0F BF 80 66 02 00 00 B9)\nalloc(newmem,$2000,glpr_gdgn)\nlabel(exit)\nlabel(return)\n\nlabel(lastProcessedPlayer)\nlabel(hdeffxoa)\n// ===============================\n// MAIN HOOK\n// ===============================\nnewmem:\n// r11    Person Pointer\n// r12\t\tItem Base Pointer\n// r13\t\tItem Pointer\n// r15\t\tTeam Pointer\n\n// rax\t\tPlayer Pointer\n\n\tpush rdx\n\tpush r10\n\tpush r11\n\tpush r12\n\tpush r15\n\n\t// Check player (cache)\n  mov r12,[lastProcessedPlayer]\t\t\t\t\t// last cached player\n  cmp r12,rax\t\t\t\t\t\t\t\t\t// compare with current\n  je exit\t\t\t\t\t\t\t\t\t\t\t// same as before -> skip\n\n  mov [lastProcessedPlayer],rax\t\t\t\t\t// cache current player\n\n\t// Get Person Pointer\n  mov r11,[rax+8]\n\tmov edx,[r11+4]\n\n  mov r10d,$playerOffset\n\tsub r10d,8\n\tcmp edx,r10d\n\tje @f\n\n\tjmp exit\n\n@@:\n  mov r11,rax\n\tadd r11,r10\n\tadd r11,8\n\n  test r11,r11\n  je exit\n\n  cmp [r11],vtbPlayer\n  jne exit\n\n\t// Get Team Pointer\n\tmov r15,[rsp+70]    \t\t\t// Pointer to Team, offset sudah dikompensasi\n  test r15,r15\n  je exit\n\n  cmp [r15],vtbTeam\n  jne exit\n\n\t// Move allocated pointer to register\n  mov r12,hdeffxoa\n\n\tcall fnItemSelector\n\nexit:\n\tpop r15\n\tpop r12\n\tpop r11\n\tpop r10\n\tpop rdx\n\n  movsx eax,word ptr [rax+00000266]\n  jmp return\n\n// ===============================\n// ITEM SELECTOR\n// ===============================\n// rbx\t\tItem Base Pointer (Temp)\n// rdx\t\tIs Active / Item Type Flag\n// rsi\t\tItem's Unique ID\n// r8\t\t\tCounter\n\n// r11    Person Pointer\n// r12\t\tItem Base Pointer\n// r13\t\tItem Pointer\n// r15\t\tTeam Pointer\n\n// rax\t\tPlayer Pointer\nfnItemSelector:\n  push rbx\n\tpush rdx\n\tpush rsi\n\tpush r8\n  push r13\n\n\txor rbx,rbx\n\n\txor rdx,rdx\n\txor rsi,rsi\n\n\txor r8,r8\n\txor r13,r13\n\n\tmov r8b,0\n\n\tlea rbx,[r12]\n\nlbLoopItemSelector:\n\tmov\tr13,[rbx+r8*8]\n\tcmp r13,0\n\tje lbRetItemSelector\n\n\tmov dl,[r13]\t\t// Is Active ?\n\tcmp dl,0\n\tje lbRetItemSelector\n\n\tmov esi,[r13+2] // Has Unique ID ?\n\tcmp esi,0\n\tje lbRetItemSelector\n\n\tmov dl,[r13+1]\t// Item Type\n\n\tcall fnItemSelection\n\nlbRetItemSelector:\n\tinc r8b\n\tcmp r8b,[r12+100]\n\tjb lbLoopItemSelector\n\n  pop r13\n\tpop r8\n\n\tpop rsi\n\tpop rdx\n\n  pop rbx\n\n\tret\n\n// ===============================\n// ITEM SELECTION\n// ===============================\n// rbx\t\tOffsets, Entity\n// rdx\t\tIs Active / Item Type Flag\n// rcx\t\tClub's Team\n// r8\t\t\tObject Base Pointer\n// r9\t\t\tOffsets\n\n// r11    Person Pointer\n// r12\t\tItem Base Pointer\n// r13\t\tItem Pointer\n// r15\t\tTeam Pointer\n\n// rax\t\tPlayer Pointer\nfnItemSelection:\n\tpush r8\n  push r9\n\n\tcmp dl,03\t\t\t\t\t\t\t\t\t// Item Type : Club\n  je lbSelectClub\n\n\tcmp dl,05\t\t\t\t\t\t\t\t\t// Item Type : Continent\n\tje lbSelectContinent\n\n\tcmp dl,09\t\t\t\t\t\t\t\t\t// Item Type : Nation\n\tje lbSelectNation\n\n\tcmp dl,19\t\t\t\t\t\t\t\t\t// Item Type : Competition\n\tje lbSelectComp\n\n\tjmp lbRetItemSelection\n\nlbSelectClub:\n\txor r8,r8\n\txor r9,r9\n\n  mov r9d,$teao.Tclu\n\n  mov r8,[r15+r9d]\n  test r8,r8\n  je lbRetItemSelection\n\n  mov r9d,[r8+0C]\n\n  cmp r9d,esi\n  jne lbRetItemSelection\n\n  call fnRegensPAMod\n\n\tjmp lbRetItemSelection\n\nlbSelectComp:\n\txor r8,r8\n\txor r9,r9\n\n  mov r9d,$teao.Tdvi\n\n  mov r8,[r15+r9d]\n  test r8,r8\n  je lbRetItemSelection\n\n  mov r9d,[r8+0C]\n\n  cmp r9d,esi\n  jne lbRetItemSelection\n\n  call fnRegensPAMod\n\n\tjmp lbRetItemSelection\n\nlbSelectContinent:\n\txor r8,r8\n\txor r9,r9\n\n  mov r9d,$teao.Tclu\n\n  mov r8,[r15+r9d]\n  test r8,r8\n  je lbRetItemSelection\n\n  xor r9d,r9d\n  mov r9d,$cluo.Cnti\n\n  mov r8,[r8+r9d]\n  test r8,r8\n  je lbRetItemSelection\n\n  xor r9d,r9d\n  mov r9d,$nato.Ncti\n\n  mov r8,[r8+r9d]\n  test r8,r8\n  je lbRetItemSelection\n\n  mov r9d,[r8+0C]\n\n  cmp r9d,esi\n  jne lbRetItemSelection\n\n  call fnRegensPAMod\n\n\tjmp lbRetItemSelection\n\nlbSelectNation:\n\txor r8,r8\n\txor r9,r9\n\n  mov r9d,$teao.Tclu\n\n  mov r8,[r15+r9d]\n  test r8,r8\n  je lbRetItemSelection\n\n  xor r9d,r9d\n  mov r9d,$cluo.Cnti\n\n  mov r8,[r8+r9d]\n  test r8,r8\n  je lbRetItemSelection\n\n  mov r9d,[r8+0C]\n\n  cmp r9d,esi\n  jne lbRetItemSelection\n\n  call fnRegensPAMod\n\n\tjmp lbRetItemSelection\n\nlbRetItemSelection:\n\tpop r9\n  pop r8\n\n\tret\n\n// ===============================\n// APPLY PA MOD\n// ===============================\n// rbx\t\tOffsets, Entity\n// r9\t\t\tMin PA\n// r10\t\tMax PA\n\n// r11    Person Pointer\n// r12\t\tItem Base Pointer\n// r13\t\tItem Pointer\n// r15\t\tTeam Pointer\n\n// rax\t\tPlayer Pointer\nfnRegensPAMod:\n\tpush rbx\n\tpush rcx\n\tpush rdx\n\tpush r9\n\tpush r10\n\n\txor rbx,rbx\n\txor r9,r9\n\txor r10,r10\n\n  mov bl,byte ptr [r13+08]\n  cmp bl,00\n\tje lbRetRegensPAMod\n  cmp bl,01\n\tje lbRegensPAModPresets\n  cmp bl,02\n\tje lbRegensPAModCustom\n\n\tjmp lbRetRegensPAMod\n\nlbRegensPAModPresets:\n  mov bl,byte ptr [r13+09]\n\n  mov r9w,000A\n  mov r10w,001E\n\n  cmp bl,00\n  jne @f\n  mov r9w,000A\n  mov r10w,001E\n\n@@:\n  cmp bl,01\n  jne @f\n  mov r9w,000A\n  mov r10w,0028\n\n@@:\n  cmp bl,02\n  jne @f\n  mov r9w,0014\n  mov r10w,0032\n\n@@:\n  cmp bl,03\n  jne @f\n  mov r9w,001E\n  mov r10w,003C\n\n@@:\n  cmp bl,04\n  jne @f\n  mov r9w,0028\n  mov r10w,0046\n\n@@:\n  cmp bl,05\n  jne @f\n  mov r9w,0032\n  mov r10w,0050\n\n@@:\n  cmp bl,06\n  jne @f\n  mov r9w,003C\n  mov r10w,005A\n\n@@:\n  cmp bl,07\n  jne @f\n  mov r9w,0046\n  mov r10w,0064\n\n@@:\n  cmp bl,08\n  jne @f\n  mov r9w,0050\n  mov r10w,006E\n\n@@:\n  cmp bl,09\n  jne @f\n  mov r9w,005A\n  mov r10w,0078\n\n@@:\n  cmp bl,0A\n  jne @f\n  mov r9w,0064\n  mov r10w,0082\n\n@@:\n  cmp bl,0B\n  jne @f\n  mov r9w,006E\n  mov r10w,008C\n\n@@:\n  cmp bl,0C\n  jne @f\n  mov r9w,0078\n  mov r10w,0096\n\n@@:\n  cmp bl,0D\n  jne @f\n  mov r9w,0082\n  mov r10w,00A0\n\n@@:\n  cmp bl,0E\n  jne @f\n  mov r9w,008C\n  mov r10w,00AA\n\n@@:\n  cmp bl,0F\n  jne @f\n  mov r9w,0096\n  mov r10w,00B4\n\n@@:\n  cmp bl,10\n  jne @f\n  mov r9w,00A0\n  mov r10w,00BE\n\n@@:\n  cmp bl,11\n  jne lbRndomizeRegensPAMod\n  mov r9w,00AA\n  mov r10w,00C8\n\n\tjmp lbRndomizeRegensPAMod\n\nlbRegensPAModCustom:\n  mov r9w,word ptr [r13+0A]\n  mov r10w,word ptr [r13+0C]\n\nlbRndomizeRegensPAMod:\n// ===============================\n// Randomize PA Based on Min Max Value\n// ===============================\n// Randomize PA\n// r9w  = Min PA\n// r10w = Max PA\n// Result -> r9d\n\tpush rax\n\n\trdtsc\n\txor edx,eax\n\tmov r8d,edx              // r8d = seed\n\n// ===============================\n// 1/64 Super Elite Chance\n// ===============================\n\tmov ecx,r8d\n\tand ecx,63\n\tcmp ecx,0\n\tjne @normal_random\n\n\t// SUPER ELITE \226\134\146 set max PA\n\tmovzx edx,r10w\n\tjmp short @applyPA\n\n// ===============================\n// range = max - min + 1\n// ===============================\n@normal_random:\n\tmovzx ecx,r10w           // ecx = max\n\tmovzx edx,r9w            // edx = min\n\tsub ecx,edx\n\tinc ecx                  // ecx = range\n\n// ===============================\n// remainder = seed % range\n// ===============================\n\tmov eax,r8d              // TEMPORARY lower 32 only eax = seed\n\txor edx,edx\n\tdiv ecx                  // edx = remainder\n\n\tadd edx,r9d              // final = min + remainder\n\n@applyPA:\n\tcmp edx,#200             // safety clamp\n\tjle @ok\n\tmov edx,#200\n\n@ok:\n  mov r9d,edx              // r9d = final PA\n\n\tpop rax\n\n\t// Apply to Player PA\n  mov word ptr[rax+266],r9w\n\nlbRetRegensPAMod:\n\tcall fnWonderkidGenerator\n\t\n\tpop r9\n\tpop r10\n\tpop rdx\n\tpop rcx\n\tpop rbx\n\n  ret\n\n// ===============================\n// WONDERKID GENERATOR\n// ===============================\n// r13 = Item Pointer\n// rax = Player Pointer\nfnWonderkidGenerator:\n  push rbx\n  push rcx\n  push rdx\n  push r8\n  push r9\n  push r10\n\tpush r11\n  push rax\n\n\tmov r11,rax        // save player pointer\n\n// --------------------------------\n// Check Wonderkid Flag\n// --------------------------------\n  mov bl,byte ptr [r13+0E]\n  cmp bl,0\n  je lbRetWonderkid\n\n// --------------------------------\n// Roll Chance (0\226\128\14799)\n// --------------------------------\n  movzx r8d,byte ptr [r13+0F]    // chance %\n  cmp r8d,0\n  je lbRetWonderkid\n\n  rdtsc\n  xor edx,eax\n  mov eax,edx\n  xor edx,edx\n  mov ecx,#100\n  div ecx                        // edx = 0\226\128\14799\n\n  cmp edx,r8d\n  jae lbRetWonderkid\n\n// --------------------------------\n// Get PA and CA\n// --------------------------------\n  movzx r9d,word ptr [r11+266]   // PA\n  movzx r10d,word ptr [r11+264]  // CA\n\n  cmp r10d,r9d\n  jae lbRetWonderkid\n\n// --------------------------------\n// Skip if CA >= 70% PA\n// --------------------------------\n  mov eax,r9d\n  imul eax,#70\n  mov ecx,#100\n  xor edx,edx\n  div ecx                        // eax = 70% PA\n\n  cmp r10d,eax\n  jae lbRetWonderkid\n\n// --------------------------------\n// Determine Boost % (Tiered by PA)\n// --------------------------------\n  mov eax,r9d                    // PA\n\n  cmp eax,#180\n  jl @tier150\n  mov ecx,#70                     // PA 180+\n  jmp short @tierDone\n\n@tier150:\n  cmp eax,#150\n  jl @tier120\n  mov ecx,#55                     // PA 150\226\128\147179\n  jmp short @tierDone\n\n@tier120:\n  cmp eax,#120\n  jl @tierLow\n  mov ecx,#40                     // PA 120\226\128\147149\n  jmp short @tierDone\n\n@tierLow:\n  mov ecx,#30                     // PA <120\n\n@tierDone:\n\n// --------------------------------\n// Boost = (PA - CA) * % / 100\n// --------------------------------\n  mov eax,r9d\n  sub eax,r10d                   // gap = PA - CA\n\n  imul eax,ecx                   // gap * percent\n  mov ecx,#100\n  xor edx,edx\n  div ecx                        // eax = boost amount\n\n  add eax,r10d                   // newCA = CA + boost\n\n// --------------------------------\n// Clamp to PA\n// --------------------------------\n  cmp eax,r9d\n  jle @applyWK\n  mov eax,r9d\n\n@applyWK:\n  mov word ptr [r11+264],ax\n\nlbRetWonderkid:\n  pop rax\n\tpop r11\n  pop r10\n  pop r9\n  pop r8\n  pop rdx\n  pop rcx\n  pop rbx\n  ret\n\nlastProcessedPlayer:\n  dq 0\n\nhdeffxoa:\n\tdq 0\n\nglpr_gdgn:\n  jmp newmem\n  nop 2\nreturn:\nregistersymbol(glpr_gdgn)\nregistersymbol(hdeffxoa)\n\n[DISABLE]\nglpr_gdgn:\n  db 0F BF 80 66 02 00 00\n\nunregistersymbol(*)\ndealloc(*)\n"
  L0_2[3] = [[
[ENABLE]
aobscanmodule(glpr_iprt, $process, 0f4cc24883c440xxxxxxxx)
alloc(newmem,$1000,glpr_iprt)

label(code)
label(exit)
label(return)
label(fnSelectPlayer)
label(fnSelectPlayerStaff)

newmem:
  pushfq
  push r8
  push r9
  push r10
  xor r8,r8

  // rax has calculated Person age
  // rsi has Person birth date

  mov r10,rsi
  sub r10,44

  // Put vTable into r8
  mov r8,[r10]
  test r8,r8
  je exit

  // Person Player
  mov r9, vtbPlayer
  cmp r8, r9
  je fnSelectPlayer

  // Person Player/Non-Player
  mov r9, vtbPlayerStaff
  cmp r8, r9
  je fnSelectPlayerStaff

  jmp exit

fnSelectPlayer:
  mov r9,r10
  sub r9,$playerOffset        // offset sized used by player
  jmp code

fnSelectPlayerStaff:
  mov r9,r10
  sub r9,$playerStaffOffset   // offset sized used by player / coach
  jmp code

code:
   // Age Check
  cmp al,$ignoreRetStartAge
  jb exit

  // PA Check
  cmp word ptr [r9+1FE],$ignoreRetStartPA
  jb exit

  // UID Check (Skip if regens)
  cmp [r10+10],#2002068000
  ja exit

  // Team Check
  mov r8,[r9+130]
  test r8,r8
  je exit

  mov r8,[r8+30]
  test r8,r8
  je exit

  cmp [r8+10],$ignoreRetCUID
  jne exit

  // Change Calculated Age to 23
  mov eax,17

exit:
  pop r10
  pop r9
  pop r8
  popfq

  add rsp,40
  pop rbx
  jmp return

glpr_iprt+3:
  jmp newmem
return:

registersymbol(glpr_iprt)

[DISABLE]
glpr_iprt+3:
  db 48 83 C4 40 5B

unregistersymbol(*)
dealloc(*)
]]
  L0_2[4] = [[
// 26.1.1
// FF676981
// 81 69 67 FF
[ENABLE]
aobscanmodule(glpr_paon, $expectedModule, 89 C6 41 89 86 D0 1E 00 00 ) // 89 C? 41 89 8? ?? 1? 00 00
alloc(newmem,$1000,glpr_paon)

label(return)

newmem:
  pushfq
  push r12
  push r13

  cmp r14,05000000
  jna @f

  test r14,r14
  je @f

  xor r12,r12
  mov r12,vtbHumanNonPlayer
	
	cmp [r14+8],0
  je @f
	
	mov r13,[r14+8]
	add r13,$humanManagerOffset
	
  cmp [r13],r12
  jne @f

  mov eax,00022F87
  //mov rax,FFFFFF
  //mov rax,0000000000034CB7

@@:
	pop r13
  pop r12
  popfq

  mov esi,eax
  mov [r14+00001ED0],eax
  jmp return

glpr_paon:
  jmp newmem
  nop 4
return:
registersymbol(glpr_paon)

[DISABLE]
glpr_paon:
  db 89 C6 41 89 86 D0 1E 00 00

unregistersymbol(*)
dealloc(*)
]]
  L0_2[5] = [[
// FM 26.1.3
// 4? 0F B6 A? xx xx 00 00 4x 8B
// xx xx > TRANSFER_MANAGER+<offered_value+0x4>
[ENABLE]
aobscanmodule(glpr_yjli, $expectedModule, 44 0F B6 AF 00 08 00 00)
alloc(newmem,$1000,glpr_yjli)

label(code)
label(return)

newmem:
  movzx r13d,byte ptr [rdi+00000800]
	
  cmp dword ptr [r8+C],0
  je code
  cmp dword ptr [r8+C],$mgrClubUID
  jne code

@@:
  mov r13d,3

code:
  jmp return

glpr_yjli:
  jmp newmem
  nop 3
return:
registersymbol(glpr_yjli)

[DISABLE]
glpr_yjli:
  db 44 0F B6 AF 00 08 00 00

unregistersymbol(*)
dealloc(*)
]]
  L0_2[6] = [[
// FM 26.1.2
// 480FBECA 4? 0FBE B? 0? ?? ?? 00 00 E8 ?? ?? ?? ??     8D ?C B? 
// 480FBECA 4? 0FBE B? 0? ?? ?? 00 00 E8 ?? ?? ?? ?? <X> 8D ?C B? -> <x> = 47
[ENABLE]
aobscanmodule(edgg_omam, $expectedModule, 44 0F BE B4 0B 78 05 00 00)
alloc(newmem,$1000,edgg_omam)
label(exit)
label(return)

label(fnPlayer)
label(fnPlayerStaff)
label(fnGetPlayerPointer)

label(fnItemSelector)
label(lbLoopItemSelector)
label(lbRetItemSelector)

label(fnItemSelection)
label(lbSelectTeam)
label(lbSelectNation)
label(lbSelectPerson)
label(lbRetItemSelection)

label(fnRolesFilter)
label(fnRoles_0)
label(fnRoles_1)
label(fnRoles_2)
label(fnRoles_3)
label(fnRoles_4)
label(lbRetRolesFilter)

label(fnFitnessMoraleMod)
label(lbRetFitnessMoraleMod)

label(fnAttributesMod)
label(lpAttributesMod)
label(lbRetAttributesMod)

label(ipizednt)

newmem:
// rax		Used for this function
// r11    Person Pointer
// r12		Item Base Pointer
// rdi		Player Pointer
// r15		Used for this function

// rcx    Offsets
// r14    Used by default
// rbx		Match Player Pointer

	push rax
	push r11
	push r12
	push rdi
	push r15

  cmp [rbx+28],0
  je exit

  mov rdi,[rbx+28]
  test rdi,rdi
  je exit

  mov r15,[rdi]

  mov rax, vtbPlayer
  cmp r15, rax
  je fnPlayer

  mov rax, vtbPlayerStaff
  cmp r15, rax
  je fnPlayerStaff

	jmp exit

fnPlayer:
	xor rax,rax
	mov eax,$playerOffset

	jmp fnGetPlayerPointer

fnPlayerStaff:
	xor rax,rax
	mov eax,$playerStaffOffset

fnGetPlayerPointer:
  xor r11,r11

	mov r11,rdi

	sub rdi,eax

  cmp [rdi],0
  je exit

	mov r12,[rdi]
  test r12,r12
  je exit

  mov r12,ipizednt

  call fnItemSelector

exit:
	pop r15
	pop rdi
	pop r12
	pop r11
	pop rax
	
	// Original Code  
  movsx r14d,byte ptr [rbx+rcx+00000578]
	
  jmp return

// rax		Item Base Pointer (Temp)
// rdx		Is Active / Item Type Flag
// rsi		Item's Unique ID
// r8			Counter
// r15		Item Pointer

// r11    Person Pointer
// r12		Item Base Pointer
// rdi		Player Pointer

// rcx    Offsets
// r14    Used by default
// rbx		Person Pointer

fnItemSelector:
  push rax
	push rdx
	push rsi
	push r8
  push r15

	xor rax,rax

	xor rdx,rdx
	xor rsi,rsi

	xor r8,r8
	xor r15,r15

	mov r8b,0

	lea rax,[r12]

lbLoopItemSelector:
	mov	r15,[rax+r8*8]
	cmp r15,0
	je lbRetItemSelector

	mov dl,[r15]		// Is Active ?
	cmp dl,0
	je lbRetItemSelector

	mov esi,[r15+2] // Has Unique ID ?
	cmp esi,0
	je lbRetItemSelector

	mov dl,[r15+1]	// Item Type

	call fnItemSelection

lbRetItemSelector:
	inc r8b
	cmp r8b,[r12+100]
	jb lbLoopItemSelector

  pop r15
	pop r8

	pop rsi
	pop rdx

  pop rax

	ret

// rax		Offsets
// r8			Object Base Pointer

// rdx		Item Type
// rsi		Item's Unique ID

// r11    Person Pointer
// r12		Item Base Pointer
// rdi		Player Pointer
// r15		Item Pointer

// rcx    Offsets
// r14    Used by default
// rbx		Person Pointer
fnItemSelection:
  push rax
	push r8

	cmp dl,01									// Item Type : Person
	je lbSelectPerson
	
	cmp dl,09									// Item Type : Nation
	je lbSelectNation

	cmp dl,18									// Item Type : Team
  je lbSelectTeam

	jmp lbRetItemSelection

lbSelectPerson:
	xor rax,rax

  mov eax,[r11+0C]

  cmp eax,esi
  jne lbRetItemSelection

  call fnFitnessMoraleMod

	jmp lbRetItemSelection

lbSelectNation:
	xor rax,rax
	xor r8,r8

  mov eax,$plao.Pctm
	sub eax,8

  mov r8,[rdi+eax]
  test r8,r8
  je lbRetItemSelection

  mov eax,[r8+0C]

  cmp eax,esi
  jne lbRetItemSelection

  call fnRolesFilter

	jmp lbRetItemSelection

lbSelectTeam:
	xor rax,rax
	xor r8,r8

  mov eax,$plao.Pctm

  mov r8,[rdi+eax]
  test r8,r8
  je lbRetItemSelection

  mov eax,[r8+0C]

  cmp eax,esi
  jne lbRetItemSelection

  call fnRolesFilter

	jmp lbRetItemSelection

lbRetItemSelection:
  pop r8
  pop rax

	ret

fnRolesFilter:
	push rax
	push r8
	push r10

	xor r8,r8
	xor r10,r10

	mov r10b,[r15+07]
  mov r8d,$plao.Ppos

  xor eax,eax
  mov al,[r15+06]

	cmp al,0
	je fnRoles_0

	cmp al,1
	je fnRoles_1

	cmp al,2
	je fnRoles_2

	cmp al,3
	je fnRoles_3

	cmp al,4
	je fnRoles_4

	jmp lbRetRolesFilter

fnRoles_1:
	cmp byte ptr [rdi+r8+0],r10b
	jnl fnRoles_0

	cmp byte ptr [rdi+r8+3],r10b
	jnl fnRoles_0

	jmp lbRetRolesFilter

fnRoles_2:
	cmp byte ptr [rdi+r8+5],r10b
	jnl fnRoles_0

	cmp byte ptr [rdi+r8+7],r10b
	jnl fnRoles_0

	cmp byte ptr [rdi+r8+A],r10b
	jnl fnRoles_0

	jmp lbRetRolesFilter

fnRoles_3:
	cmp byte ptr [rdi+r8+2],r10b
	jnl fnRoles_0

	cmp byte ptr [rdi+r8+4],r10b
	jnl fnRoles_0

	cmp byte ptr [rdi+r8+6],r10b
	jnl fnRoles_0

	cmp byte ptr [rdi+r8+8],r10b
	jnl fnRoles_0

	cmp byte ptr [rdi+r8+9],r10b
	jnl fnRoles_0

	cmp byte ptr [rdi+r8+B],r10b
	jnl fnRoles_0

	cmp byte ptr [rdi+r8+D],r10b
	jnl fnRoles_0

	cmp byte ptr [rdi+r8+E],r10b
	jnl fnRoles_0

	jmp lbRetRolesFilter

fnRoles_4:
	cmp byte ptr [rdi+r8+C],r10b
	jl lbRetRolesFilter

fnRoles_0:
	call fnFitnessMoraleMod

lbRetRolesFilter:
	pop r10
	pop r8
	pop rax
	ret

fnFitnessMoraleMod:
	push rax

  mov al,[r15+08]
  cmp al,1
  jne @f
	
  mov word ptr [rbx+C88],#-1
	
	// Morale
  mov byte ptr [rbx+CA3],#20

	// Overall Physical Condition
  mov word ptr [rbx+C7A],#10000		// Raw/UI	
  mov word ptr [rbx+C90],#10000	

	// Match Sharpness
  mov word ptr [rbx+C8A],#10000		// Raw/UI	

	// Fatigue
  mov word ptr [rbx+C84],#0
	
  jmp lbRetFitnessMoraleMod

@@:
  mov al,[r15+09]
  cmp al,1
  jne lbRetFitnessMoraleMod
	
	// Morale
  mov byte ptr [rbx+CA3],#5

	// Overall Physical Condition
  mov word ptr [rbx+C7A],#4500		// Raw/UI	
  mov word ptr [rbx+C90],#4500	

	// Match Sharpness
  mov word ptr [rbx+C8A],#4000		// Raw/UI	

	// Fatigue
  mov word ptr [rbx+C84],#1200
	
lbRetFitnessMoraleMod:
	call fnAttributesMod

	pop rax

	ret

fnAttributesMod:
	push rax
	push r15

  mov al,[r15+10]
  cmp al,1
  jne lbRetAttributesMod

	mov al,[r15+11]
	
	// Set to 0
  xor r15,r15

lpAttributesMod:
	cmp r15,18
	je @f
	cmp r15,29
	je @f
	cmp r15,30
	je @f
	
	// Attributes Start Address
	mov byte ptr [rbx+r15+587],al

@@:
	inc r15
	cmp r15,35
	jna lpAttributesMod

lbRetAttributesMod:
	pop r15
	pop rax
	ret

ipizednt:
	dq 0

edgg_omam:
  jmp newmem
  nop 4
return:
registersymbol(edgg_omam)
registersymbol(ipizednt)

[DISABLE]
edgg_omam:
  db 44 0F BE B4 0B 78 05 00 00

unregistersymbol(*)
dealloc(*)
]]
  L0_2[7] = [[
[ENABLE]
aobscanmodule(mnrz_mxsl, $process, 8A 84 08 8A 12 00 00)
aobscanmodule(njix_mxsl, $process, 41 B8 0A 00 00 00 4C 89 F1 48 89 F2 E8 75)
aobscanmodule(qrpi_mxsl, $process, 41 B8 0A 00 00 00 4C 89 F1 48 89 F2 E8 55)
aobscanmodule(rscw_mxsl, $process, B9 0F 00 00 00 0F 4C C8 41)
aobscanmodule(ovdu_mxsl, $process, 41 B8 05 00 00 00 4C 89 F1)
aobscanmodule(uvad_mxsl, $process, B9 05 00 00 00 0F 4C C8 41 00)
aobscanmodule(yfzb_mxsl, $process, BD 05 00 00 00 E9 xx xx xx xx 31)
alloc(newmem,$1000,mnrz_mxsl)

label(code)
label(return)

newmem:
  mov byte ptr [rax+rcx+0000128A],63 //0A
  mov byte ptr [rax+rcx+0000128D],63 //0A
  mov byte ptr [rax+rcx+00001299],63 //0F
  mov byte ptr [rax+rcx+00001293],63 //05
  mov byte ptr [rax+rcx+00001296],63 //05
  mov byte ptr [rax+rcx+0000129A],63 //05
code:
  mov al,[rax+rcx+0000128A]
  jmp return

mnrz_mxsl:
  jmp newmem
  nop 2
return:

njix_mxsl:
  mov r8d,00000063

qrpi_mxsl:
  mov r8d,00000063

rscw_mxsl:
  mov ecx,00000063

ovdu_mxsl:
  mov r8d,00000063

uvad_mxsl:
  mov ecx,00000063

yfzb_mxsl:
  mov ebp,00000063

registersymbol(mnrz_mxsl)

[DISABLE]
mnrz_mxsl:
  db 8A 84 08 8A 12 00 00

njix_mxsl:
  db 41 B8 0A 00 00 00

qrpi_mxsl:
  db 41 B8 0A 00 00 00

rscw_mxsl:
  db B9 0F 00 00 00

ovdu_mxsl:
  db 41 B8 05 00 00 00

uvad_mxsl:
  db B9 05 00 00 00

yfzb_mxsl:
  db BD 05 00 00 00

unregistersymbol(*)
dealloc(*)
]]
  L0_2[8] = [[
[ENABLE]
aobscanmodule(INJECT, $expectedModule, 0FB605xxxxxxxx8844244B )
label(qword_1463D896D)
INJECT+(DWORD)[INJECT+03]+03+04+04:
qword_1463D896D:
  db 0
[DISABLE]
qword_1463D896D:
  db 1
]]
  L0_2[9] = [[
[ENABLE]
aobscanmodule(INJECT, $expectedModule, 0FB605xxxxxxxx8844244B )
label(qword_1463D896D)
INJECT+(DWORD)[INJECT+03]+03+04+05:
qword_1463D896D:
  db 0
[DISABLE]
qword_1463D896D:
  db 1
]]
  L0_2[10] = [[
[ENABLE]
aobscanmodule(INJECT, $expectedModule, 0FB605xxxxxxxx8844244B )
label(qword_1463D896D)
INJECT+(DWORD)[INJECT+03]+03+04+07:
qword_1463D896D:
  db 0
[DISABLE]
qword_1463D896D:
  db 1
]]
  L0_2[11] = "[ENABLE]\naobscanmodule(INJECT, $process, 488B05xxxxxxxx488B4008488B406880785C00 )\nlabel(qword_1463CD168)\n[[[INJECT+(DWORD)[INJECT+03]+03+04]+08]+68]+5C:\nqword_1463CD168:\n  db 1\n[DISABLE]\nqword_1463CD168:\n  db 0\n"
  L1_2 = {}
  L2_2 = {}
  L2_2.Info = "Accelerate Player Development"
  L2_2.Premium = true
  L3_2 = L0_2[0]
  L2_2.Script = L3_2
  L1_2[0] = L2_2
  L2_2 = {}
  L2_2.Info = "Board Always Accepts Your Requests (Including Club Vision)"
  L2_2.Premium = true
  L3_2 = L0_2[1]
  L2_2.Script = L3_2
  L1_2[1] = L2_2
  L2_2 = {}
  L2_2.Info = "Golden Generation"
  L2_2.Premium = true
  L3_2 = L0_2[2]
  L2_2.Script = L3_2
  L1_2[2] = L2_2
  L2_2 = {}
  L2_2.Info = "Ignore Player Retirement"
  L2_2.Premium = false
  L3_2 = L0_2[3]
  L2_2.Script = L3_2
  L1_2[3] = L2_2
  L2_2 = {}
  L2_2.Info = "Players and Staff Always Accept Your Contract Offers"
  L2_2.Premium = true
  L3_2 = L0_2[4]
  L2_2.Script = L3_2
  L1_2[4] = L2_2
  L2_2 = {}
  L2_2.Info = "Recruit Players for Any Fee"
  L2_2.Premium = true
  L3_2 = L0_2[5]
  L2_2.Script = L3_2
  L1_2[5] = L2_2
  L2_2 = {}
  L2_2.Info = "On-Match Player Ability Modifier"
  L2_2.Premium = true
  L3_2 = L0_2[6]
  L2_2.Script = L3_2
  L1_2[6] = L2_2
  L2_2 = {}
  L2_2.Info = "Override and Max Out Extra Staff Limit"
  L2_2.Premium = false
  L3_2 = L0_2[7]
  L2_2.Script = L3_2
  L1_2[7] = L2_2
  L2_2 = {}
  L2_2.Info = "No Work Permits"
  L2_2.Premium = true
  L3_2 = L0_2[8]
  L2_2.Script = L3_2
  L1_2[8] = L2_2
  L2_2 = {}
  L2_2.Info = "No Transfer Windows"
  L2_2.Premium = true
  L3_2 = L0_2[9]
  L2_2.Script = L3_2
  L1_2[9] = L2_2
  L2_2 = {}
  L2_2.Info = "No Loan Restrictions"
  L2_2.Premium = true
  L3_2 = L0_2[10]
  L2_2.Script = L3_2
  L1_2[10] = L2_2
  L2_2 = {}
  L2_2.Info = "Nationality Restrictions Lifted"
  L2_2.Premium = true
  L3_2 = L0_2[11]
  L2_2.Script = L3_2
  L1_2[11] = L2_2
  return L1_2
end

getExclusivePresets = L8_1

function L8_1()
  local L0_2, L1_2, L2_2
  L0_2 = enableExclusivePresets
  L1_2 = 20696
  L2_2 = 0
  L0_2(L1_2, L2_2)
  L0_2 = enableExclusivePresets
  L1_2 = 17839
  L2_2 = 1
  L0_2(L1_2, L2_2)
  L0_2 = enableExclusivePresets
  L1_2 = 23635
  L2_2 = 2
  L0_2(L1_2, L2_2)
  L0_2 = enableExclusivePresets
  L1_2 = 20741
  L2_2 = 3
  L0_2(L1_2, L2_2)
  L0_2 = enableExclusivePresets
  L1_2 = 22720
  L2_2 = 4
  L0_2(L1_2, L2_2)
  L0_2 = enableExclusivePresets
  L1_2 = 23766
  L2_2 = 5
  L0_2(L1_2, L2_2)
  L0_2 = enableExclusivePresets
  L1_2 = 23934
  L2_2 = 6
  L0_2(L1_2, L2_2)
  L0_2 = enableExclusivePresets
  L1_2 = 23978
  L2_2 = 7
  L0_2(L1_2, L2_2)
  L0_2 = enableExclusivePresets
  L1_2 = 24042
  L2_2 = 8
  L0_2(L1_2, L2_2)
  L0_2 = enableExclusivePresets
  L1_2 = 24044
  L2_2 = 9
  L0_2(L1_2, L2_2)
  L0_2 = enableExclusivePresets
  L1_2 = 24046
  L2_2 = 10
  L0_2(L1_2, L2_2)
  L0_2 = enableExclusivePresets
  L1_2 = 24048
  L2_2 = 11
  L0_2(L1_2, L2_2)
  return
end

mrkxqk = L8_1
L8_1 = FMCETablePresets
return L8_1
