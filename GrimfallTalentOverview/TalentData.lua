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
    [16931] = {{"Cloth/Leather", 10, true}}, -- Thick Hide (10% Armor from items)
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
    [31669] = {{"Spell DR", 6, true}}, -- Frozen Core
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
    [31868] = {{"All Damage", 3, true}}, -- Crusade
    [31872] = {{"Spell Dodge", 4, true}, {"Ranged Dodge", 4, true}}, -- Divine Purpose
    [53503] = {{"AP TO SPELL", 30, true}}, -- Sheath of Light (AP as SP)
    [53648] = {{"HASTE", 3, true}}, -- Sheath of Light (AP as SP)
	
-- PRIEST: DISCIPLINE
    [52803] = {{"Instant Heal", 5, true}, {"Instant Dmg", 5, true}}, -- Twin Disciplines
    [34910] = {{"Spirit", 6, true}, {"Spell Haste", 6, true}}, -- Englightenment
    [45244] = {{"Spell crit", 3, true}}, -- Focused Will

    -- PRIEST: HOLY
    [27904] = {{"Spell DR", 10, true}}, -- Spell Warding
    [15031] = {{"SP From Spirit", 25, true}}, -- Spiritual Guidance
    [15356] = {{"Healing", 10, true}}, -- Spiritual Healing
    [33146] = {{"Effct Healing", 3, true}}, -- Blessed Resilience

    -- PRIEST: SHADOW
    [51167] = {{"SP From Spirit", 20, true}}, -- Twisted Faith
	
-- ROGUE: ASSASSINATION
    [14142] = {{"Crit", 5, true}}, -- Malice
    [14983] = {{"Energy Bonus", 10, false}}, -- Vigor
    [14159] = {{"All Damage", 4, true}}, -- Murder
    [31383] = {{"Dmg Reduc", 6, true}}, -- Deadened Nerves
    [31236] = {{"All Ability Dmg", 6, true}}, -- Find Weakness
	
    -- ROGUE: COMBAT
    [13852] = {{"Damage Off-hand", 50, true}}, -- Dual Wield Specialization
    [13845] = {{"Hit", 5, true}}, -- Precision
    [13854] = {{"Parry", 6, true}}, -- Deflection
    [30920] = {{"Expertise", 10, false}}, -- Weapon Expertise
    [61329] = {{"Energy Regen", 25, true}}, -- Vitality
    [58413] = {{"Attack Power", 4, true}}, -- Savage Combat
    --[13807] = {{"Dagger/Fist Crit", 5, true}}, -- Close Quarters Combat
	--[13964] = {{"Axe/Sword 5% Extra Atk", 1, false}}, -- Hack and Slash
    -- ROGUE: SUBTLETY
    [14173] = {{"Armor Pen", 9, true}}, -- Serrated Blades
    [30906] = {{"Attack Power", 10, true}}, -- Deadliness 
    [31213] = {{"AoE DR", 30, true}}, -- Enveloping Shadows
    [31220] = {{"Agility", 15, true}}, -- Sinister Calling
	
-- SHAMAN: ELEMENTAL
    [28998] = {{"Dmg Reduc", 6, true}}, -- Elemental Warding
    [30666] = {{"MP5 from INT", 12, true}}, -- Unrelenting Storm
    [51470] = {{"Spell Crit", 5, true}}, -- Elemental Oath

    -- SHAMAN: ENHANCEMENT
    [17489] = {{"Intellect", 10, true}}, -- Ancestral Knowledge (10% Intellect)
    [16305] = {{"Crit", 5, true}}, -- Thundering Strike
    [16272] = {{"Dodge", 3, true}, {"Disarm Duration", 50, true}}, -- Anticipation
    [51885] = {{"AP from INT", 100, true}}, -- Mental Dexterity
    [29086] = {{"Melee Dmg", 10, true}}, -- Weapon Mastery
    [30809] = {{"Attack Power", 10, true}, {"Expertise", 9, false}}, -- Unleashed Rage
    [30819] = {{"Dual-Wield Hit", 6, true}}, -- Dual Wield Specialization
    [30814] = {{"SP from AP", 30, true}}, -- Mental Quickness

    -- SHAMAN: RESTORATION
    [16225] = {{"Totem Cost Reduc", 25, true}}, -- Totemic Focus
    [16217] = {{"Heal Cost Reduc", 5, true}}, -- Tidal Focus
    [16221] = {{"Heal Crit", 5, true}}, -- Tidal Miastery
    [16213] = {{"Effct Heal", 10, true}}, -- Purifcation
    [30869] = {{"Hsp from INT", 15, true}}, --  Nature's Blessing
    [51555] = {{"Spell Crit", 4, true}}, -- Blessing of the eternals
	
