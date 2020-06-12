<CsoundSynthesizer>
<CsOptions>
-W -o ej9.9.wav
</CsOptions>
<CsInstruments>

nchnls = 2

giSeno  ftgen  100, 0, 8192, 10, 1 ; Tabla con 1 ciclo de onda sinusoidal

; Sustractivo basico

instr 9
  iDur   = p3
  iAmp   = ampdbfs(p4)  ; amplitud de dB en p4 a PCM
  iFrec  = cpspch(p5)   ; de altura en p5 a frecuencia
  iReson = p5/15        ; cantidad de resonancia
  iVol   = 1.047        ; ganancia para controlar el volumen global

;LFO
  kAmplitud line 0.1, iDur, 0.49
  klfo lfo kAmplitud, iFrec

;DCO
  adco vco2 1, iFrec, 2, 0.5+klfo

;DCF
  kfc expon 20000, iDur, 500
  adcf moogvcf adco, kfc, iReson

;EG
  keg madsr 0.001, 0.1, 0.7, 0.5
  kEnv = keg * iAmp

;DCA
  adca = (adcf*kEnv)*iVol

;SALIDA
  kPan lfo 1, 1
  aL, aR pan2 adca, kPan

         outs    aL,aR
endin

</CsInstruments>
<CsScore>

; I Just Can't Get Enough (Depeche Mode, 1981)

; tempo = 120 BPM desde el principio
t 0 120.0

; ins  inicio  durac. amplitud  altura
; (p1)  (p2)    (p3)    (p4)     (p5)
;======================================
i  9   4.000   0.250   -14.0     8.07
i  9   5.000   0.251   -14.0     8.07
i  9   5.500   0.250   -14.0     8.07
i  9   5.750   0.251   -14.0     8.07
i  9   6.250   0.251   -14.0     8.07
i  9   6.500   0.251   -14.0     8.07
i  9   7.000   0.251   -14.0     8.09
i  9   7.500   0.251   -14.0     8.11
i  9   8.000   0.251   -14.0     8.07
i  9   9.000   0.251   -14.0     8.07
i  9   9.500   0.251   -14.0     8.07
i  9   9.750   0.251   -14.0     8.07
i  9  10.250   0.251   -14.0     8.07
i  9  10.500   0.250   -14.0     8.07
i  9  11.000   0.251   -14.0     8.09
i  9  11.500   0.251   -14.0     8.11
i  9  12.000   0.250   -14.0     8.07
i  9  13.000   0.251   -14.0     8.07
i  9  13.500   0.251   -14.0     8.07
i  9  13.750   0.250   -14.0     8.07
i  9  14.250   0.251   -14.0     8.07
i  9  14.500   0.251   -14.0     8.07
i  9  15.000   0.251   -14.0     8.09
i  9  15.500   0.251   -14.0     8.11
i  9  16.000   0.251   -14.0     9.00
i  9  16.000   1.001   -14.0     8.00
i  9  17.000   0.250   -14.0     8.11
i  9  17.000   1.000   -14.0     7.11
i  9  18.000   0.750   -14.0     8.09
i  9  18.000   1.000   -14.0     7.09
i  9  19.000   0.251   -14.0     8.11
i  9  19.000   1.001   -14.0     7.11

i  9   4.000   0.500   -14.0     5.07
i  9   4.500   0.501   -14.0     5.07
i  9   6.500   0.501   -14.0     6.00
i  9   7.500   0.501   -14.0     5.11
i  9   8.000   0.501   -14.0     5.07
i  9   8.500   0.500   -14.0     5.07
i  9  10.500   0.500   -14.0     6.00
i  9  11.500   0.501   -14.0     5.11
i  9  12.000   0.500   -14.0     6.00
i  9  12.500   0.501   -14.0     6.00
i  9  14.500   0.501   -14.0     6.05
i  9  15.500   0.501   -14.0     6.04
i  9  16.000   0.501   -14.0     6.00
i  9  16.500   0.501   -14.0     6.00
i  9  18.500   0.500   -14.0     6.00
i  9  19.500   0.501   -14.0     6.00

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
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
