--### 替换技检测 
--slot+数字代表替换技槽编号，一般两个替换技的槽，装上边替换技是0，下边是1  
--对于四号有三个，前两个也是上0下1，对应typeC，第三个单独占一个TypeE，装了是1没装是0  
--用类似 `ReplaceSkillCheck().SlotX == 0`这样的来做检测条件之类的
local function ReplaceSkillCheck()
    local masterPlayer = sdk.get_managed_singleton('snow.player.PlayerManager'):call("findMasterPlayer")
    if not masterPlayer then return  end
    local SkillTypeCheck = {
        Slot1 = masterPlayer:get_field("_replaceAttackTypeA"),
        Slot2 = masterPlayer:get_field("_replaceAttackTypeB"),
        Slot4_12 = masterPlayer:get_field("_replaceAttackTypeC"),
        Slot3 = masterPlayer:get_field("_replaceAttackTypeD"),
        Slot4_3 = masterPlayer:get_field("_replaceAttackTypeE"),
        Slot5 = masterPlayer:get_field("_replaceAttackTypeF")
    }
    return SkillTypeCheck
end

---UI小提示，Credit to Bimmr
---@param text string
local function tooltip(text)
    imgui.same_line()
    imgui.text("(?)")
    if imgui.is_item_hovered() then imgui.set_tooltip("  "..text.."  ") end
end

--检测是否在怪异任务中
local function checkInAnomalyQuest()
    local QuestManager = sdk.get_managed_singleton("snow.QuestManager")
    local isMysteryQuest = QuestManager:call("isMysteryQuest")
    local isRandomMysteryQuest = QuestManager:call("isRandomMysteryQuest")
    local isInAnomalyQuest = isMysteryQuest or isRandomMysteryQuest
    return isInAnomalyQuest
end


