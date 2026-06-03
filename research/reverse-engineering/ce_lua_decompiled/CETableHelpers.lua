local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = "Cheat Engine Table Helpers"
L1_1 = "CETableHelpers"
L2_1 = "26.1.1.0"
L3_1 = "Figment; tdg6661"
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
CETableHelpers = L8_1

function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = lastInfo
  if not L3_2 then
    L3_2 = 0
  end
  lastInfo = L3_2
  if A1_2 then
    L3_2 = table
    L3_2 = L3_2.insert
    L4_2 = listInfo
    L5_2 = A2_2
    L3_2(L4_2, L5_2)
    return
  end
  if A0_2 then
    lastInfo = 1
    L3_2 = listInfo
    L3_2 = L3_2[1]
    return L3_2
  else
    L3_2 = 1
    L4_2 = listInfo
    L4_2 = #L4_2
    L5_2 = 1
    for L6_2 = L3_2, L4_2, L5_2 do
      L7_2 = lastInfo
      if L6_2 == L7_2 then
        L7_2 = listInfo
        L7_2 = #L7_2
        if L6_2 == L7_2 then
          lastInfo = 1
          break
        end
        L7_2 = L6_2 + 1
        lastInfo = L7_2
        break
      end
    end
    L3_2 = listInfo
    L4_2 = lastInfo
    L3_2 = L3_2[L4_2]
    return L3_2
  end
end

getRandomInfo = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "getRandomInfo"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = MessageDialog
  L2_2 = Table
  L2_2 = L2_2.Message
  L2_2 = L2_2.title_exclusive
  L3_2 = Table
  L3_2 = L3_2.Message
  L3_2 = L3_2.text_exclusive
  L4_2 = 2
  L5_2 = mbYes
  L6_2 = mbNo
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
  L2_2 = mrYes
  if L1_2 == L2_2 then
    L2_2 = shellExecute
    L3_2 = linkPatreon
    L2_2(L3_2)
  end
  L2_2 = enableAutoDisable
  L3_2 = A0_2
  L4_2 = nil
  L2_2(L3_2, L4_2)
end

exclusiveFeature = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "exclusiveFeature"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  if A0_2 == nil then
    return
  end
  L1_2 = getFileVersion
  L2_2 = A0_2
  L1_2, L2_2 = L1_2(L2_2)
  if L1_2 and L2_2 then
    L3_2 = string
    L3_2 = L3_2.format
    L4_2 = "%s.%s.%s.%s"
    L5_2 = L2_2.major
    L6_2 = L2_2.minor
    L7_2 = L2_2.release
    L8_2 = L2_2.build
    return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
  end
  L3_2 = nil
  return L3_2
end

getFileVersionStr = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "getFileVersionStr"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L0_2 = "0"
  L1_2 = getFileVersion
  L2_2 = getAttachedProcessFileName
  L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = L2_2()
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  if L1_2 ~= nil then
    L2_2 = bAnd
    L3_2 = bShr
    L4_2 = L1_2
    L5_2 = 48
    L3_2 = L3_2(L4_2, L5_2)
    L4_2 = 65535
    L2_2 = L2_2(L3_2, L4_2)
    L3_2 = bAnd
    L4_2 = bShr
    L5_2 = L1_2
    L6_2 = 32
    L4_2 = L4_2(L5_2, L6_2)
    L5_2 = 65535
    L3_2 = L3_2(L4_2, L5_2)
    L4_2 = bAnd
    L5_2 = bShr
    L6_2 = L1_2
    L7_2 = 16
    L5_2 = L5_2(L6_2, L7_2)
    L6_2 = 65535
    L4_2 = L4_2(L5_2, L6_2)
    L5_2 = bAnd
    L6_2 = L1_2
    L7_2 = 65535
    L5_2 = L5_2(L6_2, L7_2)
    L6_2 = string
    L6_2 = L6_2.format
    L7_2 = "%d.%d.%d"
    L8_2 = L2_2
    L9_2 = L3_2
    L10_2 = L4_2
    L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
    L0_2 = L6_2
  end
  return L0_2
end

getExeVersion = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "getExeVersion"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = nil
  L1_2 = nil
  L2_2 = enumModules
  L2_2 = L2_2()
  L3_2 = pairs
  L4_2 = L2_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L8_2 = L2_2[L6_2]
    L8_2 = L8_2.Name
    L9_2 = expectedModule
    if L8_2 == L9_2 then
      L1_2 = L2_2[L6_2]
    end
  end
  if L1_2 == nil or L1_2 == 0 then
    L3_2 = false
    return L3_2
  end
  L3_2 = getFileVersionStr
  L4_2 = L1_2.PathToFile
  L3_2 = L3_2(L4_2)
  L0_2 = L3_2
  L3_2 = expectedExeVersion
  L3_2 = L0_2 == L3_2
  return L3_2
end

checkExeVersion = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "checkExeVersion"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2, L2_2
  L0_2 = md5memory
  L1_2 = process
  L2_2 = 8192
  L0_2 = L0_2(L1_2, L2_2)
  return L0_2
end

getExeMD5 = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "getExeMD5"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2
  L0_2 = getExeMD5
  L0_2 = L0_2()
  L1_2 = expectedExeMD5
  L1_2 = L0_2 == L1_2
  return L1_2
end

checkExeMD5 = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "checkExeMD5"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2
  L0_2 = enumModules
  L0_2 = L0_2()
  if L0_2 ~= nil then
    L1_2 = L0_2[1]
    if L1_2 ~= nil then
      goto lbl_9
    end
  end
  do return end
  ::lbl_9::
  L1_2 = L0_2[1]
  return L1_2
end

getGameModule = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "getGameModule"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2
  L0_2 = getGameModule
  L0_2 = L0_2()
  if L0_2 then
    L1_2 = L0_2.Name
    return L1_2
  end
end

getGameModuleName = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "getGameModuleName"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2
  L0_2 = getPointerSize
  L0_2 = L0_2()
  if L0_2 == 4 then
    L0_2 = "(x32)"
    return L0_2
  else
    L0_2 = "(x64)"
    return L0_2
  end
end

getRegistrySizeStr = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "getRegistrySizeStr"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2
  L0_2 = enumModules
  L0_2 = L0_2()
  L1_2 = #L0_2
  if 0 < L1_2 then
    L1_2 = L0_2[1]
    L1_2 = L1_2.PathToFile
    return L1_2
  end
  L1_2 = nil
  return L1_2
end

getAttachedProcessFileName = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "getAttachedProcessFileName"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2
  L0_2 = getGameModule
  L0_2 = L0_2()
  if L0_2 then
    L1_2 = L0_2.PathToFile
    return L1_2
  end
end

getGameModulePathToFile = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "getGameModulePathToFile"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2
  L0_2 = getGameModule
  L0_2 = L0_2()
  if L0_2 then
    L1_2 = L0_2.Is64Bit
    return L1_2
  end
end

getGameModuleIs64Bit = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "getGameModuleIs64Bit"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2
  L0_2 = getGameModuleIs64Bit
  L0_2 = L0_2()
  if L0_2 then
    L0_2 = "x64"
    return L0_2
  else
    L0_2 = "x32"
    return L0_2
  end
end

getGameModuleIs64BitStr = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "getGameModuleIs64BitStr"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2
  L0_2 = getGameModule
  L0_2 = L0_2()
  if L0_2 then
    L1_2 = L0_2.Address
    return L1_2
  end
end

getGameModuleAddress = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "getGameModuleAddress"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2
  L0_2 = getFileVersion
  L1_2 = getGameModulePathToFile
  L1_2 = L1_2()
  return L0_2(L1_2)
end

getGameVersion = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "getGameVersion"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2
  L0_2 = getFileVersionStr
  L1_2 = getGameModulePathToFile
  L1_2 = L1_2()
  return L0_2(L1_2)
end

getGameVersionStr = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "getGameVersionStr"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = getGameModuleName
  L0_2 = L0_2()
  L1_2 = getGameModuleIs64Bit
  L1_2 = L1_2()
  L2_2 = getGameModulePathToFile
  L2_2 = L2_2()
  L3_2 = getGameModuleAddress
  L3_2 = L3_2()
  L4_2 = getGameVersion
  L4_2 = L4_2()
  return L0_2, L1_2, L2_2, L3_2, L4_2
end

getGameModuleInfo = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "getGameModuleInfo"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = getGameModuleName
  L0_2 = L0_2()
  L1_2 = getGameModuleIs64BitStr
  L1_2 = L1_2()
  L2_2 = getGameModulePathToFile
  L2_2 = L2_2()
  L3_2 = getGameModuleAddress
  L3_2 = L3_2()
  L4_2 = getGameVersionStr
  L4_2 = L4_2()
  return L0_2, L1_2, L2_2, L3_2, L4_2
end

getGameModuleInfoStrs = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "getGameModuleInfoStrs"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2
  L0_2 = targetIs64Bit
  L0_2 = L0_2()
  if L0_2 then
    L0_2 = 8
    return L0_2
  end
  L0_2 = 4
  return L0_2
end

pointerSize = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "pointerSize"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 == nil then
    L2_2 = "(nil)"
    return L2_2
  end
  L2_2 = "%X"
  L3_2 = type
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  if L3_2 == "number" then
    L3_2 = "%0"
    L4_2 = A1_2
    L5_2 = "X"
    L2_2 = L3_2 .. L4_2 .. L5_2
  else
    L3_2 = type
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    if L3_2 == "string" then
      return A0_2
    end
  end
  L3_2 = string
  L3_2 = L3_2.format
  L4_2 = L2_2
  L5_2 = A0_2
  return L3_2(L4_2, L5_2)
end

hex = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "hex"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L1_2 = L1_2 == "number"
  return L1_2
end

isnumber = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "isnumber"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2
  L4_2 = tonumber
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L4_2 = 0
  end
  L5_2 = tonumber
  L6_2 = A1_2
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    L5_2 = 0
  end
  L6_2 = tonumber
  L7_2 = A2_2
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    L6_2 = 0
  end
  L7_2 = tonumber
  L8_2 = A3_2
  L7_2 = L7_2(L8_2)
  if not L7_2 then
    L7_2 = 0
  end
  if L4_2 > L6_2 or L4_2 < L5_2 then
    return L7_2
  else
    return L4_2
  end
end

validateValue = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "validateValue"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2
  if A0_2 ~= nil then
    L4_2 = A0_2.getClassName
    L4_2 = L4_2()
    if L4_2 == "TMemoryRecord" then
      function L5_2(A0_3, A1_3, A2_3)
        local L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3
        
        L3_3 = writeValueAll
        L4_3 = A0_3.getCurrentAddress
        L4_3 = L4_3()
        L5_3 = validateValue
        L6_3 = A2_3
        L7_3 = A1_2
        L8_3 = A2_2
        L9_3 = A3_2
        L5_3 = L5_3(L6_3, L7_3, L8_3, L9_3)
        L6_3 = A0_3.VarType
        L3_3(L4_3, L5_3, L6_3)
      end
      
      A0_2.OnValueChanged = L5_2
    elseif L4_2 == "TCEEdit" then
      function L5_2(A0_3)
        local L1_3, L2_3, L3_3, L4_3, L5_3
        
        L1_3 = validateValue
        L2_3 = A0_3.Text
        L3_3 = A1_2
        L4_3 = A2_2
        L5_3 = A3_2
        L1_3 = L1_3(L2_3, L3_3, L4_3, L5_3)
        A0_3.Text = L1_3
      end
      
      A0_2.OnEditingDone = L5_2
    end
  end
end

defaultValue = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "defaultValue"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = string
  L1_2 = L1_2.match
  L2_2 = A0_2
  L3_2 = "^([^%d]*%d)(%d*)(.-)$"
  L1_2, L2_2, L3_2 = L1_2(L2_2, L3_2)
  L4_2 = L1_2
  L6_2 = L2_2
  L5_2 = L2_2.reverse
  L5_2 = L5_2(L6_2)
  L6_2 = L5_2
  L5_2 = L5_2.gsub
  L7_2 = "(%d%d%d)"
  L8_2 = "%1,"
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L6_2 = L5_2
  L5_2 = L5_2.reverse
  L5_2 = L5_2(L6_2)
  L6_2 = L3_2
  L4_2 = L4_2 .. L5_2 .. L6_2
  return L4_2
end

commaValue = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "commaValue"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = ""
  L2_2 = 1
  L3_2 = A0_2
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = L1_2
    L7_2 = string
    L7_2 = L7_2.char
    L8_2 = math
    L8_2 = L8_2.random
    L9_2 = 97
    L10_2 = 122
    L8_2, L9_2, L10_2 = L8_2(L9_2, L10_2)
    L7_2 = L7_2(L8_2, L9_2, L10_2)
    L1_2 = L6_2 .. L7_2
  end
  return L1_2
end

randomVariable = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "randomVariable"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = false
  L2_2 = memrec
  if L2_2 ~= nil then
    L2_2 = findRecord
    L3_2 = memrec
    L4_2 = A0_2
    L2_2 = L2_2(L3_2, L4_2)
    if L2_2 == nil then
      L3_2 = getAddressList
      L3_2 = L3_2()
      L3_2 = L3_2.createMemoryRecord
      L3_2 = L3_2()
      L2_2 = L3_2
      L2_2.Description = A0_2
      L2_2.IsGroupHeader = true
      L3_2 = L2_2.appendToEntry
      L4_2 = memrec
      L3_2(L4_2)
    end
    L1_2 = L2_2.Active
  end
  return L1_2
end

getFlag = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "getFlag"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2
  if A0_2 == nil or A0_2 == 0 then
    L2_2 = nil
    return L2_2
  end
  L2_2 = readSignedInteger
  L3_2 = A0_2 + A1_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= nil then
    L3_2 = A0_2 + L2_2
    L3_2 = L3_2 + A1_2
    L3_2 = L3_2 + 4
    return L3_2
  end
  L3_2 = nil
  return L3_2
end

getCodeOffset = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "getCodeOffset"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L3_2 = type
  L4_2 = A2_2
  L3_2 = L3_2(L4_2)
  if L3_2 ~= "table" then
    L3_2 = {}
    A2_2 = L3_2
  end
  L3_2 = type
  L4_2 = A2_2.debug
  L3_2 = L3_2(L4_2)
  if L3_2 ~= "boolean" then
    A2_2.debug = false
  end
  L3_2 = nil
  L4_2 = 1
  L5_2 = #A1_2
  L6_2 = 1
  for L7_2 = L4_2, L5_2, L6_2 do
    if A0_2 ~= nil then
      L8_2 = type
      L9_2 = A1_2[L7_2]
      L8_2 = L8_2(L9_2)
      if L8_2 == "table" then
        L9_2 = type
        L10_2 = A1_2[L7_2]
        L10_2 = L10_2.offset
        L9_2 = L9_2(L10_2)
        if L9_2 ~= "number" then
          L9_2 = nil
          return L9_2
        end
        L9_2 = A1_2[L7_2]
        L9_2 = L9_2.rc
        if L9_2 == true then
          L9_2 = getCodeOffset
          L10_2 = A0_2
          L11_2 = A1_2[L7_2]
          L11_2 = L11_2.offset
          L9_2 = L9_2(L10_2, L11_2)
          A0_2 = L9_2
        else
          L9_2 = A1_2[L7_2]
          L9_2 = L9_2.r32
          if L9_2 == true then
            L9_2 = readInteger
            L10_2 = A1_2[L7_2]
            L10_2 = L10_2.offset
            L10_2 = A0_2 + L10_2
            L9_2 = L9_2(L10_2)
            A0_2 = L9_2
          else
            L9_2 = readPointer
            L10_2 = A1_2[L7_2]
            L10_2 = L10_2.offset
            L10_2 = A0_2 + L10_2
            L9_2 = L9_2(L10_2)
            A0_2 = L9_2
          end
        end
      elseif L8_2 == "number" then
        L9_2 = readPointer
        L10_2 = A1_2[L7_2]
        L10_2 = A0_2 + L10_2
        L9_2 = L9_2(L10_2)
        A0_2 = L9_2
      else
        L9_2 = nil
        return L9_2
      end
      L9_2 = A2_2.debug
      if L9_2 then
        L9_2 = print
        L10_2 = "  "
        L11_2 = hex
        L12_2 = A0_2
        L11_2 = L11_2(L12_2)
        L10_2 = L10_2 .. L11_2
        L9_2(L10_2)
      end
    end
  end
  L4_2 = type
  L5_2 = A2_2.endingoffset
  L4_2 = L4_2(L5_2)
  if L4_2 == "number" then
    L4_2 = A2_2.endingoffset
    A0_2 = A0_2 + L4_2
  end
  return A0_2
end

followAddress = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "followAddress"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  if A0_2 == nil then
    return
  end
  L1_2 = readInteger
  L2_2 = process
  L1_2 = L1_2(L2_2)
  if L1_2 ~= nil then
    L1_2 = process
    if L1_2 == "fm.exe" then
      goto lbl_15
    end
  end
  L1_2 = closeCE
  L1_2()
  do return end
  ::lbl_15::
  L1_2 = createMemScan
  L1_2 = L1_2()
  L2_2 = L1_2.setOnlyOneResult
  L3_2 = true
  L2_2(L3_2)
  L2_2 = L1_2.firstScan
  L3_2 = soExactValue
  L4_2 = vtString
  L5_2 = rtRounded
  L6_2 = "LC_COLLATE"
  L7_2 = ""
  L8_2 = 0
  L9_2 = 9223372036854775807
  L10_2 = "*W*X*C"
  L11_2 = fsmNotAligned
  L12_2 = "1"
  L13_2 = false
  L14_2 = true
  L15_2 = false
  L16_2 = true
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
  L2_2 = L1_2.waitTillDone
  L2_2()
  L2_2 = L1_2.getOnlyResult
  L2_2 = L2_2()
  if L2_2 == nil or L2_2 == 0 then
    return
  end
  L3_2 = getAddressSafe
  L4_2 = hex
  L5_2 = L2_2
  L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L4_2(L5_2)
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
  if L3_2 == nil or L3_2 == 0 then
    return
  end
  L4_2 = string
  L4_2 = L4_2.find
  L5_2 = string
  L5_2 = L5_2.lower
  L6_2 = readString
  L7_2 = L3_2
  L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L6_2(L7_2)
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
  L6_2 = string
  L6_2 = L6_2.lower
  L7_2 = A0_2
  L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L6_2(L7_2)
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
  if L4_2 == nil then
    L4_2 = closeCE
    L4_2()
    return
  end
