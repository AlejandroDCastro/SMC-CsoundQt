<CsoundSynthesizer>
<CsOptions>
-W -o ej6.6.wav
</CsOptions>
<CsInstruments>

; Se inicializan los parametros de cabecera
sr = 44100
0dbfs = 1

instr PeineFIR
  SFich  = p4
  ia0    = 1/2     ;  coef para x[n]
  iaD    = p5        ;  coef para x[n-D]
  itD    = p6/1000        ;  delay time (pasar el valor que llega a segundos)

	if (iaD == +1) then
		iaD = +1/2
	else
		iaD = -1/2
	endif

	ain soundin SFich
	asal delay ain, itD
	aout = ia0*ain + iaD*asal
	
	printks2 "frecuencia: %d\n", sr/itD
	printks2 "f2: %d\n", 1/itD
	printks2 "Muestras retardo: %d\n", sr*itD
	
	out aout
	

endin

</CsInstruments>
<CsScore>

t 0 60

;     p1      p2  p3     p4       p5     p6
;   instr    ini dur  fichero   signo  tD(ms)
;---------------------------------------------
i "PeineFIR"  0   1  "f_var.wav"  +1   0.3
i "PeineFIR" 1.5  1  "f_var.wav"  -1   0.3
i "PeineFIR" 3    4  "perc.wav"   -1   1.5
 
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
