<CsoundSynthesizer>
<CsOptions>
-W -o ej5.15.wav
</CsOptions>
<CsInstruments>

sr = 44100 ; frecuencia de muestreo
kr = 100   ; para que el bucle de control se haga 100 veces/s
nchnls = 2 ; genera estereo

; DETECCION Y SEGUIMIENTO DE F0 CON pitchamdf (tambien hay ptrack, pitch)

instr f0
  SFich   = p4
  iUmbral = -30
  
  aSound soundin SFich
  
  kFrec, kAmp pitchamdf aSound, 100, 500
  
  if (ampdbfs(kAmp) < iUmbral) then
  	kFrec = 0
  endif

  kvariable tonek kFrec, 5
  printk  1, int(kvariable)
  
  out aSound
endin


</CsInstruments>
<CsScore>

;  inst inic   durac   fichero    
;   p1   p2     p3       p4  
;-------------------------------
i "f0"   0      6.0 "flauta_G5.wav"


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
