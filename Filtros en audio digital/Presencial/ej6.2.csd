<CsoundSynthesizer>
<CsOptions>
-W -o ej6.2.wav
</CsOptions>
<CsInstruments>

; Parametros de cabecera:

sr = 44100 ; frecuencia de muestreo
0dbfs =  1 ; maxima amplitud del rango

; Filtro Pasa-Baja FIR de orden 3

instr pasabajaFIR
  SFich  = p4      ;  String con el nombre del fichero con la onda a filtrar
  ia0    = 0.25     ;  coef. para x[n]. Todos los coeficientes deben ser iguales
  ia1    = 0.25     ;  coef. para x[n-1]
  ia2    = 0.25     ;  coef. para x[n-2]
  ia3    = 0.25     ;  coef. para x[n-3]

  ain    soundin  SFich   ; FICHERO ENVIADO DESDE LA PARTITURA

; AQUI LOS DELAYS (se pone el primero para que veas como funciona)
  ain1   delay1   ain
  ain2	  delay1   ain1
  ain3   delay1   ain2
  
; Luego APLICA LA ECUACION PARA CREAR LA SALIDA FILTRADA
aout = ia0*ain + ia1*ain1 + ia2*ain2 + ia3*ain3

         out      aout
endin


</CsInstruments>
<CsScore>

t 0 60   ; tempo 60 BPM (1 tiempo = 1 segundo) 

;      p1        p2  p3     p4
;  instrumento  ini dur   fichero
;-----------------------------------
i "pasabajaFIR"  0   1  "f_6600.wav"

e

</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>16</x>
 <y>17</y>
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
