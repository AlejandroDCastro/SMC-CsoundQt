<CsoundSynthesizer>
<CsOptions>
-m 1 -W -o ej7.6.wav
</CsOptions>
<CsInstruments>

nchnls = 1  ; sonido en mono

; ECO SIMPLE MEDIANTE FILTRO PEINE FIR

instr eco1
  SFich  = p4  ; nombre del fichero de entrada
  igE    = p5  ; ganancia de la entrada
  igR    = p6  ; ganancia de la retrasada
  itD    = p7  ; tiempo de retardo
  
  ain soundin SFich
  asal delay ain, itD
  aout = igE*ain + igR*asal


         out    aout
endin

</CsInstruments>
<CsScore>

t 0 60   ; tempo = 60 BPM constante desde el principio
         ; para que los inicios y duraciones esten en segundos

;   p1     p2     p3          p4       p5   p6   p7
; instrum ini    dur       fichero     gE   gR   tD
;----------------------------------------------------
i "eco1"   0  [9.0+0.001] "pasos.wav"  1.0  0.0  0.001
i "eco1"   +  [9.0+0.151] "pasos.wav"  1.0  0.4  0.151
i "eco1"   +  [9.0+0.364] "pasos.wav"  0.5  1.5  0.364

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
