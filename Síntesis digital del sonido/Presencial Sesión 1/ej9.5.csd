<CsoundSynthesizer>
<CsOptions>
-W -o ej9.45.wav ; --midi-key=4
</CsOptions>
<CsInstruments>

0dbfs = 1  ; amplitud maxima normalizada
ksmps = 1  ; maxima precision en el calculo de las variables k-

; Este instrumento lee los widgets y activa el instrumento nota

instr lee_parametros
  ktA   invalue "tata"  ; Lee el tiempo de ataque desde el widget
  ktD   invalue "tdec"  ; Lee el tiempo de caida
  kAS   invalue "asus"  ; Lee la amplitud de sostenimiento
  ktR   invalue "trel"  ; Lee el tiempo de relajación
  kTipo invalue "tipo"  ; Lee el tipo de envolvente
  iNota = cpsmidinn(p4) ; Pasa la altura MIDI recibida a Hz
           ;  p1   p2 p3   p4    p5   p6  p7  p8  p9
  event "i","nota", 0, 2,iNota,kTipo,ktA,ktD,kAS,ktR
  turnoff
endin

; instrumento para poner una envolvente

instr nota
  iDur  = p3         ; Duracion de la nota en segundos
  iFrec = p4         ; Recibe la nota midi 60 (DO4) que pasa a Hz
  iTipo = p5         ; Tipo de envolvente: 0=ASR/AR, 1=ADSR, 2=ADSR-X
  itAta = p6         ; tA absoluto en segundos
  itDec = p7*iDur    ; tD relativo a la duracion
  iAsus = p8 
  itRel = p9*iDur    ; tR relativo a duracion


  if ((itAta+itDec+itRel)>iDur) then
    itRel = iDur - (itAta+itDec)
  endif
  
  if (iTipo == 0) then
    kEnv linen iAsus, itAta, iDur, itRel
  elseif (iTipo == 1) then
    kEnv adsr itAta, iDur, iAsus, itRel
  elseif (iTipo == 2) then
    kEnv madsr itAta, iDur, iAsus, itRel
  endif
  
  aSal2 poscil 0dbfs/2, iFrec

  ; para verificar los valores en la consola:
  prints "tA =%5.2f, tD =%5.2f, As =%5.2f, tR =%5.2f\n", itAta, itDec/iDur, iAsus, itRel/iDur

  aSal = aSal2*kEnv

  outvalue "ENVOLVENTE", kEnv
  out aSal
endin

</CsInstruments>
<CsScore>

;f 0 [2*60] ; mantiene activo el programa durante 2 minutos
i "lee_parametros" 0 0.1 72

e

