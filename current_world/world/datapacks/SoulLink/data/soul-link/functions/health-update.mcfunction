execute as @s run tag @s add hpChecked
execute as @s run effect give @s minecraft:instant_damage 1 0 true
execute as @s run schedule function soul-link:heal-self 1t append