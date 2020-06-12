<CsoundSynthesizer>
<CsOptions>
-W -o ej9.7.wav
</CsOptions>
<CsInstruments>

;           NTab, ini, L, GEN, Armonicos
giSeno ftgen 100,  0, 16,  10,  1  ; un ciclo de sinusoidal con GEN10
giSierra ftgen 101, 0, 128, 10, 1, 1/2, 1/3, 1/4, 1/5, 1/6, 1/7, 1/8
giForma ftgen 102,0,128, 7, 0.000000, 15, 0.854545, 19, 0.472727, 26, 0.696970, 11, -0.490909, 3, -0.163636, 19, -0.593939, 34, 0.000000


instr wavetable
  iDur   = p3
  iAmp   = ampdbfs(p4)  ; de dBFS a valor de amplitud
  iFrec  = cpspch(p5)   ; de octava.nota a Hercios
  iTable = p6

  aAmp oscil3 iAmp, iFrec, iTable
  aSal linen aAmp, 0.01*iDur, iDur, 0.2*iDur
  
         out    aSal
endin



</CsInstruments>
<CsScore>

t 0 100 ; tempo = 100 BPM constante desde el principio

;      p1       p2   p3   p4   p5    p6
; instrumento  ini  dur  amp  nota numTabla
;------------------------------------------
i "wavetable" 0.0  4.5   -9  7.07  100
i .           +    .     .   7.04  101
i .           +    .     .   7.00  102

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
 <bsbObject type="BSBScope" version="2">
  <objectName/>
  <x>7</x>
  <y>10</y>
  <width>556</width>
  <height>266</height>
  <uuid>{b6109110-9856-49e3-adc0-f114b49cae46}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <value>-255.00000000</value>
  <type>scope</type>
  <zoomx>2.00000000</zoomx>
  <zoomy>1.00000000</zoomy>
  <dispx>1.00000000</dispx>
  <dispy>1.00000000</dispy>
  <mode>0.00000000</mode>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
