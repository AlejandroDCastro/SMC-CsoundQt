<CsoundSynthesizer>
<CsOptions>
-W -o ej5.6.wav  ; salida a este fichero WAV
</CsOptions>
<CsInstruments>

; inicializaciones de los parametros globales

sr = 44100  ; frecuencia de muestreo
ksmps  = 1  ; muestras calculadas en cada ciclo de control
nchnls = 1  ; sonido monoaural

; INSTRUMENTO PARA CREAR UNA ONDA SENO DE F Y A CONSTANTES

instr seno
  iAmp   = ampdbfs(p4) ; se recibe en dBFS y se convierte a PCM
  iFrec  = cpspch(p5)  ; se recibe altura y se convierte en Hz
  ipi    = 3.141592    ; valor de pi

	kres timek
	
	avar = iAmp*sin((2*ipi*iFrec*kres) / sr)
	
	out avar

endin

</CsInstruments>
<CsScore>

; tempo constante desde el principio segun se indique

; activa el instrumento seno durante los tiempos indicados
t 0 90
;  ins   ini  dur amp(dBFS) altura
;   p1    p2   p3     p4      p5
;---------------------------------
i "seno" 0 1.75 -3.6 7

e

</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>16</x>
 <y>17</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid>{2f013944817708af1fb58dd52c49e141}</uuid>
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
  <uuid>{7fbb8ca058db819baa08365bed246e5a}</uuid>
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
