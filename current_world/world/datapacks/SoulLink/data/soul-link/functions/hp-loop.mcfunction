execute as @a unless entity @s[tag=hpChecked] run tag @s add hpChecking
#execute as @a[tag=hpChecking] run effect give @s minecraft:instant_damage 1 0 true
#execute as @a[tag=hpChecking] run effect give @s minecraft:regeneration 1 255 true
#execute as @a[tag=hpChecking] run effect give @s minecraft:health_boost 2 0 true
execute as @a[tag=hpChecking] run effect give @s minecraft:absorption 1 0 true
execute as @a[tag=hpChecking] run scoreboard players set @a deathCount 0
execute as @a[tag=hpChecking] run scoreboard players set @a lowestHealth 20
execute as @a[tag=hpChecking] run tag @s add hpChecked
execute as @a[tag=hpChecking] run tag @s remove hpChecking

execute as @a[scores={Health=0..10}] unless entity @s[tag=halfHealth] run scoreboard players add @s halfHealth 1
execute as @a[scores={Health=0..10}] unless entity @s[tag=halfHealth] run tag @s add halfHealth
execute as @a[scores={Health=11..}] if entity @s[tag=halfHealth] run tag @s remove halfHealth

execute as @a[scores={Health=0..1}] unless entity @s[tag=halfHeart] run scoreboard players add @s halfHeart 1
execute as @a[scores={Health=0..1}] unless entity @s[tag=halfHeart] run tag @s add halfHeart
execute as @a[scores={Health=2..}] if entity @s[tag=halfHeart] run tag @s remove halfHeart

execute as @a unless entity @s[tag=alreadyDead] if score @s Health < @s lowestHealth run execute store result score @s lowestHealth run scoreboard players get @s Health