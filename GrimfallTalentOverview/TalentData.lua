-- TalentData.lua
-- Format: [SpellID] = { {label, value, isPercent}, ... }

-- Primary Stats
global_intellect = "Int"
global_dexterity = "Dex"
global_strength = "Str"
global_spirit = "Spr"
global_agility = "Agi"
global_stamina = "Stam"
global_all_Stats = "Stats"
global_expertise = "Expertise"

-- General Combat
global_crit = "Crit"
global_crit_dmg = "Crit Dmg"
global_hit = "Hit"
global_haste = "Haste"
global_hot = "HoT"
global_dot = "DoT"
global_damage = "Dmg"
global_damage_off_hand = "Dmg Off-Hand"
global_attack_power = "AP"
global_max_energy = "Max Energy"
global_energy_regen = "Energy Regen"
global_energy_speed = "Energy Speed"
global_ability_damage = "Ability Dmg"
global_armor_pen = "ArP"

-- Defense & Health
global_health = "Health"
global_mana = "Mana"
global_armor = "Armor"
global_dodge_chance = "Dodge"
global_parry = "Parry"
global_dmg_taken_reduced = "DR"
global_cloth_leather_armour = "C/L Armor"
block_chance = "Block Chance"
block_value = "Block Value"
global_area_of_effect_damage_reduction = "AoE DR"
global_disarm_duration = "Disarm Reduc."
global_rage_gen = "Rage/3s"
global_dodge_reduction = "Dodge Ignore"

-- Spell Specific
spell_damage = "Spell Dmg"
spell_crit = "Spell Crit"
spell_crit_dmg = "Spell Crit Dmg"
spell_hit = "Spell Hit"
spell_haste = "Spell Haste"
spell_dodge = "Spell Dodge"
spell_damage_taken_reduced = "Spell DR"

-- Melee Specific
melee_damage = "Melee Dmg"
melee_crit = "Melee Crit"
melee_crit_dmg = "Melee Crit Dmg"
melee_hit = "Melee Hit"
melee_haste = "Melee Haste"
melee_crit_reduction = "Crit Reduc."
melee_dodge = "Melee Dodge"

dual_wield_hit_chance = "DW Hit"
physical_crit_dmg = "Phys Crit Dmg"
global_rage_bonus = "Rage Gen"

-- Ranged Specific
ranged_crit = "Ranged Crit"
ranged_crit_dmg = "Ranged Crit Dmg"
ranged_hit = "Ranged Hit"
ranged_haste = "Ranged Haste"
ranged_dodge = "Ranged Dodge"

-- Conversions (Stat A to Stat B)
global_armor_from_int = "Int > Armor"
spell_power_from_int = "Int > SP"
spell_power_from_ap = "AP > SP"
spell_power_from_spirit = "Spr > SP"
ranged_ap_from_Int = "Int > RAP"
ap_from_int = "Int > AP"
mp5_from_int = "Int > Mp5"
healing_power_from_int = "Int > Hsp"

-- Healing
global_healing = "Healing"
global_effective_healing = "Heal Eff."
global_heal_crit_chance = "Heal Crit"
global_heal_cost_reduction = "Heal Cost -"
global_totem_cost_reduction = "Totem Cost -"
instant_heal = "Inst. Heal"
instant_damage = "Inst. Dmg"

-- DK things 
runic_regen = "Runic/5"

