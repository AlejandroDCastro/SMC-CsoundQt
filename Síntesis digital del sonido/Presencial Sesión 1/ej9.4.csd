<CsoundSynthesizer>
<CsOptions>
-o ej9.4.wav
</CsOptions>
<CsInstruments>

seed 4  ; para la curva aleatoria

opcode espectro, 0,a ; operador definido para el espectro
  aSig  xin
        outvalue "outFT", 1
        dispfft  aSig, 0.1, 2048, 1, 0
endop

instr viento
	iAmp = 0dbfs
	aRosa pinkish iAmp
	kFrec rspline 30, 3000, 0.5, 3
	outvalue "FCENTRAL", kFrec
	kAnc = kFrec/10
	
	aPaBa butbp aRosa, kFrec, kAnc
	aMarron noise iAmp/2, 0.995
	aPaBa2 butlp aMarron, 200
	
	aSal = aPaBa + aPaBa2

      espectro aSal
      out aSal
endin

</CsInstruments>
<CsScore>

i "viento" 0 11 

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
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>6</x>
  <y>8</y>
  <width>20</width>
  <height>194</height>
  <uuid>{d84a9d76-5573-4b70-b132-6d8fe5f79ce4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <objectName2>FCENTRAL</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>30.00000000</yMin>
  <yMax>3000.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>1.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>234</g>
   <b>0</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBGraph">
  <objectName>outFT</objectName>
  <x>28</x>
  <y>8</y>
  <width>462</width>
  <height>192</height>
  <uuid>{a422e564-1ec5-45a4-866c-406d9d3fbfdf}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <value>1</value>
  <objectName2>giSoundFile</objectName2>
  <zoomx>1.00000000</zoomx>
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
