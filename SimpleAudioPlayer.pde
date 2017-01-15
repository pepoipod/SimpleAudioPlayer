/***

  SimpleAudioPlayer is wrapped minim.AudioPlayer.
  requirements: minim

***/

import ddf.minim.*;

enum PLAY_STATUS {
  NOT_PLAYED,
  PLAYING
}

class SimpleAudioPlayer {
  Minim minim;

  AudioPlayer audioPlayer;
  PLAY_STATUS playStatus;

  String currentAudioFileName;
  int currentBufferSize;

  SimpleAudioPlayer (Object fileSystemHandler, String fileName, int bufferSize) {
    minim = new Minim (fileSystemHandler);

    audioPlayer = minim.loadFile (fileName, bufferSize);
    playStatus = PLAY_STATUS.NOT_PLAYED;

    currentAudioFileName = fileName;
    currentBufferSize = bufferSize;
  }

  // check playing.
  Boolean isPlaying () {
    return audioPlayer.isPlaying ();
  }

  // check play end.
  Boolean isPlayEnd () {
    return !audioPlayer.isPlaying () && playStatus == PLAY_STATUS.PLAYING;
  }

    void LoadFile (String fileName, int bufferSize) {
      audioPlayer = minim.loadFile (fileName, bufferSize);
    }

    void SetGain (float gain) {
      audioPlayer.setGain (gain);
    }

  void Play () {
    playStatus = PLAY_STATUS.PLAYING;
    audioPlayer.play ();
  }

  void Stop (Boolean isReloadPlayedAudio) {
    audioPlayer.close ();
    playStatus = PLAY_STATUS.NOT_PLAYED;

    if (isReloadPlayedAudio) {
      audioPlayer = minim.loadFile (currentAudioFileName, currentBufferSize);
    }
  }
}