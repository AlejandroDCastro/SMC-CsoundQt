<CsoundSynthesizer>
<CsOptions>
-W -o ej5.12.wav
</CsOptions>
<CsInstruments>

; inicializaciones de los parametros globales

sr = 44100  ; frecuencia de muestreo
ksmps  = 1  ; muestras calculadas en cada ciclo de control
nchnls = 2  ; sonido monoaural

instr panorama
	iAmp = p4
	iFrec = p5
	iPi = 3.141592
	kn timek
	
	aPink pinkish iAmp ; Sonido Rosa
	
	ksenal = sin((2*iPi*iFrec*kn)/sr)
	ksenalgl = ksenal*ksenal
	ksenalgr = 1-ksenalgl


  ;---- para la pregunta -----------
  if kn=sr/2 then
    printks "%5.3f %5.3f\n",0, ksenalgl, ksenalgr ;<-- PON AQUI TUS VARIABLES k- PARA LAS GANANCIAS
  endif
  
  outs ksenalgl*aPink, ksenalgr*aPink
  
endin
</CsInstruments>
<CsScore>

t 0 60 ; tempo constante desde el principio = 60 BPM --> 1 tiempo = 1 s

;     ins    ini  dur  amp   Fpan
;                     (PCM)  (Hz)
;---------------------------------
i "panorama" 0    5   20000  0.26

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
