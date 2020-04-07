<CsoundSynthesizer>
<CsOptions>
-n
</CsOptions>
<CsInstruments>

sr = 1000
ksmps = 20
nchnls = 2
0dbfs = 1

instr CINCO
	SVamos = "EMPEZAMOS"
	iCinco = 5
	print iCinco
	prints "%sEste no es el ejercicio %d, es el %d\n\n", SVamos, 4, iCinco
endin

kValor init 0
printk 0.2,kValor
kValor = kValor+10

</CsInstruments>
<CsScore>
i "CINCO" 0 1
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
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
