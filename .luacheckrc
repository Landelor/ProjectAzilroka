-- luacheck configuration for ProjectAzilroka
-- Establishes the WOW-2 static-analysis baseline. Run from the repository root:
--   luacheck ProjectAzilroka
--
-- Philosophy: this config silences what is structurally unavoidable in a WoW addon
-- (Blizzard's global API surface, long option-table lines, unused callback arguments)
-- so that what remains is signal. It deliberately does NOT declare a short list of
-- globals that look like typos or migration leftovers -- see `-- SUSPECT` below --
-- so those keep reporting as W113 until they are fixed or confirmed intentional.

std = 'lua51'

-- Blizzard's Lua extensions that are not in stock 5.1.
read_globals = {
	'ACCEPT', 'BNET_CLIENT_WOW', 'BNET_LAST_ONLINE_TIME', 'BNGetFriendInfo', 'BNGetFriendInfoByID',
	'BNGetFriendInviteInfo', 'BNGetInfo', 'BNGetNumFriendInvites', 'BNGetNumFriends', 'BNGetSelectedFriend',
	'BNInviteFriend', 'BNSendGameData', 'BNSetFriendNote', 'BNet_GetBattlenetClientAtlas', 'BNet_GetClientTexture',
	'BOOKTYPE_PET', 'BOOKTYPE_SPELL', 'CANCEL', 'CLASS_ICON_TCOORDS', 'COLOR_PICKER', 'C_AddOns', 'C_AddOns_LoadAddOn',
	'C_BattleNet', 'C_ChatInfo', 'C_Container', 'C_FriendList', 'C_Item', 'C_PetBattles', 'C_PetJournal',
	'C_PlayerInteractionManager', 'C_QuestLog', 'C_Reputation', 'C_Spell', 'C_SpellBook', 'C_UnitAuras',
	'CollapseFactionHeader', 'ConfirmLootRoll', 'ConfirmLootSlot', 'CopyTable', 'CreateColor', 'CreateFrame',
	'DeleteCursorItem', 'ElvUI', 'Enum', 'ExpandFactionHeader', 'FONT_SIZE', 'FRIENDS_BNET_BACKGROUND_COLOR',
	'FRIENDS_BNET_NAME_COLOR', 'FRIENDS_BUTTON_HEIGHTS', 'FRIENDS_BUTTON_TYPE_BNET', 'FRIENDS_BUTTON_TYPE_DIVIDER',
	'FRIENDS_BUTTON_TYPE_INVITE', 'FRIENDS_BUTTON_TYPE_INVITE_HEADER', 'FRIENDS_BUTTON_TYPE_WOW',
	'FRIENDS_FRAME_FRIENDS_FRIENDS_HEIGHT', 'FRIENDS_GRAY_COLOR', 'FRIENDS_LEVEL_TEMPLATE', 'FRIENDS_LIST_OFFLINE',
	'FRIENDS_OFFLINE_BACKGROUND_COLOR', 'FRIENDS_TEXTURE_AFK', 'FRIENDS_TEXTURE_DND', 'FRIENDS_TEXTURE_OFFLINE',
	'FRIENDS_TEXTURE_ONLINE', 'FRIENDS_WOW_BACKGROUND_COLOR', 'FRIEND_REQUESTS', 'FriendsFrame',
	'FriendsFrameFriendButton_OnClick', 'FriendsFrameFriendsScrollFrame', 'FriendsFrameSendMessageButton',
	'FriendsFrameTooltip_Show', 'FriendsFrame_GetInviteRestriction', 'FriendsFrame_GetLastOnline',
	'FriendsFrame_SelectFriend', 'FriendsFrame_ShouldShowSummonButton', 'FriendsFrame_SummonButton_Update',
	'FriendsListButtonMixin', 'FriendsListFrame', 'FriendsListFrameScrollFrame', 'FriendsList_CanWhisperFriend',
	'FriendsTooltip', 'GameMenuFrame', 'GameTooltip', 'GetCVarBool', 'GetCursorPosition', 'GetFactionInfo',
	'GetFactionInfoByID', 'GetFlyoutInfo', 'GetFlyoutSlotInfo', 'GetInventoryItemID', 'GetInventoryItemTexture',
	'GetItemCount', 'GetItemInfo', 'GetItemInfoInstant', 'GetItemQualityColor', 'GetLocale', 'GetLootRollItemInfo',
	'GetLootRollItemLink', 'GetLootSlotLink', 'GetMouseFoci', 'GetMouseFocus', 'GetNumFactions', 'GetNumLootItems',
	'GetNumQuestChoices', 'GetNumQuestLogChoices', 'GetNumQuestLogEntries', 'GetNumQuestLogRewardFactions',
	'GetNumSpellTabs', 'GetPhysicalScreenSize', 'GetQuestDifficultyColor', 'GetQuestLogRewardFactionInfo',
	'GetQuestLogRewardXP', 'GetQuestLogTitle', 'GetRealmName', 'GetSpecialization', 'GetSpecializationInfo',
	'GetSpecializationRole', 'GetSpellBookItemName', 'GetSpellCharges', 'GetSpellCooldown', 'GetSpellInfo',
	'GetSpellTabInfo', 'GetSubZoneText', 'GetTime', 'GetWeaponEnchantInfo', 'GetXPExhaustion', 'HOSTILE_REACTION',
	'HasNewMail', 'HasPetSpells', 'HideDropDownMenu', 'HybridScrollFrame_CreateButtons', 'HybridScrollFrame_GetOffset',
	'HybridScrollFrame_Update', 'INVITE_RESTRICTION_NONE', 'InCombatLockdown', 'InviteUnit', 'IsInGroup',
	'IsInInstance', 'IsInRaid', 'IsModifiedClick', 'IsPlayerAtEffectiveMaxLevel', 'IsPlayerInWorld', 'IsReplacingUnit',
	'IsShiftKeyDown', 'IsSpellKnownOrOverridesKnown', 'IsXPUserDisabled', 'Item', 'LEVEL', 'LE_PARTY_CATEGORY_HOME',
	'LOCALIZED_CLASS_NAMES_MALE', 'LOCATION_MOBILE_APP', 'LibStub', 'LootSlot', 'MAX_PLAYER_LEVEL', 'Minimap',
	'MinimapMailFrameUpdate', 'NORMAL_FONT_COLOR', 'NUM_BAG_SLOTS', 'OPEN_DROPDOWNMENUS', 'PlaySound', 'PlaySoundFile',
	'QuestInfo_GetRewardButton', 'QuickJoinToastButton', 'RAF_RECRUITER_FRIEND', 'RAF_RECRUIT_FRIEND',
	'REWARD_ITEMS_ONLY', 'RegisterStateDriver', 'RegisterUnitWatch', 'RollOnLoot', 'SOUNDKIT', 'SendChatMessage',
	'SetFriendNotes', 'SetItemButtonCount', 'SetItemButtonTexture', 'StaticPopup_Show', 'ToggleDropDownMenu',
	'UIDROPDOWNMENU_INIT_MENU', 'UIDROPDOWNMENU_MENU_LEVEL', 'UIDROPDOWNMENU_MENU_VALUE', 'UIDropDownMenu_AddButton',
	'UIDropDownMenu_CreateInfo', 'UIFrameFadeIn', 'UIFrameFadeOut', 'UIParent', 'UNKNOWN', 'UnitAffectingCombat',
	'UnitAura', 'UnitClass', 'UnitClassification', 'UnitExists', 'UnitFactionGroup', 'UnitInVehicle',
	'UnitIsDeadOrGhost', 'UnitIsEnemy', 'UnitIsFriend', 'UnitIsPlayer', 'UnitIsUnit', 'UnitLevel', 'UnitName',
	'UnitRace', 'UnitXP', 'UnitXPMax', 'UnregisterStateDriver', 'UnregisterUnitWatch',
	'WOW_PROJECT_BURNING_CRUSADE_CLASSIC', 'WOW_PROJECT_CATACLYSM_CLASSIC', 'WOW_PROJECT_CLASSIC', 'WOW_PROJECT_ID',
	'WOW_PROJECT_MAINLINE', 'WOW_PROJECT_MISTS_CLASSIC', 'WOW_PROJECT_WRATH_CLASSIC', 'WrapTextInColorCode', 'ceil',
	'floor', 'format', 'gsub', 'hooksecurefunc', 'issecretvalue', 'max', 'min', 'mod', 'sort', 'strfind', 'strlen',
	'strlower', 'strmatch', 'strsplit', 'strsub', 'strtrim', 'time', 'tinsert', 'tremove', 'wipe'
}

-- Globals ProjectAzilroka intentionally creates.
globals = {
	'ProjectAzilroka', 'PA', 'stAddonManagerProfilesDB', 'stAddonManagerServerDB', 'stAMCheckButtonMixin',
	'LOOTFRAME_AUTOLOOT_DELAY', 'LOOTFRAME_AUTOLOOT_RATE', 'SMB_MailFrame', 'oUF_PetBattleFrameHider',
	'MasterExperience', 'SunsongRanchFarmer', 'ReputationReward', 'FriendGroups'
}

-- SUSPECT: intentionally absent from read_globals so luacheck keeps flagging them.
--   Name, caster, casterIsPlayer  -- Modules/iFilger.lua, leftovers of the UnitAura -> C_UnitAuras migration
--   coolInfo                      -- Modules/Reminder.lua:58, typo for cooldownInfo (hard error)
--   color                         -- Modules/EnhancedPetBattleUI.lua:431, missing `local`
--   info, lastOnline, k,
--   totalScrollHeight,
--   UnitPopupButtons,
--   UnitPopupShown, UnitPopupMenus -- Modules/FriendGroups.lua (file is not in any load manifest)
--   L                              -- Modules/MasterExperience.lua (commented out of Load_Modules.xml)
--   Buttons                        -- Modules/SunsongRanchFarmer.lua (file is not in any load manifest)

-- Vendored libraries are upstream code; we do not lint them.
exclude_files = { 'ProjectAzilroka/Libs' }

-- Style rules this codebase does not follow and is not going to start following.
max_line_length = false
-- W212 unused argument / W213 unused loop variable: WoW callback signatures are
-- positional, so partially-used argument lists are idiomatic, not a defect.
unused_args = false
