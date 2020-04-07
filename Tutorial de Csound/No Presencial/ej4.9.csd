<CsoundSynthesizer>
<CsOptions>
-W -o ej4.9.wav
</CsOptions>
<CsInstruments>

sr = 22050
nchnls = 1
0dbfs = 1
ksmps = 1050

instr inicio
	prints "Inicializando la frecuencia.\n"
	giFrec = cpspch(8.09)
	print giFrec
endin

instr caida
	iAmp = 0.6
	kFrec line giFrec, p3, 20
	printk 0.5, kFrec
	aSal vco2 iAmp, kFrec
	out aSal
endin
	
</CsInstruments>
<CsScore>

i "inicio" 0 1.0
i "caida"	 + 3.0

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
