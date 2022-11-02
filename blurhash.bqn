c83 ← "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz#$%*+,-.:;=?@[]^_{|}~"
Base83 ← ⊏⟜c83∘{0:""; (𝕊⌊𝕩÷83)∾83|𝕩}
Base83Pad ← {
  s ← Base83𝕩
  s∾˜'0'⥊˜𝕨-≠s
}
DCT2d ← {
  s ← ≢𝕩
  basis ← ×´¨ •math.Cos π×𝕨⊸×¨÷⟜s¨↕s
  ÷⟜(×´s)+´⥊basis×𝕩
}

Lin2srgb ← {
  𝕩≤0.0031308 ? ⌊0.5+12.92×255×0⌈𝕩;
  ⌊0.5+255×0.055-˜1.055×(𝕩⌊1)⋆÷2.4
}
Ac2ints ← {
  max ← ⌈´|⥊𝕩
  quant ← 0⌈82⌊⌊¯0.5+max×166
  norm ← 166÷˜1+quant
  v ← 0⌈18⌊⌊9.5+9×(××⋆⟜0.5∘|)(𝕩÷norm)
  # FIXME: grayscale
  v+19×v+19×v
}

img ← (16÷˜4‿4⥊↕16)
comps ← 3‿2 # y‿x components

B83_3ch ← {𝕨 Base83Pad 𝕩+256×𝕩+256×𝕩}

cs ← ⥊DCT2d⟜img¨(↕comps)
dc ← ⊑cs
ac ← 2×1↓cs
ac∾ac≍ac

c ← 1 Base83Pad +´9‿1×comps-1
max ← ⌈´|⥊ac
quant ← 0⌈82⌊⌊¯0.5+max×166
q ← 1 Base83Pad quant
a ← 4 B83_3ch Lin2srgb dc
d ← 2⊸Base83Pad¨ Ac2ints ac
c∾q∾a∾∾´d
