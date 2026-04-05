MiniTalentCacheChar = MiniTalentCacheChar or {}
MiniTalentPos = MiniTalentPos or { pinned = true }
local SCAN_SPEED = 0.1
local MAX_STEPS = 50
local ICON_SIZE = 21
local ICON_GAPPING = 3
local CELL_SIZE = ICON_SIZE + ICON_GAPPING
local ICONS_PER_ROW = 4
local currentViewSpec = nil
local Title_Name = "Talent Overview"
local F = CreateFrame("Frame", "CL_MiniTalentList", UIParent)
F:SetWidth(370)
F:SetBackdrop({
	bgFile = "Interface\\TutorialFrame\\TutorialFrameBackground", 
	edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border", 
	tile = true, tileSize = 32, edgeSize = 16, 
	insets = {left = 5, right = 5, top = 5, bottom = 5}
})
F:SetBackdropColor(1, 1, 1, 1)
F:SetFrameStrata("HIGH")
F:SetToplevel(true)
F:SetClampedToScreen(true)
F:SetMovable(true)
F:EnableMouse(true)
F:RegisterForDrag("LeftButton")
F:Hide()
tinsert(UISpecialFrames, "CL_MiniTalentList")
local close = CreateFrame("Button", nil, F, "UIPanelCloseButton")
close:SetPoint("TOPLEFT", F, "TOPLEFT", 2, -2)
local pin = CreateFrame("Button", nil, F)
pin:SetSize(20, 20)
pin:SetPoint("LEFT", close, "RIGHT", -2, 0)
pin:SetFrameLevel(F:GetFrameLevel() + 2)
pin.tex = pin:CreateTexture(nil, "OVERLAY")
pin.tex:SetTexture("Interface\\Icons\\INV_Misc_Key_03")
pin.tex:SetAllPoints()
pin:SetNormalTexture(pin.tex)
pin.high = pin:CreateTexture(nil, "HIGHLIGHT")
pin.high:SetTexture("Interface\\Buttons\\UI-Common-MouseHilight")
pin.high:SetBlendMode("ADD")
pin.high:SetAllPoints()
pin:SetPushedTexture("Interface\\Buttons\\UI-Quickslot-Depress")
local function UpdatePosition()
	if not pin or not pin.tex then return end
	if MiniTalentPos.pinned then
		pin.tex:SetVertexColor(1, 1, 1)
		local target = _G["PlayerTalentFrame"]
		if target then
			F:ClearAllPoints()
			F:SetPoint("TOPLEFT", target, "TOPRIGHT", 8, 0)
		end
	else
		pin.tex:SetVertexColor(1, 0.2, 0.2)
		F:ClearAllPoints()
		if MiniTalentPos.x and MiniTalentPos.y then
			F:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", MiniTalentPos.x, MiniTalentPos.y)
		else
			F:SetPoint("CENTER", UIParent, "CENTER")
		end
	end
end
pin:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
	if MiniTalentPos.pinned then
		GameTooltip:SetText("Unpin from Talents")
		GameTooltip:AddLine("Allows you to move the window freely.", 1, 1, 1)
	else
		GameTooltip:SetText("Pin to Talents")
		GameTooltip:AddLine("Snaps the window back to the Talent Frame.", 1, 1, 1)
	end
	GameTooltip:Show()
end)
pin:SetScript("OnLeave", function() GameTooltip:Hide() end)
pin:SetScript("OnClick", function()
	MiniTalentPos.pinned = not MiniTalentPos.pinned
	PlaySound("igMainMenuOptionCheckBoxOn")
	UpdatePosition()
	pin:GetScript("OnEnter")(pin)
end)
F:SetScript("OnDragStart", function(self)
	if not MiniTalentPos.pinned then self:StartMoving() end
end)
F:SetScript("OnDragStop", function(self)
	self:StopMovingOrSizing()
	MiniTalentPos.x = self:GetLeft()
	MiniTalentPos.y = self:GetTop()
end)
local function CreateSeparator(parent, width)
	local line = parent:CreateTexture(nil, "ARTWORK")
	line:SetSize(width or 340, 8)
	line:SetTexture("Interface\\FriendsFrame\\UI-FriendsFrame-OnlineDivider")
	return line