end

cType = L8_1

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = A0_2
  if L2_2 == nil then
    return
  end
  L3_2 = createTimer
  L3_2 = L3_2()
  L3_2.Interval = 100
  
  function L4_2()
    local L0_3, L1_3
    L2_2.Active = false
    L0_3 = A1_2
    if L0_3 ~= nil then
      L0_3 = A1_2
      L1_3 = L2_2
      L0_3(L1_3)
    end
    L0_3 = L3_2
    if L0_3 ~= nil then
      L3_2.Enabled = false
      L0_3 = L3_2.destroy
      L0_3()
    end
    L0_3 = nil
    L3_2 = L0_3
  end
  
  L3_2.onTimer = L4_2
  L3_2.Enabled = true
end

enableAutoDisable = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "enableAutoDisable"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = pairs
  L3_2 = A0_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L7_2 = getAddressList
    L7_2 = L7_2()
    L7_2 = L7_2.getMemoryRecordByID
    L8_2 = L6_2
    L7_2 = L7_2(L8_2)
    if L7_2 ~= nil then
      L7_2.Options = "[moAllowManualCollapseAndExpand]"
      L8_2 = createTimer
      L8_2 = L8_2()
      L8_2.Interval = 100
      
      function L9_2()
        local L0_3, L1_3
        L0_3 = L7_2.Parent
        L0_3 = L0_3.Active
        if L0_3 then
          L7_2.Collapsed = true
          L8_2.Enabled = false
          L0_3 = L8_2.Destroy
          L0_3()
        end
      end
      
      L8_2.OnTimer = L9_2
      
      function L9_2(A0_3, A1_3, A2_3)
        local L3_3, L4_3, L5_3
        L3_3 = tonumber
        L4_3 = A2_3
        L3_3 = L3_3(L4_3)
        L4_3 = tonumber
        L5_3 = A1_2
        L4_3 = L4_3(L5_3)
        if L3_3 == L4_3 then
          A0_3.Collapsed = false
        else
          A0_3.Collapsed = true
        end
      end
      
      L7_2.OnValueChangedByUser = L9_2
    end
  end
  return
end

enableAutoCollapseExpand = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "enableAutoCollapseExpand"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2
  L0_2 = 60000
  return L0_2
end

getDefaultTimerFreq = L8_1

function L8_1()
  local L0_2, L1_2, L2_2
  L0_2 = memrec
  if L0_2 ~= nil then
    L0_2 = memrec
    L0_2 = L0_2.id
    L1_2 = timers
    L1_2 = L1_2[L0_2]
    if L1_2 == nil then
      L1_2 = timers
      L2_2 = createTimer
      L2_2 = L2_2()
      L1_2[L0_2] = L2_2
      L1_2 = timers
      L1_2 = L1_2[L0_2]
      L1_2.Enabled = false
      L1_2 = timers
      L1_2 = L1_2[L0_2]
      L2_2 = getFreezeTimer
      L2_2 = L2_2()
      L2_2 = L2_2.Interval
      L1_2.Interval = L2_2
    end
    L1_2 = timers
    L1_2 = L1_2[L0_2]
    return L1_2
  end
  L0_2 = nil
  return L0_2
end

getTimer = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "getTimer"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2, L2_2
  L0_2 = memrec
  if L0_2 ~= nil then
    L0_2 = memrec
    L0_2 = L0_2.id
    L1_2 = timers
    L1_2 = L1_2[L0_2]
    if L1_2 ~= nil then
      L1_2 = timers
      L1_2 = L1_2[L0_2]
      L2_2 = L1_2
      L1_2 = L1_2.Destroy
      L1_2(L2_2)
      L1_2 = timers
      L1_2[L0_2] = nil
    end
  end
end

killTimer = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "killTimer"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  if A1_2 == nil or A1_2 <= 0 then
    L3_2 = getDefaultTimerFreq
    L3_2 = L3_2()
    A1_2 = L3_2
  end
  L3_2 = A0_2
  L4_2 = createTimer
  L4_2 = L4_2()
  L4_2.Interval = 100
  
  function L5_2()
    local L0_3, L1_3
    L0_3 = L4_2
    if L0_3 ~= nil then
      L0_3 = L3_2.Active
      if L0_3 then
        goto lbl_13
      end
    end
    L4_2.Enabled = false
    L0_3 = L4_2.destroy
    L0_3()
    L0_3 = nil
    L4_2 = L0_3
    goto lbl_20
    ::lbl_13::
    L0_3 = A2_2
    if L0_3 ~= nil then
      L0_3 = A2_2
      L0_3()
      L0_3 = A1_2
      L4_2.Interval = L0_3
    end
    ::lbl_20::
  end
  
  L4_2.onTimer = L5_2
  L4_2.Enabled = true
end

enableTimer = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "enableTimer"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  L2_2 = memrec
  if L2_2 == nil then
    L2_2 = false
    return L2_2
  end
  L2_2 = aobscans
  L3_2 = memrec
  L3_2 = L3_2.id
  L2_2 = L2_2[L3_2]
  if L2_2 ~= nil then
    L2_2 = aobscans
    L3_2 = memrec
    L3_2 = L3_2.id
    L2_2 = L2_2[L3_2]
    L2_2[A0_2] = nil
  end
  L2_2 = A1_2.bytes
  if L2_2 == nil then
    L2_2 = false
    return L2_2
  end
  L2_2 = A1_2.perm
  if L2_2 == nil then
    L2_2 = "-C-W+X"
  end
  L3_2 = 0
  L4_2 = 9223372036854775807
  L5_2 = A1_2.module
  if L5_2 ~= nil then
    L5_2 = getAddress
    L6_2 = A1_2.module
    L5_2 = L5_2(L6_2)
    L3_2 = L5_2
    L5_2 = getModuleSize
    L6_2 = A1_2.module
    L5_2 = L5_2(L6_2)
    L4_2 = L3_2 + L5_2
  end
  L5_2 = A1_2.bytes
  L6_2 = createMemScan
  L6_2 = L6_2()
  L7_2 = false
  L8_2 = aobscans
  L9_2 = memrec
  L9_2 = L9_2.id
  L8_2 = L8_2[L9_2]
  if L8_2 == nil then
    L8_2 = aobscans
    L9_2 = memrec
    L9_2 = L9_2.id
    L10_2 = {}
    L8_2[L9_2] = L10_2
  end
  if L6_2 ~= nil then
    L8_2 = L6_2.firstScan
    L9_2 = soExactValue
    L10_2 = vtByteArray
    L11_2 = 0
    L12_2 = L5_2
    L13_2 = ""
    L14_2 = L3_2
    L15_2 = L4_2
    L16_2 = L2_2
    L17_2 = fsmNotAligned
    L18_2 = "1"
    L19_2 = true
    L20_2 = false
    L21_2 = false
    L22_2 = false
    L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
    L8_2 = L6_2.waitTillDone
    L8_2()
    L8_2 = createFoundList
    L9_2 = L6_2
    L8_2 = L8_2(L9_2)
    if L8_2 ~= nil then
      L9_2 = L8_2.initialize
      L9_2()
      L9_2 = L8_2.Count
      if 0 < L9_2 then
        L9_2 = aobscans
        L10_2 = memrec
        L10_2 = L10_2.id
        L9_2 = L9_2[L10_2]
        L10_2 = {}
        L9_2[A0_2] = L10_2
        L9_2 = nil
        L10_2 = 0
        L11_2 = L8_2.Count
        L11_2 = L11_2 - 1
        L12_2 = 1
        for L13_2 = L10_2, L11_2, L12_2 do
          L14_2 = table
          L14_2 = L14_2.insert
          L15_2 = aobscans
          L16_2 = memrec
          L16_2 = L16_2.id
          L15_2 = L15_2[L16_2]
          L15_2 = L15_2[A0_2]
          L16_2 = tonumber
          L17_2 = "0x"
          L18_2 = L8_2.Address
          L18_2 = L18_2[L13_2]
          L17_2 = L17_2 .. L18_2
          L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L16_2(L17_2)
          L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
        end
      end
      L10_2 = L8_2
      L9_2 = L8_2.Destroy
      L9_2(L10_2)
    end
    L10_2 = L6_2
    L9_2 = L6_2.Destroy
    L9_2(L10_2)
    if L7_2 then
      L9_2 = true
      return L9_2
    end
  end
  L8_2 = false
  return L8_2
end

setScan = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "setScan"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = nil
  L3_2 = nil
  L4_2 = pairs
  L5_2 = A0_2
  L4_2, L5_2, L6_2 = L4_2(L5_2)
  for L7_2, L8_2 in L4_2, L5_2, L6_2 do
    L9_2 = setScan
    L10_2 = L7_2
    L11_2 = L8_2
    L12_2 = A1_2
    L9_2(L10_2, L11_2, L12_2)
  end
end

setScans = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "setScans"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2
  L1_2 = memrec
  if L1_2 ~= nil then
    L1_2 = memrec
    L1_2 = L1_2.id
    L2_2 = aobscans
    L2_2 = L2_2[L1_2]
    if L2_2 ~= nil then
      L2_2 = aobscans
      L2_2 = L2_2[L1_2]
      L2_2 = L2_2[A0_2]
      if L2_2 ~= nil then
        L2_2 = aobscans
        L2_2 = L2_2[L1_2]
        L2_2 = L2_2[A0_2]
        return L2_2
      end
    end
  end
  L1_2 = nil
  return L1_2
end

getScan = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "getScan"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2
  if A0_2 < A1_2 then
    L4_2 = A0_2
    L5_2 = 1
    while A1_2 > L4_2 do
      L6_2 = A3_2
      L7_2 = L5_2
      L8_2 = L4_2
      L6_2 = L6_2(L7_2, L8_2)
      if L6_2 == false then
        break
      end
      L4_2 = L4_2 + A2_2
      L5_2 = L5_2 + 1
    end
  end
end

forEach = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "forEach"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L5_2 = 0
  L6_2 = A2_2 - 1
  while L5_2 <= L6_2 do
    L7_2 = L6_2 - L5_2
    L7_2 = L7_2 // 2
    L7_2 = L7_2 + L5_2
    L8_2 = A4_2
    L9_2 = A0_2
    L10_2 = L7_2 * A3_2
    L10_2 = A1_2 + L10_2
    L8_2 = L8_2(L9_2, L10_2)
    if L8_2 == 0 then
      L9_2 = L7_2 * A3_2
      L9_2 = A1_2 + L9_2
      return L9_2
    elseif L8_2 < 0 then
      L6_2 = L7_2 - 1
    else
      L5_2 = L7_2 + 1
    end
  end
  L7_2 = nil
  return L7_2
end

bsearch = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "bsearch"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = {}
  L3_2 = nil
  L4_2 = nil
  L5_2 = pairs
  L6_2 = A0_2
  L5_2, L6_2, L7_2 = L5_2(L6_2)
  for L8_2, L9_2 in L5_2, L6_2, L7_2 do
    L10_2 = table
    L10_2 = L10_2.insert
    L11_2 = L2_2
    L12_2 = L8_2
    L10_2(L11_2, L12_2)
  end
  L5_2 = ipairs
  L6_2 = L2_2
  L5_2, L6_2, L7_2 = L5_2(L6_2)
  for L8_2, L9_2 in L5_2, L6_2, L7_2 do
    L10_2 = A1_2
    L11_2 = L9_2
    L12_2 = A0_2[L9_2]
    L10_2(L11_2, L12_2)
  end
end

tforEach = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "tforEach"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = ""
  if A0_2 ~= nil then
    if A1_2 then
      L3_2 = pairs
      L4_2 = A0_2
      L3_2, L4_2, L5_2 = L3_2(L4_2)
      for L6_2, L7_2 in L3_2, L4_2, L5_2 do
        L8_2 = L2_2
        L9_2 = L6_2
        L10_2 = ":"
        L11_2 = L7_2
        L12_2 = "\r\n"
        L2_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2
      end
    else
      L3_2 = pairs
      L4_2 = A0_2
      L3_2, L4_2, L5_2 = L3_2(L4_2)
      for L6_2, L7_2 in L3_2, L4_2, L5_2 do
        L8_2 = L2_2
        L9_2 = L7_2
        L10_2 = "\r\n"
        L2_2 = L8_2 .. L9_2 .. L10_2
      end
    end
  end
  return L2_2
end

enumsToStringList = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "enumsToStringList"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = false
  if A0_2 ~= nil then
    L4_2 = pairs
    L5_2 = A0_2
    L4_2, L5_2, L6_2 = L4_2(L5_2)
    for L7_2, L8_2 in L4_2, L5_2, L6_2 do
      if A1_2 == L8_2 then
        L3_2 = true
        break
      end
    end
    if A2_2 then
      L3_2 = not L3_2
    end
  else
    L4_2 = nil
    return L4_2
  end
  return L3_2
end

dependencies = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "dependencies"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  if A1_2 ~= nil then
    L2_2 = next
    L3_2 = A1_2
    L2_2 = L2_2(L3_2)
    if L2_2 ~= nil then
      goto lbl_9
    end
  end
  do return end
  ::lbl_9::
  L2_2 = {}
  L3_2 = createStringList
  L3_2 = L3_2()
  L4_2 = 1
  L5_2 = pairs
  L6_2 = A1_2
  L5_2, L6_2, L7_2 = L5_2(L6_2)
  for L8_2, L9_2 in L5_2, L6_2, L7_2 do
    L10_2 = {}
    L2_2[L4_2] = L10_2
    L10_2 = L2_2[L4_2]
    L10_2.name = L9_2
    L10_2 = L2_2[L4_2]
    L10_2.id = L8_2
    L10_2 = L3_2.add
    L11_2 = L2_2[L4_2]
    L11_2 = L11_2.name
    L10_2(L11_2)
    L4_2 = L4_2 + 1
  end
  L5_2 = showSelectionList
  L6_2 = string
  L6_2 = L6_2.format
  L7_2 = "%s (%d)"
  L8_2 = A0_2
  L9_2 = L3_2.Count
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L7_2 = "Select item from list"
  L8_2 = L3_2
  L5_2, L6_2 = L5_2(L6_2, L7_2, L8_2)
  L7_2 = L3_2.destroy
  L7_2()
  if L5_2 == -1 then
    L7_2 = nil
    return L7_2
  end
  L7_2 = L5_2 + 1
  L7_2 = L2_2[L7_2]
  L7_2 = L7_2.id
  return L7_2
end

createSelectionList = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "createSelectionList"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2)
  local L7_2, L8_2, L9_2, L10_2
  L7_2 = getAddressList
  L7_2 = L7_2()
  L7_2 = L7_2.createMemoryRecord
  L7_2 = L7_2()
  L7_2.Description = A1_2
  L7_2.VarType = A2_2
  if A3_2 ~= nil then
    L8_2 = L7_2.setAddress
    L9_2 = A3_2
    L10_2 = A4_2
    L8_2(L9_2, L10_2)
  end
  L8_2 = vtCustom
  if A2_2 == L8_2 and A5_2 ~= nil then
    L7_2.CustomTypeName = A5_2
  end
  L8_2 = vtAutoAssembler
  if A2_2 == L8_2 and A6_2 ~= nil then
    L7_2.Script = A6_2
  end
  L8_2 = vtGrouped
  if A2_2 ~= L8_2 then
    L8_2 = vtPointer
    if A2_2 ~= L8_2 then
      goto lbl_34
    end
  end
  L7_2.IsGroupHeader = true
  L7_2.options = "[moHideChildren,moDeactivateChildrenAsWell]"
  L7_2.ShowAsHex = true
  ::lbl_34::
  L8_2 = L7_2.appendToEntry
  L9_2 = A0_2
  L8_2(L9_2)
  L7_2.DontSave = true
  return L7_2
end

createRecord = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "createRecord"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  if A0_2 == nil then
    L2_2 = memrec
    if L2_2 ~= nil then
      A0_2 = memrec
    end
  end
  if A0_2 ~= nil then
    L2_2 = A0_2.Count
    if L2_2 ~= 0 then
      goto lbl_13
    end
  end
  do return end
  ::lbl_13::
  L2_2 = nil
  L3_2 = nil
  L4_2 = 0
  L5_2 = A0_2.Count
  L5_2 = L5_2 - 1
  L6_2 = 1
  for L7_2 = L4_2, L5_2, L6_2 do
    L8_2 = A0_2.Child
    L8_2 = L8_2[L7_2]
    L8_2 = L8_2.Description
    L8_2 = #L8_2
    L9_2 = #A1_2
    if L8_2 == L9_2 then
      L8_2 = string
      L8_2 = L8_2.compare
      L9_2 = string
      L9_2 = L9_2.gsub
      L10_2 = A0_2.Child
      L10_2 = L10_2[L7_2]
      L10_2 = L10_2.Description
      L11_2 = "[().%+-*?[^$:]"
      L12_2 = ""
      L9_2 = L9_2(L10_2, L11_2, L12_2)
      L10_2 = string
      L10_2 = L10_2.gsub
      L11_2 = A1_2
      L12_2 = "[().%+-*?[^$:]"
      L13_2 = ""
      L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2, L12_2, L13_2)
      L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
      if L8_2 then
        L8_2 = A0_2.Child
        L2_2 = L8_2[L7_2]
        L3_2 = L7_2
        break
      end
    end
  end
  L4_2 = L2_2
  L5_2 = L3_2
  return L4_2, L5_2
end

