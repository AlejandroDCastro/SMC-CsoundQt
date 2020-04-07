<CsoundSynthesizer>
<CsOptions>
-W -o ej7.4.wav
</CsOptions>
<CsInstruments>

ksmps = 1

; MEDIDOR DE FRECUENCIA MAXIMA
opcode frec_max, 0,a
  as xin
  kFmax init 0
  kTime  timeinsts
  if kTime > 1.5 && kTime < p3-1.5 then
    kFrec,kAmp  pitchamdf  as,100,500
    kFmax   peak  kFrec
    printk2 round(kFmax)
  endif
endop

instr vibrato
	SFich    = p4
	iDes     = p5
	iFrec    = p6

	ain soundin SFich
	
	kn timeinsts
	
	if (kn < 1.0) then
		kmod = 0
	else
		kmod lfo iDes, iFrec
	endif
	
	kRet = kmod + iDes
	aout vdelay ain, kRet, 2*iDes

  frec_max aout  ; TU_SONIDO_DE_SALIDA
  out aout
endin

</CsInstruments>
<CsScore>

t 0 60  ; tempo = 60 BPM desde el principio

;  instrum  ini dur    fichero    A_des fmod
;             (s)                  (ms) (Hz)
;-------------------------------------------
i "vibrato"  0  5.0   "violin.wav"  0.1  0
i "vibrato"  +   .    "violin.wav"  0.9  5

e

</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>1</x>
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