-- WARLOCK: AFFLICTION
    [32484] = {{"Spell Dmg", 3, true}}, -- Malediction

    -- WARLOCK: DEMONOLOGY
    [18699] = {{"Stamina", 10, true}}, -- Demonic Embrace (10% Total Stamina)
    [18744] = {{"Health", 3, true}, {"Mana", 3, true}}, -- Fel Vitality
    [30248] = {{"Crit", 10, true}}, -- Demonic Tactics

    -- WARLOCK: DESTRUCTION
    [63351] = {{"Dmg Reduc", 6, true}}, -- Molten Skin (6% Damage Reduction)
	
-- WARRIOR: ARMS
    [16466] = {{"Parry", 5, true}}, -- Deflection (Parry)
    [12296] = {{"Rage per 3s", 1, false}}, -- Anger management
    [16494] = {{"Phys Crit Dmg", 20, true}}, -- Impale
    --[12712] = {{"Two-hand Melee Dmg", 6, true}}, -- Two-Handed Wep Spec
    --[12785] = {{"Axe/Poleaxe Crit", 5, true}, {"Axe/Poleaxe Crit Dmg", 5, true}}, -- Axe/Poleaxe Spec
    [12704] = {{"Mace armor Pen", 15, true}}, -- Mace Spec
    [46866] = {{"Sword 10% Extra Att", 1, false}}, -- Sword Spec
    [46866] = {{"Strength", 4, true}, {"Stamina", 4, true}, {"Expertise", 4, false}}, -- Strength of Arms
    [29859] = {{"Melee Haste", 10, true}}, -- Blood Frenzy
    [29623] = {{"Rage bonus", 25, true}}, -- Endless Rage
    [20505] = {{"Reduce dodged attacks", 2, true}}, -- Weapon Mastery

    -- WARRIOR: FURY
    [61222] = {{"ARMOR_CALC", 3, false}}, -- Armored to the teeth
    [12856] = {{"Melee Crit", 5, true}}, -- Cruelty
    [23588] = {{"Damage Off-hand", 25, true}}, -- Dual Wield Specialization (25% Offhand Dmg)
    [29592] = {{"Melee Hit", 3, true}}, -- Precision (3% Hit)
    [29801] = {{"Melee Crit", 5, true}, {"Ranged Crit", 5, true}}, -- Rampage
	
    -- WARRIOR: PROTECTION
    [12727] = {{"Block Chance", 5, true}}, -- Shield Specialization (Block/Rage)
    [12753] = {{"Dodge Chance", 5, true}}, -- Anticipation (Dodge)
    [12764] = {{"Armor Bonus", 10, true}}, -- Toughness (10% Armor from items)
    [12308] = {{"Spell Dodge", 2, true}}, -- Improved Shield Block (Cooldown)
    [29599] = {{"Block Value", 30, true}}, -- Shield Mastery (Block value/Cooldown)
    [29144] = {{"Strength", 6, true}, {"Stamina", 9, true}, {"Expertise", 6, false}}, -- Vitality (6% Total Stamina)
    --[16542] = {{"One-Hand Phys Dmg", 10, true}}, -- One-Handed wep Spec

}