findRecord = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "findRecord"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = false
  L3_2 = pairs
  L4_2 = A1_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    if A0_2 == L7_2 then
      L2_2 = true
      break
    end
  end
  return L2_2
end

checkRecordExist = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "checkRecordExist"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = pairs
  L2_2 = A0_2
  L1_2, L2_2, L3_2 = L1_2(L2_2)
  for L4_2, L5_2 in L1_2, L2_2, L3_2 do
    L6_2 = getAddressList
    L6_2 = L6_2()
    L6_2 = L6_2.getMemoryRecordByID
    L7_2 = L4_2
    L6_2 = L6_2(L7_2)
    if L6_2 ~= nil then
      L6_2.Description = L5_2
    end
  end
  return
end

changeTableLanguage = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "changeTableLanguage"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = pairs
  L5_2 = A0_2
  L4_2, L5_2, L6_2 = L4_2(L5_2)
  for L7_2, L8_2 in L4_2, L5_2, L6_2 do
    L9_2 = getAddressList
    L9_2 = L9_2()
    L9_2 = L9_2.getMemoryRecordByID
    L10_2 = L8_2
    L9_2 = L9_2(L10_2)
    if L9_2 == nil then
      return
    end
    L9_2.VarType = A1_2
    L10_2 = vtCustom
    if A1_2 == L10_2 and A2_2 ~= nil then
      L9_2.CustomTypeName = A2_2
    end
    L10_2 = vtAutoAssembler
    if A1_2 == L10_2 and A3_2 ~= nil then
      L9_2.Script = A3_2
    end
    L10_2 = vtGrouped
    if A1_2 ~= L10_2 then
      L10_2 = vtPointer
      if A1_2 ~= L10_2 then
        goto lbl_35
      end
    end
    L9_2.IsGroupHeader = true
    L9_2.options = "[moHideChildren,moDeactivateChildrenAsWell]"
    L9_2.ShowAsHex = true
    ::lbl_35::
  end
end

changeRecordsVarType = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "changeRecordsVarType"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = pairs
  L3_2 = A0_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L7_2 = getAddressList
    L7_2 = L7_2()
    L7_2 = L7_2.getMemoryRecordByID
    L8_2 = L6_2
    L7_2 = L7_2(L8_2)
    if L7_2 == nil then
      return
    end
    L7_2.Value = A1_2
  end
  return
end

changeRecordsValue = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "changeRecordsValue"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = 0
  L2_2 = createTimer
  L2_2 = L2_2()
  L2_2.Interval = 150
  
  function L3_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    L0_3 = L1_2
    L0_3 = L0_3 + 0.001
    L1_2 = L0_3
    L0_3 = math
    L0_3 = L0_3.floor
    L1_3 = math
    L1_3 = L1_3.sin
    L2_3 = freq
    L3_3 = L1_2
    L2_3 = L2_3 * L3_3
    L3_3 = redPhase
    L2_3 = L2_3 + L3_3
    L1_3 = L1_3(L2_3)
    L2_3 = mag
    L1_3 = L1_3 * L2_3
    L0_3 = L0_3(L1_3)
    L1_3 = bias
    L0_3 = L0_3 + L1_3
    red = L0_3
    L0_3 = math
    L0_3 = L0_3.floor
    L1_3 = math
    L1_3 = L1_3.sin
    L2_3 = freq
    L3_3 = L1_2
    L2_3 = L2_3 * L3_3
    L3_3 = greenPhase
    L2_3 = L2_3 + L3_3
    L1_3 = L1_3(L2_3)
    L2_3 = mag
    L1_3 = L1_3 * L2_3
    L0_3 = L0_3(L1_3)
    L1_3 = bias
    L0_3 = L0_3 + L1_3
    green = L0_3
    L0_3 = math
    L0_3 = L0_3.floor
    L1_3 = math
    L1_3 = L1_3.sin
    L2_3 = freq
    L3_3 = L1_2
    L2_3 = L2_3 * L3_3
    L3_3 = bluePhase
    L2_3 = L2_3 + L3_3
    L1_3 = L1_3(L2_3)
    L2_3 = mag
    L1_3 = L1_3 * L2_3
    L0_3 = L0_3(L1_3)
    L1_3 = bias
    L0_3 = L0_3 + L1_3
    blue = L0_3
    L0_3 = red
    L1_3 = green
    L1_3 = L1_3 << 8
    L0_3 = L0_3 + L1_3
    L1_3 = blue
    L1_3 = L1_3 << 16
    L0_3 = L0_3 + L1_3
    L1_3 = 0
    L2_3 = A0_2.Count
    L2_3 = L2_3 - 1
    L3_3 = 1
    for L4_3 = L1_3, L2_3, L3_3 do
      L5_3 = A0_2.Child
      L5_3 = L5_3[L4_3]
      L5_3.Color = L0_3
    end
  end
  
  L2_2.OnTimer = L3_2
  return L2_2
end

createRecordColorTimer = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "createRecordColorTimer"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = pairs
  L3_2 = A0_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L7_2 = getAddressList
    L7_2 = L7_2()
    L7_2 = L7_2.getMemoryRecordByID
    L8_2 = L6_2
    L7_2 = L7_2(L8_2)
    if L7_2 ~= nil then
      function L8_2(A0_3, A1_3, A2_3)
        local L3_3
        
        L3_3 = A1_2
        L3_3()
        L3_3 = false
        return L3_3
      end
      
      L7_2.OnValueChangedByUser = L8_2
    end
  end
  return
end

batchOnValueChangedByUser = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "batchOnValueChangedByUser"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L3_2 = pairs
  L4_2 = A0_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L8_2 = getAddressList
    L8_2 = L8_2()
    L8_2 = L8_2.getMemoryRecordByID
    L9_2 = L7_2
    L8_2 = L8_2(L9_2)
    if L8_2 == nil then
      return
    end
    if A2_2 then
      L8_2.ShowAsSigned = false
      L8_2.DropDownReadOnly = false
      L8_2.DropDownDescriptionOnly = false
      L8_2.DisplayAsDropDownListItem = false
      L9_2 = L8_2.DropDownList
      L9_2.Text = ""
    else
      L8_2.ShowAsSigned = true
      L8_2.DropDownReadOnly = true
      L8_2.DropDownDescriptionOnly = true
      L8_2.DisplayAsDropDownListItem = true
      L9_2 = L8_2.DropDownList
      L10_2 = typeOptionStringMaps
      L10_2 = L10_2[A1_2]
      L9_2.Text = L10_2
    end
  end
  return
end

dropDownListItem = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "dropDownListItem"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2
  L0_2 = math
  L0_2 = L0_2.pi
  L0_2 = L0_2 / 4
  redPhase = L0_2
  L0_2 = math
  L0_2 = L0_2.pi
  L0_2 = 3 * L0_2
  L0_2 = L0_2 / 4
  greenPhase = L0_2
  L0_2 = math
  L0_2 = L0_2.pi
  L0_2 = 5 * L0_2
  L0_2 = L0_2 / 4
  bluePhase = L0_2
  freq = 20
  mag = 111
  bias = 128
end

defineConstants = L8_1

function L8_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = Table
  if L0_2 == nil then
    L0_2 = {}
    Table = L0_2
  end
  L0_2 = Table
  L1_2 = {}
  L1_2.text_darkmode = [[
Enable "Disable Dark Mode support" on Cheat Engine for an optimal viewing experience.

Edit -> Settings -> Disable Dark Mode support]]
  L2_2 = string
  L2_2 = L2_2.format
  L3_2 = [[
This option is available only to Patrons.

Become a patron to access all features:

Patreon - %s
KaryaKarsa - %s

Register now?]]
  L4_2 = linkPatreon
  L5_2 = linkKaryaKarsa
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L1_2.text_exclusive = L2_2
  L1_2.text_luafailure = [[
Unable to continue.

Please change LUA Script Execution to Always, then restart Cheat Engine.

Edit > Settings > Table: LUA Scripts]]
  L2_2 = string
  L2_2 = L2_2.format
  L3_2 = [[
No process was selected.

Please manually attach [%s] to Cheat Engine]]
  L4_2 = expectedExecutable
  L2_2 = L2_2(L3_2, L4_2)
  L1_2.text_noprocess = L2_2
  L2_2 = string
  L2_2 = L2_2.format
  L3_2 = "You need at least Cheat Engine version [%.1f] to use this table."
  L4_2 = requiredCE
  L2_2 = L2_2(L3_2, L4_2)
  L1_2.text_wrongceversion = L2_2
  L2_2 = string
  L2_2 = L2_2.format
  L3_2 = [[
This table only work with process named [%s].

Please attach the correct process.]]
  L4_2 = expectedExecutable
  L2_2 = L2_2(L3_2, L4_2)
  L1_2.text_wrongexe = L2_2
  L2_2 = string
  L2_2 = L2_2.format
  L3_2 = [[
This table only work with [%s] version [%s].

Please use the correct table.]]
  L4_2 = gameShortName
  L5_2 = expectedVersion
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L1_2.text_wrongexeversion = L2_2
  L1_2.title_darkmode = "Dark Mode Enabled"
  L1_2.title_exclusive = "Exclusive Feature"
  L1_2.title_luafailure = "LUA Script Was Not Run"
  L1_2.title_noprocess = "Process Not Found"
  L1_2.title_wrongceversion = "Wrong CE Version"
  L1_2.title_wrongexe = "Wrong Process"
  L1_2.title_wrongexeversion = "Version Not Compatible"
  L0_2.Message = L1_2
end

defineStruct = L8_1

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = readInteger
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 == nil then
    L2_2 = allocateMemory
    L3_2 = A1_2
    L2_2 = L2_2(L3_2)
    L3_2 = registerSymbol
    L4_2 = A0_2
    L5_2 = L2_2
    L6_2 = true
    L3_2(L4_2, L5_2, L6_2)
    L3_2 = true
    return L3_2
  else
    L2_2 = false
    return L2_2
  end
end

customAlloc = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "customAlloc"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  if A0_2 ~= nil then
    if A1_2 == nil then
      A0_2.Description = "Records (??) ->"
    else
      A0_2.Description = A1_2
    end
    L3_2 = nil
    if A2_2 then
      ::lbl_11::
      L4_2 = A0_2.Count
      if A2_2 < L4_2 then
        L4_2 = A0_2.Child
        L4_2 = L4_2[A2_2]
        L4_2 = L4_2.Destroy
        L4_2()
        goto lbl_11
      end
    else
      L4_2 = A0_2.Count
      L4_2 = L4_2 - 1
      L5_2 = 0
      L6_2 = -1
      for L7_2 = L4_2, L5_2, L6_2 do
        L8_2 = A0_2.Child
        L8_2 = L8_2[L7_2]
        L9_2 = L8_2
        L8_2 = L8_2.Destroy
        L8_2(L9_2)
      end
    end
  end
end

disableArrayRecord = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "disableArrayRecord"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = os
  L2_2 = L2_2.clock
  L2_2 = L2_2()
  L3_2 = 0
  L4_2 = ""
  L5_2 = getAddressList
  L5_2 = L5_2()
  L6_2 = 0
  L7_2 = L5_2.getCount
  L7_2 = L7_2()
  L7_2 = L7_2 - 1
  L8_2 = 1
  for L9_2 = L6_2, L7_2, L8_2 do
    L10_2 = L5_2[L9_2]
    L10_2 = L10_2.ID
    L11_2 = A0_2.ID
    if L10_2 ~= L11_2 then
      L10_2 = L5_2[L9_2]
      L10_2 = L10_2.Active
      if L10_2 == true then
        L10_2 = L5_2[L9_2]
        L10_2.Active = false
        L10_2 = L4_2
        L11_2 = " "
        L12_2 = L5_2[L9_2]
        L12_2 = L12_2.ID
        L4_2 = L10_2 .. L11_2 .. L12_2
        L3_2 = L3_2 + 1
      end
    end
  end
  if A1_2 then
    L6_2 = MessageDialog
    L7_2 = string
    L7_2 = L7_2.format
    L8_2 = [[
		Operation Success!
		
		Disabled Record IDs = %s
		Total = %d
		
		Elapsed time is: %.3f s
		]]
    L9_2 = L4_2
    L10_2 = L3_2
    L11_2 = os
    L11_2 = L11_2.clock
    L11_2 = L11_2()
    L11_2 = L11_2 - L2_2
    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2)
    L8_2 = 2
    return L6_2(L7_2, L8_2)
  end
  return
end

disableAllRecords = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "disableAllRecords"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = os
  L2_2 = L2_2.clock
  L2_2 = L2_2()
  L3_2 = 0
  L4_2 = ""
  L5_2 = A0_2.parent
  L6_2 = 0
  L7_2 = L5_2.Count
  L7_2 = L7_2 - 1
  L8_2 = 1
  for L9_2 = L6_2, L7_2, L8_2 do
    L10_2 = L5_2.Child
    L10_2 = L10_2[L9_2]
    L10_2 = L10_2.ID
    L11_2 = A0_2.ID
    if L10_2 ~= L11_2 then
      L10_2 = L5_2.Child
      L10_2 = L10_2[L9_2]
      L10_2 = L10_2.Active
      if L10_2 == true then
        L10_2 = L5_2.Child
        L10_2 = L10_2[L9_2]
        L10_2.Active = false
        L10_2 = L4_2
        L11_2 = " "
        L12_2 = L5_2[L9_2]
        L12_2 = L12_2.ID
        L4_2 = L10_2 .. L11_2 .. L12_2
        L3_2 = L3_2 + 1
      end
    end
  end
  if A1_2 then
    L6_2 = MessageDialog
    L7_2 = string
    L7_2 = L7_2.format
    L8_2 = [[
		Operation Success!
		
		Disabled Record IDs = %s
		Total = %d
		
		Elapsed time is: %.3f s
		]]
    L9_2 = L4_2
    L10_2 = L3_2
    L11_2 = os
    L11_2 = L11_2.clock
    L11_2 = L11_2()
    L11_2 = L11_2 - L2_2
    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2)
    L8_2 = 2
    return L6_2(L7_2, L8_2)
  end
  return
end

disableOtherRecords = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "disableOtherRecords"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  if A0_2 == nil then
    L2_2 = memrec
    if L2_2 ~= nil then
      A0_2 = memrec
    end
  end
  L2_2 = findRecord
  L3_2 = A0_2
  L4_2 = A1_2
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 == nil then
    L3_2 = getAddressList
    L3_2 = L3_2()
    L3_2 = L3_2.createMemoryRecord
    L3_2 = L3_2()
    L2_2 = L3_2
    L2_2.Description = A1_2
    L2_2.IsGroupHeader = true
    if A0_2 ~= nil then
      L3_2 = L2_2.appendToEntry
      L4_2 = A0_2
      L3_2(L4_2)
    end
  end
  return L2_2
end

getHeader = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "getHeader"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = nil
  L1_2 = 0
  L2_2 = getFormCount
  L2_2 = L2_2()
  L2_2 = L2_2 - 1
  L3_2 = 1
  for L4_2 = L1_2, L2_2, L3_2 do
    L5_2 = getForm
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    L0_2 = L5_2
    L5_2 = L0_2.ClassName
    if L5_2 == "TfrmLuaEngine" then
      L5_2 = _frm
      if L5_2 then
        L5_2 = true
        if L5_2 then
          break
        end
      end
      L5_2 = L0_2.isForegroundWindow
      L6_2 = L0_2
      L5_2 = L5_2(L6_2)
      if L5_2 then
        break
      end
    end
  end
  L1_2 = L0_2.ClassName
  if L1_2 ~= "TfrmLuaEngine" or not L0_2 then
    L1_2 = getLuaEngine
    L1_2 = L1_2()
    L0_2 = L1_2
  end
  L1_2 = L0_2.ComponentByName
  L1_2 = L1_2.MenuItem5
  L1_2 = L1_2.doClick
  L1_2()
end

cls = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "cls"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = component_getComponent
  L1_2 = AddressList
  L2_2 = 0
  L0_2 = L0_2(L1_2, L2_2)
  L1_2 = setMethodProperty
  L2_2 = L0_2
  L3_2 = "OnDragOver"
  L4_2 = nil
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = setMethodProperty
  L2_2 = L0_2
  L3_2 = "OnDragDrop"
  L4_2 = nil
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = setMethodProperty
  L2_2 = L0_2
  L3_2 = "OnEndDrag"
  L4_2 = nil
  L1_2(L2_2, L3_2, L4_2)
end

disableDragDrop = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "disableDragDrop"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = component_getComponent
  L1_2 = AddressList
  L2_2 = 1
  L0_2 = L0_2(L1_2, L2_2)
  L1_2 = setMethodProperty
  L2_2 = L0_2
  L3_2 = "OnSectionClick"
  L4_2 = nil
  L1_2(L2_2, L3_2, L4_2)
end

disableHeaderSorting = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "disableHeaderSorting"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2
  L1_2 = AddressList
  L1_2 = L1_2.Header
  L1_2 = L1_2.Sections
  L1_2 = L1_2[2]
  L1_2.Visible = A0_2
  L1_2 = AddressList
  L1_2 = L1_2.Header
  L1_2 = L1_2.Sections
  L1_2 = L1_2[3]
  L1_2.Visible = A0_2
  return
end

showAddressTypeColumn = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "showAddressTypeColumn"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = compactmenuitem
  L2_2 = L2_2.Caption
  L2_2 = L2_2 ~= "Compact View Mode"
  if A1_2 ~= nil then
    L2_2 = not A1_2
  end
  L3_2 = compactmenuitem
  if L2_2 then
    L4_2 = "Compact View Mode"
    if L4_2 then
      goto lbl_17
    end
  end
  L4_2 = "Full View Mode"
  ::lbl_17::
  L3_2.Caption = L4_2
  L3_2 = getMainForm
  L3_2 = L3_2()
  L3_2 = L3_2.Splitter1
  L3_2.Visible = L2_2
  L3_2 = getMainForm
  L3_2 = L3_2()
  L3_2 = L3_2.Panel5
  L3_2.Visible = L2_2
