class 'patches'


function patches:__init()
	self:RegisterEvents()
end

function patches:RegisterEvents()
	self.m_ReadInstanceEvent = Events:Subscribe('Partition:ReadInstance', self, self.ReadInstance)
end

function patches:ReadInstance(p_Instance, p_Guid)

	if p_Instance == nil then
		return
	end
	if p_Instance.typeName == "SyncedBFSettings" then
		local s_Instance = SyncedBFSettings(p_Instance)
		s_Instance.allUnlocksUnlocked = true
		s_Instance.unlicensedUnlocksUnlocked = true
	end


	if p_Instance.typeName == "ValueUnlockAsset" then
		local s_Instance = ValueUnlockAsset(p_Instance)
		s_Instance.autoAvailable = true
		s_Instance.hiddenInProgression = false
		s_Instance.autoAvailable = true
		s_Instance.unlockScore = 0
		s_Instance.availableForPlayer = UnlockAvailability.UnlockAvailability_All
		
	end

	if p_Instance.typeName == "UnlockAsset" then
		local s_Instance = ValueUnlockAsset(p_Instance)
		s_Instance.autoAvailable = true
		s_Instance.hiddenInProgression = false
		s_Instance.autoAvailable = true
		s_Instance.unlockScore = 0
		s_Instance.availableForPlayer = UnlockAvailability.UnlockAvailability_All
	end
end

g_patches = patches()

return patches