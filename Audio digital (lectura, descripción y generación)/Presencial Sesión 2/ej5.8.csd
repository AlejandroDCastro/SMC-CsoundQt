<CsoundSynthesizer>
<CsOptions>
-W -o ej5.8.wav
</CsOptions>
<CsInstruments>

; inicializaciones de los parametros globales

sr = 44100  ; frecuencia de muestreo
ksmps  = 1  ; muestras calculadas en cada ciclo de control
nchnls = 1  ; sonido monoaural

; INSTRUMENTO PARA CREAR TONOS DTMF

instr dtfm
  iA1  = ampdbfs(p4)  ; se recibe en dBFS y se convierte a PCM
  iA2  = ampdbfs(p4+2)
  prints "Amplitud del tono alto: %d\n", round(iA2)
  iF1  =  p5            ; se recibe ya en Hz
  iF2  =  p6            ;
  ipi  = 3.141592     ; valor de pi

	kres timek

	avar1 =  iA1*sin((2*ipi*iF1*kres) / sr)
	avar2 =  iA2*sin((2*ipi*iF2*kres) / sr)
	
	aResultado = avar1 + avar2

	out aResultado
endin

</CsInstruments>
<CsScore>

t 0 200 ; tempo constante desde el principio = 200 BPM --> 1 tiempo = 0,3 s

;   ins  ini  dur  amp   fbaja falta
;                 (dBFS)  (Hz)  (Hz)
;    p1   p2   p3   p4     p5    p6
;-------------------------------------
i "dtfm"  0   0.5  -10     852  1477
i    .    1    .    .      697  1209
i    .    2    .    .						770  1336
i    .    3    .    .     852   1209
i    .    4    .    .     941   1336
i    .    5    .    .      697  1209
i    .    6    .    .      697  1477
i    .    7    .    .						770  1336
i    .    8    .    .						770  1209
; 915701354
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
