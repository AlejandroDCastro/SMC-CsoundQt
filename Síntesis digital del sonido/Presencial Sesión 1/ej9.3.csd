<CsoundSynthesizer>
<CsOptions>
-W -o ej9.3.wav
--midi-key-pch=4
--midi-velocity-amp=5
-F smb.mid
</CsOptions>
<CsInstruments>

0dbfs = 1
massign 0, "sinte"

instr sinte
  iFrec = cpspch(p4) ; de altura en p4 a frecuencia
  iAmp  = p5         ; amplitud en p5 (entre 0 y 0dbfs=1)

  adco  vco2     iAmp, iFrec, 10
  kfc   expon    10000, 2, 350
  aSal  lowpass2 adco, kfc, 10
  kEnv  linenr   0.2, 0.01, 0.4, 0.1
  aSal  =        aSal*kEnv
        out      aSal
endin

</CsInstruments>
<CsScore>

t 105
;i "sinte" 0 4 7.04 0.7
e 40

</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid>{7fbb8ca058db819baa08365bed246e5a}</uuid>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
