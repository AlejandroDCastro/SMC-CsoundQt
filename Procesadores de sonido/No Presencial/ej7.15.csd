<CsoundSynthesizer>
<CsOptions>
-W -o ej7.15.wav
</CsOptions>
<CsInstruments>

nchnls = 2  ; sonido en estéreo

instr faser
	SFich = p4
	iFrec = p5
	iNfil = p6
	iGana = p7
	
	ac1, ac2 mp3in SFich
	kosc1 lfo 500, 0.9
	kosc2 lfo 750, 0.7
	kfc1 = iFrec + kosc1
	kfc2 = iFrec + kosc2
	
	aL phaser1 ac1, kfc1, iNfil, iGana
	aD phaser1 ac2, kfc2, iNfil, iGana
	
	outs aL, aD

endin

</CsInstruments>
<CsScore>

t 0 60   ; tempo = 60 BPM constante desde el principio

;    p1    p2  p3       p4       p5   p6  p7 
;  instr  ini dur    fichero    Frec Num Gan
;---------------------------------------------
i "faser"  0  10 "guitrim.mp3"  1000  1   0.3
i    .     +  .        .        1000  5   0.5
i    .     +  .        .        1000  10  0.7

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
