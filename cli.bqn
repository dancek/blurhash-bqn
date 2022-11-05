#!/usr/bin/env bqn

blurhash ← •Import "blurhash.bqn"
ppm ← •Import "ppm.bqn"

•Out 4‿3 blurhash.Encode ppm.Decode •FBytes ⊑•args