end
local title = F:CreateFontString(nil, "OVERLAY", "GameFontNormalHuge")
title:SetPoint("TOP", 0, -12)
title:SetTextColor(0.8, 0.9, 1, 1) 
title:SetShadowOffset(1, -1)
title:SetShadowColor(0, 0, 0, 0.8)
title:SetText(Title_Name)
CreateSeparator(F, 340):SetPoint("TOP", 0, -32)
local help = CreateFrame("Button", nil, F)
help:SetSize(22, 22)
help:SetPoint("TOPRIGHT", -10, -10)
help:SetNormalTexture("Interface\\Icons\\INV_Misc_QuestionMark")
help:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")
help:SetScript("OnEnter", function(self)
	local count = 0
	for _ in pairs(MiniTalentCacheChar) do count = count + 1 end
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
	GameTooltip:ClearLines()
	GameTooltip:AddLine(Title_Name .. " Info", 1, 1, 1)
	GameTooltip:AddLine(" ")
	GameTooltip:AddDoubleLine("Tracked Talents:", count, 1, 0.82, 0, 1, 1, 1)
	GameTooltip:AddLine(" ")
	GameTooltip:AddLine("Controls:", 0.5, 0.5, 1)
	GameTooltip:AddLine("|cffffffffShift + Click:|r Link talent to chat", 0.8, 0.8, 0.8)
	GameTooltip:AddLine("|cffffffffKey Icon:|r Toggle Pin/Unpin (Drag mode)", 0.8, 0.8, 0.8)
	GameTooltip:AddLine("|cffffffffESC / Close:|r Hide this window", 0.8, 0.8, 0.8)
	if not MiniTalentPos.pinned then
		GameTooltip:AddLine(" ")
		GameTooltip:AddLine("Window is currently |cff00ff00Independent|r", 0.4, 1, 0.4)
	end
	GameTooltip:Show()
end)
help:SetScript("OnLeave", function() GameTooltip:Hide() end)
local btnCache = CreateFrame("Button", nil, F, "UIPanelButtonTemplate")
btnCache:SetSize(95, 22)
btnCache:SetPoint("BOTTOMLEFT", F, "BOTTOMLEFT", 15, 12)
btnCache:SetText("Cache All")
local btnClear = CreateFrame("Button", nil, F, "UIPanelButtonTemplate")
btnClear:SetSize(80, 22)
btnClear:SetPoint("LEFT", btnCache, "RIGHT", 0, 0)
btnClear:SetText("Clear")
btnClear:SetScript("OnClick", function() wipe(MiniTalentCacheChar) UpdateMiniList() end)
local footerLine = CreateSeparator(F, 340)
footerLine:SetPoint("BOTTOM", F, "BOTTOM", 0, 38)
local scroll = CreateFrame("ScrollFrame", "CL_MiniTalentScrollFrame", F, "UIPanelScrollFrameTemplate")
scroll:SetPoint("TOPLEFT", 10, -42)
scroll:SetPoint("BOTTOMRIGHT", -30, 44)
local canvas = CreateFrame("Frame", "CL_MiniTalentCanvas", scroll)
canvas:SetSize(320, 1)
scroll:SetScrollChild(canvas)
local emptyText = scroll:CreateFontString(nil, "OVERLAY", "GameFontDisableLarge")
emptyText:SetPoint("CENTER", scroll, "CENTER", 0, 0)
emptyText:SetText("Click 'Cache All' to\nview your talents.")
local specFrames = {}
local SPEC_MAP = {
    -- Warrior
    ["Arms"] = "WARRIOR", 
    ["Fury"] = "WARRIOR", 
    ["Prot"] = {"WARRIOR", "PALADIN"},

    -- Paladin / Priest
    ["Holy"] = {"PALADIN", "PRIEST"}, 
    ["Ret"] = "PALADIN",
    ["Disc"] = "PRIEST", 
    ["Shadow"] = "PRIEST",

    -- Hunter
    ["BM"] = "HUNTER", 
    ["MM"] = "HUNTER", 
    ["Surv"] = "HUNTER",

    -- Rogue
    ["Sins"] = "ROGUE", 
    ["Combat"] = "ROGUE", 
    ["Sub"] = "ROGUE",

    -- Shaman / Druid
    ["Ele"] = "SHAMAN", 
    ["Enh"] = "SHAMAN", 
    ["Resto"] = {"SHAMAN", "DRUID"},
    ["Balance"] = "DRUID", 
    ["Feral"] = "DRUID",

    -- Mage
    ["Arcane"] = "MAGE", 
    ["Fire"] = "MAGE", 
    ["Frost"] = "MAGE",

    -- Warlock
    ["Affli"] = "WARLOCK", 
    ["Demo"] = "WARLOCK", 
    ["Destro"] = "WARLOCK"
}