end

cycleFullCompact = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "cycleFullCompact"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2, L2_2
  L0_2 = compactmenualreadyexists
  if L0_2 then
    return
  end
  L0_2 = getMainForm
  L0_2 = L0_2()
  L0_2 = L0_2.Menu
  L0_2 = L0_2.Items
  L1_2 = createMenuItem
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  compactmenuitem = L1_2
  L1_2 = L0_2.add
  L2_2 = compactmenuitem
  L1_2(L2_2)
  L1_2 = compactmenuitem
  L1_2.Caption = "Compact View Mode"
  L1_2 = compactmenuitem
  L2_2 = cycleFullCompact
  L1_2.OnClick = L2_2
  compactmenualreadyexists = "yes"
end

addCompactMenu = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "addCompactMenu"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = readQword
  L2_2 = getAddressSafe
  L3_2 = A0_2
  L2_2, L3_2 = L2_2(L3_2)
  return L1_2(L2_2, L3_2)
end

getVTable = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "getVTable"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = #A0_2
  L3_2 = #A1_2
  if L2_2 ~= L3_2 then
    return
  end
  L2_2 = 1
  L3_2 = #A0_2
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = registerSymbol
    L7_2 = A0_2[L5_2]
    L8_2 = getAddressSafe
    L9_2 = A1_2[L5_2]
    L8_2 = L8_2(L9_2)
    L9_2 = true
    L6_2(L7_2, L8_2, L9_2)
  end
end

registerSymbolBatch = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "registerSymbolBatch"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = nil
  L3_2 = ipairs
  L4_2 = enumStructureForms
  L4_2, L5_2, L6_2, L7_2, L8_2, L9_2 = L4_2()
  L3_2, L4_2, L5_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L8_2 = L7_2.MainStruct
    if L8_2 ~= nil then
      L9_2 = L8_2.Name
      if L9_2 == A0_2 then
        L2_2 = L7_2
        break
      end
    end
  end
  if L2_2 == nil then
    L3_2 = createStructureForm
    L4_2 = A1_2
    L5_2 = nil
    L6_2 = A0_2
    L3_2(L4_2, L5_2, L6_2)
    return
  end
  L3_2 = L2_2.addColumn
  L3_2 = L3_2()
  L3_2.AddressText = A1_2
  L3_2.Focused = true
  return L3_2
end

AddAddressToStructureForm = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "AddAddressToStructureForm"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = createForm
  L3_2 = false
  L2_2 = L2_2(L3_2)
  L2_2.Caption = A0_2
  L2_2.BorderStyle = "bsDialog"
  L2_2.AutoSize = true
  L2_2.Position = "poScreenCenter"
  L3_2 = createLabel
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L3_2.Caption = A1_2
  L4_2 = L3_2.BorderSpacing
  L4_2.Around = 20
  return L2_2
end

myShowMessage = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "myShowMessage"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = createForm
  L1_2 = false
  L0_2 = L0_2(L1_2)
  L0_2.BorderStyle = "bsNone"
  L0_2.FormStyle = "fsSplash"
  L0_2.Width = 325
  L0_2.Height = 54
  L0_2.Position = "poMainFormCenter"
  L1_2 = createFont
  L1_2 = L1_2()
  L1_2.Name = "Bahnschrift"
  L1_2.Size = 11
  L2_2 = Color
  L2_2 = L2_2.Text
  L1_2.Color = L2_2
  L1_2.Quality = "fqDraft"
  L1_2.CharSet = "ANSI_CHARSET"
  L1_2.Pitch = "fpVariable"
  L1_2.Style = "[fsBold]"
  L1_2.Color = 14474460
  L2_2 = createPanel
  L3_2 = L0_2
  L2_2 = L2_2(L3_2)
  L2_2.Align = "alClient"
  L3_2 = TreeView
  L3_2 = L3_2.Color
  L2_2.Color = L3_2
  L3_2 = createLabel
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = L3_2.AnchorSideLeft
  L4_2.Control = L2_2
  L4_2 = L3_2.AnchorSideTop
  L4_2.Control = L2_2
  L4_2 = L3_2.AnchorSideRight
  L4_2.Control = L2_2
  L4_2 = L3_2.AnchorSideRight
  L5_2 = asrBottom
  L4_2.Side = L5_2
  L3_2.Alignment = "taCenter"
  L3_2.Anchors = "[akTop, akLeft, akRight]"
  L4_2 = L3_2.BorderSpacing
  L4_2.Around = 5
  L3_2.Align = "alTop"
  L3_2.Font = L1_2
  L3_2.Caption = "Setting up the table, please wait...."
  L4_2 = createProgressBar
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  L5_2 = L4_2.AnchorSideLeft
  L5_2.Control = L2_2
  L5_2 = L4_2.AnchorSideTop
  L6_2 = asrBottom
  L5_2.Side = L6_2
  L5_2 = L4_2.AnchorSideRight
  L5_2.Control = L2_2
  L5_2 = L4_2.AnchorSideRight
  L6_2 = asrBottom
  L5_2.Side = L6_2
  L5_2 = L4_2.AnchorSideBottom
  L5_2.Control = L2_2
  L5_2 = L4_2.AnchorSideBottom
  L6_2 = asrBottom
  L5_2.Side = L6_2
  L4_2.Anchors = "[akLeft, akRight, akBottom]"
  L5_2 = L4_2.BorderSpacing
  L5_2.Around = 5
  L4_2.Height = 20
  L4_2.Align = "alBottom"
  L4_2.Min = 0
  L4_2.Max = 100
  L4_2.Step = 1
  L4_2.Style = "pbstNormal"
  repeat
    L5_2 = L4_2.stepIt
    L5_2()
    L5_2 = L4_2.position
  until L5_2 == 100
  L5_2 = L0_2.Show
  return L5_2()
end

showProgress = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "showProgress"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = readInteger
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= nil then
    L2_2 = targetIs64Bit
    L2_2 = L2_2()
    if L2_2 then
      L2_2 = bShr
      L3_2 = L1_2
      L4_2 = 31
      L2_2 = L2_2(L3_2, L4_2)
      if L2_2 == 1 then
        L2_2 = bOr
        L3_2 = -4294967296
        L4_2 = L1_2
        return L2_2(L3_2, L4_2)
      end
    end
  end
  return L1_2
end

readSignedInteger = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "readSignedInteger"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = readSmallInteger
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= nil then
    L2_2 = bShr
    L3_2 = L1_2
    L4_2 = 15
    L2_2 = L2_2(L3_2, L4_2)
    if L2_2 == 1 then
      L2_2 = targetIs64Bit
      L2_2 = L2_2()
      if L2_2 then
        L2_2 = bOr
        L3_2 = -65536
        L4_2 = L1_2
        return L2_2(L3_2, L4_2)
      else
        L2_2 = bOr
        L3_2 = 4294901760
        L4_2 = L1_2
        return L2_2(L3_2, L4_2)
      end
    end
  end
  return L1_2
end

readSignedShortInteger = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "readSignedShortInteger"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = readBytes
  L2_2 = A0_2
  L3_2 = 1
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 ~= nil then
    L2_2 = bShr
    L3_2 = L1_2
    L4_2 = 7
    L2_2 = L2_2(L3_2, L4_2)
    if L2_2 == 1 then
      L2_2 = targetIs64Bit
      L2_2 = L2_2()
      if L2_2 then
        L2_2 = bOr
        L3_2 = -256
        L4_2 = L1_2
        return L2_2(L3_2, L4_2)
      else
        L2_2 = bOr
        L3_2 = 4294967040
        L4_2 = L1_2
        return L2_2(L3_2, L4_2)
      end
    end
  end
  return L1_2
end

readSignedByte = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "readSignedByte"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = bShr
  L3_2 = readBytes
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L4_2 = A1_2
  L2_2 = L2_2(L3_2, L4_2)
  L2_2 = L2_2 & 1
  return L2_2
end

readBit = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "readBit"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = readBit
  L4_2 = A0_2
  L5_2 = A1_2
  L3_2 = L3_2(L4_2, L5_2)
  L3_2 = L3_2 == 1
  L4_2 = readByte
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  if not L3_2 and A2_2 then
    L5_2 = writeBytes
    L6_2 = A0_2
    L7_2 = bShl
    L8_2 = 1
    L9_2 = A1_2
    L7_2 = L7_2(L8_2, L9_2)
    L7_2 = L4_2 + L7_2
    return L5_2(L6_2, L7_2)
  end
  if L3_2 and not A2_2 then
    L5_2 = writeBytes
    L6_2 = A0_2
    L7_2 = bShl
    L8_2 = 1
    L9_2 = A1_2
    L7_2 = L7_2(L8_2, L9_2)
    L7_2 = L4_2 - L7_2
    return L5_2(L6_2, L7_2)
  end
end

writeBit = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "writeBit"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = bShr
  L3_2 = A0_2
  L4_2 = A1_2
  L2_2 = L2_2(L3_2, L4_2)
  L2_2 = L2_2 & 1
  L2_2 = L2_2 == 1
  return L2_2
end

readBitInt = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "readBitInt"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = readBitInt
  L4_2 = A0_2
  L5_2 = A1_2
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = A0_2
  if not L3_2 and A2_2 then
    L5_2 = bShl
    L6_2 = 1
    L7_2 = A1_2
    L5_2 = L5_2(L6_2, L7_2)
    A0_2 = L4_2 + L5_2
  end
  if L3_2 and not A2_2 then
    L5_2 = bShl
    L6_2 = 1
    L7_2 = A1_2
    L5_2 = L5_2(L6_2, L7_2)
    A0_2 = L4_2 - L5_2
  end
  return A0_2
end

writeBitInt = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "writeBitInt"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = getAddressSafe
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 ~= nil then
    if A2_2 == "vtByte" then
      L3_2 = writeByte
      L4_2 = A0_2
      L5_2 = A1_2
      return L3_2(L4_2, L5_2)
    elseif A2_2 == "vtWord" then
      L3_2 = writeSmallInteger
      L4_2 = A0_2
      L5_2 = A1_2
      return L3_2(L4_2, L5_2)
    elseif A2_2 == "vtDword" then
      L3_2 = writeInteger
      L4_2 = A0_2
      L5_2 = A1_2
      return L3_2(L4_2, L5_2)
    elseif A2_2 == "vtQword" then
      L3_2 = writeQword
      L4_2 = A0_2
      L5_2 = A1_2
      return L3_2(L4_2, L5_2)
    elseif A2_2 == "vtSingle" then
      L3_2 = writeFloat
      L4_2 = A0_2
      L5_2 = A1_2
      return L3_2(L4_2, L5_2)
    elseif A2_2 == "vtDouble" then
      L3_2 = writeDouble
      L4_2 = A0_2
      L5_2 = A1_2
      return L3_2(L4_2, L5_2)
    elseif A2_2 == "vtString" then
      L3_2 = writeString
      L4_2 = A0_2
      L5_2 = A1_2
      return L3_2(L4_2, L5_2)
    elseif A1_2 <= 2147483647 then
      L3_2 = writeInteger
      L4_2 = A0_2
      L5_2 = A1_2
      return L3_2(L4_2, L5_2)
    elseif A1_2 <= 32767 then
      L3_2 = writeSmallInteger
      L4_2 = A0_2
      L5_2 = A1_2
      return L3_2(L4_2, L5_2)
    elseif A1_2 <= 127 then
      L3_2 = writeByte
      L4_2 = A0_2
      L5_2 = A1_2
      return L3_2(L4_2, L5_2)
    else
      return
    end
  end
end

writeValueAll = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "writeValueAll"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = A0_2 // 65536
  L2_2 = A0_2 % 65536
  L2_2 = L2_2 // 256
  L2_2 = L2_2 << 8
  L3_2 = A0_2 % 256
  L3_2 = L3_2 << 16
  L4_2 = L1_2 + L2_2
  L4_2 = L4_2 + L3_2
  return L4_2
end

RGB2BGR = L8_1

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = {}
  L3_2 = A0_2
  L4_2 = A1_2
  L3_2 = L3_2 .. L4_2
  L4_2 = L3_2
  L3_2 = L3_2.gmatch
  L5_2 = "(.-)"
  L6_2 = A1_2
  L5_2 = L5_2 .. L6_2
  L3_2, L4_2, L5_2 = L3_2(L4_2, L5_2)
  for L6_2 in L3_2, L4_2, L5_2 do
    L7_2 = table
    L7_2 = L7_2.insert
    L8_2 = L2_2
    L9_2 = L6_2
    L7_2(L8_2, L9_2)
  end
  return L2_2
end

split = L8_1
L8_1 = string

function L9_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L2_2 = A0_2
  L1_2 = A0_2.sub
  L3_2 = 3
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = tonumber
  L3_2 = L1_2
  L4_2 = 16
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = RGB2BGR
  L4_2 = L2_2
  return L3_2(L4_2)
end

L8_1.bgr = L9_1
L8_1 = string

function L9_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 == "string" then
    L2_2 = type
    L3_2 = A1_2
    L2_2 = L2_2(L3_2)
    if L2_2 == "string" then
      goto lbl_13
    end
  end
  L2_2 = nil
  do return L2_2 end
  ::lbl_13::
  L2_2 = string
  L2_2 = L2_2.match
  L3_2 = string
  L3_2 = L3_2.lower
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L4_2 = string
  L4_2 = L4_2.lower
  L5_2 = A1_2
  L4_2, L5_2 = L4_2(L5_2)
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  if L2_2 ~= nil then
    L2_2 = true
    return L2_2
  end
  L2_2 = false
  return L2_2
end

L8_1.compare = L9_1
L8_1 = string

function L9_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = {}
  L3_2 = 1
  L4_2 = string
  L4_2 = L4_2.find
  L5_2 = A0_2
  L6_2 = A1_2
  L7_2 = L3_2
  L4_2, L5_2 = L4_2(L5_2, L6_2, L7_2)
  while L4_2 do
    L6_2 = table
    L6_2 = L6_2.insert
    L7_2 = L2_2
    L8_2 = string
    L8_2 = L8_2.sub
    L9_2 = A0_2
    L10_2 = L3_2
    L11_2 = L4_2 - 1
    L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2, L10_2, L11_2)
    L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
    L3_2 = L5_2 + 1
    L6_2 = string
    L6_2 = L6_2.find
    L7_2 = A0_2
    L8_2 = A1_2
    L9_2 = L3_2
    L6_2, L7_2 = L6_2(L7_2, L8_2, L9_2)
    L5_2 = L7_2
    L4_2 = L6_2
  end
  L6_2 = table
  L6_2 = L6_2.insert
  L7_2 = L2_2
  L8_2 = string
  L8_2 = L8_2.sub
  L9_2 = A0_2
  L10_2 = L3_2
  L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2, L10_2)
  L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
  return L2_2
end

L8_1.split = L9_1
L8_1 = math

function L9_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = 0
  L2_2 = pairs
  L3_2 = A0_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L1_2 = L1_2 + L6_2
  end
  return L1_2
end

L8_1.sum = L9_1
L8_1 = math

function L9_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = 0
  L2_2 = pairs
  L3_2 = A0_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L1_2 = L1_2 + L6_2
  end
  L2_2 = #A0_2
  L2_2 = L1_2 / L2_2
  return L2_2
end

L8_1.average = L9_1
L8_1 = math

function L9_1(A0_2)
  local L1_2
  if 0 <= A0_2 then
    L1_2 = 1
    if L1_2 then
      goto lbl_7
    end
  end
  L1_2 = -1
  ::lbl_7::
  return L1_2
end

L8_1.sign = L9_1
L8_1 = math

function L9_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if not A1_2 then
    A1_2 = 1
  end
  L2_2 = math
  L2_2 = L2_2.floor
  L3_2 = A0_2 / A1_2
  L4_2 = math
  L4_2 = L4_2.sign
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L4_2 = L4_2 * 0.5
  L3_2 = L3_2 + L4_2
  L2_2 = L2_2(L3_2)
  L2_2 = L2_2 * A1_2
  return L2_2
end

L8_1.round = L9_1
L8_1 = table

function L9_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = pairs
  L3_2 = A0_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    if L6_2 == A1_2 then
      return L5_2
    end
  end
  L2_2 = nil
  return L2_2
end

L8_1.contains = L9_1
L8_1 = table

function L9_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = pairs
  L3_2 = A0_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L7_2 = table
    L7_2 = L7_2.concat
    L8_2 = L6_2
    L7_2 = L7_2(L8_2)
    L8_2 = table
    L8_2 = L8_2.concat
    L9_2 = A1_2
    L8_2 = L8_2(L9_2)
    if L7_2 == L8_2 then
      return L5_2
    end
  end
  L2_2 = nil
  return L2_2
end

L8_1.match = L9_1
L8_1 = table

function L9_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = A0_2[A1_2]
  L3_2 = table
  L3_2 = L3_2.remove
  L4_2 = A0_2
  L5_2 = A1_2
  L3_2(L4_2, L5_2)
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = A0_2
  L5_2 = L2_2
  L3_2(L4_2, L5_2)
  return A0_2
end

L8_1.replace = L9_1
L8_1 = table

function L9_1(A0_2, A1_2)
  local L2_2
  L2_2 = A0_2[A1_2]
  A0_2[A1_2] = nil
  return L2_2
end

L8_1.removekey = L9_1

