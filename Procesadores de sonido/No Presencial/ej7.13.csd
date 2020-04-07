<CsoundSynthesizer>
<CsOptions>
-W -o ej7.13.wav
</CsOptions>
<CsInstruments>

nchnls = 2  ; sonido en estéreo
sr = 44100  ; frecuencia de muestreo
ksmps =  1  ; en cada ciclo de control se calcula 1 muestra

instr F0
  iUmbral = 0dbfs/30

  ain soundin "lead.wav"
  
  apasabaja tone ain, 500
  kFrec, kAmp pitchamdf apasabaja, 100, 500
  
  ; Amplitudes no significativas
  if (kAmp < iUmbral) then
  	kAmp = 0
  endif
  
  kvarF tonek kFrec, 2
  kvarA tonek kAmp, 5
  
  aout poscil kvarA, kvarF
  
  outs ain, aout

endin


</CsInstruments>
<CsScore>

;instr ini dur
;--------------
i "F0"  0  14

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
