<CsoundSynthesizer>
<CsOptions>
-W -o ej5.14.wav
</CsOptions>
<CsInstruments>

; inicializaciones de los parametros globales

sr = 44100  ; frecuencia de muestreo
ksmps  = 1  ; 1 muestra calculada en cada ciclo de control
nchnls = 1  ; sonido monoaural

seed 1  ; semilla para el generador de numeros aleatorios

instr ruidos
  iBlanco = 1
  iRosa   = 2
  iMarron = 3
  iAmp    = p4
  iRuido  = p5
  kValor  init 0
  
  if (iRuido == iBlanco) then
  	aSenal random -iAmp, +iAmp
  elseif (iRuido == iRosa) then
	aSen random -iAmp, +iAmp
	aSenal tone aSen, 1000
  else
  	kValor random -1, +1
  	if (kValor>0) then
  		kcambio = iAmp/100
  	else
  		kcambio = -iAmp/100
  	endif
  	if (abs(kValor+kcambio)>iAmp) then
  		kcambio = -kcambio
  	endif
  	kValor = kValor + kcambio
  	aSenal = kValor
  endif
	
  out aSenal


endin

</CsInstruments>
<CsScore>

t 0 60 ; tempo constante desde el principio = 60 BPM --> 1 tiempo = 1 s

;    ins   ini  dur  amp  tipo
;                   (PCM)  
;------------------------------
i "ruidos"  0    2  11250  1
i "ruidos"  +    .  21250  2
i "ruidos"  +    .  30000  3

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