function L8_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L0_2 = getMainForm
  L0_2 = L0_2()
  L1_2 = L0_2.Menu
  if L1_2 == nil then
    return
  end
  L1_2 = L0_2.Menu
  L1_2 = L1_2.Items
  L2_2 = nil
  L3_2 = {}
  L4_2 = 0
  L5_2 = L1_2.Count
  L5_2 = L5_2 - 1
  L6_2 = 1
  for L7_2 = L4_2, L5_2, L6_2 do
    L8_2 = L1_2[L7_2]
    L8_2 = L8_2.Name
    if L8_2 == "miTable" then
      L2_2 = L1_2[L7_2]
      L8_2 = L2_2.doClick
      L8_2()
      L8_2 = L0_2.bringToFront
      L8_2()
    end
  end
  L4_2 = false
  L5_2 = 0
  L6_2 = L2_2.Count
  L6_2 = L6_2 - 1
  L7_2 = 1
  for L8_2 = L5_2, L6_2, L7_2 do
    if L4_2 then
      L9_2 = #L3_2
      L9_2 = L9_2 + 1
      L10_2 = L2_2[L8_2]
      L10_2 = L10_2.Caption
      L3_2[L9_2] = L10_2
    end
    L9_2 = L2_2[L8_2]
    L9_2 = L9_2.Name
    if L9_2 == "miAddFile" then
      L4_2 = true
    end
  end
  L5_2 = ipairs
  L6_2 = L3_2
  L5_2, L6_2, L7_2 = L5_2(L6_2)
  for L8_2, L9_2 in L5_2, L6_2, L7_2 do
    L10_2 = findTableFile
    L11_2 = L9_2
    L10_2 = L10_2(L11_2)
    if L10_2 then
      L11_2 = L10_2.delete
      L11_2()
    end
  end
  L5_2 = true
  return L5_2
end

removeAllTableFiles = L8_1

function L8_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2
  L4_2 = createPicture
  L4_2 = L4_2()
  L5_2 = L4_2.loadFromStream
  L6_2 = findTableFile
  L7_2 = A1_2
  L6_2 = L6_2(L7_2)
  L6_2 = L6_2.Stream
  L5_2(L6_2)
  
  function L5_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L1_3 = A0_3.getCanvas
    L1_3 = L1_3()
    L2_3 = L4_2.getBitmap
    L2_3 = L2_3()
    L3_3 = L1_3.draw
    L4_3 = A2_2
    L5_3 = A3_2
    L6_3 = L2_3
    L3_3(L4_3, L5_3, L6_3)
  end
  
  A0_2.OnPaint = L5_2
end

attachBackground = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "attachBackground"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 == "string" then
    L1_2 = nil
    L2_2 = nil
    L3_2 = findTableFile
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    L1_2 = L3_2
    if not L1_2 then
      L3_2 = io
      L3_2 = L3_2.open
      L4_2 = A0_2
      L5_2 = "r"
      L3_2 = L3_2(L4_2, L5_2)
      if not L3_2 then
        L4_2 = error
        L5_2 = "ERROR loading font"
        L4_2(L5_2)
      else
        L5_2 = L3_2
        L4_2 = L3_2.close
        L4_2(L5_2)
        L5_2 = A0_2
        L4_2 = A0_2.match
        L6_2 = "\\(.-)$"
        L4_2 = L4_2(L5_2, L6_2)
        L2_2 = L4_2
        L4_2 = findTableFile
        L5_2 = L2_2
        L4_2 = L4_2(L5_2)
        L1_2 = L4_2
        if not L1_2 then
          L4_2 = createTableFile
          L5_2 = L2_2
          L6_2 = A0_2
          L4_2 = L4_2(L5_2, L6_2)
          L1_2 = L4_2
        end
      end
    end
    L3_2 = cheatEngineIs64Bit
    L3_2 = L3_2()
    if L3_2 then
      L3_2 = [[
mov edx,#%%d
mov rcx,#%%d
xor r8d,r8d
lea r9d,[count]
call AddFontMemResourceEx
mov [handle],rax]]
      if L3_2 then
        goto lbl_49
      end
    end
    L3_2 = [[
lea eax,[count]
push eax
push 0
push #%%d
push #%%d
call AddFontMemResourceEx
mov [handle],eax]]
    ::lbl_49::
    L4_2 = L1_2.stream
    L4_2 = L4_2.memory
    L5_2 = L1_2.stream
    L5_2 = L5_2.size
    L6_2 = [[
alloc(script,128)
alloc(data,32)
label(count)
label(handle)
registersymbol(count)
registersymbol(handle)
registersymbol(script)
script:
_FORMAT
ret
data:
count:
dd -1
handle:
dd -1
createthread(script)]]
    L8_2 = L6_2
    L7_2 = L6_2.gsub
    L9_2 = "_FORMAT"
    L10_2 = L3_2
    L7_2 = L7_2(L8_2, L9_2, L10_2)
    L8_2 = L7_2
    L7_2 = L7_2.format
    L9_2 = L5_2
    L10_2 = L4_2
    L7_2 = L7_2(L8_2, L9_2, L10_2)
    L6_2 = L7_2
    L7_2 = autoAssemble
    L8_2 = L6_2
    L9_2 = true
    L7_2 = L7_2(L8_2, L9_2)
    if L7_2 then
      L8_2 = readIntegerLocal
      L9_2 = "handle"
      L8_2 = L8_2(L9_2)
      if not L8_2 then
        L8_2 = 0
      end
      L9_2 = L8_2 ~= 0
      return L9_2
    end
    L8_2 = false
    return L8_2
  end
end

TableAddFont = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "TableAddFont"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = nil
  L1_2 = 0
  L2_2 = getFormCount
  L2_2 = L2_2()
  L3_2 = 1
  for L4_2 = L1_2, L2_2, L3_2 do
    L5_2 = getForm
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      L5_2 = getForm
      L6_2 = L4_2
      L5_2 = L5_2(L6_2)
      L5_2 = L5_2.name
      if L5_2 == "Comments" then
        L5_2 = getForm
        L6_2 = L4_2
        L5_2 = L5_2(L6_2)
        L0_2 = L5_2
        break
      end
    end
  end
  return L0_2
end

getCommentsForm = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "getCommentsForm"
L8_1(L9_1)

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = getAddressList
  L2_2 = L2_2()
  L3_2 = 0
  L4_2 = L2_2.getCount
  L4_2 = L4_2()
  L4_2 = L4_2 - 1
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = L2_2[L6_2]
    L7_2 = L7_2.Color
    if L7_2 == A0_2 then
      L7_2 = L2_2[L6_2]
      L7_2.Color = A1_2
    end
  end
end

changeEntriesColor = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "changeEntriesColor"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = getAddressList
  L0_2 = L0_2()
  L1_2 = 0
  L2_2 = L0_2.getCount
  L2_2 = L2_2()
  L2_2 = L2_2 - 1
  L3_2 = 1
  for L4_2 = L1_2, L2_2, L3_2 do
    L5_2 = L0_2[L4_2]
    L5_2 = L5_2.Color
    L6_2 = DefColor
    L6_2 = L6_2.Title
    if L5_2 == L6_2 then
      L5_2 = L0_2[L4_2]
      L6_2 = Color
      L6_2 = L6_2.Title
      L5_2.Color = L6_2
    else
      L5_2 = L0_2[L4_2]
      L5_2 = L5_2.Color
      L6_2 = DefColor
      L6_2 = L6_2.Header
      if L5_2 == L6_2 then
        L5_2 = L0_2[L4_2]
        L6_2 = Color
        L6_2 = L6_2.Header
        L5_2.Color = L6_2
      else
        L5_2 = L0_2[L4_2]
        L5_2 = L5_2.Color
        L6_2 = DefColor
        L6_2 = L6_2.Child1
        if L5_2 == L6_2 then
          L5_2 = L0_2[L4_2]
          L6_2 = Color
          L6_2 = L6_2.Child1
          L5_2.Color = L6_2
        else
          L5_2 = L0_2[L4_2]
          L5_2 = L5_2.Color
          L6_2 = DefColor
          L6_2 = L6_2.Child2
          if L5_2 == L6_2 then
            L5_2 = L0_2[L4_2]
            L6_2 = Color
            L6_2 = L6_2.Child2
            L5_2.Color = L6_2
          else
            L5_2 = L0_2[L4_2]
            L5_2 = L5_2.Color
            L6_2 = DefColor
            L6_2 = L6_2.Child3
            if L5_2 == L6_2 then
              L5_2 = L0_2[L4_2]
              L6_2 = Color
              L6_2 = L6_2.Child3
              L5_2.Color = L6_2
            else
              L5_2 = L0_2[L4_2]
              L5_2 = L5_2.Color
              L6_2 = DefColor
              L6_2 = L6_2.Child4
              if L5_2 == L6_2 then
                L5_2 = L0_2[L4_2]
                L6_2 = Color
                L6_2 = L6_2.Child4
                L5_2.Color = L6_2
              else
                L5_2 = L0_2[L4_2]
                L5_2 = L5_2.Color
                L6_2 = DefColor
                L6_2 = L6_2.Text
                if L5_2 == L6_2 then
                  L5_2 = L0_2[L4_2]
                  L6_2 = Color
                  L6_2 = L6_2.Text
                  L5_2.Color = L6_2
                else
                  L5_2 = L0_2[L4_2]
                  L5_2 = L5_2.Color
                  L6_2 = DefColor
                  L6_2 = L6_2.Pointer
                  if L5_2 == L6_2 then
                    L5_2 = L0_2[L4_2]
                    L6_2 = Color
                    L6_2 = L6_2.Pointer
                    L5_2.Color = L6_2
                  else
                    L5_2 = L0_2[L4_2]
                    L5_2 = L5_2.Color
                    L6_2 = DefColor
                    L6_2 = L6_2.SetFocus
                    if L5_2 == L6_2 then
                      L5_2 = L0_2[L4_2]
                      L6_2 = Color
                      L6_2 = L6_2.SetFocus
                      L5_2.Color = L6_2
                    else
                      L5_2 = L0_2[L4_2]
                      L5_2 = L5_2.Color
                      L6_2 = DefColor
                      L6_2 = L6_2.ReadOnly
                      if L5_2 == L6_2 then
                        L5_2 = L0_2[L4_2]
                        L6_2 = Color
                        L6_2 = L6_2.ReadOnly
                        L5_2.Color = L6_2
                      else
                        L5_2 = L0_2[L4_2]
                        L5_2 = L5_2.Color
                        L6_2 = DefColor
                        L6_2 = L6_2.SwitchOn
                        if L5_2 == L6_2 then
                          L5_2 = L0_2[L4_2]
                          L6_2 = Color
                          L6_2 = L6_2.SwitchOn
                          L5_2.Color = L6_2
                        else
                          L5_2 = L0_2[L4_2]
                          L5_2 = L5_2.Color
                          L6_2 = DefColor
                          L6_2 = L6_2.SwitchOff
                          if L5_2 == L6_2 then
                            L5_2 = L0_2[L4_2]
                            L6_2 = Color
                            L6_2 = L6_2.SwitchOff
                            L5_2.Color = L6_2
                          else
                            L5_2 = L0_2[L4_2]
                            L5_2 = L5_2.Color
                            L6_2 = DefColor
                            L6_2 = L6_2.SeparatorBig
                            if L5_2 == L6_2 then
                              L5_2 = L0_2[L4_2]
                              L6_2 = Color
                              L6_2 = L6_2.SeparatorBig
                              L5_2.Color = L6_2
                            else
                              L5_2 = L0_2[L4_2]
                              L5_2 = L5_2.Color
                              L6_2 = DefColor
                              L6_2 = L6_2.SeparatorSmall
                              if L5_2 == L6_2 then
                                L5_2 = L0_2[L4_2]
                                L6_2 = Color
                                L6_2 = L6_2.SeparatorSmall
                                L5_2.Color = L6_2
                              else
                                L5_2 = L0_2[L4_2]
                                L5_2 = L5_2.Color
                                L6_2 = DefColor
                                L6_2 = L6_2.Tools
                                if L5_2 == L6_2 then
                                  L5_2 = L0_2[L4_2]
                                  L6_2 = Color
                                  L6_2 = L6_2.Tools
                                  L5_2.Color = L6_2
                                else
                                  L5_2 = L0_2[L4_2]
                                  L5_2 = L5_2.Color
                                  L6_2 = DefColor
                                  L6_2 = L6_2.ReadMe
                                  if L5_2 == L6_2 then
                                    L5_2 = L0_2[L4_2]
                                    L6_2 = Color
                                    L6_2 = L6_2.ReadMe
                                    L5_2.Color = L6_2
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  L1_2 = pairs
  L2_2 = Color
  L1_2, L2_2, L3_2 = L1_2(L2_2)
  for L4_2, L5_2 in L1_2, L2_2, L3_2 do
    L6_2 = DefColor
    L6_2[L4_2] = L5_2
  end
end

changeAllEntriesColor = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "changeAllEntriesColor"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
  L3_2 = A0_2
  if L3_2 == nil then
    return
  end
  L4_2 = createSaveDialog
  L4_2 = L4_2()
  L4_2.DefaultExt = ".csv"
  L4_2.Filter = "Excel CSV File (*.csv)|*.csv"
  L4_2.FilterIndex = 1
  L4_2.Options = "[ofOverwritePrompt, ofEnableSizing]"
  L5_2 = A2_2 or L5_2
  if not A2_2 then
    L5_2 = ""
  end
  L4_2.InitialDir = L5_2
  L5_2 = A1_2 or L5_2
  if not A1_2 then
    L5_2 = ""
  end
  L4_2.Filename = L5_2
  L5_2 = L4_2.execute
  L5_2 = L5_2()
  if L5_2 then
    L5_2 = L3_2.saveToFile
    L6_2 = L4_2.Filename
    L5_2(L6_2)
  end
  L5_2 = L4_2.destroy
  L5_2()
  L5_2 = L3_2.destroy
  L5_2()
  return
end

saveCSV = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "saveCSV"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2, L2_2
  L0_2 = ""
  L1_2 = createOpenDialog
  L1_2 = L1_2()
  L1_2.DefaultExt = ".csv"
  L1_2.Filter = "Excel CSV File (*.csv)|*.csv"
  L1_2.FilterIndex = 1
  L1_2.Options = "[ofOverwritePrompt, ofEnableSizing]"
  L2_2 = L1_2.execute
  L2_2 = L2_2()
  if L2_2 then
    L0_2 = L1_2.Filename
  end
  L2_2 = L1_2.destroy
  L2_2()
  return L0_2
end

loadCSV = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "loadCSV"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  if A0_2 == nil or A0_2 == "" then
    L1_2 = nil
    return L1_2
  end
  L1_2 = io
  L1_2 = L1_2.open
  L2_2 = A0_2
  L3_2 = "r"
  L1_2 = L1_2(L2_2, L3_2)
  if not L1_2 then
    L2_2 = error
    L3_2 = "Failed to open file: "
    L4_2 = A0_2
    L3_2 = L3_2 .. L4_2
    L2_2(L3_2)
  end
  L3_2 = L1_2
  L2_2 = L1_2.read
  L2_2 = L2_2(L3_2)
  L3_2 = split
  L4_2 = L2_2
  L5_2 = ","
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = ipairs
  L5_2 = L3_2
  L4_2, L5_2, L6_2 = L4_2(L5_2)
  for L7_2, L8_2 in L4_2, L5_2, L6_2 do
  end
  L4_2 = {}
  L5_2 = 0
  L7_2 = L1_2
  L6_2 = L1_2.lines
  L6_2, L7_2, L8_2 = L6_2(L7_2)
  for L9_2 in L6_2, L7_2, L8_2 do
    L11_2 = L9_2
    L10_2 = L9_2.gsub
    L12_2 = "\n"
    L13_2 = ""
    L10_2 = L10_2(L11_2, L12_2, L13_2)
    L11_2 = L10_2
    L10_2 = L10_2.gsub
    L12_2 = "\r"
    L13_2 = ""
    L10_2 = L10_2(L11_2, L12_2, L13_2)
    L9_2 = L10_2
    L10_2 = split
    L11_2 = L9_2
    L12_2 = ","
    L10_2 = L10_2(L11_2, L12_2)
    L11_2 = {}
    L12_2 = ipairs
    L13_2 = L10_2
    L12_2, L13_2, L14_2 = L12_2(L13_2)
    for L15_2, L16_2 in L12_2, L13_2, L14_2 do
      L17_2 = table
      L17_2 = L17_2.insert
      L18_2 = L11_2
      L19_2 = L16_2
      L17_2(L18_2, L19_2)
    end
    L12_2 = L5_2 + 1
    L4_2[L12_2] = L11_2
    L5_2 = L5_2 + 1
  end
  L7_2 = L1_2
  L6_2 = L1_2.close
  L6_2(L7_2)
  return L4_2
end

readCSV = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "readCSV"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = A0_2
  if L1_2 == nil then
    return
  end
  L2_2 = pairs
  L3_2 = L1_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L7_2 = 1
    L8_2 = L1_2[L5_2]
    L8_2 = #L8_2
    L9_2 = 1
    for L10_2 = L7_2, L8_2, L9_2 do
      L11_2 = print
      L12_2 = L1_2[L5_2]
      L12_2 = L12_2[L10_2]
      L11_2(L12_2)
    end
  end
end

