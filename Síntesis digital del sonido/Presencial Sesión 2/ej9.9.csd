<CsoundSynthesizer>
<CsOptions>
-W -o ej9.9.wav
</CsOptions>
<CsInstruments>

ksmps = 1

giNota init -1
gSMsgNota[] init 4
gSMsgNota fillarray "Nota 1: solo se percibe un vibrato.",
                    "Nota 2: se percibe un vibrato creciente. Al final distorsiona el espectro.",
                    "Nota 3: FM armonica con Imod decreciente. Se van perdiendo armonicos.",
                    "Nota 4: FM inarmonica con Imod creciente. Los parciales van aumentando."
                    
instr FMsimple
  iDur    = p3
  iAmp    = p4
  iFc     = p5
  iFm     = p6
  iAm1    = p7
  iAm2    = p8
  
  kEnv expon iAm1, iDur, iAm2
  aMod poscil3 kEnv, iFm
  aMod = aMod + iFc
  aPor poscil3 iAmp, aMod
  kEnvolvente adsr 0.05, 0.2, 0.8, 0.1
  aSal = kEnvolvente * aPor

  outvalue "outFT", 1       ; salida del espectro
  dispfft  aSal, 0.1, 1024
  giNota = giNota+1
  outvalue "NNOTA", gSMsgNota[giNota]
endin

</CsInstruments>
<CsScore>

t 0 30 ; tempo = 30 BPM constante desde el principio

;      p1     p2  p3  p4   p5   p6    p7   p8
; instrument ini dur Amp   fc   fm   Am1  Am2
;-----------------------------------------------
i "FMsimple" 0.0  4 25000 400   20   15   15
i     .      4.5  .   .   400   25   10  6000
i     .      9.0  .   .   400  200  6000 200
i     .     13.5  .   .   400 [3.1416*400] 0.5 [3.1416*400*20]
                          
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
 <bsbObject type="BSBDisplay" version="2">
  <objectName>NNOTA</objectName>
  <x>8</x>
  <y>215</y>
  <width>502</width>
  <height>30</height>
  <uuid>{3b8090bf-bc09-44f5-a8d5-4051309b2c21}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Nota 2: se percibe un vibrato creciente. Al final distorsiona el espectro.</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>14</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBGraph" version="2">
  <objectName>outFT</objectName>
  <x>9</x>
  <y>11</y>
  <width>500</width>
  <height>200</height>
  <uuid>{635809e0-17c9-4e27-8f19-e21b6bcf5001}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <value>0</value>
  <objectName2/>
  <zoomx>1.50000000</zoomx>
  <zoomy>1.00000000</zoomy>
  <dispx>1.00000000</dispx>
  <dispy>1.00000000</dispy>
  <modex>lin</modex>
  <modey>lin</modey>
  <all>true</all>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
