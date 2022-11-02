c83 ← "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz#$%*+,-.:;=?@[]^_{|}~"
Base83 ← ⊏⟜c83∘{0:⟨⟩; (𝕊⌊𝕩÷83)∾83|𝕩}
DCT1d ← {
  s ← ≠𝕩
  basis ← •math.Cos π×𝕨×÷⟜s↕s
  ÷⟜s+´⥊basis×𝕩
}
DCT2d ← {
  s ← ≢𝕩
  basis ← ×´¨ •math.Cos π×𝕨⊸×¨÷⟜s¨↕s
  ÷⟜(×´s)+´⥊basis×𝕩
}

img ← (16÷˜4‿4⥊↕16)
comps ← 3‿2 # y‿x components

norm ← 1⌾(0‿0⊸⊑) comps⥊2

•Show norm × DCT2d⟜img¨(↕comps)