printCSV = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "printCSV"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2
  L0_2 = {}
  Color = L0_2
  L0_2 = Color
  L0_2.Title = 55295
  L0_2 = Color
  L0_2.Header = 16744576
  L0_2 = Color
  L0_2.Child1 = 16776960
  L0_2 = Color
  L0_2.Child2 = 8454143
  L0_2 = Color
  L0_2.Child3 = 8421631
  L0_2 = Color
  L0_2.Child4 = 8453888
  L0_2 = Color
  L0_2.Text = 14474460
  L0_2 = Color
  L0_2.Pointer = 16744448
  L0_2 = Color
  L0_2.SetFocus = 4073680
  L0_2 = Color
  L0_2.ReadOnly = 255
  L0_2 = Color
  L0_2.SwitchOn = 65280
  L0_2 = Color
  L0_2.SwitchOff = 255
  L0_2 = Color
  L0_2.SeparatorBig = 8421504
  L0_2 = Color
  L0_2.SeparatorSmall = 5592405
  L0_2 = Color
  L0_2.Tools = 12615935
  L0_2 = Color
  L0_2.ReadMe = 4899229
  L0_2 = {}
  DefColor = L0_2
  L0_2 = DefColor
  L0_2.Title = 55295
  L0_2 = DefColor
  L0_2.Header = 16744576
  L0_2 = DefColor
  L0_2.Child1 = 16776960
  L0_2 = DefColor
  L0_2.Child2 = 8454143
  L0_2 = DefColor
  L0_2.Child3 = 8421631
  L0_2 = DefColor
  L0_2.Child4 = 8453888
  L0_2 = DefColor
  L0_2.Text = 14474460
  L0_2 = DefColor
  L0_2.Pointer = 16744448
  L0_2 = DefColor
  L0_2.SetFocus = 4073680
  L0_2 = DefColor
  L0_2.ReadOnly = 255
  L0_2 = DefColor
  L0_2.SwitchOn = 65280
  L0_2 = DefColor
  L0_2.SwitchOff = 255
  L0_2 = DefColor
  L0_2.SeparatorBig = 8421504
  L0_2 = DefColor
  L0_2.SeparatorSmall = 5592405
  L0_2 = DefColor
  L0_2.Tools = 12615935
  L0_2 = DefColor
  L0_2.ReadMe = 4899229
  L0_2 = getAddressList
  L0_2 = L0_2()
  AL = L0_2
  L0_2 = createFont
  L0_2 = L0_2()
  Font = L0_2
  L0_2 = AL
  L0_2 = L0_2.Control
  L0_2 = L0_2[0]
  TreeView = L0_2
  L0_2 = Font
  L0_2.Name = "Consolas"
  L0_2 = Font
  L0_2.Size = 12
  L0_2 = Font
  L1_2 = Color
  L1_2 = L1_2.Text
  L0_2.Color = L1_2
  L0_2 = Font
  L0_2.Quality = "fqDraft"
  L0_2 = Font
  L0_2.CharSet = "ANSI_CHARSET"
  L0_2 = Font
  L0_2.Pitch = "fpVariable"
  L0_2 = Font
  L0_2.Style = "[fsBold]"
  L0_2 = TreeView
  L1_2 = Font
  L0_2.Font = L1_2
  L0_2 = TreeView
  L0_2.Color = 2558999
  L0_2 = AL
  L0_2.CheckboxColor = 7481081
  L0_2 = AL
  L0_2.CheckboxActiveColor = 15923448
  L0_2 = AL
  L0_2.CheckboxSelectedColor = 7481081
  L0_2 = AL
  L0_2.CheckboxActiveSelectedColor = 15923448
  L0_2 = AL
  L0_2.SelectedBackgroundColor = 6380375
  L0_2 = AL
  L0_2.SelectedSecondaryBackgroundColor = 3752769
  return
end

loadTableTheme = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "loadTableTheme"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = getCommentsForm
  L0_2 = L0_2()
  L0_2.Height = 600
  L0_2.Width = 555
  L1_2 = createFont
  L1_2 = L1_2()
  L1_2.Name = "Consolas"
  L1_2.Size = 10
  L2_2 = Color
  L2_2 = L2_2.Text
  L1_2.Color = L2_2
  L1_2.Quality = "fqDraft"
  L1_2.CharSet = "ANSI_CHARSET"
  L1_2.Pitch = "fpFixed"
  L2_2 = L0_2.tsComment
  L2_2 = L2_2.Destroy
  L2_2()
  L2_2 = L0_2.PageControl1
  L2_2 = L2_2.AddTab
  L2_2 = L2_2()
  L2_2.Caption = "Read Me"
  L3_2 = L0_2.PageControl1
  L3_2 = L3_2.AddTab
  L3_2 = L3_2()
  L3_2.Caption = "Changelog"
  L4_2 = createMemo
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  L4_2.Align = "alClient"
  L4_2.Color = 2238503
  L4_2.ScrollBars = "ssAutoVertical"
  L4_2.Font = L1_2
  L5_2 = L4_2.Lines
  L6_2 = tableReadme
  L5_2.Text = L6_2
  L4_2.ReadOnly = true
  L5_2 = createMemo
  L6_2 = L3_2
  L5_2 = L5_2(L6_2)
  L5_2.Align = "alClient"
  L5_2.Color = 2238503
  L5_2.ScrollBars = "ssAutoVertical"
  L5_2.Font = L1_2
  L6_2 = L5_2.Lines
  L7_2 = tableChangelog
  L6_2.Text = L7_2
  L5_2.ReadOnly = true
  return
end

loadReadMe = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "loadReadMe"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = hideAllCEWindows
  L0_2()
  L0_2 = MessageDialog
  L1_2 = gameShortName
  L2_2 = " "
  L3_2 = tableDesc
  L1_2 = L1_2 .. L2_2 .. L3_2
  L2_2 = firstMessage
  L3_2 = 2
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = unhideMainCEwindow
  L0_2()
end

loadFirstPopUp = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "loadFirstPopUp"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L0_2 = getMainForm
  L0_2 = L0_2()
  L0_2 = L0_2.Panel4
  Signature = L0_2
  L0_2 = Signature
  L1_2 = clNone
  L0_2.Color = L1_2
  L0_2 = getMainForm
  L0_2 = L0_2()
  L0_2 = L0_2.CommentButton
  L0_2.Visible = false
  L0_2 = getMainForm
  L0_2 = L0_2()
  L0_2 = L0_2.advancedbutton
  L0_2.Visible = false
  L0_2 = createFont
  L0_2 = L0_2()
  L0_2.Name = "Orbitron"
  L1_2 = clBlack
  L0_2.Color = L1_2
  L0_2.Size = 9
  L0_2.Quality = "fqDraft"
  L0_2.CharSet = "ANSI_CHARSET"
  L0_2.Pitch = "fpVariable"
  L0_2.Style = "[fsBold]"
  L1_2 = createPanel
  L2_2 = Signature
  L1_2 = L1_2(L2_2)
  L2_2 = L1_2.AnchorSideLeft
  L3_2 = Signature
  L2_2.Side = L3_2
  L2_2 = L1_2.AnchorSideTop
  L3_2 = Signature
  L2_2.Control = L3_2
  L2_2 = L1_2.AnchorSideBottom
  L3_2 = Signature
  L2_2.Control = L3_2
  L2_2 = L1_2.AnchorSideBottom
  L3_2 = asrBottom
  L2_2.Side = L3_2
  L1_2.Height = 32
  L1_2.Top = 1
  L1_2.Width = 85
  L1_2.Anchors = "[akTop, akLeft, akBottom]"
  L2_2 = clNone
  L1_2.BevelColor = L2_2
  L1_2.BevelOuter = "bvNone"
  L1_2.ClientHeight = 32
  L1_2.ClientWidth = 85
  L2_2 = attachBackground
  L3_2 = L1_2
  L4_2 = "patreon.png"
  L5_2 = 3
  L6_2 = 3
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = createLabel
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = L2_2.AnchorSideTop
  L3_2.Control = L1_2
  L3_2 = L2_2.AnchorSideBottom
  L3_2.Control = L1_2
  L3_2 = L2_2.AnchorSideBottom
  L4_2 = asrBottom
  L3_2.Side = L4_2
  L2_2.Anchors = "[akTop, akBottom]"
  L2_2.Layout = "tlCenter"
  L2_2.Font = L0_2
  L2_2.Caption = "Patreon"
  L2_2.Hint = "Visit the official Patreon page"
  L2_2.ShowHint = true
  L3_2 = crHandPoint
  L2_2.Cursor = L3_2
  L2_2.Left = 25
  L2_2.Width = 52
  
  function L3_2(A0_3)
    local L1_3, L2_3
    L1_3 = A0_3.Font
    L2_3 = clBlue
    L1_3.Color = L2_3
  end
  
  L2_2.OnMouseEnter = L3_2
  
  function L3_2(A0_3)
    local L1_3, L2_3
    L1_3 = A0_3.Font
    L2_3 = clBlack
    L1_3.Color = L2_3
  end
  
  L2_2.OnMouseLeave = L3_2
  
  function L3_2(A0_3)
    local L1_3, L2_3
    L1_3 = shellExecute
    L2_3 = linkPatreon
    L1_3(L2_3)
  end
  
  L2_2.OnClick = L3_2
  L3_2 = createPanel
  L4_2 = Signature
  L3_2 = L3_2(L4_2)
  L4_2 = L3_2.AnchorSideLeft
  L4_2.Control = L1_2
  L4_2 = L3_2.AnchorSideLeft
  L5_2 = asrBottom
  L4_2.Side = L5_2
  L4_2 = L3_2.AnchorSideTop
  L5_2 = Signature
  L4_2.Control = L5_2
  L4_2 = L3_2.AnchorSideBottom
  L5_2 = Signature
  L4_2.Control = L5_2
  L4_2 = L3_2.AnchorSideBottom
  L5_2 = asrBottom
  L4_2.Side = L5_2
  L3_2.Height = 32
  L3_2.Top = 1
  L3_2.Width = 75
  L3_2.Anchors = "[akTop,akLeft,akBottom]"
  L4_2 = clNone
  L3_2.BevelColor = L4_2
  L3_2.BevelOuter = "bvNone"
  L3_2.ClientHeight = 32
  L3_2.ClientWidth = 75
  L4_2 = attachBackground
  L5_2 = L3_2
  L6_2 = "paypal.png"
  L7_2 = 3
  L8_2 = 3
  L4_2(L5_2, L6_2, L7_2, L8_2)
  L4_2 = createLabel
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = L4_2.AnchorSideTop
  L5_2.Control = L3_2
  L5_2 = L4_2.AnchorSideBottom
  L5_2.Control = L3_2
  L5_2 = L4_2.AnchorSideBottom
  L6_2 = asrBottom
  L5_2.Side = L6_2
  L4_2.Anchors = "[akTop, akBottom]"
  L4_2.Layout = "tlCenter"
  L4_2.Font = L0_2
  L4_2.Caption = "PayPal"
  L4_2.Hint = "Donate with PayPal"
  L4_2.ShowHint = true
  L5_2 = crHandPoint
  L4_2.Cursor = L5_2
  L4_2.Left = 25
  L4_2.Width = 46
  
  function L5_2(A0_3)
    local L1_3, L2_3
    L1_3 = A0_3.Font
    L2_3 = clBlue
    L1_3.Color = L2_3
  end
  
  L4_2.OnMouseEnter = L5_2
  
  function L5_2(A0_3)
    local L1_3, L2_3
    L1_3 = A0_3.Font
    L2_3 = clBlack
    L1_3.Color = L2_3
  end
  
  L4_2.OnMouseLeave = L5_2
  
  function L5_2(A0_3)
    local L1_3, L2_3
    L1_3 = shellExecute
    L2_3 = linkPayPal
    L1_3(L2_3)
  end
  
  L4_2.OnClick = L5_2
  L5_2 = createPanel
  L6_2 = Signature
  L5_2 = L5_2(L6_2)
  L6_2 = L5_2.AnchorSideLeft
  L6_2.Control = L3_2
  L6_2 = L5_2.AnchorSideLeft
  L7_2 = asrBottom
  L6_2.Side = L7_2
  L6_2 = L5_2.AnchorSideTop
  L7_2 = Signature
  L6_2.Control = L7_2
  L6_2 = L5_2.AnchorSideBottom
  L7_2 = Signature
  L6_2.Control = L7_2
  L6_2 = L5_2.AnchorSideBottom
  L7_2 = asrBottom
  L6_2.Side = L7_2
  L5_2.Height = 32
  L5_2.Top = 1
  L5_2.Width = 105
  L5_2.Anchors = "[akTop,akLeft,akBottom]"
  L6_2 = clNone
  L5_2.BevelColor = L6_2
  L5_2.BevelOuter = "bvNone"
  L5_2.ClientHeight = 32
  L5_2.ClientWidth = 105
  L6_2 = attachBackground
  L7_2 = L5_2
  L8_2 = "karyakarsa.png"
  L9_2 = 3
  L10_2 = 3
  L6_2(L7_2, L8_2, L9_2, L10_2)
  L6_2 = createLabel
  L7_2 = L5_2
  L6_2 = L6_2(L7_2)
  L7_2 = L6_2.AnchorSideTop
  L7_2.Control = L5_2
  L7_2 = L6_2.AnchorSideBottom
  L7_2.Control = L5_2
  L7_2 = L6_2.AnchorSideBottom
  L8_2 = asrBottom
  L7_2.Side = L8_2
  L6_2.Anchors = "[akTop, akBottom]"
  L6_2.Layout = "tlCenter"
  L6_2.Font = L0_2
  L6_2.Caption = "KaryaKarsa"
  L6_2.Hint = "Kunjungi page official di KaryaKarsa.com"
  L6_2.ShowHint = true
  L7_2 = crHandPoint
  L6_2.Cursor = L7_2
  L6_2.Left = 25
  L6_2.Width = 80
  
  function L7_2(A0_3)
    local L1_3, L2_3
    L1_3 = A0_3.Font
    L2_3 = clBlue
    L1_3.Color = L2_3
  end
  
  L6_2.OnMouseEnter = L7_2
  
  function L7_2(A0_3)
    local L1_3, L2_3
    L1_3 = A0_3.Font
    L2_3 = clBlack
    L1_3.Color = L2_3
  end
  
  L6_2.OnMouseLeave = L7_2
  
  function L7_2(A0_3)
    local L1_3, L2_3
    L1_3 = shellExecute
    L2_3 = linkKaryaKarsa
    L1_3(L2_3)
  end
  
  L6_2.OnClick = L7_2
  L7_2 = createPanel
  L8_2 = Signature
  L7_2 = L7_2(L8_2)
  L8_2 = L7_2.AnchorSideLeft
  L9_2 = asrBottom
  L8_2.Side = L9_2
  L8_2 = L7_2.AnchorSideTop
  L9_2 = Signature
  L8_2.Control = L9_2
  L8_2 = L7_2.AnchorSideRight
  L9_2 = Signature
  L8_2.Control = L9_2
  L8_2 = L7_2.AnchorSideRight
  L9_2 = asrBottom
  L8_2.Side = L9_2
  L8_2 = L7_2.AnchorSideBottom
  L9_2 = Signature
  L8_2.Control = L9_2
  L8_2 = L7_2.AnchorSideBottom
  L9_2 = asrBottom
  L8_2.Side = L9_2
  L7_2.Height = 32
  L7_2.Top = 1
  L7_2.Width = 60
  L7_2.Anchors = "[akTop,akRight,akBottom]"
  L8_2 = clNone
  L7_2.BevelColor = L8_2
  L7_2.BevelOuter = "bvNone"
  L7_2.ClientHeight = 32
  L7_2.ClientWidth = 60
  L8_2 = attachBackground
  L9_2 = L7_2
  L10_2 = "fearless.png"
  L11_2 = 3
  L12_2 = 3
  L8_2(L9_2, L10_2, L11_2, L12_2)
  L8_2 = createLabel
  L9_2 = L7_2
  L8_2 = L8_2(L9_2)
  L9_2 = L8_2.AnchorSideTop
  L9_2.Control = L7_2
  L9_2 = L8_2.AnchorSideBottom
  L9_2.Control = L7_2
  L9_2 = L8_2.AnchorSideBottom
  L10_2 = asrBottom
  L9_2.Side = L10_2
  L8_2.Anchors = "[akTop, akBottom]"
  L8_2.Layout = "tlCenter"
  L8_2.Font = L0_2
  L8_2.Caption = "FRF"
  L8_2.Hint = "Visit the official thread on Fearless Revolution"
  L8_2.ShowHint = true
  L9_2 = crHandPoint
  L8_2.Cursor = L9_2
  L8_2.Left = 25
  L8_2.Width = 28
  
  function L9_2(A0_3)
    local L1_3, L2_3
    L1_3 = A0_3.Font
    L2_3 = clBlue
    L1_3.Color = L2_3
  end
  
  L8_2.OnMouseEnter = L9_2
  
  function L9_2(A0_3)
    local L1_3, L2_3
    L1_3 = A0_3.Font
    L2_3 = clBlack
    L1_3.Color = L2_3
  end
  
  L8_2.OnMouseLeave = L9_2
  
  function L9_2(A0_3)
    local L1_3, L2_3
    L1_3 = shellExecute
    L2_3 = linkFRF
    L1_3(L2_3)
  end
  
  L8_2.OnClick = L9_2
  L9_2 = createPanel
  L10_2 = Signature
  L9_2 = L9_2(L10_2)
  L10_2 = L9_2.AnchorSideLeft
  L11_2 = asrBottom
  L10_2.Side = L11_2
  L10_2 = L9_2.AnchorSideTop
  L11_2 = Signature
  L10_2.Control = L11_2
  L10_2 = L9_2.AnchorSideRight
  L10_2.Control = L7_2
  L10_2 = L9_2.AnchorSideBottom
  L11_2 = Signature
  L10_2.Control = L11_2
  L10_2 = L9_2.AnchorSideBottom
  L11_2 = asrBottom
  L10_2.Side = L11_2
  L9_2.Height = 32
  L9_2.Top = 1
  L9_2.Width = 100
  L9_2.Anchors = "[akTop, akRight, akBottom]"
  L10_2 = clNone
  L9_2.BevelColor = L10_2
  L9_2.BevelOuter = "bvNone"
  L9_2.ClientHeight = 32
  L9_2.ClientWidth = 100
  L10_2 = attachBackground
  L11_2 = L9_2
  L12_2 = "sortitoutsi.png"
  L13_2 = 3
  L14_2 = 3
  L10_2(L11_2, L12_2, L13_2, L14_2)
  L10_2 = createLabel
  L11_2 = L9_2
  L10_2 = L10_2(L11_2)
  L11_2 = L10_2.AnchorSideTop
  L11_2.Control = L9_2
  L11_2 = L10_2.AnchorSideBottom
  L11_2.Control = L9_2
  L11_2 = L10_2.AnchorSideBottom
  L12_2 = asrBottom
  L11_2.Side = L12_2
  L10_2.Anchors = "[akTop, akBottom]"
  L10_2.Layout = "tlCenter"
  L10_2.Font = L0_2
  L10_2.Caption = "Sortitoutsi"
  L10_2.Hint = "Visit the thread on Sortitoutsi.net"
  L10_2.ShowHint = true
  L11_2 = crHandPoint
  L10_2.Cursor = L11_2
  L10_2.Left = 25
  L10_2.Width = 69
  
  function L11_2(A0_3)
    local L1_3, L2_3
    L1_3 = A0_3.Font
    L2_3 = clBlue
    L1_3.Color = L2_3
  end
  
  L10_2.OnMouseEnter = L11_2
  
  function L11_2(A0_3)
    local L1_3, L2_3
    L1_3 = A0_3.Font
    L2_3 = clBlack
    L1_3.Color = L2_3
  end
  
  L10_2.OnMouseLeave = L11_2
  
  function L11_2(A0_3)
    local L1_3, L2_3
    L1_3 = shellExecute
    L2_3 = linkSortitoutsi
    L1_3(L2_3)
  end
  
  L10_2.OnClick = L11_2
  L11_2 = createLabel
  L12_2 = Signature
  L11_2 = L11_2(L12_2)
  L11_2.Caption = "TDG6661"
  L11_2.Align = "alClient"
  L11_2.Alignment = "taCenter"
  L11_2.Layout = "tlCenter"
  L12_2 = L11_2.Font
  L12_2.Name = "HEX:gon Bold"
  L12_2 = L11_2.Font
  L12_2.Size = 18
  L12_2 = L11_2.Font
  L13_2 = Color
  L13_2 = L13_2.SetFocus
  L12_2.Color = L13_2
  
  function L12_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = 0
    L2_3 = createTimer
    L2_3 = L2_3()
    L2_3.Interval = A0_3
    
    function L3_3()
      local L0_4, L1_4, L2_4, L3_4
      L0_4 = L1_3
      L0_4 = L0_4 + 0.001
      L1_3 = L0_4
      L0_4 = math
      L0_4 = L0_4.floor
      L1_4 = math
      L1_4 = L1_4.sin
      L2_4 = freq
      L3_4 = L1_3
      L2_4 = L2_4 * L3_4
      L3_4 = redPhase
      L2_4 = L2_4 + L3_4
      L1_4 = L1_4(L2_4)
      L2_4 = mag
      L1_4 = L1_4 * L2_4
      L0_4 = L0_4(L1_4)
      L1_4 = bias
      L0_4 = L0_4 + L1_4
      red = L0_4
      L0_4 = math
      L0_4 = L0_4.floor
      L1_4 = math
      L1_4 = L1_4.sin
      L2_4 = freq
      L3_4 = L1_3
      L2_4 = L2_4 * L3_4
      L3_4 = greenPhase
      L2_4 = L2_4 + L3_4
      L1_4 = L1_4(L2_4)
      L2_4 = mag
      L1_4 = L1_4 * L2_4
      L0_4 = L0_4(L1_4)
      L1_4 = bias
      L0_4 = L0_4 + L1_4
      green = L0_4
      L0_4 = math
      L0_4 = L0_4.floor
      L1_4 = math
      L1_4 = L1_4.sin
      L2_4 = freq
      L3_4 = L1_3
      L2_4 = L2_4 * L3_4
      L3_4 = bluePhase
      L2_4 = L2_4 + L3_4
      L1_4 = L1_4(L2_4)
      L2_4 = mag
      L1_4 = L1_4 * L2_4
      L0_4 = L0_4(L1_4)
      L1_4 = bias
      L0_4 = L0_4 + L1_4
      blue = L0_4
      L0_4 = red
      L1_4 = green
      L1_4 = L1_4 << 8
      L0_4 = L0_4 + L1_4
      L1_4 = blue
      L1_4 = L1_4 << 16
      L0_4 = L0_4 + L1_4
      L1_4 = L11_2.Font
      L1_4.Color = L0_4
    end
    
    L2_3.OnTimer = L3_3
    return L2_3
  end
  
  L13_2 = L12_2
  L14_2 = 1
  L13_2(L14_2)
  return