</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid>{7fbb8ca058db819baa08365bed246e5a}</uuid>
 <bgcolor mode="nobackground">
  <r>246</r>
  <g>255</g>
  <b>237</b>
 </bgcolor>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>17</x>
  <y>7</y>
  <width>163</width>
  <height>250</height>
  <uuid>{9e3d556f-e489-435d-bc7c-97a868c27d64}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Envolvente de amplitud</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>181</r>
   <g>233</g>
   <b>238</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>tata</objectName>
  <x>39</x>
  <y>29</y>
  <width>20</width>
  <height>170</height>
  <uuid>{9c20c1f0-dac8-49c8-a022-14477e73432e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.01000000</minimum>
  <maximum>1.95000000</maximum>
  <value>0.20400000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>tdec</objectName>
  <x>72</x>
  <y>29</y>
  <width>20</width>
  <height>170</height>
  <uuid>{3e1a333a-8f89-4086-bfb2-0db2e61e1a89}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.01000000</minimum>
  <maximum>0.30000000</maximum>
  <value>0.20105882</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>asus</objectName>
  <x>106</x>
  <y>29</y>
  <width>20</width>
  <height>170</height>
  <uuid>{02d697b0-77e4-4d0c-add5-30e36794ece0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.05000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.50264706</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>trel</objectName>
  <x>141</x>
  <y>29</y>
  <width>20</width>
  <height>170</height>
  <uuid>{2e9cf2ae-7997-4391-9363-0ea7ba3fe217}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.01000000</minimum>
  <maximum>0.95000000</maximum>
  <value>0.90023529</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>39</x>
  <y>203</y>
  <width>18</width>
  <height>24</height>
  <uuid>{ed8bc21e-980d-438e-a004-8797008451b4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>A</label>
  <alignment>left</alignment>
  <font>DejaVu Sans</font>
  <fontsize>10</fontsize>
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
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>71</x>
  <y>203</y>
  <width>18</width>
  <height>24</height>
  <uuid>{9db192c7-a3b1-452d-ab86-7bc39b5a097e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>D</label>
  <alignment>left</alignment>
  <font>DejaVu Sans</font>
  <fontsize>10</fontsize>
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
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>106</x>
  <y>203</y>
  <width>18</width>
  <height>24</height>
  <uuid>{6e841111-90a7-44e2-94df-541c3d28aed5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>S</label>
  <alignment>left</alignment>
  <font>DejaVu Sans</font>
  <fontsize>10</fontsize>
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
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>141</x>
  <y>203</y>
  <width>18</width>
  <height>24</height>
  <uuid>{90de043d-9e1a-484e-86c1-2cf0d364f1d8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>R</label>
  <alignment>left</alignment>
  <font>DejaVu Sans</font>
  <fontsize>10</fontsize>
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
 <bsbObject version="2" type="BSBButton">
  <objectName>nota</objectName>
  <x>215</x>
  <y>143</y>
  <width>83</width>
  <height>46</height>
  <uuid>{e4326a6a-c4fc-4223-9c46-355a3e2f2ff9}</uuid>
  <visible>true</visible>
  <midichan>1</midichan>
  <midicc>0</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>NOTA</text>
  <image>/</image>
  <eventLine>i "lee_parametros" 0 0.1 72</eventLine>
  <latch>false</latch>
  <latched>true</latched>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName/>
  <x>190</x>
  <y>6</y>
  <width>13</width>
  <height>251</height>
  <uuid>{28e0359f-76e6-4602-a0fa-33d68a1ebf55}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <objectName2>ENVOLVENTE</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00004423</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>250</g>
   <b>11</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>tata</objectName>
  <x>24</x>
  <y>224</y>
  <width>44</width>
  <height>26</height>
  <uuid>{6adcc342-95d1-4851-a0e9-b35a926f3c2a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.204</label>
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
 <bsbObject version="2" type="BSBDisplay">
  <objectName>tdec</objectName>
  <x>61</x>
  <y>224</y>
  <width>43</width>
  <height>25</height>
  <uuid>{e101a9b2-9d19-4345-91aa-5dc4bac0b2b6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.201</label>
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
 <bsbObject version="2" type="BSBDisplay">
  <objectName>asus</objectName>
  <x>95</x>
  <y>224</y>
  <width>43</width>
  <height>25</height>
  <uuid>{b5e8bb97-6ff2-41a6-9596-55e6d5802957}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.503</label>
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
 <bsbObject version="2" type="BSBDisplay">
  <objectName>trel</objectName>
  <x>131</x>
  <y>224</y>
  <width>44</width>
  <height>25</height>
  <uuid>{f99cba85-cecf-4ee6-9028-046f9f6b76c0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.900</label>
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
 <bsbObject version="2" type="BSBDropdown">
  <objectName>tipo</objectName>
  <x>215</x>
  <y>31</y>
  <width>89</width>
  <height>30</height>
  <uuid>{daa2c7dc-24db-4ebf-a8d2-1c21744e2e1b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name>ASR/AR</name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>ADSR</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>ADSR-X</name>
    <value>2</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>2</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>213</x>
  <y>14</y>
  <width>98</width>
  <height>24</height>
  <uuid>{c674ae73-46e4-4cf2-b7cb-35ee8762d877}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Tipo de envolvente</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
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