local hoverGlow = F:CreateTexture(nil, "OVERLAY")
hoverGlow:SetTexture("Interface\\Buttons\\CheckButtonHilight")
hoverGlow:SetBlendMode("ADD")
hoverGlow:SetSize(ICON_SIZE + 4, ICON_SIZE + 4)
hoverGlow:Hide()
local function GetTalentButton(parent, talentID)
	local b = CreateFrame("Button", nil, parent)
	b:SetSize(ICON_SIZE, ICON_SIZE)
	b.tex = b:CreateTexture(nil, "ARTWORK")
	b.tex:SetAllPoints()
	b:SetNormalTexture(b.tex)
    b.glow = b:CreateTexture(nil, "OVERLAY")
    b.glow:SetTexture("Interface\\Buttons\\UI-ActionButton-Border")
    b.glow:SetBlendMode("ADD")
    b.glow:SetPoint("TOPLEFT", b, "TOPLEFT", -8, 8)
    b.glow:SetPoint("BOTTOMRIGHT", b, "BOTTOMRIGHT", 8, -8)
    b.glow:SetVertexColor(1, 1, 0)
    b.glow:Hide()
	b:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetHyperlink("spell:"..talentID)
		GameTooltip:Show()
		hoverGlow:SetPoint("CENTER", self, "CENTER", 0, 0)
		hoverGlow:Show()
	end)
	b:SetScript("OnLeave", function() GameTooltip:Hide() hoverGlow:Hide() end)
	b:SetScript("OnClick", function(self)
		if IsShiftKeyDown() then
			local link = GetSpellLink(talentID)
			if not link then
				local name = GetSpellInfo(talentID)
				if name then link = "|cff71d5ff|Hspell:"..talentID.."|h["..name.."]|h|r" end
			end
			if link then
				if not ChatEdit_InsertLink(link) then ChatFrame_OpenChat(link) end
			end
		end
	end)
	return b
end

