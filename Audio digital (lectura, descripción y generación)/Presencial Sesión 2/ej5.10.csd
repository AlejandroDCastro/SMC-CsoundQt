<CsoundSynthesizer>
<CsOptions>
-W -o ej5.10.wav
</CsOptions>
<CsInstruments>

; inicializaciones de los parametros globales

sr = 44100  ; frecuencia de muestreo
ksmps  = 1  ; muestras calculadas en cada ciclo de control
nchnls = 1  ; sonido monoaural

; INSTRUMENTO PARA CREAR UNA ONDA COMPUESTA

instr aproxgeo
  iAmp   = ampdbfs(p4) ; se recibe en dB y se convierte a PCM
  iFrec  = p5          ; en Hz
  ipi    = 3.141592    ; valor de pi

	kn timek
	
	kfase = ((2*ipi*iFrec*kn) / sr)
	avar = iAmp*((1*sin(kfase)) + ((1/2)*sin(2*kfase)) + ((1/3)*sin(3*kfase)) + ((1/4)*sin(4*kfase)) + ((1/5)*sin(5*kfase)))

  ; --> Puedes usar un print para imprimir en consola las frecuencias pedidas
  print iFrec, iFrec*2, iFrec*3, iFrec*4, iFrec*5
  
  out avar
endin

</CsInstruments>
<CsScore>

t 0 70 ; tempo constante desde el principio = 60 BPM --> 1 tiempo = 1 s

; activa el instrumento "aproxgeo" durante 2 tiempos

;    ins    ini  dur   amp   frec
;                    (dBFS)  (Hz)
;---------------------------------
i  "aproxgeo" 0 4.25  -5.0  310

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
 <bsbObject type="BSBScope" version="2">
  <objectName/>
  <x>5</x>
  <y>5</y>
  <width>400</width>
  <height>200</height>
  <uuid>{691704d0-f73a-41f8-8ba6-60aed033e0aa}</uuid>
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
