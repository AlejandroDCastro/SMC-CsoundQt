<CsoundSynthesizer>
<CsOptions>
-W -o ej7.14.wav
</CsOptions>
<CsInstruments>

nchnls = 2

instr ladea
  iDur  = p3
  SFich = p4
  
  aL soundin SFich
  
  ktD line 0, iDur, 1
  aRet vdelay aL, ktD, 1
  kfc expon 20000, iDur, 200
  aR tone aRet, kfc

  outs  aL, aR  ; L (izq.) = original, R (dch.) = retrasada-filtrada
endin

</CsInstruments>
<CsScore>

;    p1    p2  p3     p4
;  instr  ini dur  fichero
;----------------------------
i "ladea"  0   7 "pasos.wav"

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
