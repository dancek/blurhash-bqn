ConsumeComment ← {𝕊 stream:
  {(⊑stream)≠@+10 ? ConsumeComment 1↓stream ; 1↓stream}
}
ws ← @ + 9‿10‿13‿32
ConsumeWhitespace ← {𝕊 stream:
  {⊑(⊑stream) ∊ ws ? ConsumeWhitespace 1↓stream;
   '#'=⊑stream ? ConsumeComment stream;
   stream}
}
ReadNumber ← {𝕊 stream:
  stream ↩ ConsumeWhitespace stream
  n ← 0
  {𝕊
    c ← ⊑stream
    stream ↩ 1↓stream
    (c≥'0')∧(c≤'9') ?
      n ↩ (c-'0')+n×10
      𝕊@
    ;@}@
  stream ↩ ConsumeWhitespace stream
  n‿stream
}

Decode ⇐ {𝕊 data:
  "Only PPM type P6 supported for now!" ! "P6"≡2↑data
  w‿d2 ← ReadNumber 2↓data
  h‿d3 ← ReadNumber d2
  m‿pxs ← ReadNumber d3
  "Only 8-bit PPM channels are supported for now!" ! m<256

  2‿1‿0 ⍉⁼ h‿w‿3⥊pxs-@
}

Encode ⇐ {𝕊 img:
  ch‿w‿h ← ≢img
  "Only RGB supported!" ! ch=3
  "Data needs to be integers between 0-255" ! (255≥⌈´⥊img)∧(0≤⌊´⥊img)
  data ← @+¨⥊2‿1‿0⍉⁼img
  "P6
"∾(•Fmt w)∾" "∾(•Fmt h)∾" 255
"∾data
}