function UpdateMiniList()
    if not F:IsShown() then return end
    if _G["PlayerTalentFrame"] then UpdatePosition() end
    local dataTree, count = {}, 0
    for name, data in pairs(MiniTalentCacheChar) do
        count = count + 1
        local s = data.spec or "General"
        dataTree[s] = dataTree[s] or {}
        table.insert(dataTree[s], {name = name, icon = data.icon, id = data.id})
    end
    if count > 0 then emptyText:Hide() else emptyText:Show() end
    if currentViewSpec then
        btnCache:Hide()
        btnClear:Hide()
        local classes = SPEC_MAP[currentViewSpec] or {"GENERAL"}
        if type(classes) == "string" then classes = {classes} end
        local iconString = ""
        for _, tag in ipairs(classes) do
            if tag == "GENERAL" then
                iconString = iconString .. "|TInterface\\Icons\\INV_Misc_Book_09:16:16:0:0|t "
            else
                local c = CLASS_ICON_TCOORDS[tag]
                if c then
                    iconString = iconString .. "|TInterface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes:18:18:0:0:256:256:"..(c[1]*256)..":"..(c[2]*256)..":"..(c[3]*256)..":"..(c[4]*256).."|t "
                end
            end
        end
        title:SetText("|cff00ff00<|r " .. iconString .. currentViewSpec)
        if not F.backBtn then
            F.backBtn = CreateFrame("Button", nil, F)
            F.backBtn:SetAllPoints(title)
            F.backBtn:SetScript("OnClick", function() currentViewSpec = nil UpdateMiniList() end)
        end
        F.backBtn:Show()
    else
        btnCache:Show()
        btnClear:Show()
        title:SetText(Title_Name)
        if F.backBtn then F.backBtn:Hide() end
    end
    for _, frame in pairs(specFrames) do frame:Hide() end
    if not currentViewSpec then
        local specs = {}
        for s in pairs(dataTree) do table.insert(specs, s) end
        table.sort(specs)
        local leftY, midY, rightY, colWidth = -5, -5, -5, 105
        for i, specName in ipairs(specs) do
            local currX, currY, targetCol
            if leftY >= midY and leftY >= rightY then currX, currY, targetCol = 2, leftY, "left"
            elseif midY >= rightY then currX, currY, targetCol = colWidth + 8, midY, "mid"
            else currX, currY, targetCol = (colWidth * 2) + 14, rightY, "right" end

            local sFrame = specFrames[specName] or CreateFrame("Frame", nil, canvas)
            specFrames[specName] = sFrame
            if not sFrame.bg then
                sFrame:SetBackdrop({bgFile = "Interface\\Buttons\\WHITE8X8", edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", tile = true, tileSize = 16, edgeSize = 12, insets = {left = 2, right = 2, top = 2, bottom = 2}})
                sFrame:SetBackdropColor(0, 0, 0, 0.6)
                sFrame:SetBackdropBorderColor(0.3, 0.3, 0.3, 1)
                sFrame:EnableMouse(true)
                sFrame:SetScript("OnEnter", function(self) self:SetBackdropBorderColor(1, 0.8, 0, 0.8) end)
                sFrame:SetScript("OnLeave", function(self) self:SetBackdropBorderColor(0.3, 0.3, 0.3, 1) end)
                sFrame:SetScript("OnMouseDown", function() currentViewSpec = specName UpdateMiniList() PlaySound("igCharacterInfoTab") end)
                sFrame.bg = true
            end
            sFrame:ClearAllPoints()
            sFrame:SetPoint("TOPLEFT", canvas, "TOPLEFT", currX, currY)
            sFrame:SetWidth(colWidth)
            sFrame:Show()
            sFrame.headerIcons = sFrame.headerIcons or {}
            for _, hi in ipairs(sFrame.headerIcons) do hi:Hide() end
            local classes = SPEC_MAP[specName] or {"GENERAL"}
            if type(classes) == "string" then classes = {classes} end
            local lastIcon = nil
            for j, tag in ipairs(classes) do
                local icon = sFrame.headerIcons[j] or sFrame:CreateTexture(nil, "ARTWORK")
                sFrame.headerIcons[j] = icon
                icon:SetSize(14, 14)
                if j == 1 then icon:SetPoint("TOPLEFT", 6, -6) else icon:SetPoint("LEFT", sFrame.headerIcons[j-1], "RIGHT", 2, 0) end
                if tag == "GENERAL" then icon:SetTexture("Interface\\Icons\\INV_Misc_Book_09")
                else
                    icon:SetTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
                    local c = CLASS_ICON_TCOORDS[tag]
                    if c then icon:SetTexCoord(unpack(c)) end
                end
                icon:Show() lastIcon = icon
            end
            sFrame.txt = sFrame.txt or sFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            sFrame.txt:SetPoint("LEFT", lastIcon, "RIGHT", 4, 0)
            sFrame.txt:SetText("|cffffd100"..specName.."|r")
            sFrame.txt:Show()

            sFrame.talentButtons = sFrame.talentButtons or {}
            for _, b in ipairs(sFrame.talentButtons) do b:Hide() if b.nameTxt then b.nameTxt:Hide() end end
            local list = dataTree[specName]
            table.sort(list, function(a,b) return a.name < b.name end)
            for k, data in ipairs(list) do
                local b = sFrame.talentButtons[k] or GetTalentButton(sFrame, data.id)
                sFrame.talentButtons[k] = b
                b:SetSize(ICON_SIZE, ICON_SIZE)
                b.tex:SetTexture(data.icon)
                local col, row = (k-1) % ICONS_PER_ROW, math.floor((k-1) / ICONS_PER_ROW)
                b:SetPoint("TOPLEFT", sFrame, "TOPLEFT", 6 + (col * CELL_SIZE), -24 - (row * CELL_SIZE))
                b:Show()
            end
            local h = 28 + (math.ceil(#list/ICONS_PER_ROW) * CELL_SIZE) + 6
            sFrame:SetHeight(h)
            if targetCol == "left" then leftY = leftY - h - 8 elseif targetCol == "mid" then midY = midY - h - 8 else rightY = rightY - h - 8 end
        end
        canvas:SetHeight(math.abs(math.min(leftY, midY, rightY)) + 25)
    else
        local list = dataTree[currentViewSpec] or {}
        table.sort(list, function(a,b) return a.name < b.name end)
        local sFrame = specFrames[currentViewSpec]
        sFrame:ClearAllPoints()
        sFrame:SetPoint("TOPLEFT", canvas, "TOPLEFT", 10, -10)
        sFrame:SetSize(canvas:GetWidth() - 20, 10)
        sFrame:Show()
        if sFrame.txt then sFrame.txt:Hide() end
        for _, hi in ipairs(sFrame.headerIcons or {}) do hi:Hide() end
        for _, b in ipairs(sFrame.talentButtons or {}) do b:Hide() end
        for i, data in ipairs(list) do
            local b = sFrame.talentButtons[i] or GetTalentButton(sFrame, data.id)
            sFrame.talentButtons[i] = b
            b:SetSize(32, 32)
            b.tex:SetTexture(data.icon)
            b:SetPoint("TOPLEFT", sFrame, "TOPLEFT", 12, -12 - ((i-1) * 38))
            b:Show()
            if not b.nameTxt then b.nameTxt = b:CreateFontString(nil, "OVERLAY", "GameFontHighlight") b.nameTxt:SetPoint("LEFT", b, "RIGHT", 10, 0) end
            b.nameTxt:SetText(data.name) b.nameTxt:Show()
        end
        local totalH = (#list * 38) + 24
        sFrame:SetHeight(totalH)
        canvas:SetHeight(totalH + 25)
    end
    F:SetHeight(count == 0 and 160 or math.min(600, canvas:GetHeight() + 80))
    scroll:UpdateScrollChildRect()
    UpdateStatSummary(currentViewSpec)
end
function InstantScan()
	local foundNew = false
	if not PlayerTalentFrame or not PlayerTalentFrame:IsShown() then return false end
	for i=1, 25 do
		local r = _G["PlayerTalentFrameListRow"..i]
		if r and r:IsShown() then
			local text, name = "", nil
			for _, reg in ipairs({r:GetRegions()}) do
				if reg:IsObjectType("FontString") then
					local t = reg:GetText() or ""
					text = text .. " " .. t
					if not name and not tonumber(t) and t:len() > 3 and not t:find("|") then name = t:gsub("^%s*(.-)%s*$", "%1") end
				end
			end
			local spec = "General"
            if text:find("Assassination") then spec = "Sins"
            elseif text:find("Subtlety") then spec = "Sub"
            elseif text:find("Retribution") then spec = "Ret"
            elseif text:find("Protection") then spec = "Prot"
            elseif text:find("Beast Mastery") then spec = "BM"
            elseif text:find("Marksmanship") then spec = "MM"
            elseif text:find("Survival") then spec = "Surv"
            elseif text:find("Discipline") then spec = "Disc"
            elseif text:find("Restoration") then spec = "Resto"
            elseif text:find("Enhancement") then spec = "Enh"
            elseif text:find("Elemental") then spec = "Ele"
            elseif text:find("Affliction") then spec = "Affli"
            elseif text:find("Demonology") then spec = "Demo"
            elseif text:find("Destruction") then spec = "Destro"
            elseif text:find("Feral") then spec = "Feral"
            else
                for s in pairs(SPEC_MAP) do 
                    if text:find(s) then spec = s break end 
                end
            end
			if name and r:GetScript("OnEnter") then
				r:GetScript("OnEnter")(r)
				local _, _, id = GameTooltip:GetSpell()
				if id then
					if not MiniTalentCacheChar[name] then foundNew = true end
					MiniTalentCacheChar[name] = MiniTalentCacheChar[name] or {}
					MiniTalentCacheChar[name].id, MiniTalentCacheChar[name].spec = id, spec
					local _, _, tex = GetSpellInfo(id)
					MiniTalentCacheChar[name].icon = tex
				end
			end
		end
	end
	GameTooltip:Hide()
	return foundNew
end
local scrollTimer = CreateFrame("Frame")
scrollTimer:Hide()
btnCache:SetScript("OnClick", function()
	scrollTimer.count, scrollTimer.lastTick = 0, GetTime()
	InstantScan()
	scrollTimer:Show()
end)
scrollTimer:SetScript("OnUpdate", function(self)
	local now = GetTime()
	if (now - self.lastTick) >= SCAN_SPEED then
		local scrollDown = PlayerTalentFrameListScrollFrameScrollBarScrollDownButton
		if scrollDown and self.count < MAX_STEPS then
			scrollDown:Click()
			self.count, self.lastTick = self.count + 1, now
			if not InstantScan() then self:Hide() UpdateMiniList() end
		else self:Hide() UpdateMiniList() end
	end
end)
local function HookTalents()
	if F.hooked then return end
	local target = _G["PlayerTalentFrame"]
	if not target then return false end
	UpdatePosition()
	target:HookScript("OnShow", function()
		F:Show()
		UpdateMiniList()
	end)
	target:HookScript("OnHide", function()
		if MiniTalentPos.pinned then
			F:Hide()
		end
	end)
	if target:IsShown() then
		F:Show()
		UpdateMiniList()
	end
	F.hooked = true
	return true
end
SLASH_MINITALENT1 = "/minitalent"
SlashCmdList["MINITALENT"] = function()
	if F:IsShown() then F:Hide() else F:Show() UpdateMiniList() end
end
local loader = CreateFrame("Frame")
loader:SetScript("OnUpdate", function(self, elapsed)
	self.timer = (self.timer or 0) + elapsed
	if self.timer > 0.5 then
		if HookTalents() then self:SetScript("OnUpdate", nil) end
		self.timer = 0
	end
end)
local StatFrame = CreateFrame("Frame", nil, F)
StatFrame:SetWidth(150)
StatFrame:SetPoint("TOPLEFT", F, "TOPRIGHT", -5, -40)
StatFrame:SetHeight(40)
StatFrame:SetBackdrop({
    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", 
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", 
    tile = true, tileSize = 12, edgeSize = 12, 
    insets = {left = 3, right = 3, top = 3, bottom = 3}
})
StatFrame:SetBackdropColor(0, 0, 0, 0.8)
StatFrame.title = StatFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
StatFrame.title:SetPoint("TOP", 0, -10)
StatFrame.title:SetText("Global Stat Summary")
local statRows = {}
local function GetStatRow(index)
    if statRows[index] then return statRows[index] end
    local f = CreateFrame("Button", nil, StatFrame)
    f:SetSize(130, 16)
    f:SetPoint("TOPLEFT", 8, -25 - ((index-1) * 18))
    f.txt = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    f.txt:SetAllPoints()
    f.txt:SetJustifyH("LEFT")
    f.hl = f:CreateTexture(nil, "BACKGROUND")
    f.hl:SetAllPoints()
    f.hl:SetTexture(1, 1, 0, 0.3)
    f.hl:Hide()
	f:SetScript("OnEnter", function(self)
        if not self.sources then return end
        self.hl:Show()
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:AddLine(self.statName, 1, 1, 1)
        GameTooltip:AddLine("Sources:", 0.5, 0.5, 1)
        local isPct = self.sources.isPct
        local suffix = isPct and "%" or ""
        local s = {}
        for _, data in ipairs(self.sources) do 
            table.insert(s, {
                name = data.name, 
                val = data.val, 
                active = data.active,
                desc = data.desc
            }) 
            for _, sFrame in pairs(specFrames) do
                if sFrame.talentButtons then
                    for _, btn in ipairs(sFrame.talentButtons) do
                        local cached = MiniTalentCacheChar[data.name]
                        if btn:IsShown() and cached and btn.tex:GetTexture() == cached.icon then
                            if btn.glow then btn.glow:Show() end
                        end
                    end
                end
            end
        end
        table.sort(s, function(a,b) return a.val > b.val end)
        for _, d in ipairs(s) do
            local display = d.desc or d.val 
            local isActive = (d.active ~= false) 
            local valColor = isActive and "|cff00ff00+" or "|cffff0000+"
            local nameColor = isActive and "|cffffffff" or "|cff808080"
            GameTooltip:AddDoubleLine(nameColor..d.name.."|r", valColor..display..suffix.."|r")
        end
        GameTooltip:Show()
    end)
    f:SetScript("OnLeave", function(self)
        self.hl:Hide()
        GameTooltip:Hide()
        for _, sFrame in pairs(specFrames) do
            if sFrame.talentButtons then
                for _, btn in ipairs(sFrame.talentButtons) do
                    if btn.glow then btn.glow:Hide() end
                end
            end
        end
    end)
    statRows[index] = f
    return f
end
local function IsReqMet(req)
    if not req or req == "" then return true end
    local mhLink = GetInventoryItemLink("player", 16)
    local ohLink = GetInventoryItemLink("player", 17)
    local mhType = mhLink and select(9, GetItemInfo(mhLink))
    local ohType = ohLink and select(9, GetItemInfo(ohLink))
    if req == "Shield" then
        return ohType == "Shields"
    end
    if req == "Two-Handed" then
        return mhType and mhType:find("Two%-Handed")
    elseif req == "One-Handed" then
        return mhType and not mhType:find("Two%-Handed") and mhType ~= "Shields"
    end
    if mhType and mhType:find(req) then
        return true
    end
    if req == "Unarmed" or req == "Fist" then
        return (not mhLink) or (mhType == "Fist Weapons")
    end
    return false
end
function UpdateStatSummary(filterSpec)
    if not StatFrame:IsShown() then return end
    local totals, sources = {}, {}
    if not CL_FixedTalents then return end
    if filterSpec then
        StatFrame.title:SetText("|cff00ff00" .. filterSpec .. "|r Stats")
    else
        StatFrame.title:SetText("Global Stat Summary")
    end
    for name, data in pairs(MiniTalentCacheChar) do
        local match = false
        if not filterSpec then
            match = true
        elseif data.spec then
            if data.spec:lower() == filterSpec:lower() then
                match = true
            end
        end
		if match then
			local talentID = data.id
			if talentID and CL_FixedTalents[talentID] then
				for _, stat in ipairs(CL_FixedTalents[talentID]) do
					local label, val, isPct, req = stat[1], stat[2], stat[3], stat[4]
					local active = (label == "ARMOR_CALC") or IsReqMet(req)
					local finalLabel = label 
					local finalVal = 0
					if label == "ARMOR_CALC" then
						local _, armor = UnitArmor("player")
						local divisor = tonumber(req) or 180 
						finalVal = math.floor(armor / divisor) * val
						finalLabel = "AP Flat"
					else
						finalVal = tonumber(val) or 0
					end
					if active then
						totals[finalLabel] = (totals[finalLabel] or 0) + finalVal
					end
					if not sources[finalLabel] then
						sources[finalLabel] = { isPct = isPct }
					end
					table.insert(sources[finalLabel], {name = name, val = finalVal, active = active})
				end
			end
		end
    end
    for _, r in ipairs(statRows) do r:Hide() end
    local keys = {}
    for k in pairs(totals) do table.insert(keys, k) end
    table.sort(keys)
    local maxWidth, visibleRows = 130, 0
    for i, lbl in ipairs(keys) do
        local row = GetStatRow(i)
        local suffix = (sources[lbl] and sources[lbl].isPct) and "%" or ""
        local displayText = lbl..": |cff00ff00+"..totals[lbl]..suffix.."|r"
        row.statName, row.sources = lbl, sources[lbl]
        row.txt:SetText(displayText)
        row:Show()
        local textWidth = row.txt:GetStringWidth()
        if textWidth + 20 > maxWidth then maxWidth = textWidth + 20 end
        visibleRows = i
    end
    if visibleRows == 0 then
        StatFrame:SetHeight(40)
        StatFrame:SetWidth(150)
    else
        StatFrame:SetWidth(maxWidth + 16) 
        StatFrame:SetHeight(35 + (visibleRows * 18))
        for i = 1, visibleRows do statRows[i]:SetWidth(maxWidth) end
    end
end
local originalUpdateMiniList = UpdateMiniList
UpdateMiniList = function()
    originalUpdateMiniList()
    UpdateStatSummary(currentViewSpec)
end
local btnStats = CreateFrame("Button", "CL_StatSummaryToggle", F, "UIPanelButtonTemplate")
btnStats:SetSize(85, 22)
btnStats:SetPoint("BOTTOMRIGHT", F, "BOTTOMRIGHT", -15, 12)
btnStats:SetText("Summary")
btnStats:SetScript("OnClick", function()
    if StatFrame:IsShown() then
        StatFrame:Hide()
        PlaySound("igMainMenuOptionCheckBoxOff")
    else
        StatFrame:Show()
        UpdateStatSummary(currentViewSpec)
        PlaySound("igMainMenuOptionCheckBoxOn")
    end
end)
local gearUpdate = CreateFrame("Frame")
gearUpdate:RegisterEvent("UNIT_INVENTORY_CHANGED")
gearUpdate:SetScript("OnEvent", function(self, event, unit)
    if unit == "player" and StatFrame:IsShown() then
        UpdateStatSummary(currentViewSpec)
    end
end)