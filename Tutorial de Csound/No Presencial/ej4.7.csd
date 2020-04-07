<CsoundSynthesizer>
<CsOptions>
-W -o ej4.7.wav
</CsOptions>
<CsInstruments>

sr = 44100
nchnls = 1
0dbfs = 32768

instr SIETE
	iAmp = ampdbfs(p4)
	iFrec = cpspch(p5)
	aSal	oscils iAmp, iFrec, 0
			out	   aSal
endin

</CsInstruments>
<CsScore>

t 0 150
i "SIETE" 0 [1/2] -22  9.00
i .       + .     <    8.11
i .       + .     <    8.09
i .       + .     <    8.07
i .       + .     <    8.05
i .       + .     <    8.04
i .       + .     <    8.07
i .       + .     -1   9.00
i .						+ .				-10		 8.00
i .						5 1.0   .			 9.00
i .						. .     .			 8.07
i .						. .     .			 8.04

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
