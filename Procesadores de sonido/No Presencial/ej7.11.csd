<CsoundSynthesizer>
<CsOptions>
-W -o ej7.11.wav
</CsOptions>
<CsInstruments>

nchnls = 1  ; sonido en mono
sr = 44100  ; frecuencia de muestreo
ksmps  = 1  ; en cada ciclo de control se calcula 1 muestra

instr ducking
  iUmbdB  = p4   ; umbral en dBFS enviado desde la partitura
  iRatio  = p5   ; tasa de compresion
  SFich   = p6   ; nombre del fichero con el sonido a comprimir
  iUmbPCM = ampdbfs(iUmbdB) ; calculo del umbral en PCM

  prints  "\n"
  print   iUmbdB,iUmbPCM    ; para verificar que esta entre 0 y Amax

  ain soundin SFich
  avoz soundin "dj.wav"
  kEnv rms avoz

  if (kEnv > iUmbPCM) then
    kgan = ((kEnv/iUmbPCM)^((1/iRatio)-1)) ; calcula la ganancia para que comprima
  else
    kgan = 1 ; la ganancia valadra 1
  endif
  	
  aout = ain*kgan + avoz
  
  out     aout      ; sacar la sennal de salida

endin

</CsInstruments>
<CsScore>

t 0 60 ; tempo 60 desde el inicio

;    p1      p2  p3    p4     p5        p6
;  instr    ini dur  umbral ratio    fichero
;----------------------------------------------
i "ducking"  0 15.0   -30   [15/1]  "base.wav"

e

</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>17</x>
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
