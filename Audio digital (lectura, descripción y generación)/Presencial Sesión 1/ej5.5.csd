; PARA APLICARLE UNA ENVOLVENTE A UN FICHERO
<CsoundSynthesizer>
<CsOptions>
-W -o ej5.5.wav
</CsOptions>
<CsInstruments>

sr = 44100 ; Frecencia de muestreo 
ksmps = 10 ; Se calculan 10 muestras por ciclo
nchnls = 1 ; Sonido en mono
0dbfs  = 1 ; Amplitud normalizada para la onda


; Crea el instrumento según las instrucciones

instr env_ampli
  iDur  = p3  ; Duracion de la activacion
  itA   = p4  ; tiempo de ataque
  itD   = p5  ; tiempo de decaimiento (solo en ADSR)
  iAs   = p6  ; Amplitud de sostenimiento
  itR   = p7  ; tiempo de relajacion
  
  aSound soundin "onda_seno.wav"
  	
  	kres linen iAs, itA, iDur, itR
  	
  	arff = aSound*kres
  
  out arff
endin


</CsInstruments>
<CsScore>

;                         parametros de envolvente
;    inst    inic  durac   tAta  tDec  Asos  tRel
;     p1      p2    p3      p4    p5    p6    p7
;--------------------------------------------------
i    "env_ampli"  1.5     0.5    1.4   0.90  0.1

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
 <uuid>{7fbb8ca058db819baa08365bed246e5a}</uuid>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
