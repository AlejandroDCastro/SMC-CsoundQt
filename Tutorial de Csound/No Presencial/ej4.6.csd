<CsoundSynthesizer>
<CsOptions>
-W -o ej4.6.wav
</CsOptions>
<CsInstruments>

sr = 44100
nchnls = 1
0dbfs = 32768
ksmps = 32

instr SEIS
	iAmp = p4
	iFrec = p5
	aSal	oscils iAmp, iFrec, 0
			out	   aSal
endin

</CsInstruments>
<CsScore>

t 0 120
i "SEIS" 0	1.0	 20000  500
i "SEIS" 1  3.0	 10000  250
i "SEIS" 4	0.75 30000  440
i "SEIS" 5	1.0	 10000 	880

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
