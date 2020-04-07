<CsoundSynthesizer>
<CsOptions>
-W -o ej6.7.wav
</CsOptions>
<CsInstruments>

; Se inicializan los parametros de cabecera
sr = 44100
ksmps = 1
0dbfs = 1

instr PeineIIR
  SFich  = p4
  iaD    = p7      ;  coef para y[n-D]
  ia0    = 1-iaD   ;  coef para x[n]
  iSigno = p5      ;  mas (+1) o menos (-1)
  itD    = p6/1000 ;  delay time (pasar el valor que llega a segundos)

  ; Falta cambiar el signo del coeficiente de realimentacion si signo es menos
  if (iSigno == -1) then
  	iaD = -iaD
  endif

  aout   init     0

  ; aqui se implementa el filtro
  ain soundin SFich
  asal delay ain, itD
  aout = ia0*ain + iaD*asal
  
  out aout
  
endin

</CsInstruments>
<CsScore>

t 0 60  ; (tempo = 60 BPM)

;     p1      p2  p3     p4       p5     p6   p7
;   instr    ini dur  fichero   signo  tD(ms)  a
;-------------------------------------------------
i  "PeineIIR" 0   1  "f_var.wav" +1    0.3   0.85
i  "PeineIIR" 1.5 5  "drums.wav" -1    2     0.65
i  "PeineIIR" 7   1  "delta.wav" +1    25    0.8


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
