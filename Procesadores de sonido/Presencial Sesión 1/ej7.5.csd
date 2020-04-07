<CsoundSynthesizer>
<CsOptions>
-W -o ej7.5.wav
</CsOptions>
<CsInstruments>

nchnls = 1 ; sonido en mono
sr = 44100 ; frecuencia de muestreo
ksmps = 32 ; en cada ciclo de control se calculan 32 muestras

opcode F0, 0,f
  fespectro xin
  kfr,kamp pvspitch fespectro, 0.01
  kT timeinsts
  if kT>0.9 && kT<1.1 then
    printks "F0 = %d Hz\n", 1.5, kfr
  endif
endop
 
instr transpon                                                      
  SFich    = p4           ; nombre del fichero del sonido
  iRTrans  = p5           ; relacion de transposicion
  iFFTSize = 1024         ; num. frecuencias calculadas
  iSolapa  = iFFTSize/4   ; solapamiento de la ventana
  iVenSize = iFFTSize     ; longitud de la ventana
  iVenTipo = 1            ; ventana tipo von Hann

  aentrada soundin  SFich

  fespectro pvsanal aentrada, iFFTSize, iSolapa, iVenSize, iVenTipo
  f_out pvscale fespectro, iRTrans
  aout pvsynth f_out

  F0  f_out  ; TU_ESPECTRO_DE_SALIDA
  out aout
endin

</CsInstruments>
<CsScore>

t 0 60 
 
;     p1      p2  p3       p5
;  instrum   ini dur    Fichero   R_frec 
;-----------------------------------------
i "transpon"  0  4.6  "saxo.wav" [1/1]  ; sin transponer
i "transpon"  +   .   "saxo.wav" [15/8]
i "transpon"  +   .   "saxo.wav" [2/1]
i "transpon"  +   .   "saxo.wav" [-8/5]


e

</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>0</x>
 <y>0</y>
 <width>10</width>
 <height>10</height>
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
