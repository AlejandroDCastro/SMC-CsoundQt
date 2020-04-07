<CsoundSynthesizer>
<CsOptions>
-m1 -W -o ej7.9.wav
</CsOptions>
<CsInstruments>

nchnls = 1  ; sonido en mono
sr = 44100

; ECO MULTIPLE CON FILTRO PEINE IIR

instr FLANGER
  SFich = p4      ; nombre del fichero de entrada
  igR   = p5      ; ganancia de la entrada
  itD   = p6     ; tiempo de retardo (ms)
  iaD   = p7
  iFrec = p8
  aout  init  0   ; inicializacion de la onda de salida (por la realimentacion)
  
  print (itD/1000)*sr
  
  ain soundin SFich
 ; kres lfo iaD, iFrec, 0
  asal vdelay aout, itD, (itD+iaD)
  aout = ain + igR*asal
	
	out  aout

endin

</CsInstruments>
<CsScore>

t 0 60   ; tempo = 60 BPM constante desde el principio

;     p1     p2   p3         p4        p5  p6    p7     p8 
;  instrum  ini  dur      fichero      gR  tD  max_desv fm 
;                                          ms    ms     Hz 
;-----------------------------------------------------------
i "FLANGER" 0  10.5  "guitarra.wav" 0.67 2.2  1.7      0.32

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
