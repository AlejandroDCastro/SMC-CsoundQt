<CsoundSynthesizer>
<CsOptions>
-W -o ej7.16.wav
</CsOptions>
<CsInstruments>

nchnls = 2  ; sonido en estereo

instr chorus
	itD1  = p4
	ifm1  = p5
	ig1   = p6
	itD2  = p7
	ifm2  = p8
	ig2   = p9
	SFich = p10
	
	ain soundin SFich
	
	; Parte Superior
	kcur1 rspline -0.005, 0.005, ifm1, (2*ifm1)
	kTd1 = kcur1 + itD1
	kcur2 rspline -0.005, 0.005, ifm2, (2*ifm2)
	kTd2 = kcur2 + itD2
	kG1 randomi (ig1/2), (2*ig1), ifm1
	kG2 randomi (ig2/2), (2*ig2), ifm2
	
	; Linea de Retardo
	a3 delayr 0.1
	a2 deltap kTd2
	a1 deltap kTd1
	   delayw ain
	   
	; Calculamos los canales de salida
	ag0 = 0.5*ain
	ag1 = kG1*a1
	ag2 = kG2*a2
	aL  = ag0 + ag1
	aD  = ag0 + ag2
	
	
	outs aL, aD

endin

</CsInstruments>
<CsScore>

t 0 60   ; tempo = 60 BPM constante desde el principio

;    p1    p2  p3  p4   p5  p6   p7   p8  p9      p10
; instrum ini dur tD1  fm1  g1  tD2  fm2  g2    fichero
;                  s    Hz       s    Hz 
;-------------------------------------------------------------
i "chorus" 0  14 0.039 0.4 0.0 0.027 0.7 0.0 "guitardust.wav"
i "chorus" +  14 0.039 0.4 0.5 0.027 0.7 0.4 "guitardust.wav"

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
