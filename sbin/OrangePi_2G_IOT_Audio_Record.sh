do_RDA_audio_record() {
  amixer cset numid=9,iface=MIXER,name='Stop' 1 > /dev/null 2>&1
  amixer cset numid=2,iface=MIXER,name='Capture Volume' 2 > /dev/null 2>&1
  amixer cset numid=3,iface=MIXER,name='ITF' $1 > /dev/null 2>&1
  amixer cset numid=5,iface=MIXER,name='ForceMainMic' 1 > /dev/null 2>&1
  amixer cset numid=6,iface=MIXER,name='CodecAppMode' 0 > /dev/null 2>&1
  amixer cset numid=12,iface=MIXER,name='InSampleRate' 16000 > /dev/null 2>&1
  amixer cset numid=13,iface=MIXER,name='InChannelNumber' 1 > /dev/null 2>&1
  amixer cset numid=8,iface=MIXER,name='StartRecord' 1 > /dev/null 2>&1
}

do_RDA_audio_record $1
