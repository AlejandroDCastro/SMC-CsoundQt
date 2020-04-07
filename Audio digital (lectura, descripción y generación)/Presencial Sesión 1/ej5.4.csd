<CsoundSynthesizer>
<CsOptions>
-n ; no se genera ningun sonido
</CsOptions>
<CsInstruments>

sr = 44100 ; frecuencia de muestreo
kr = 10    ; para que el bucle de control se haga 10 veces/s (cálculo de RMS cada 4410 muestras)

instr A_RMS
  SFich  = p4
  
  aSound soundin SFich
  kres rms aSound, 5
  kdBFS = dbfsamp(kres);
  kTiempo times

  ; usa kTiempo para el tiempo y kdBFS para la amplitud medida

  fprintks "rms.txt","%2d,%1d\t%3d,%1d\\n",int(kTiempo),frac(kTiempo)*10,\
                                          -floor(-kdBFS),int(10*frac(-kdBFS))
  out      aSound   ; solo para monitorizar
endin


</CsInstruments>
<CsScore>

; Activa el instrumento A_RMS enviando el nombre del fichero a analizar.
; La duracion de la activacion debe ser igual a la indicada en la pregunta.

; En p3 va la duracion en segundos del fichero a analizar
; En p4 va el nombre del fichero a analizar

;  inst  inic  durac  fichero    
;   p1    p2     p3     p4  
;--------------------------------
i "A_RMS"  0    1.8  "oboe_e6.wav"

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
