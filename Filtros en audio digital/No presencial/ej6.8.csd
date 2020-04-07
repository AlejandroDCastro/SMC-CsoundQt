<CsoundSynthesizer>
<CsOptions>
-W -o ej6.8.wav
</CsOptions>
<CsInstruments>

ksmps  = 1

instr fptoda
	SFich = p4
	ig    = p5
	itD   = p6/1000
	iaD   = p7
	
	ain soundin SFich
	ain = 0.9*ain
	aaux delay ain, itD
	aout = (-ig)*ain + aaux + ig*iaD
	
	out aout
endin

instr fptoda2
	SFich = P4
	ig    = p5
	itD   = p6/1000
	
	ain soundin SFich
	ain = 0.9*ain
	aout  alpass  ain, 0.01, itD
	
	out aout
endin

</CsInstruments>
<CsScore>

t 0 60    ; tempo = 60 BPM --> 1 tiempo = 1 segundo

;    p1      p2  p3      p4         p5     p6
;  instr    ini dur   fichero      gain  tD(ms)
;-----------------------------------------------
i "fptoda"  0   1   "f_var.wav"   0.04   10
i "fptoda"  +   6 "game_end.wav"  0.04   10
s
i "fptoda2"  0   1   "f_var.wav"   0.04   10
i "fptoda2"  +   6 "game_end.wav"  0.04   10
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
