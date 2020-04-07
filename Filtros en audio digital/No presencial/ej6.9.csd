<CsoundSynthesizer>
<CsOptions>
-W -o ej6.9.wav
</CsOptions>
<CsInstruments>

; parametros de cabecera:
sr  = 44100
ksmps = 128
nchnls  = 1
0dbfs   = 1

opcode espectro, 0,a ; operador definido aqui para ver el espectro
  aSig  xin
        outvalue "outFT", 1
        dispfft  aSig, 0.1, 1024, 1, 0
endop


instr filtros
  SFich  = p4
  ifC    = p5*sr
  iFiltro= p6
  
  ain soundin SFich
  
  if (iFiltro == 1) then
  	aout tone ain, ifC
  elseif (iFiltro == 2) then
  	aout atone ain, ifC
  elseif (iFiltro == 3) then
  	aout reson ain, ifC, 2
  else
  	aout areson ain, ifC, 4
  endif
  
        espectro aout
        out aout
endin

</CsInstruments>
<CsScore>

t 0 60    ; tempo = 60 BPM --> 1 tiempo = 1 segundo

i "filtros" 0 10 "tormenta.wav" [1/8] 1
i     .     + .        .        [1/5] 2
i     .     + .        .        [1/3] 3
i     .     + .        .        [2/9] 4

e

</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>10</x>
 <y>10</y>
 <width>0</width>
 <height>0</height>
 <visible>true</visible>
 <uuid>{7fbb8ca058db819baa08365bed246e5a}</uuid>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
 <bsbObject type="BSBScope" version="2">
  <objectName>audio_out</objectName>
  <x>111</x>
  <y>7</y>
  <width>407</width>
  <height>148</height>
  <uuid>{2103ab27-bd9e-4650-ab43-545afafb7b7d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <value>-255.00000000</value>
  <type>scope</type>
  <zoomx>2.00000000</zoomx>
  <zoomy>1.00000000</zoomy>
  <dispx>1.00000000</dispx>
  <dispy>1.00000000</dispy>
  <mode>0.00000000</mode>
 </bsbObject>
 <bsbObject type="BSBGraph" version="2">
  <objectName>outFT</objectName>
  <x>111</x>
  <y>160</y>
  <width>407</width>
  <height>203</height>
  <uuid>{282e9bc0-e49b-4ef1-b14c-923f3091036e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <value>1</value>
  <objectName2>tab_outFT</objectName2>
  <zoomx>1.00000000</zoomx>
  <zoomy>1.00000000</zoomy>
  <dispx>1.00000000</dispx>
  <dispy>1.00000000</dispy>
  <modex>lin</modex>
  <modey>lin</modey>
  <all>true</all>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>20</x>
  <y>20</y>
  <width>80</width>
  <height>25</height>
  <uuid>{ef576f8a-9ba9-4f7c-b696-06c7064cd150}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>ONDA:</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>17</x>
  <y>179</y>
  <width>87</width>
  <height>26</height>
  <uuid>{a084513a-a5cd-4878-a0ff-ff226c0dd928}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>ESPECTRO:</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
