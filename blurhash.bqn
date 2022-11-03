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

Srgb2lin ← {
  𝕩≤0.04045 ? 𝕩÷255×12.92;
  ((𝕩+0.055)÷1.055)⋆2.4
}
Lin2srgb ← {
  𝕩≤0.0031308 ? ⌊0.5+12.92×255×0⌈𝕩;
  ⌊0.5+255×0.055-˜1.055×(𝕩⌊1)⋆÷2.4
}
Ac2ints ← {
  norm ← 166÷˜1+𝕨
  0⌈18⌊⌊9.5+9×(××⋆⟜0.5∘|)(𝕩÷norm)
}

EncodeLinear ← {comps 𝕊 img:
  cs ← (⥊↕comps) DCT2d⌜ <˘img

  dc ← ⊏cs
  ac ← 2×1↓cs

  c ← 1 Base83Pad +´9‿1×comps-1
  max ← ⌈´|⥊ac
  quant ← 0⌈82⌊⌊¯0.5+max×166
  q ← 1 Base83Pad quant
  a ← 4 Base83Pad +´(⌽256⊸⋆↕3) × Lin2srgb¨ dc
  d ← 2⊸Base83Pad¨ +˝(⌽19⊸⋆↕3) × ⍉ quant Ac2ints ac
  c∾q∾a∾∾´d
}
Encode ← {
  𝕨 EncodeLinear Srgb2lin 𝕩
}

img ← (4‿4⥊0)∾(16÷˜4‿4⥊↕16)≍(4‿4⥊1)
comps ← 2‿3 # y‿x components

•Out comps EncodeLinear img
