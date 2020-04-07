<CsoundSynthesizer>
<CsOptions>
-W -o ej4.8.wav
</CsOptions>
<CsInstruments>

sr = 44100
nchnls = 2
0dbfs = 1
ksmps = 32

instr Canal
	iAmp = ampdbfs(p4)
	iCanal = p5
	
	if iCanal == 0 then
		aIzq pinkish iAmp
		aDrc = 0
	elseif iCanal == 1 then
		aIzq = 0
		aDrc pinkish iAmp
	elseif iCanal == 2 then
		aIzq pinkish iAmp
		aDrc pinkish iAmp
	else
		aIzq = 0
		aIzq = 0
		prints "ERROR!\n"
	endif
	
	out aIzq, aDrc
endin

</CsInstruments>
<CsScore>

t 0 50
i "Canal" 0  1  -5  0
i .       2  .   .  1
i .       4  .   .  2
i .       6  .   .  3

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
