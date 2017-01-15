import ddf.minim.*;

SimpleAudioPlayer audioPlayer;

void setup () {
  size(500, 500);
  audioPlayer = new SimpleAudioPlayer (this, "cat.mp3", 2048); 
}

void draw () {
  if (audioPlayer.isPlayEnd ()) {
    audioPlayer.Stop (true);
  }
}

void mouseClicked() {
  if (!audioPlayer.isPlaying ()) {
    audioPlayer.Play();
  }
}