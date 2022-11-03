#!/usr/bin/env bqn

blurhash ← •Import "blurhash.bqn"
ppm ← •Import "ppm.bqn"

•Out 5‿1 blurhash.Encode ppm.Decode •FBytes ⊑•args
