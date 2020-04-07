<CsoundSynthesizer>
<CsOptions>
-m1 -W -o ej7.8.wav
</CsOptions>
<CsInstruments>

nchnls = 2  ; sonido en estereo (generamos 2 canales!)

; REVERBERACION POR CONVOLUCION USANDO pconvolve 

instr rever
  SFich  = p4
  SRImp  = p5
  iLVent = 1024
  
  ain soundin SFich
  
  aout1, aout2 pconvolve ain, SRImp, iLVent
  asal1 = aout1 + ain
  asal2 = aout2 + ain 

  outs      asal1, asal2
endin


</CsInstruments>
<CsScore>

t 0 60   ; tempo = 60 BPM constante desde el principio

;    p1    p2    p3          p4             p5
; instrum ini   dur      Fich.sonido   Fich.R.Impulso
;-----------------------------------------------------
i "rever"  0  [8.5+0.659] "cracks.wav" "ht_sala.wav"
i "rever"  +  [8.5+1.9]   "cracks.wav" "ht_teatro.wav"

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
