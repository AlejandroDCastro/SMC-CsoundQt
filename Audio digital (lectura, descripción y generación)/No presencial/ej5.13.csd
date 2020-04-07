<CsoundSynthesizer>
<CsOptions>
-W -o ej5.13.wav
</CsOptions>
<CsInstruments>

; inicializaciones de los parametros globales

sr = 44100  ; frecuencia de muestreo
ksmps  = 1  ; 1 muestra calculada en cada ciclo de control
nchnls = 1  ; sonido monoaural

; INSTRUMENTO PARA CREAR UNA ONDA COMPUESTA

instr cuadrada
	iDur = p3
	iAmp = ampdbfs(p4)
	iFrec = p5
	iPi = 3.141592
	kn timek
	
	kFase = (2*iPi*iFrec*kn)/sr
	
	if (kFase % (2*iPi))<iPi then
		iAmpFase = +iAmp
	else
		iAmpFase = -iAmp
	endif

	aSound = iAmpFase*sin(kFase)
	aSolucion linen aSound, 0.30, iDur, 0.20
	
	prints "Amplitud Maxima PCM: %d\n", iAmp
	
	out aSolucion
	
endin

</CsInstruments>
<CsScore>

; recuerda poner la orden de control del tempo 
t 0 100

;    ins    ini  dur  amp   frec  
;                    (dBFS) (Hz) 
;     p1     p2   p3   p4    p5   
;---------------------------------
i "cuadrada" 0   4     -7   260

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
 <bsbObject version="2" type="BSBScope">
  <objectName/>
  <x>5</x>
  <y>5</y>
  <width>400</width>
  <height>200</height>
  <uuid>{6b9bac97-db0d-4ef6-a24e-816e3896cd34}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <value>-255.00000000</value>
  <type>scope</type>
  <zoomx>2.00000000</zoomx>
  <zoomy>1.00000000</zoomy>
  <dispx>1.00000000</dispx>
  <dispy>1.00000000</dispy>
  <mode>0.00000000</mode>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
