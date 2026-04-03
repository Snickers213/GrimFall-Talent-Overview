-- TalentData.lua
-- Format: [SpellID] = { {label, value, isPercent}, ... }
CL_FixedTalents = {
-- DEATH KNIGHT: BLOOD
    -- [48979] = {{"??", 0, false}}, -- Icy Touch (Active)
    -- [48997] = {{"??", 0, false}}, -- Death Strike (Active)
    -- [49182] = {{"??", 0, false}}, -- Heart Strike (Active)
    -- [55225] = {{"??", 0, false}}, -- Blade Barrier (Proc-based)
    -- [48978] = {{"??", 0, false}}, -- Blood Boil (Active)
    [49004] = {{"Damage", 15, true}}, -- Black Ice (15% Frost/Shadow Damage)
    -- [49508] = {{"??", 0, false}}, -- Scent of Blood (Proc-based)
    -- [55107] = {{"??", 0, false}}, -- Improved Blood Presence (Presence modifier)
    -- [48982] = {{"??", 0, false}}, -- Rune Tap (Active)
    -- [48987] = {{"??", 0, false}}, -- Dark Command (Active)
    -- [49467] = {{"??", 0, false}}, -- Spell Deflection (Proc-based)
    -- [48985] = {{"??", 0, false}}, -- Vampiric Blood (Active)
    -- [49145] = {{"??", 0, false}}, -- Heart Strike (Active)
    -- [49015] = {{"??", 0, false}}, -- Sudden Doom (Proc-based)
    [48977] = {{"Crit %", 5, true}}, -- Vicious Strikes (5% Crit on builders)
    -- [49006] = {{"??", 0, false}}, -- Mark of Blood (Active)
    -- [49005] = {{"??", 0, false}}, -- Bone Shield (Active)
    -- [48988] = {{"??", 0, false}}, -- Dancing Rune Weapon (Active)
    -- [53137] = {{"??", 0, false}}, -- Abomination's Might (Proc-based)
    [53138] = {{"Damage", 10, true}}, -- Bloody Strikes (10% Heart Strike Damage)
    [49027] = {{"Strength", 10, true}}, -- Abomination's Might (10% Strength)
    -- [49016] = {{"??", 0, false}}, -- Hysteria (Active)
    -- [50365] = {{"??", 0, false}}, -- Will of the Necropolis (Situational)
    -- [62905] = {{"??", 0, false}}, -- Blood-Caked Blade (Proc-based)

    -- DEATH KNIGHT: FROST
    [49018] = {{"Armor Bonus", 25, true}}, -- Toughness (25% Armor from items)
    -- [49143] = {{"??", 0, false}}, -- Frost Strike (Active)
    -- [49184] = {{"??", 0, false}}, -- Howling Blast (Active)
    -- [51410] = {{"??", 0, false}}, -- Icy Talons (Proc-based)
    -- [49206] = {{"??", 0, false}}, -- Lichborne (Active)
    -- [49203] = {{"??", 0, false}}, -- Annihilation (Non-passive mechanic)
    -- [49023] = {{"??", 0, false}}, -- Killing Machine (Proc-based)
    -- [49189] = {{"??", 0, false}}, -- Frigid Dreadplate (Utility)
    -- [51271] = {{"??", 0, false}}, -- Unbreakable Armor (Active)
    -- [49200] = {{"??", 0, false}}, -- Improved Icy Talons (Aura)
    [49137] = {{"Damage", 10, true}}, -- Merciless Combat (10% Damage on low HP)
    -- [49202] = {{"??", 0, false}}, -- Rime (Proc-based)
    -- [51123] = {{"??", 0, false}}, -- Blood of the North (Mechanic)
    -- [55090] = {{"??", 0, false}}, -- Threat of Thassarian (Mechanic)
    -- [49152] = {{"??", 0, false}}, -- Guile of Gorefiend (Ability modifier)
    -- [51209] = {{"??", 0, false}}, -- Hungering Cold (Active)

    -- DEATH KNIGHT: UNHOLY
    -- [49158] = {{"??", 0, false}}, -- Corpse Explosion (Active)
    -- [49194] = {{"??", 0, false}}, -- Unholy Blight (Active)
    -- [49220] = {{"??", 0, false}}, -- Death and Decay (Active)
    -- [49222] = {{"??", 0, false}}, -- Bone Shield (Active)
    -- [49217] = {{"??", 0, false}}, -- Wandering Plague (Proc-based)
    -- [49219] = {{"??", 0, false}}, -- Ebon Plaguebringer (Debuff)
    -- [49223] = {{"??", 0, false}}, -- Rage of Rivendare (Ability specific)
    -- [49208] = {{"??", 0, false}}, -- Night of the Dead (Utility)
    -- [49226] = {{"??", 0, false}}, -- Scourge Strike (Active)
    -- [49233] = {{"??", 0, false}}, -- Summon Gargoyle (Active)
    -- [50524] = {{"??", 0, false}}, -- Master of Ghouls (Pet mechanic)
    -- [49632] = {{"??", 0, false}}, -- Anti-Magic Zone (Active)
    -- [49130] = {{"??", 0, false}}, -- Desolation (Proc-based)
    -- [49231] = {{"??", 0, false}}, -- Impurity (AP Scaling)
    -- [55050] = {{"??", 0, false}}, -- Reaping (Mechanic)
    -- [49236] = {{"??", 0, false}}, -- Unholy Frenzy (Active)
	
-- DRUID: BALANCE
    [57814] = {{"Healing Perodic", 5, true}, {"Damage Perodic", 5, true}}, -- Genesis (5% HoT/DoT)
    [33591] = {{"Int as SP", 12, true}}, -- Lunar Guidance (12% Intellect as SP)
    [16924] = {{"Spell Haste", 3, true}}, -- Celestial Focus 3% Haste
    [33596] = {{"Spell Hit", 4, true}}, -- Balance of power 4% Spell Hit

    -- DRUID: FERAL
    [16931] = {{"Cloth/Leather Armor Bonus", 10, true}}, -- Thick Hide (10% Armor from items)
    [24894] = {{"Intellect", 20, true}}, -- Heart of the Wild
    [33856] = {{"All Attribute", 6, true}, {"Melee Crit Reduc", 6, true}}, -- Survival of the Fittest

    -- DRUID: RESTORATION
    [24946] = {{"Healing", 10, true}}, -- Gift of Nature
    [33883] = {{"Spell Crit", 3, true}}, -- Natural Perfection
    [34153] = {{"Spirit", 15, true}}, -- Living Spirit
    [33890] = {{"Bonus HoT", 20, true}}, -- Empowered Rejuvenation
    [51183] = {{"Haste Spell", 10, true}}, -- Gift of the Earthmother

-- HUNTER: BEAST MASTERY
    [19587] = {{"Health", 5, true}}, -- Endurance Training (5% Health)
    [19612] = {{"Armor", 10, true}}, -- Thick Hide
    [34465] = {{"Dodge Chance", 3, true}}, -- Catlike Reflexes
	[34470] = {{"Ranged Haste", 20, true}}, -- Serpents Swiftness
	
    -- HUNTER: MARKSMANSHIP
    [19431] = {{"Ranged Crit", 5, true}}, -- Lethal Shots (5% Crit)
    [34484] = {{"Ranged AP from INT", 100, true}}, -- Careful Aim
    [34476] = {{"Agility", 4, true}, {"Intellect", 4, true}}, -- Combat Experience
    [19506] = {{"Attack Power", 10, true}}, -- Trueshot Aura
    [34489] = {{"Crit Chance", 5, true}}, -- Master Marksman

    -- HUNTER: SURVIVAL
    [34496] = {{"Dmg taken reduc", 4, true}}, -- Survival Instinct
    [19298] = {{"Parry", 3, true}}, -- Deflection
    [19259] = {{"Stamina", 10, true}}, -- Survivalist
    [19373] = {{"Crit %", 3, true}}, -- Killer Instinct
    [24297] = {{"Agility", 15, true}}, -- Lightning Reflexes
    [53292] = {{"Agility", 3, true}}, -- Lightning Reflexes
	
-- MAGE: ARCANE
    [54659] = {{"Armor from INT", 150, true}}, -- Arcane Fortitude (150% Int as Armor)
    [44399] = {{"Spirit", 10, true}}, -- Studen of the Mind
    [12503] = {{"Intellect", 15, true}}, -- Arcane Mind
    [54354] = {{"Dmg Reduc", 6, true}}, -- Name
    [15060] = {{"Spell Dmg", 3, true}, {"Spell Crit", 3 , true}}, -- Arcane Instability
    [31588] = {{"SP from INT", 15, true}}, -- Mind Mastery
    [44403] = {{"Spell Haste", 6, true}}, -- Netherwind Presence
    [35581] = {{"Spell Crit Dmg", 50, true}}, -- Spell Power

    -- MAGE: FIRE
    [31640] = {{"Spell Dmg", 3, true}, {"Spell dmg Taken", 3 , true}}, -- Playing with Fire
    [34296] = {{"Crit Hit", 3, true}}, -- Pyromaniac
    [44472] = {{"Spell Crit Dmg", 50, true}}, -- Burnout

    -- MAGE: FROST
    [29440] = {{"Spell Hit", 3, true}}, -- Precision
    [31669] = {{"Spell Dmg Reduc", 6, true}}, -- Frozen Core
    [31678] = {{"Spell Dodge", 5, true}, {"Ranged Dodge", 5, true}}, -- Arctic Winds
	
-- PALADIN: HOLY
    [20261] = {{"Intellect", 15, true}}, -- Divine Intellect (15% Total Intellect)
    [31841] = {{"SP from INT", 20, true}}, -- Holy Guidance

    -- PALADIN: PROTECTION
    [63650] = {{"Healing", 5, true}}, -- Divinity
    [20266] = {{"Strength", 15, true}}, -- Divine Strength
    [20100] = {{"Dodge", 5, true}}, -- Anticipation (Dodge)
    [20147] = {{"Armor Bonus", 10, true}}, -- Toughness (10% Armor from items)
    [20260] = {{"Block Chance", 5, true}}, -- Redoubt (5% Block)
    [20470] = {{"Dmg Reduc", 6, true}}, -- Improved Righteous Fury (Dmg Reduc)
    [20468] = {{"Dmg Reduc", 6, true}}, -- Shield of the Templar (6% Dmg Reduc)
    [31849] = {{"Stamina", 4, true}}, -- Shield of the Templar (6% Dmg Reduc)
    [20135] = {{"Block Value", 30, true}}, -- Shield of the Templar (6% Dmg Reduc)

    -- PALADIN: RETRIBUTION
    [20049] = {{"Parry", 5, true}}, -- Deflection (Parry Chance)
    [20121] = {{"Crit", 5, true}}, -- Conviction (5% Phys/Spell Crit)
    [31872] = {{"Spell Dodge", 4, true}, {"Ranged Dodge", 4, true}}, -- Two-Handed Weapon Specialization (10% Dmg)
    [53503] = {{"AP TO SPELL", 30, true}}, -- Sheath of Light (AP as SP)
    [53648] = {{"HASTE", 3, true}}, -- Sheath of Light (AP as SP)
	
-- PRIEST: DISCIPLINE
    [14747] = {{"Crit", 5, true}}, -- Holy Specialization (5% Holy Crit)
    [14767] = {{"Mana Regen", 50, true}}, -- Meditation (50% Regen while casting)
    [14774] = {{"Intellect", 15, true}}, -- Mental Agility (15% Total Intellect)
    [18551] = {{"Spirit", 25, true}}, -- Enlightenment (25% Total Spirit)

    -- PRIEST: HOLY
    [14889] = {{"Healing", 10, true}}, -- Divine Fury (10% Smite/Heal/Greater Heal)
    [14912] = {{"Healing", 10, true}}, -- Spiritual Guidance (25% Spirit as SP)
    [14901] = {{"Spirit", 5, true}}, -- Spiritual Healing (5% Total Spirit)

    -- PRIEST: SHADOW
    [15259] = {{"Hit %", 3, true}}, -- Shadow Affinity (3% Spell Hit)
    [15260] = {{"Shadow Damage", 15, true}}, -- Shadow Power (15% Shadow Dmg)
	
-- ROGUE: ASSASSINATION
    [14162] = {{"Crit %", 5, true}}, -- Malice
    [14156] = {{"Energy Bonus", 10, false}}, -- Vigor
    [14158] = {{"Crit Dmg", 30, true}}, -- Find Weakness (30% Ability Crit Dmg)

    -- ROGUE: COMBAT
    [13715] = {{"Dodge %", 5, true}}, -- Lightning Reflexes
    [13713] = {{"Hit %", 5, true}}, -- Precision
    [13706] = {{"Damage", 50, true}}, -- Dual Wield Specialization (50% Offhand Dmg)
    [13800] = {{"Crit %", 5, true}}, -- Close Quarters Combat (5% Dagger/Fist Crit)

    -- ROGUE: SUBTLETY
    [14082] = {{"Agility", 15, true}}, -- Sinister Calling (15% Total Agility)
	
-- SHAMAN: ELEMENTAL
    [16035] = {{"Damage", 5, true}}, -- Concussion (5% Shock/Lightning Dmg)
    [16164] = {{"Crit", 5, true}}, -- Elemental Fury (5% Crit - part of 3.3.5 logic)
    [16086] = {{"Crit Dmg", 100, true}}, -- Elemental Fury (100% Spell Crit Dmg bonus)

    -- SHAMAN: ENHANCEMENT
    [16259] = {{"Crit", 5, true}}, -- Ancestral Knowledge (5% Intellect)
    [16255] = {{"Crit", 5, true}}, -- Thundering Strikes (5% Phys Crit)
    [17485] = {{"Hit", 6, true}}, -- Dual Wield Specialization (6% Phys Hit)
    [16254] = {{"AP Bonus", 30, true}}, -- Mental Quickness (30% AP as SP)

    -- SHAMAN: RESTORATION
    [16179] = {{"Hit", 3, true}}, -- Nature's Guidance (3% Spell/Phys Hit)
    [16181] = {{"Crit", 5, true}}, -- Tidal Mastery (5% Spell Crit)
    [16194] = {{"Healing", 10, true}}, -- Purification (10% Healing)
	
-- WARLOCK: AFFLICTION
    [18827] = {{"Damage", 10, true}}, -- Improved Curse of Agony (10% Dmg)
    [18174] = {{"Hit %", 3, true}}, -- Suppression (3% Spell Hit)
    [18271] = {{"Shadow Damage", 15, true}}, -- Shadow Mastery (15% Shadow Dmg)

    -- WARLOCK: DEMONOLOGY
    [18705] = {{"Stamina", 10, true}}, -- Demonic Embrace (10% Total Stamina)
    [18731] = {{"Stamina", 3, true}, {"Intellect", 3, true}}, -- Fel Vitality
    [35691] = {{"SP Bonus", 12, true}}, -- Demonic Knowledge (12% Pet Stat as SP)
    [30242] = {{"Crit", 10, true}}, -- Demonic Tactics (10% Crit)

    -- WARLOCK: DESTRUCTION
    [47192] = {{"Dmg Reduc", 6, true}}, -- Molten Skin (6% Damage Reduction)
    [17959] = {{"Crit Dmg", 100, true}}, -- Ruin (100% Crit Dmg bonus)
    [18130] = {{"Crit", 5, true}}, -- Devastation (5% Destruction Crit)
    [17954] = {{"Fire Damage", 15, true}}, -- Emberstorm (15% Fire Dmg)
	
-- WARRIOR: ARMS
    [16466] = {{"Parry", 5, true}}, -- Deflection (Parry)
    [12282] = {{"Damage", 10, true}}, -- Two-Handed Weapon Specialization (10% Dmg)

    -- WARRIOR: FURY
    [12856] = {{"Crit", 5, true}}, -- Cruelty (5% Crit)
    [14148] = {{"Damage Off-hand", 25, true}}, -- Dual Wield Specialization (25% Offhand Dmg)
    [12313] = {{"Hit", 3, true}}, -- Precision (3% Hit)

    -- WARRIOR: PROTECTION
    [12727] = {{"Block Chance", 5, true}}, -- Shield Specialization (Block/Rage)
    [12753] = {{"Dodge Chance", 5, true}}, -- Anticipation (Dodge)
    [12764] = {{"Armor Bonus", 10, true}}, -- Toughness (10% Armor from items)
    [12308] = {{"Spell Dodge", 2, true}}, -- Improved Shield Block (Cooldown)
    [29599] = {{"Block Value", 30, true}}, -- Shield Mastery (Block value/Cooldown)
    [29144] = {{"Strength", 6, true}, {"Stamina", 9, true}, {"Expertise", 6, false}}, -- Vitality (6% Total Stamina)
}