end

loadFooterArea = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "loadFooterArea"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = getAddressList
  L0_2 = L0_2()
  L1_2 = getMainForm
  L1_2 = L1_2()
  L2_2 = createFont
  L2_2 = L2_2()
  L2_2.Name = "Bahnschrift"
  L2_2.Quality = "fqDraft"
  L2_2.CharSet = "ANSI_CHARSET"
  L2_2.Pitch = "fpVariable"
  L2_2.Style = "[fsBold]"
  L3_2 = createPanel
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  TableTitle = L3_2
  L3_2 = TableTitle
  L4_2 = alTop
  L3_2.Align = L4_2
  L3_2 = TableTitle
  L3_2.Height = 40
  L3_2 = TableTitle
  L4_2 = clNone
  L3_2.Color = L4_2
  L3_2 = createLabel
  L4_2 = TableTitle
  L3_2 = L3_2(L4_2)
  TableTitleText = L3_2
  L3_2 = TableTitleText
  L3_2.Alignment = "taCenter"
  L3_2 = TableTitleText
  L3_2.Font = L2_2
  L3_2 = TableTitleText
  L3_2 = L3_2.Font
  L3_2.Size = 11
  L3_2 = TableTitleText
  L3_2 = L3_2.Font
  L3_2.Color = 4073680
  L3_2 = TableTitleText
  L3_2 = L3_2.AnchorSideLeft
  L4_2 = TableTitle
  L3_2.Control = L4_2
  L3_2 = TableTitleText
  L3_2 = L3_2.AnchorSideTop
  L4_2 = TableTitle
  L3_2.Control = L4_2
  L3_2 = TableTitleText
  L3_2 = L3_2.AnchorSideRight
  L4_2 = TableTitle
  L3_2.Control = L4_2
  L3_2 = TableTitleText
  L3_2 = L3_2.AnchorSideRight
  L4_2 = asrBottom
  L3_2.Side = L4_2
  L3_2 = TableTitleText
  L3_2.Anchors = "[akTop, akLeft, akRight]"
  L3_2 = TableTitleText
  L3_2 = L3_2.BorderSpacing
  L3_2.Around = 2
  L3_2 = createLabel
  L4_2 = TableTitle
  L3_2 = L3_2(L4_2)
  TableTitleDesc = L3_2
  L3_2 = TableTitleDesc
  L3_2.Alignment = "taCenter"
  L3_2 = TableTitleDesc
  L3_2.Font = L2_2
  L3_2 = TableTitleDesc
  L3_2 = L3_2.Font
  L3_2.Size = 9
  L3_2 = TableTitleDesc
  L3_2 = L3_2.Font
  L3_2.Color = 16744448
  L3_2 = TableTitleDesc
  L3_2 = L3_2.AnchorSideLeft
  L4_2 = TableTitle
  L3_2.Control = L4_2
  L3_2 = TableTitleDesc
  L3_2 = L3_2.AnchorSideTop
  L4_2 = TableTitleText
  L3_2.Control = L4_2
  L3_2 = TableTitleDesc
  L3_2 = L3_2.AnchorSideTop
  L4_2 = asrBottom
  L3_2.Side = L4_2
  L3_2 = TableTitleDesc
  L3_2 = L3_2.AnchorSideRight
  L4_2 = TableTitle
  L3_2.Control = L4_2
  L3_2 = TableTitleDesc
  L3_2 = L3_2.AnchorSideRight
  L4_2 = asrBottom
  L3_2.Side = L4_2
  L3_2 = TableTitleDesc
  L3_2 = L3_2.AnchorSideBottom
  L4_2 = TableTitle
  L3_2.Control = L4_2
  L3_2 = TableTitleDesc
  L3_2 = L3_2.AnchorSideBottom
  L4_2 = asrBottom
  L3_2.Side = L4_2
  L3_2 = TableTitleDesc
  L3_2.Anchors = "[akTop, akLeft, akRight, akBottom]"
  L3_2 = TableTitleDesc
  L3_2 = L3_2.BorderSpacing
  L3_2.Around = 2
end

loadTitlePanel = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "loadTitlePanel"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = getAddressList
  L0_2 = L0_2()
  L1_2 = getMainForm
  L1_2 = L1_2()
  L2_2 = createFont
  L2_2 = L2_2()
  L2_2.Name = "Orbitron"
  L2_2.Quality = "fqDraft"
  L2_2.CharSet = "ANSI_CHARSET"
  L2_2.Pitch = "fpVariable"
  L2_2.Size = 8
  L3_2 = createPanel
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  L3_2.Left = 0
  L3_2.Height = 21
  L3_2.Top = 0
  L3_2.Width = 679
  L3_2.Align = "alBottom"
  L3_2.BevelOuter = "bvNone"
  L3_2.ClientHeight = 21
  L3_2.ClientWidth = 679
  L3_2.TabOrder = 0
  L4_2 = clWhite
  L3_2.Color = L4_2
  L4_2 = createPanel
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  InfoLabelPanel = L4_2
  L4_2 = InfoLabelPanel
  L4_2 = L4_2.AnchorSideLeft
  L4_2.Control = L3_2
  L4_2 = InfoLabelPanel
  L4_2 = L4_2.AnchorSideTop
  L4_2.Control = L3_2
  L4_2 = InfoLabelPanel
  L4_2 = L4_2.AnchorSideBottom
  L4_2.Control = L3_2
  L4_2 = InfoLabelPanel
  L4_2 = L4_2.AnchorSideBottom
  L5_2 = asrBottom
  L4_2.Side = L5_2
  L4_2 = InfoLabelPanel
  L4_2.Left = 0
  L4_2 = InfoLabelPanel
  L4_2.Height = 21
  L4_2 = InfoLabelPanel
  L4_2.Top = 0
  L4_2 = InfoLabelPanel
  L4_2.Width = 60
  L4_2 = InfoLabelPanel
  L4_2.Anchors = "[akTop, akLeft, akBottom]"
  L4_2 = InfoLabelPanel
  L4_2.BevelOuter = "bvNone"
  L4_2 = InfoLabelPanel
  L4_2.Font = L2_2
  L4_2 = InfoLabelPanel
  L4_2 = L4_2.Font
  L4_2.Size = 10
  L4_2 = InfoLabelPanel
  L4_2.Caption = "Info"
  L4_2 = InfoLabelPanel
  L4_2.TabOrder = 0
  L4_2 = createLabel
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  InfoText = L4_2
  L4_2 = InfoText
  L4_2 = L4_2.AnchorSideLeft
  L5_2 = asrBottom
  L4_2.Side = L5_2
  L4_2 = InfoText
  L4_2 = L4_2.AnchorSideTop
  L4_2.Control = L3_2
  L4_2 = InfoText
  L4_2 = L4_2.AnchorSideRight
  L5_2 = asrBottom
  L4_2.Side = L5_2
  L4_2 = InfoText
  L4_2 = L4_2.AnchorSideBottom
  L4_2.Control = L3_2
  L4_2 = InfoText
  L4_2 = L4_2.AnchorSideBottom
  L5_2 = asrBottom
  L4_2.Side = L5_2
  L4_2 = InfoText
  L5_2 = InfoLabelPanel
  L5_2 = L5_2.Width
  L4_2.Left = L5_2
  L4_2 = InfoText
  L4_2.Anchors = "[akTop, akBottom]"
  L4_2 = InfoText
  L4_2 = L4_2.BorderSpacing
  L4_2.Around = 0
  L4_2 = InfoText
  L4_2.Font = L2_2
  L4_2 = InfoText
  L4_2 = L4_2.Font
  L4_2.Name = "Consolas"
  L4_2 = InfoText
  L4_2.Layout = "tlCenter"
  L4_2 = InfoText
  L4_2.ParentColor = false
  L4_2 = InfoText
  L4_2.ParentFont = false
  L4_2 = InfoText
  L5_2 = getRandomInfo
  L6_2 = true
  L5_2 = L5_2(L6_2)
  L4_2.Caption = L5_2
  L4_2 = InfoText
  L4_2.Visible = false
  L4_2 = getMainForm
  L4_2 = L4_2()
  L4_2 = L4_2.Width
  InfoTextLeft = L4_2
  L4_2 = InfoText
  L4_2.Visible = true
  L4_2 = createTimer
  L4_2 = L4_2()
  L4_2.Interval = 30
  
  function L5_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = control_getSize
    L1_3 = getMainForm
    L1_3, L2_3, L3_3, L4_3 = L1_3()
    L0_3, L1_3 = L0_3(L1_3, L2_3, L3_3, L4_3)
    L2_3 = InfoText
    L2_3 = L2_3.Width
    L2_3 = -L2_3
    L3_3 = InfoLabelPanel
    L3_3 = L3_3.Width
    L2_3 = L2_3 + L3_3
    L3_3 = InfoTextLeft
    if L3_3 == L2_3 then
      L3_3 = getRandomInfo
      L3_3 = L3_3()
      L4_3 = InfoText
      L4_3.Caption = L3_3
      L4_3 = getMainForm
      L4_3 = L4_3()
      L4_3 = L4_3.Width
      InfoTextLeft = L4_3
    else
      L3_3 = InfoTextLeft
      L3_3 = L3_3 - 1
      InfoTextLeft = L3_3
    end
    L3_3 = InfoText
    L4_3 = InfoTextLeft
    L3_3.Left = L4_3
  end
  
  L4_2.OnTimer = L5_2
  L4_2.Enabled = true
end

loadInfoPanel = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "loadInfoPanel"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = getCEVersion
  L1_2 = L1_2()
  L2_2 = requiredCE
  if L1_2 < L2_2 then
    L1_2 = MessageDialog
    L2_2 = Table
    L2_2 = L2_2.Message
    L2_2 = L2_2.title_wrongceversion
    L3_2 = Table
    L3_2 = L3_2.Message
    L3_2 = L3_2.text_wrongceversion
    L4_2 = 1
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = enableAutoDisable
    L2_2 = A0_2
    L3_2 = nil
    L1_2(L2_2, L3_2)
    L1_2 = false
    return L1_2
  end
  L1_2 = _G
  L1_2 = L1_2.getAttachedProcessFileName
  if L1_2 == nil then
    L1_2 = MessageDialog
    L2_2 = Table
    L2_2 = L2_2.Message
    L2_2 = L2_2.title_luafailure
    L3_2 = Table
    L3_2 = L3_2.Message
    L3_2 = L3_2.text_luafailure
    L4_2 = 1
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = enableAutoDisable
    L2_2 = A0_2
    L3_2 = nil
    L1_2(L2_2, L3_2)
    L1_2 = false
    return L1_2
  end
  L1_2 = process
  if L1_2 ~= nil then
    L1_2 = readInteger
    L2_2 = process
    L1_2 = L1_2(L2_2)
    if L1_2 then
      L1_2 = string
      L1_2 = L1_2.match
      L2_2 = string
      L2_2 = L2_2.lower
      L3_2 = process
      L2_2 = L2_2(L3_2)
      L3_2 = "^fm"
      L1_2 = L1_2(L2_2, L3_2)
      if L1_2 == nil then
        L1_2 = MessageDialog
        L2_2 = Table
        L2_2 = L2_2.Message
        L2_2 = L2_2.title_wrongexe
        L3_2 = Table
        L3_2 = L3_2.Message
        L3_2 = L3_2.text_wrongexe
        L4_2 = 1
        L1_2(L2_2, L3_2, L4_2)
        L1_2 = enableAutoDisable
        L2_2 = A0_2
        L3_2 = nil
        L1_2(L2_2, L3_2)
        L1_2 = false
        return L1_2
      end
      L1_2 = string
      L1_2 = L1_2.lower
      L2_2 = process
      L1_2 = L1_2(L2_2)
      expectedExecutable = L1_2
      L1_2 = unregisterSymbol
      L2_2 = "fm.exe"
      L1_2(L2_2)
      L1_2 = registerSymbol
      L2_2 = "fm.exe"
      L3_2 = process
      L4_2 = true
      L1_2(L2_2, L3_2, L4_2)
    end
  end
  L1_2 = process
  if L1_2 ~= nil then
    L1_2 = readInteger
    L2_2 = process
    L1_2 = L1_2(L2_2)
    if L1_2 ~= nil then
      goto lbl_97
    end
  end
  L1_2 = openProcess
  L2_2 = expectedExecutable
  L1_2(L2_2)
  ::lbl_97::
  L1_2 = process
  if L1_2 == nil then
    L1_2 = MessageDialog
    L2_2 = Table
    L2_2 = L2_2.Message
    L2_2 = L2_2.title_noprocess
    L3_2 = Table
    L3_2 = L3_2.Message
    L3_2 = L3_2.text_noprocess
    L4_2 = 1
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = enableAutoDisable
    L2_2 = A0_2
    L3_2 = nil
    L1_2(L2_2, L3_2)
    L1_2 = false
    return L1_2
  end
  L1_2 = checkExeVersion
  L1_2 = L1_2()
  if not L1_2 then
    L1_2 = MessageDialog
    L2_2 = Table
    L2_2 = L2_2.Message
    L2_2 = L2_2.title_wrongexeversion
    L3_2 = Table
    L3_2 = L3_2.Message
    L3_2 = L3_2.title_wrongexeversion
    L4_2 = 1
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = enableAutoDisable
    L2_2 = A0_2
    L3_2 = nil
    L1_2(L2_2, L3_2)
    L1_2 = false
    return L1_2
  end
  L1_2 = darkMode
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = MessageDialog
    L2_2 = Table
    L2_2 = L2_2.Message
    L2_2 = L2_2.title_darkmode
    L3_2 = Table
    L3_2 = L3_2.Message
    L3_2 = L3_2.text_darkmode
    L4_2 = 0
    L1_2(L2_2, L3_2, L4_2)
  end
  L1_2 = waitForPDB
  if L1_2 then
    L1_2 = waitForPDB
    L1_2()
  end
  L1_2 = getAddress
  L2_2 = process
  L1_2 = L1_2(L2_2)
  GAME_BASE_ADDRESS = L1_2
  L1_2 = true
  return L1_2
