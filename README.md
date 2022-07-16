# snesdemo

I'm trying to make some SNES music and put it on a ROM.

**Disclaimer: I do not know what I'm doing.**

1. Fetch an SPC pack from [snesmusic.org](http://www.snesmusic.org) (RSNs are just RARs).
2. Alternatively, spin up `snes9x-gtk` with a ROM of yours, wait for your song and "Save SPC".
3. Open the SPC file in `SPCTool.exe`, find some samples and export them as WAV.
4. Use the WAV samples to create instruments and a song with `ft2-clone`.
5. Run `snesgssQv2.exe`, import the XM and recreate the instruments with the WAV samples.
6. Export the song from SNES GSS to get `music_1.bin` and `spc700.bin`.
7. Make something cool with `trse` and add the music files. There are tutorials. Set up `cl65` as the WDC65C816 assembler and build.
8. Alternatively, "Export SPC" from SNES GSS, open the file with SPCTool, add some text with the "Tag Editor" and "Create ROM".
9. Open the ROM with an emulator and lo and behold.

The XM notes import is likely to require some tempo adjustments. You should to make sure that all
notes have a set volume since the SNES appears to use the last specified volume for the given
instrument when no volume is specified. Also, [this](nix/0001-Read-and-write-note-volume-in-the-00-64-range.patch).

You may have to change `smc.cfg` to make ROMs with large audio binaries build. Not sure why or if
it's the right thing to do, but it appears to work.

bsnes and ZSNES works with these ROMs. Snes9x and Mesen-S does not get the all graphics right.

The Windows executables can be found under `tools`. Use `wine` to run them.
