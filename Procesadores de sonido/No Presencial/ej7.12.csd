<CsoundSynthesizer>
<CsOptions>
-W -o ej7.12.wav
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 10
nchnls = 1

opcode transpon, a, ai
  ain, iratio xin
  fftin   pvsanal  ain, 1024, 256, 1024, 1
  fftscal pvscale  fftin, iratio
  aTransp pvsynth  fftscal
          xout     aTransp
endop


instr ecotrans
  itD    = p4  ; tiempo de retardo (s)
  igR    = p5  ; ganancia de la realimentacion
  iTrans = p6  ; relacion de transposicion
  aout   init  0

  ain soundin "campanas.wav"
  atrans transpon aout, iTrans
  asal delay atrans, itD
  aout = ain + igR*asal

         out   aout
endin

</CsInstruments>
<CsScore>

;     p1      p2  p3   p4  p5    p6
;  instrum   ini dur   tD  gR  Transp
;-------------------------------------
i "ecotrans"  0  12   0.2 0.85  [9/8]

e

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