CL_FixedTalents = {
-- DEATH KNIGHT: BLOOD
    [49393] = {{"ARMOR_CALC", 5, false, 180}}, -- Bladed Armor
    [49480] = {{global_crit, 0, false}}, -- Dark Conviction 5% Crit
    [50029] = {{global_strength, 3, true}, {global_stamina, 3, true}, {global_expertise, 6, true}}, -- Veteran of the third war
    [53138] = {{global_attack_power, 10, true}, {global_strength, 2, true}}, -- Abominations might
    [61158] = {{global_armor_pen, 10, true}}, -- Blood Gorged
	
    -- DEATH KNIGHT: FROST
    [49789] = {{global_armor, 10, true}}, -- Toughness (10% Armor from items)
    [50138] = {{global_damage_off_hand, 25, true}}, -- Nerves of Cold Steel
	[55610] = {{global_haste, 25, true}}, -- Improved Icy Talons??

    -- DEATH KNIGHT: UNHOLY
	[55133] = {{global_dodge_chance, 5, true}}, -- Anticipation
	[49572] = {{global_strength, 3, true}}, -- Ravenous Dead
	[49638] = {{"Spell Benefit", 20, true}}, -- Impurity ?????????????????
	[49611] = {{spell_damage_taken_reduced, 6, true}}, -- Magic Suppression
	
-- DRUID: BALANCE
    [57814] = {{global_hot, 5, true}, {global_dot, 5, true}}, -- Genesis (5% HoT/DoT)
    [33591] = {{spell_power_from_int, 12, true}}, -- Lunar Guidance (12% Intellect as SP)
    [16924] = {{spell_haste, 3, true}}, -- Celestial Focus 3% Haste
    [33596] = {{spell_hit, 4, true}}, -- Balance of power 4% Spell Hit

    -- DRUID: FERAL
    [16931] = {{global_cloth_leather_armour, 10, true}}, -- Thick Hide (10% Armor from items)
    [24894] = {{global_intellect, 20, true}}, -- Heart of the Wild
    [33856] = {{global_all_Stats, 6, true}, {melee_crit_reduction, 6, true}}, -- Survival of the Fittest

    -- DRUID: RESTORATION
    [24946] = {{global_healing, 10, true}}, -- Gift of Nature
    [33883] = {{spell_crit, 3, true}}, -- Natural Perfection
    [34153] = {{global_spirit, 15, true}}, -- Living Spirit
    [33890] = {{global_hot, 20, true}}, -- Empowered Rejuvenation
    [51183] = {{spell_haste, 10, true}}, -- Gift of the Earthmother

-- HUNTER: BEAST MASTERY
    [19587] = {{global_healing, 5, true}}, -- Endurance Training (5% Health)
    [19612] = {{global_armor, 10, true}}, -- Thick Hide
    [34465] = {{global_dodge_chance, 3, true}}, -- Catlike Reflexes
	[34470] = {{ranged_haste, 20, true}}, -- Serpents Swiftness
	
    -- HUNTER: MARKSMANSHIP
    [19431] = {{ranged_crit, 5, true}}, -- Lethal Shots (5% Crit)
    [34484] = {{ranged_ap_from_Int, 100, true}}, -- Careful Aim
    [34476] = {{global_agility, 4, true}, {global_intellect, 4, true}}, -- Combat Experience
    [19506] = {{global_attack_power, 10, true}}, -- Trueshot Aura
    [34489] = {{global_crit, 5, true}}, -- Master Marksman

    -- HUNTER: SURVIVAL
    [34496] = {{global_dmg_taken_reduced, 4, true}}, -- Survival Instinct
    [19298] = {{global_parry, 3, true}}, -- Deflection
    [19259] = {{global_stamina, 10, true}}, -- Survivalist
    [19373] = {{global_crit, 3, true}}, -- Killer Instinct
    [24297] = {{global_agility, 15, true}}, -- Lightning Reflexes
    [53292] = {{global_agility, 3, true}}, -- Lightning Reflexes
	
-- MAGE: ARCANE
    [54659] = {{global_armor_from_int, 150, true}}, -- Arcane Fortitude (150% Int as Armor)
    [44399] = {{global_spirit, 10, true}}, -- Studen of the Mind
    [12503] = {{global_intellect, 15, true}}, -- Arcane Mind
    [54354] = {{global_dmg_taken_reduced, 6, true}}, -- Name
    [15060] = {{spell_damage, 3, true}, {spell_crit, 3 , true}}, -- Arcane Instability
    [31588] = {{spell_power_from_int, 15, true}}, -- Mind Mastery
    [44403] = {{spell_haste, 6, true}}, -- Netherwind Presence
    [35581] = {{spell_crit_dmg, 50, true}}, -- Spell Power

    -- MAGE: FIRE
    [31640] = {{spell_damage, 3, true}, {spell_damage_taken_reduced, 3 , true}}, -- Playing with Fire
    [34296] = {{spell_crit, 3, true}}, -- Pyromaniac
    [44472] = {{spell_crit_dmg, 50, true}}, -- Burnout

    -- MAGE: FROST
    [29440] = {{spell_hit, 3, true}}, -- Precision
    [31669] = {{spell_damage_taken_reduced, 6, true}}, -- Frozen Core
    [31678] = {{melee_dodge, 5, true}, {ranged_dodge, 5, true}}, -- Arctic Winds
	
-- PALADIN: HOLY
    [20261] = {{global_intellect, 15, true}}, -- Divine Intellect (15% Total Intellect)
    [31841] = {{spell_power_from_int, 20, true}}, -- Holy Guidance

    -- PALADIN: PROTECTION
    [63650] = {{global_healing, 5, true}}, -- Divinity
    [20266] = {{global_strength, 15, true}}, -- Divine Strength
    [20100] = {{global_dodge_chance, 5, true}}, -- Anticipation (Dodge)
    [20147] = {{global_armor, 10, true}}, -- Toughness (10% Armor from items)
    [20260] = {{block_chance, 5, true}}, -- Redoubt (5% Block)
    [20470] = {{global_dmg_taken_reduced, 6, true}}, -- Improved Righteous Fury (Dmg Reduc)
    [20468] = {{global_dmg_taken_reduced, 3, true}}, -- Shield of the Templar
    [31849] = {{global_stamina, 4, true}}, -- 
    [20135] = {{block_value, 30, true}}, -- 
	
    -- PALADIN: RETRIBUTION
    [20049] = {{global_parry, 5, true}}, -- Deflection (Parry Chance)
    [20121] = {{global_crit, 5, true}}, -- Conviction (5% Phys/Spell Crit)
    [31868] = {{global_damage, 3, true}}, -- Crusade
    [31872] = {{spell_dodge, 4, true}, {ranged_dodge, 4, true}}, -- Divine Purpose
    [53503] = {{Spell_power_from_ap, 30, true}}, -- Sheath of Light (AP as SP)
    [53648] = {{global_haste, 3, true}}, -- Sheath of Light (AP as SP)
	
-- PRIEST: DISCIPLINE
    [52803] = {{Instant_heal, 5, true}, {Instant_damage, 5, true}}, -- Twin Disciplines
    [34910] = {{global_spirit, 6, true}, {spell_haste, 6, true}}, -- Englightenment
    [45244] = {{spell_crit, 3, true}}, -- Focused Will

    -- PRIEST: HOLY
    [27904] = {{spell_damage_taken_reduced, 10, true}}, -- Spell Warding
    [15031] = {{spell_power_from_spirit, 25, true}}, -- Spiritual Guidance
    [15356] = {{global_healing, 10, true}}, -- Spiritual Healing
    [33146] = {{global_effective_healing, 3, true}}, -- Blessed Resilience

    -- PRIEST: SHADOW
    [51167] = {{spell_power_from_spirit, 20, true}}, -- Twisted Faith
	
-- ROGUE: ASSASSINATION
    [14142] = {{global_crit, 5, true}}, -- Malice
    [14983] = {{global_max_energy, 10, false}}, -- Vigor
    [14159] = {{global_damage, 4, true}}, -- Murder
    [31383] = {{global_dmg_taken_reduced, 6, true}}, -- Deadened Nerves
    [31236] = {{global_ability_damage, 6, true}}, -- Find Weakness
	
    -- ROGUE: COMBAT
    [13852] = {{global_damage_off_hand, 50, true}}, -- Dual Wield Specialization
    [13845] = {{global_hit, 5, true}}, -- Precision
    [13854] = {{global_parry, 6, true}}, -- Deflection
    [30920] = {{global_expertise, 10, false}}, -- Weapon Expertise
    [61329] = {{global_energy_regen, 25, true}}, -- Vitality
    [58413] = {{global_attack_power, 4, true}}, -- Savage Combat
    --[13807] = {{"Dagger/Fist Crit", 5, true}}, -- Close Quarters Combat
	--[13964] = {{"Axe/Sword 5% Extra Atk", 1, false}}, -- Hack and Slash
    -- ROGUE: SUBTLETY
    [14173] = {{global_armor_pen, 9, true}}, -- Serrated Blades
    [30906] = {{global_attack_power, 10, true}}, -- Deadliness 
    [31213] = {{global_area_of_effect_damage_reduction, 30, true}}, -- Enveloping Shadows
    [31220] = {{global_agility, 15, true}}, -- Sinister Calling
	
-- SHAMAN: ELEMENTAL
    [28998] = {{global_dmg_taken_reduced, 6, true}}, -- Elemental Warding
    [30666] = {{mp5_from_int, 12, true}}, -- Unrelenting Storm
    [51470] = {{spell_crit, 5, true}}, -- Elemental Oath

    -- SHAMAN: ENHANCEMENT
    [17489] = {{global_intellect, 10, true}}, -- Ancestral Knowledge (10% Intellect)
    [16305] = {{global_crit, 5, true}}, -- Thundering Strike
    [16272] = {{global_dodge_chance, 3, true}, {global_disarm_duration, 50, true}}, -- Anticipation
    [51885] = {{ap_from_int, 100, true}}, -- Mental Dexterity
    [29086] = {{melee_damage, 10, true}}, -- Weapon Mastery
    [30809] = {{global_attack_power, 10, true}, {global_expertise, 9, false}}, -- Unleashed Rage
    [30819] = {{dual_wield_hit_chance, 6, true}}, -- Dual Wield Specialization
    [30814] = {{spell_power_from_ap, 30, true}}, -- Mental Quickness

    -- SHAMAN: RESTORATION
    [16225] = {{global_totem_cost_reduction, 25, true}}, -- Totemic Focus
    [16217] = {{global_heal_cost_reduction, 5, true}}, -- Tidal Focus
    [16221] = {{global_heal_crit_chance, 5, true}}, -- Tidal Miastery
    [16213] = {{global_effective_healing, 10, true}}, -- Purifcation
    [30869] = {{healing_power_from_int, 15, true}}, --  Nature's Blessing
    [51555] = {{spell_crit, 4, true}}, -- Blessing of the eternals
	
-- WARLOCK: AFFLICTION
    [32484] = {{spell_damage, 3, true}}, -- Malediction

    -- WARLOCK: DEMONOLOGY
    [18699] = {{global_stamina, 10, true}}, -- Demonic Embrace (10% Total Stamina)
    [18744] = {{global_health, 3, true}, {global_mana, 3, true}}, -- Fel Vitality
    [30248] = {{global_crit, 10, true}}, -- Demonic Tactics

    -- WARLOCK: DESTRUCTION
    [63351] = {{global_dmg_taken_reduced, 6, true}}, -- Molten Skin (6% Damage Reduction)
	
-- WARRIOR: ARMS
    [16466] = {{global_parry, 5, true}}, -- Deflection (Parry)
    [12296] = {{global_rage_gen, 1, false}}, -- Anger management
    [16494] = {{physical_crit_dmg, 20, true}}, -- Impale
    --[12712] = {{"Two-hand Melee Dmg", 6, true}}, -- Two-Handed Wep Spec
    --[12785] = {{"Axe/Poleaxe Crit", 5, true}, {"Axe/Poleaxe Crit Dmg", 5, true}}, -- Axe/Poleaxe Spec
    --[12704] = {{"Mace armor Pen", 15, true}}, -- Mace Spec
    --[46866] = {{"Sword 10% Extra Att", 1, false}}, -- Sword Spec
    [46866] = {{global_strength, 4, true}, {global_stamina, 4, true}, {global_expertise, 4, false}}, -- Strength of Arms
    [29859] = {{melee_haste, 10, true}}, -- Blood Frenzy
    [29623] = {{global_rage_bonus, 25, true}}, -- Endless Rage
    [20505] = {{global_dodge_reduction, 2, true}}, -- Weapon Mastery

    -- WARRIOR: FURY
    [61222] = {{"ARMOR_CALC", 3, false, 108}}, -- Armored to the teeth
    [12856] = {{melee_crit, 5, true}}, -- Cruelty
    [23588] = {{global_damage_off_hand, 25, true}}, -- Dual Wield Specialization (25% Offhand Dmg)
    [29592] = {{melee_hit, 3, true}}, -- Precision (3% Hit)
    [29801] = {{melee_crit, 5, true}, {ranged_crit, 5, true}}, -- Rampage
	
    -- WARRIOR: PROTECTION
    [12727] = {{block_chance, 5, true}}, -- Shield Specialization (Block/Rage)
    [12753] = {{global_dodge_chance, 5, true}}, -- Anticipation (Dodge)
    [12764] = {{global_armor, 10, true}}, -- Toughness (10% Armor from items)
    [12308] = {{spell_dodge, 2, true}}, -- Improved Shield Block (Cooldown)
    [29599] = {{block_value, 30, true}}, -- Shield Mastery (Block value/Cooldown)
    [29144] = {{global_strength, 6, true}, {global_stamina, 9, true}, {global_expertise, 6, false}}, -- Vitality (6% Total Stamina)
    --[16542] = {{"One-Hand Phys Dmg", 10, true}}, -- One-Handed wep Spec

}