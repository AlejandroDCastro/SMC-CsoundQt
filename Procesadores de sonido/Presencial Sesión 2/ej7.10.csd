<CsoundSynthesizer>
<CsOptions>
-m1 -W -o ej7.10.wav
</CsOptions>
<CsInstruments>

nchnls = 1  ; sonido en mono

instr WahWah 
 SFich  = p4
 iFmin  = p5
 iFmax  = p6
 iABand = p7
 ia     = p8
 iF1    = 0.5
 iF2    = 5
 
 ain soundin SFich
 ksol rspline iFmin, iFmax, iF1, iF2
 asol butbp ain, ksol, iABand
 aout = ia*asol + ain*(1-ia)
 
 iQmin = iFmin/iABand
 iQmax = iFmax/iABand

 prints "Qmin = %3.1f, Qmax = %3.1f\n", iQmin, iQmax
 
 out aout

endin

</CsInstruments>
<CsScore>

t 0 60   ; tempo = 60 BPM constante desde el principio

;    p1    p2  p3       p4        p5    p6     p7   p8 
; instrum ini dur    fichero    fcmin fcmax An.Band. a 
;-------------------------------------------------------
i "WahWah" 0  8.0 "guitar1.wav" 100   1500    100  0.70

e

</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>0</x>
 <y>0</y>
 <width>0</width>
 <height>0</height>
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
