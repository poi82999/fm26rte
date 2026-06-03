local L0_1, L1_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  if A0_2 ~= nil then
    L1_2 = "luaFiles"
    L2_2 = A0_2
    if L1_2 ~= nil or L1_2 ~= "" then
      L3_2 = package
      L3_2 = L3_2.config
      L4_2 = L3_2
      L3_2 = L3_2.sub
      L5_2 = 1
      L6_2 = 1
      L3_2 = L3_2(L4_2, L5_2, L6_2)
      L4_2 = L1_2
      L5_2 = L3_2
      L6_2 = A0_2
      L2_2 = L4_2 .. L5_2 .. L6_2
    end
    L3_2 = io
    L3_2 = L3_2.open
    L4_2 = L2_2
    L5_2 = ".lua"
    L4_2 = L4_2 .. L5_2
    L3_2, L4_2 = L3_2(L4_2)
    if L3_2 and not L4_2 then
      L6_2 = L3_2
      L5_2 = L3_2.close
      L5_2(L6_2)
      L5_2 = require
      L6_2 = L2_2
      return L5_2(L6_2)
    else
      L5_2 = findTableFile
      L6_2 = A0_2
      L7_2 = ".lua"
      L6_2 = L6_2 .. L7_2
      L5_2 = L5_2(L6_2)
      if L5_2 == nil then
        L6_2 = nil
        return L6_2
      end
      L6_2 = L5_2.getData
      L6_2 = L6_2()
      L7_2 = nil
      L8_2 = L6_2.read
      L9_2 = L6_2.Size
      L8_2 = L8_2(L9_2)
      L9_2 = 1
      L10_2 = #L8_2
      L11_2 = 1
      for L12_2 = L9_2, L10_2, L11_2 do
        if L7_2 == nil then
          L7_2 = ""
        end
        L13_2 = L7_2
        L14_2 = string
        L14_2 = L14_2.char
        L15_2 = L8_2[L12_2]
        L14_2 = L14_2(L15_2)
        L7_2 = L13_2 .. L14_2
      end
      if L7_2 then
        L9_2 = assert
        L10_2 = loadstring
        L11_2 = L7_2
        L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L10_2(L11_2)
        L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
        return L9_2()
      end
    end
  end
  L1_2 = nil
  return L1_2
end

CETrequire = L0_1
L0_1 = CETrequire
L1_1 = "CETableHelpers"
L0_1(L1_1)
L0_1 = initTable
L0_1()
