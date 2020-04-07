<CsoundSynthesizer>
<CsOptions>
-W -o ej7.1.wav
</CsOptions>
<CsInstruments>

nchnls = 1  ; sonido en mono
sr = 44100  ; frecuencia de muestreo
ksmps = 10  ; en cada ciclo de control se calculan 10 muestras

instr tremolo
	SFich   = p4
	kgM     = p5
	iAmp    = p6
	iFrec   = p7
	iPi     = 3.14159265
	
	ain soundin SFich
	kgan lfo iAmp, iFrec
	kgVar = kgM + kgan
	
	aout = kgVar*ain

	out aout
endin


</CsInstruments>
<CsScore>

t 0 60 ; tempo 60 desde el inicio
 
;    p1     p2  p3      p4       p5   p6   p7
; instrum  ini dur   fichero    gmed Amod fmod  
;----------------------------------------------
i "tremolo" 0   8  "acordes.wav" 0.8  0    0
i "tremolo" +   .  "acordes.wav" 0.8  0.4  7.0

e

</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>1</x>
 <y>1</y>
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
