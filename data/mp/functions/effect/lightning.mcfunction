#built using mc-build (https://github.com/IanSSenne/mcbuild), Datapack by Mizab

effect give @p[distance=..5] resistance 12 225 true
execute as @e[distance=..6,type=!player] at @s run summon lightning_bolt ~ ~ ~
kill @s