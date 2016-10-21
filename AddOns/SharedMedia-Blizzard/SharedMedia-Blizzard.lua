if not SharedMediaBlizzard then return end
local revision = tonumber(string.sub("$Revision: 63551 $", 12, -3))
SharedMediaBlizzard.revision = (revision > SharedMediaBlizzard.revision) and revision or SharedMediaBlizzard.revision

local SMB = SharedMediaBlizzard

--------------------------------------------------------------------------------------------------
--    	If there are any textures here that you do not wish to use, you may	--
--    	simply comment out their respective lines by putting two dashes (--) 	--
--	in front (just like these lines, or where it says border, etc).  This	--
--	way, your menu in-game won't be so long to go through.			--
--------------------------------------------------------------------------------------------------


--border:
	SMB:Register("border", "Dialog Gold", "Interface\\DialogFrame\\UI-DialogBox-Gold-Border.blp")
	SMB:Register("border", "Wood border", "Interface\\AchievementFrame\\UI-Achievement-WoodBorder.blp")

--background:
	SMB:Register("background", "PvP Banner 5", "Interface\\PVPFrame\\PVP-Banner-5.blp")
	SMB:Register("background", "PvP Banner 2", "Interface\\PVPFrame\\PVP-Banner-2.blp")
	SMB:Register("background", "PvP Banner 3", "Interface\\PVPFrame\\PVP-Banner-3.blp")
	SMB:Register("background", "Alliance Insignia", "Interface\\PvPRankBadges\\PvPRankAlliance.blp")
	SMB:Register("background", "Horde Insignia", "Interface\\PvPRankBadges\\PvPRankHorde.blp")
	SMB:Register("background", "Achievement Alert", "Interface\\AchievementFrame\\UI-Achievement-Alert-Background.blp")
	SMB:Register("background", "Achievement Cat. BG", "Interface\\AchievementFrame\\UI-Achievement-Category-Background.blp")
	SMB:Register("background", "DressUp-BloodElf", "Interface\\DressUpFrame\\DressUpBackground-BloodElf1.blp")
	SMB:Register("background", "DressUp-Draenei", "Interface\\DressUpFrame\\DressUpBackground-Draenei1.blp")
	SMB:Register("background", "DressUp-Dwarf", "Interface\\DressUpFrame\\DressUpBackground-Dwarf1.blp")
	SMB:Register("background", "DressUp-Human", "Interface\\DressUpFrame\\DressUpBackground-Human1.blp")
	SMB:Register("background", "DressUp-NightElf", "Interface\\DressUpFrame\\DressUpBackground-NightElf1.blp")
	SMB:Register("background", "DressUp-Orc", "Interface\\DressUpFrame\\DressUpBackground-Orc1.blp")
	SMB:Register("background", "DressUp-Scourge", "Interface\\DressUpFrame\\DressUpBackground-Scourge1.blp")
	SMB:Register("background", "DressUp-Tauren", "Interface\\DressUpFrame\\DressUpBackground-Tauren1.blp")
	SMB:Register("background", "Bronze", "Interface\\ItemTextFrame\\ItemText-Bronze-TopLeft.blp")
	SMB:Register("background", "Marble", "Interface\\ItemTextFrame\\ItemText-Marble-TopLeft.blp")
	SMB:Register("background", "Silver", "Interface\\ItemTextFrame\\ItemText-Silver-TopLeft.blp")
	SMB:Register("background", "Stone", "Interface\\ItemTextFrame\\ItemText-Stone-TopLeft.blp")
	SMB:Register("background", "BuyBack frame", "Interface\\MERCHANTFRAME\\UI-BuyBack-TopLeft.blp")
	SMB:Register("background", "BloodElf Logo", "Interface\\FlavorImages\\BloodElfLogo-small.blp")
	SMB:Register("background", "Scarlet Crusade Logo", "Interface\\FlavorImages\\ScarletCrusadeLogo.blp")
	SMB:Register("background", "AoE Spell Aura", "Interface\\SpellShadow\\Spell-Shadow-Acceptable.blp")
	SMB:Register("background", "Auction Stationery", "Interface\\Stationery\\AuctionStationery1.blp")
	SMB:Register("background", "Horde Stationery", "Interface\\Stationery\\Stationery_OG1.blp")
	SMB:Register("background", "TB Stationery", "Interface\\Stationery\\Stationery_TB1.blp")
	SMB:Register("background", "UC Stationery", "Interface\\Stationery\\Stationery_UC1.blp")
	SMB:Register("background", "Valentine Stationery", "Interface\\Stationery\\Stationery_Val1.blp")
	SMB:Register("background", "Plain Stationery", "Interface\\Stationery\\StationeryTest1.blp")
	SMB:Register("background", "BeastMastery TalentBG", "Interface\\TalentFrame\\HunterBeastMastery-TopLeft.blp")
	SMB:Register("background", "HolyP TalentBG", "Interface\\TalentFrame\\PriestHoly-TopLeft.blp")
	SMB:Register("background", "RestoSh TalentBG", "Interface\\TalentFrame\\ShamanRestoration-TopLeft.blp")
	SMB:Register("background", "Unholy DK TalentBG", "Interface\\TalentFrame\\DeathKnightUnholy-TopLeft.blp")
	SMB:Register("background", "Eastern Kingdoms", "Interface\\TaxiFrame\\TAXIMAP0.blp")
	SMB:Register("background", "Kalimdor", "Interface\\TaxiFrame\\TAXIMAP1.blp")
	SMB:Register("background", "Outlands", "Interface\\TaxiFrame\\TAXIMAP530.blp")
	SMB:Register("background", "WorldMapBG", "Interface\\WorldMap\\UI-WorldMap-Middle3.blp")
	SMB:Register("background", "Gryphon Left", "Interface\\MainMenuBar\\UI-MainMenuBar-EndCap-Dwarf.blp")
	SMB:Register("background", "Lion Left", "Interface\\MainMenuBar\\UI-MainMenuBar-EndCap-Human.blp")
	SMB:Register("background", "Gryphon Right", "Interface\\AddOns\\SharedMedia-Blizzard\\Backgrounds\\UI-MainMenuBar-EndCap-Dwarf-right.blp")
	SMB:Register("background", "Lion Right", "Interface\\AddOns\\SharedMedia-Blizzard\\Backgrounds\\UI-MainMenuBar-EndCap-Human-right.blp")
	SMB:Register("background", "Elite", "Interface\\AddOns\\SharedMedia-Blizzard\\Backgrounds\\Elite.tga")
	SMB:Register("background", "Elite Left", "Interface\\AddOns\\SharedMedia-Blizzard\\Backgrounds\\EliteLeft.tga")
	SMB:Register("background", "Rare", "Interface\\AddOns\\SharedMedia-Blizzard\\Backgrounds\\Rare.tga")
	SMB:Register("background", "Rare Left", "Interface\\AddOns\\SharedMedia-Blizzard\\Backgrounds\\RareLeft.tga")