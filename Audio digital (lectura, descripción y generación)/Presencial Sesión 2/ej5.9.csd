; PARA ELIMINAR LOS CLICKS DE LA ESCALA
<CsoundSynthesizer>
<CsOptions>
-W -o ej5.9.wav
</CsOptions>
<CsInstruments>

; inicializaciones de los parametros globales

sr = 44100  ; frecuencia de muestreo
ksmps  = 1  ; muestras calculadas en cada ciclo de control
nchnls = 1  ; sonido monoaural

; INSTRUMENTO PARA CREAR UNA ONDA SENO DE F Y A CONSTANTES CON ENVOLVENTE

instr notaseno
  iAmp  = ampdbfs(p4) ; se recibe en dB y se convierte a PCM
  iFrec = p5          ; se recibe en Hz
  ipi   = 3.141592    ; valor de pi
  
  ; Se deben definir aqui los datos particulares de la envolvente (tipo i)

  aOut  oscils iAmp, iFrec, 0
          
   kres linen 0.8, 0.05, p3, 0.12
   
  aSol = aOut*kres


        out    aSol
endin

</CsInstruments>
<CsScore>

t 0 150 ; tempo constante desde el principio = 150 BPM --> 1 tiempo = 0,4 s

;PARA SINTETIZAR UNA ESCALA

#define ref #261.6#

;   instr    ini  dur   amp   frec
;                     (dBFS)  (Hz)
;     p1      p2   p3   p4     p5
;-----------------------------------------
i "notaseno"  0   1.0   -1    $ref
i     .       +    .     . [$ref*9/8] 
i     .       +    .     . [$ref*5/4] 
i     .       +    .     . [$ref*4/3] 
i     .       +    .     . [$ref*3/2] 
i     .       +    .     . [$ref*5/3] 
i     .       +    .     . [$ref*15/8] 
i     .       +    .     . [$ref*2] 

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
