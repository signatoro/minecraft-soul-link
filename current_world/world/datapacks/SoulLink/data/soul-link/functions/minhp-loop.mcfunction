bossbar set minecraft:minhp players @a

execute store result score MinHealth generic run scoreboard players get @r Health
execute as @a if score @s Health <= MinHealth generic store result score MinHealth generic run scoreboard players get @s Health
execute store result bossbar minecraft:minhp value run scoreboard players get MinHealth generic

execute if score MinHealth generic < YellowMinHealth generic run bossbar set minecraft:minhp color red
execute if score MinHealth generic >= YellowMinHealth generic run bossbar set minecraft:minhp color yellow
execute if score MinHealth generic >= GreenMinHealth generic run bossbar set minecraft:minhp color green