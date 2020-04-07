<CsoundSynthesizer>
<CsOptions>
-W -o ej7.3.wav
</CsOptions>
<CsInstruments>

nchnls = 1 ; sonido en mono
sr = 44100 ; frecuencia de muestreo
ksmps = 1  ; en cada ciclo de control se calcula una sola muestra

instr expansor
  SFich   = p4     ; nombre del fichero a procesar
  iUmbdB  = p5     ; umbral en dBFS enviado desde la partitura
  iRatio  = p6     ; tasa de compresion
  iUmbPCM = ampdbfs(p5)     ; calculo del umbral en PCM con ampdbfs()

  prints  "\n"
  print   iUmbdB,iUmbPCM    ; para verificar que esta entre 0 y Amax

  ain soundin SFich                          ; leer fichero muestra a muestra (porque ksmps=1)
  kAmp rms ain                         ; la amplitud es el valor absoluto de la muestra
  
  if (kAmp > iUmbPCM) then                 ; la condicion para calcular la ganancia
    kgan = 1 ; si no debe actuar el compresor
  else
    kgan = ((kAmp/iUmbPCM)^((1/iRatio)-1)) ; si debe actuar el compresor
  endif
   
   aout = ain*kgan   ; y[n] = x[n] * g[n]
   out     aout      ; sacar la sennal de salida
endin

</CsInstruments>
<CsScore>

t 0 60 ; tempo 60 desde el inicio

;      p1      p2  p3       p4         p5     p6
;   instrum   ini dur    fichero     umbral ratio  
;--------------------------------------------------
i "expansor"  0  8.0 "percusion.wav"   -96   [1/1.1] ; sin expansor
i "expansor"  +   .  "percusion.wav"   -24   [1/2.0]
i "expansor"  +   .  "percusion.wav"   -30   [1/21]

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
