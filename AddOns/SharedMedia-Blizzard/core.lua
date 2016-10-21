local LSM3 = LibStub("LibSharedMedia-3.0", true)
local LSM2 = LibStub("LibSharedMedia-2.0", true)
local SML = LibStub("SharedMedia-1.0", true)

SharedMediaBlizzard = {}
SharedMediaBlizzard.revision = tonumber(string.sub("$Revision$", 12, -3)) or 1

SharedMediaBlizzard.registry = { ["background"] = {} }

function SharedMediaBlizzard:Register(mediatype, key, data, langmask)
	if LSM3 then
		LSM3:Register(mediatype, key, data, langmask)
	end
	if LSM2 then
		LSM2:Register(mediatype, key, data)
	end
	if SML then
		SML:Register(mediatype, key, data)
	end
	if not SharedMediaBlizzard.registry[mediatype] then
		SharedMediaBlizzard.registry[mediatype] = {}
	end
	table.insert(SharedMediaBlizzard.registry[mediatype], { key, data, langmask})
end

function SharedMediaBlizzard.OnEvent(this, event, ...)
	if not LSM3 then
		LSM3 = LibStub("LibSharedMedia-3.0", true)
		if LSM3 then
			for m,t in pairs(SharedMediaBlizzard.registry) do
				for _,v in ipairs(t) do
					LSM3:Register(m, v[1], v[2], v[3])
				end
			end
		end
	end
	if not LSM2 then
		LSM2 = LibStub("LibSharedMedia-2.0", true)
		if LSM2 then
			for m,t in pairs(SharedMediaBlizzard.registry) do
				for _,v in ipairs(t) do
					LSM2:Register(m, v[1], v[2])
				end
			end
		end
	end
	if not SML then
		SML = LibStub("SharedMedia-1.0", true)
		if SML then
			for m,t in pairs(SharedMediaBlizzard.registry) do
				for _,v in ipairs(t) do
					SML:Register(m, v[1], v[2])
				end
			end
		end
	end
end

SharedMediaBlizzard.frame = CreateFrame("Frame")
SharedMediaBlizzard.frame:SetScript("OnEvent", SharedMediaBlizzard.OnEvent)
SharedMediaBlizzard.frame:RegisterEvent("ADDON_LOADED")
