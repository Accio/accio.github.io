---
layout: post
title: Read and look up words from Linux command line
category: programming
tags: CLI dict TTS
---

Here are my notes during a search for tools that help me read an English word and look it up in dictionaries on the Linux command line. I need them to learn a word at my fingertip.

If you just care about the solution, please jump to [the end of the post](#my-solution).

# Reading words with Text-To-Speech (TTS)

All options except for `gTTS` work offline.

## festival

[festival](https://wiki.archlinux.org/title/Festival) is a general multi-lingual speech synthesis system.

To read a sentence, use `echo 'ten simple rules of doing a postdoc in pharmaceutical companies.' | festival --tts`. The default voice sounds like a robot, but understandable.

## espeak

Similar as festival, `espeak` can synthesize speeches. To read a word, use `espeak -x -s 120 "word"`.

## TTS

[TTS](https://github.com/mozilla/TTS) is developed by Mozilla for text-to-speech conversion using pre-trained models.

Install with `pip install TTS`.

To read a sentence, use `tts --text "Ten simple rules of doing a postdoc in pharmaceutical companies." --out_path sandbox/test.wav; play !$`. The voices sound natural to me.

While reading a word helps to remember it, text-to-speech can help proofreading long texts (e.g. manuscripts), because it can reveal missing or redundant words as well as mistakes.

On my mint/ubuntu machine as Virtual box, running the command complains `[W NNPACK.cpp:79] Could not initialize NNPACK! Reason: Unsupported hardware.`. However, it does not cause any problem of synthesizing the text.

## gTTS (online)

[gTTS](https://gtts.readthedocs.io/en/latest/) is s python library and CLI tool to interface with Google Translate's text-to-speech API. It can be used to read a single word.

Install `gTTS` with `pip install gTTS`.

To read a word slowly and play the mp3 file on the fly, use `gtts-cli --slow 'rogue' | play -t mp3 -`.

# Looking up words

I use the `dict` program, which is both fast and comprehensive.

```bash
sudo apt-get install dict-gcide
sudo apt-get install dict-wn
sudo apt-get install dict-devil
## English Thesaurus database
sudo apt-get install dict-moby-thesaurus
```

# My solution

To use the functionality even when I am cut off from internet, I use the
combination of `Mozilla/TTS` and `dict`. I am inspired by [a solution on
StackOverflow](https://askubuntu.com/questions/170775/offline-dictionary-with-pronunciation-and-usages)
(user: precise) to add the following lines to my `~/.bashrc` file.

```
function define {
  tmpfile=$(mktemp)
  ## requirement: install mozilla/tts with `pip install TTS`
  tts --text "$1" --out_path "$tmpfile" &>/dev/null
  play "$tmpfile" &>/dev/null
  rm "$tmpfile"
  dict "$1" | less
}
```

Now, try `define function`. And for fun, try `define funcition`, which includes a common typo of mine.
