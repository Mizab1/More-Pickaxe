#built using mc-build (https://github.com/IanSSenne/mcbuild), Datapack by Mizab

effect give @p[distance=..5] resistance 1 225 true
kill @s
summon arrow ~0.1 ~1.5 ~ {pickup:1b}
summon arrow ~-0.1 ~1.5 ~ {pickup:1b}
summon arrow ~ ~1.5 ~0.1 {pickup:1b}
summon arrow ~ ~1.5 ~-0.1 {pickup:1b}
summon arrow ~ ~1.5 ~ {pickup:1b}
summon tnt ~ ~1.5 ~ {Fuse:0}
summon firework_rocket ~ ~1.5 ~ {LifeTime:0,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Colors:[I;16711680,543487,16766996]}]}}}}