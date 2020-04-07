<CsoundSynthesizer>
<CsOptions>
-W -o ej5.11.wav
</CsOptions>
<CsInstruments>

; inicializaciones de los parametros globales

sr = 8000    ; frecuencia de muestreo

instr aliasing

 iAmp = p4
 iF1 = cpspch(p5)
 iF2 = sr - iF1
 kn timek
 
 if (kn < p2+p3/2) then
 	asound oscils iAmp, iF1, 0
 	prints "Primera Frecuencia: %d\n", iF1
 else
 	asound oscils iAmp/2, iF2, 0
 	prints "Segunda Frecuencia: %d\n", iF2
 endif
 
 out asound

endin

</CsInstruments>
<CsScore>

t 0 60

;PARA PROBAR EL ALIASING
;    ins    ini dur  amp   nota
;                   (PCM)(oct.st)
;--------------------------------
i "aliasing" 0 1 15000 7.10
i "aliasing" + .   .   9.07
i "aliasing" + .   .   11.03

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