end

startUpValidation = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "startUpValidation"
L8_1(L9_1)

function L8_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = showProgress
  L1_2()
  
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L0_3 = _G
    L0_3 = L0_3._globalsRegistered
    if L0_3 == nil then
      L0_3 = require
      L1_3 = "lib\\FMCETableForms"
      L0_3 = L0_3(L1_3)
      if L0_3 == nil then
        return
      end
      L1_3 = require
      L2_3 = "lib\\FMCETableEnums"
      L1_3 = L1_3(L2_3)
      if L1_3 == nil then
        return
      end
      L2_3 = require
      L3_3 = "lib\\FMCETableHelpers"
      L2_3 = L2_3(L3_3)
      if L2_3 == nil then
        return
      end
      L3_3 = require
      L4_3 = "lib\\FMCETablePresets"
      L3_3 = L3_3(L4_3)
      if L3_3 == nil then
        return
      end
      L4_3 = loadOffsets
      L4_3()
      L4_3 = loadLanguages
      L4_3()
      L4_3 = loadStatusPanel
      L4_3()
      L4_3 = loadSearchPanel
      L4_3()
    end
    L0_3 = openProcess
    L1_3 = expectedExecutable
    L0_3(L1_3)
    L0_3 = {}
    L1_3 = 17809
    L2_3 = 12109
    L3_3 = 18992
    L4_3 = 20669
    L5_3 = 19947
    L0_3[1] = L1_3
    L0_3[2] = L2_3
    L0_3[3] = L3_3
    L0_3[4] = L4_3
    L0_3[5] = L5_3
    L1_3 = pairs
    L2_3 = L0_3
    L1_3, L2_3, L3_3 = L1_3(L2_3)
    for L4_3, L5_3 in L1_3, L2_3, L3_3 do
      L6_3 = getAddressList
      L6_3 = L6_3()
      L6_3 = L6_3.getMemoryRecordByID
      L7_3 = L5_3
      L6_3 = L6_3(L7_3)
      L6_3.Active = true
    end
    L1_3 = addCompactMenu
    L1_3()
    L1_3 = cycleFullCompact
    L2_3 = nil
    L3_3 = Table
    L3_3 = L3_3.UseCompactMode
    L1_3(L2_3, L3_3)
    L1_3 = showAddressTypeColumn
    L2_3 = Table
    L2_3 = L2_3.ShowAddressType
    L1_3(L2_3)
    _deactivateTimers = false
  end
  
  L2_2 = createTimer
  L2_2 = L2_2()
  L2_2.Interval = 1000
  
  function L3_2()
    local L0_3, L1_3, L2_3
    L0_3 = getProcessIDFromProcessName
    L1_3 = expectedExecutable
    L0_3 = L0_3(L1_3)
    if L0_3 == nil then
      L0_3 = L2_2
      if L0_3 ~= nil then
        L2_2.Enabled = false
        L0_3 = L2_2.destroy
        L0_3()
        L0_3 = nil
        L2_2 = L0_3
      end
      A0_2.Active = false
      pointerInitState = false
      L0_3 = MainForm
      L0_3 = L0_3.ProcessLabel
      L0_3.Caption = "No Process Selected"
      L0_3 = getAddressList
      L0_3 = L0_3()
      L0_3 = L0_3.disableAllWithoutExecute
      L0_3()
      L0_3 = showStatusPanel
      L1_3 = nil
      L0_3(L1_3)
      L0_3 = cycleFullCompact
      L1_3 = nil
      L2_3 = false
      L0_3(L1_3, L2_3)
      L0_3 = showAddressTypeColumn
      L1_3 = true
      L0_3(L1_3)
      process = nil
      return
    else
    end
    L0_3 = L1_2
    if L0_3 ~= nil then
      L0_3 = L1_2
      L1_3 = nil
      L1_2 = L1_3
      L1_3 = L0_3
      L1_3()
      A0_2.options = "[moHideChildren,moDeactivateChildrenAsWell]"
      L1_3 = L2_2
      if L1_3 ~= nil then
        L2_2.Interval = 2000
      end
    end
  end
  
  L2_2.onTimer = L3_2
  L2_2.Enabled = true
  return
end

runEngine = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "runEngine"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = require
  L1_2 = "lib\\LIP"
  L0_2 = L0_2(L1_2)
  if L0_2 == nil then
    return
  end
  L1_2 = L0_2.load
  L2_2 = "config\\settings.ini"
  L1_2 = L1_2(L2_2)
  if L1_2 == nil then
    return
  end
  L2_2 = Font
  L3_2 = L1_2.Appereance
  L3_2 = L3_2.FontSize
  L2_2.Size = L3_2
  L2_2 = Font
  L3_2 = L1_2.Appereance
  L3_2 = L3_2.FontType
  L2_2.Name = L3_2
  L2_2 = AL
  L3_2 = L1_2.Appereance
  L3_2 = L3_2.TableCheckboxActiveselectedColor
  L2_2.CheckboxActiveSelectedColor = L3_2
  L2_2 = AL
  L3_2 = L1_2.Appereance
  L3_2 = L3_2.TableCheckboxSelectedColor
  L2_2.CheckboxSelectedColor = L3_2
  L2_2 = AL
  L3_2 = L1_2.Appereance
  L3_2 = L3_2.TableCheckboxActiveColor
  L2_2.CheckboxActiveColor = L3_2
  L2_2 = AL
  L3_2 = L1_2.Appereance
  L3_2 = L3_2.TableCheckboxColor
  L2_2.CheckboxColor = L3_2
  L2_2 = TreeView
  L3_2 = L1_2.Appereance
  L3_2 = L3_2.TableBackgroundColor
  L2_2.Color = L3_2
  L2_2 = AL
  L3_2 = L1_2.Appereance
  L3_2 = L3_2.TableSelectedBackgroundColor
  L2_2.SelectedBackgroundColor = L3_2
  L2_2 = AL
  L3_2 = L1_2.Appereance
  L3_2 = L3_2.TableSelectedSecondaryBackgroundColor
  L2_2.SelectedSecondaryBackgroundColor = L3_2
  L2_2 = Color
  L3_2 = L1_2.Appereance
  L3_2 = L3_2.TextColorTitle
  L2_2.Title = L3_2
  L2_2 = Color
  L3_2 = L1_2.Appereance
  L3_2 = L3_2.TextColorHeader
  L2_2.Header = L3_2
  L2_2 = Color
  L3_2 = L1_2.Appereance
  L3_2 = L3_2.TextColorChild1
  L2_2.Child1 = L3_2
  L2_2 = Color
  L3_2 = L1_2.Appereance
  L3_2 = L3_2.TextColorChild2
  L2_2.Child2 = L3_2
  L2_2 = Color
  L3_2 = L1_2.Appereance
  L3_2 = L3_2.TextColorChild3
  L2_2.Child3 = L3_2
  L2_2 = Color
  L3_2 = L1_2.Appereance
  L3_2 = L3_2.TextColorChild4
  L2_2.Child4 = L3_2
  L2_2 = Color
  L3_2 = L1_2.Appereance
  L3_2 = L3_2.TextColorText
  L2_2.Text = L3_2
  L2_2 = Color
  L3_2 = L1_2.Appereance
  L3_2 = L3_2.TextColorNotWorking
  L2_2.NotWorking = L3_2
  L2_2 = Color
  L3_2 = L1_2.Appereance
  L3_2 = L3_2.TextColorPointer
  L2_2.Pointer = L3_2
  L2_2 = Color
  L3_2 = L1_2.Appereance
  L3_2 = L3_2.TextColorPresets
  L2_2.Presets = L3_2
  L2_2 = Color
  L3_2 = L1_2.Appereance
  L3_2 = L3_2.TextColorSetFocus
  L2_2.SetFocus = L3_2
  L2_2 = Color
  L3_2 = L1_2.Appereance
  L3_2 = L3_2.TextColorReadOnly
  L2_2.ReadOnly = L3_2
  L2_2 = Color
  L3_2 = L1_2.Appereance
  L3_2 = L3_2.TextColorSwitchOn
  L2_2.SwitchOn = L3_2
  L2_2 = Color
  L3_2 = L1_2.Appereance
  L3_2 = L3_2.TextColorSwitchOff
  L2_2.SwitchOff = L3_2
  L2_2 = Color
  L3_2 = L1_2.Appereance
  L3_2 = L3_2.TextColorSeparatorBig
  L2_2.SeparatorBig = L3_2
  L2_2 = Color
  L3_2 = L1_2.Appereance
  L3_2 = L3_2.TextColorSeparatorSmall
  L2_2.SeparatorSmall = L3_2
  L2_2 = Color
  L3_2 = L1_2.Appereance
  L3_2 = L3_2.TextColorTools
  L2_2.Tools = L3_2
  L2_2 = Color
  L3_2 = L1_2.Appereance
  L3_2 = L3_2.TextColorReadMe
  L2_2.ReadMe = L3_2
  L2_2 = Table
  L3_2 = L1_2.General
  L3_2 = L3_2.HeaderUpdateTime
  L2_2.HeaderUpdateTime = L3_2
  L2_2 = Table
  L3_2 = L1_2.General
  L3_2 = L3_2.MaxShowItem
  L2_2.MaxShowItem = L3_2
  L2_2 = Table
  L3_2 = L1_2.General
  L3_2 = L3_2.MaxShowSearch
  L2_2.MaxShowSearch = L3_2
  L2_2 = Table
  L3_2 = L1_2.General
  L3_2 = L3_2.ShowAddressType
  L2_2.ShowAddressType = L3_2
  L2_2 = Table
  L3_2 = L1_2.General
  L3_2 = L3_2.TimerUpdateTime
  L2_2.TimerUpdateTime = L3_2
  L2_2 = Table
  L3_2 = L1_2.General
  L3_2 = L3_2.UseCompactMode
  L2_2.UseCompactMode = L3_2
  L2_2 = Table
  L3_2 = L1_2.Other
  L3_2 = L3_2.CurrencyType
  L2_2.CurrencyType = L3_2
  L2_2 = Table
  L3_2 = L1_2.Other
  L3_2 = L3_2.ShowTableTitle
  L2_2.ShowTableTitle = L3_2
  L2_2 = Table
  L3_2 = L1_2.Other
  L3_2 = L3_2.ShowSearchPanel
  L2_2.ShowSearchPanel = L3_2
  L2_2 = Table
  L3_2 = L1_2.Other
  L3_2 = L3_2.ShowStatusPanel
  L2_2.ShowStatusPanel = L3_2
  L2_2 = Font
  L2_2.Name = "Consolas"
  L2_2 = Font
  L2_2.Size = 12
  L2_2 = Font
  L3_2 = Color
  L3_2 = L3_2.Text
  L2_2.Color = L3_2
  L2_2 = Font
  L2_2.Quality = "fqDraft"
  L2_2 = Font
  L2_2.CharSet = "ANSI_CHARSET"
  L2_2 = Font
  L2_2.Pitch = "fpVariable"
  L2_2 = Font
  L2_2.Style = "[fsBold]"
  L2_2 = TreeView
  L3_2 = Font
  L2_2.Font = L3_2
end

loadINI = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "loadINI"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = require
  L1_2 = "lib\\LIP"
  L0_2 = L0_2(L1_2)
  L1_2 = {}
  L2_2 = {}
  L3_2 = Font
  L3_2 = L3_2.Size
  L2_2.FontSize = L3_2
  L3_2 = Font
  L3_2 = L3_2.Name
  L2_2.FontType = L3_2
  L3_2 = TreeView
  L3_2 = L3_2.Color
  L2_2.TableBackgroundColor = L3_2
  L3_2 = AL
  L3_2 = L3_2.CheckboxActiveColor
  L2_2.TableCheckboxActiveColor = L3_2
  L3_2 = AL
  L3_2 = L3_2.CheckboxActiveSelectedColor
  L2_2.TableCheckboxActiveselectedColor = L3_2
  L3_2 = AL
  L3_2 = L3_2.CheckboxColor
  L2_2.TableCheckboxColor = L3_2
  L3_2 = AL
  L3_2 = L3_2.CheckboxSelectedColor
  L2_2.TableCheckboxSelectedColor = L3_2
  L3_2 = AL
  L3_2 = L3_2.SelectedBackgroundColor
  L2_2.TableSelectedBackgroundColor = L3_2
  L3_2 = AL
  L3_2 = L3_2.SelectedSecondaryBackgroundColor
  L2_2.TableSelectedSecondaryBackgroundColor = L3_2
  L3_2 = Color
  L3_2 = L3_2.Title
  L2_2.TextColorTitle = L3_2
  L3_2 = Color
  L3_2 = L3_2.Header
  L2_2.TextColorHeader = L3_2
  L3_2 = Color
  L3_2 = L3_2.Child1
  L2_2.TextColorChild1 = L3_2
  L3_2 = Color
  L3_2 = L3_2.Child2
  L2_2.TextColorChild2 = L3_2
  L3_2 = Color
  L3_2 = L3_2.Child3
  L2_2.TextColorChild3 = L3_2
  L3_2 = Color
  L3_2 = L3_2.Child4
  L2_2.TextColorChild4 = L3_2
  L3_2 = Color
  L3_2 = L3_2.Text
  L2_2.TextColorText = L3_2
  L3_2 = Color
  L3_2 = L3_2.NotWorking
  L2_2.TextColorNotWorking = L3_2
  L3_2 = Color
  L3_2 = L3_2.Pointer
  L2_2.TextColorPointer = L3_2
  L3_2 = Color
  L3_2 = L3_2.Presets
  L2_2.TextColorPresets = L3_2
  L3_2 = Color
  L3_2 = L3_2.SetFocus
  L2_2.TextColorSetFocus = L3_2
  L3_2 = Color
  L3_2 = L3_2.ReadOnly
  L2_2.TextColorReadOnly = L3_2
  L3_2 = Color
  L3_2 = L3_2.SwitchOn
  L2_2.TextColorSwitchOn = L3_2
  L3_2 = Color
  L3_2 = L3_2.SwitchOff
  L2_2.TextColorSwitchOff = L3_2
  L3_2 = Color
  L3_2 = L3_2.SeparatorBig
  L2_2.TextColorSeparatorBig = L3_2
  L3_2 = Color
  L3_2 = L3_2.SeparatorSmall
  L2_2.TextColorSeparatorSmall = L3_2
  L3_2 = Color
  L3_2 = L3_2.Tools
  L2_2.TextColorTools = L3_2
  L3_2 = Color
  L3_2 = L3_2.ReadMe
  L2_2.TextColorReadMe = L3_2
  L1_2.Appereance = L2_2
  L2_2 = {}
  L3_2 = Table
  L3_2 = L3_2.HeaderUpdateTime
  L2_2.HeaderUpdateTime = L3_2
  L3_2 = Table
  L3_2 = L3_2.MaxShowItem
  L2_2.MaxShowItem = L3_2
  L3_2 = Table
  L3_2 = L3_2.MaxShowSearch
  L2_2.MaxShowSearch = L3_2
  L3_2 = Table
  L3_2 = L3_2.ShowAddressType
  L2_2.ShowAddressType = L3_2
  L3_2 = Table
  L3_2 = L3_2.TimerUpdateTime
  L2_2.TimerUpdateTime = L3_2
  L3_2 = Table
  L3_2 = L3_2.UseCompactMode
  L2_2.UseCompactMode = L3_2
  L1_2.General = L2_2
  L2_2 = {}
  L3_2 = Table
  L3_2 = L3_2.CurrencyType
  L2_2.CurrencyType = L3_2
  L3_2 = Table
  L3_2 = L3_2.ShowTableTitle
  L2_2.ShowSearchPanel = L3_2
  L3_2 = Table
  L3_2 = L3_2.ShowSearchPanel
  L2_2.ShowStatusPanel = L3_2
  L3_2 = Table
  L3_2 = L3_2.ShowStatusPanel
  L2_2.ShowTableTitle = L3_2
  L1_2.Other = L2_2
  L2_2 = L0_2.save
  L3_2 = "config\\settings.ini"
  L4_2 = L1_2
  L2_2(L3_2, L4_2)
  return
end

saveINI = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "saveINI"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = require
  L1_2 = "lib\\CETableDetails"
  L0_2 = L0_2(L1_2)
  if L0_2 == nil then
    return
  end
  L1_2 = openProcess
  L2_2 = expectedExecutable
  L1_2(L2_2)
  L1_2 = {}
  Table = L1_2
  L1_2 = {}
  Color = L1_2
  L1_2 = getAddressList
  L1_2 = L1_2()
  AL = L1_2
  L1_2 = createFont
  L1_2 = L1_2()
  Font = L1_2
  L1_2 = AL
  L1_2 = L1_2.Control
  L1_2 = L1_2[0]
  TreeView = L1_2
  L1_2 = TableAddFont
  L2_2 = "bahnschrift.ttf"
  L1_2(L2_2)
  L1_2 = TableAddFont
  L2_2 = "hexgonbold.ttf"
  L1_2(L2_2)
  L1_2 = TableAddFont
  L2_2 = "orbitron_bold.ttf"
  L1_2(L2_2)
  L1_2 = defineConstants
  L1_2()
  L1_2 = defineStruct
  L1_2()
  L1_2 = loadINI
  L1_2()
  L1_2 = loadFooterArea
  L1_2()
  L1_2 = loadTitlePanel
  L1_2()
  L1_2 = loadInfoPanel
  L1_2()
  L1_2 = TableTitleText
  L2_2 = string
  L2_2 = L2_2.upper
  L3_2 = tableTitle
  L2_2 = L2_2(L3_2)
  L1_2.Caption = L2_2
  L1_2 = TableTitleDesc
  L2_2 = string
  L2_2 = L2_2.upper
  L3_2 = tableDesc
  L2_2 = L2_2(L3_2)
  L1_2.Caption = L2_2
end

initTable = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "initTable"
L8_1(L9_1)
L8_1 = CETableHelpers
return L8_1
