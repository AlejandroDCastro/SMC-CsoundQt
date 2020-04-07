<CsoundSynthesizer>
<CsOptions>
-m1 -W -o ej7.7.wav
</CsOptions>
<CsInstruments>

nchnls = 1  ; sonido en mono
sr = 44100

; ECO MULTIPLE CON FILTRO PEINE IIR

instr ecomul
  SFich = p4      ; nombre del fichero de entrada
  igR   = p5      ; ganancia de la entrada
  itD   = p6/1000 ; tiempo de retardo (ms --> s)
  aout  init  0   ; inicializacion de la onda de salida (por la realimentacion)
  
  ain soundin SFich
  asal delay aout, itD
  aout = ain + igR*asal
	
	out  aout

endin

</CsInstruments>
<CsScore>

t 0 60   ; tempo = 60 BPM constante desde el principio

;    p1     p2      p3         p4         p5    p6
; instrum  ini     dur      fichero       gR  tD(ms) 
;------------------------------------------------------
i "ecomul"  0 [5.0+11.31]  "trueno.wav"  0.41  1460
i "ecomul"  + [10.5+6.25] "campanas.wav"  0.65  390

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
