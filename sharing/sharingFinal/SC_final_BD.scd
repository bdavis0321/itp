// SUPERCOLLIDER FINAL PROJECT - Bryce Davis
// 1980s deep house thingy
// Guide to playing and messing with the knobs
// INIT
// Step [ 1 ] = Boot and clear buffers
// Step [ 2 ] = More buffers
// SYNTHDEFS
// Step [ 3 ] = Drums Synthdef
// Step [ 4 ] = Bass Synthdef
// Step [ 5 ] = Pad Synthdef
// GUI
// Step [ 6 ] = OPEN GUI
// PATTERNS
// Step [ 7 ] = Start pad, REMEMBER it starts delayed for some reason, this started this morning and I don't know how to fix it
// Step [ 8 ] = Start bassline, REMEMBER it also starts delayed but by about a 16th note
// Step [ 9 ] = Start drums, PRESS 'OFF' button on downbeat (not delayed luckily :D )
// FUN WITH PARAMETERS
// Step [ 10 ] = Mess around with drums GUI
// Step [ 11 ] = Mess around with pad filter (when changing Synthdef parameters, re-execute each time, NOT PBind)
// Step [ 12 ] = Mess around with bass filter (when changing Synthdef parameters, re-execute each time, NOT PBind)
// Step [ 13 ] = Do this until you're bored
// Step [ ?? ] = You've now created an 80s style deep house track shoutout Chicago shoutout Detroit

(   // START WITH THIS   [ 1 ]   BOOT
s.waitForBoot({
	{
		if (a.notNil, {
			if (a.buffer.notNil, {
				a.buffer.free;
			});
			if (a.target.notNil, {
				a.target.free;
			});
			if (a.irspectrum.notNil, {
				a.irspectrum.free;
			});
		});
		a = ();
		a.fftsize = 2048;
		a.target= Buffer.read(s, "/Users/brycedavis/Documents/SCan/beat2.wav");
		if (a.buffer.notNil, {
			a.buffer.free;
		});
		a.buffer = Buffer.read(s, "/Users/brycedavis/Documents/SCan/alesis/Midiverb_II-20-Medium Bright 1.9sec.wav");
		s.sync;
		"Setup Completed".postln;
	}.fork;
});
)
(    // THEN EXECUTE THIS  [ 2 ]   PARTCONV
	{
		s.sync;
		a.bufsize = PartConv.calcBufSize(a.fftsize, a.buffer);
		if (a.irspectrum.notNil, {
			a.irspectrum.free;
		});
		a.irspectrum = Buffer.alloc(s, a.bufsize, 1);
		a.irspectrum.preparePartConv(a.buffer, a.fftsize);
		s.sync;
		"Prepare Buffer Completed".postln;
	}.fork;
)
(    // EXECUTE SYNTHDEFS  [ 3 ] BREAK
SynthDef(\break, {
	arg freq=440, rq=0.5, dry=0.01, wetReverbVol=0.03, sendReverbVol=0.09, wetDelayVol=0, sendDelayVol=0, fb=0.7;
	var snd, lpf, res, wsnd, sendReverb, sigReverb, sendDelay, sigDelay, delayTime;
	snd = PlayBuf.ar(2, a.target, loop:1);
	snd = snd * (-6.dbamp);
	sendReverb = snd * (sendReverbVol);
	delayTime = 0.375;
	sendDelay = snd * (sendDelayVol);
	sigDelay = sendDelay + (LocalIn.ar(2) * fb);
	sigDelay = DelayC.ar(sigDelay, 1.0, delayTime - ControlDur.ir);
	sigDelay = HPF.ar(sigDelay,150,1,1);
	LocalOut.ar(sigDelay);
	lpf = Clip.kr(freq, 20, 20000);
	res = Clip.kr(rq, 0.1, 0.5);
	snd = RLPF.ar(snd,lpf,res);
	sigReverb = PartConv.ar(sendReverb, a.fftsize, a.irspectrum.bufnum, 0.1);
	sigReverb = HPF.ar(sigReverb,150,1,1);
	Out.ar(0, ((dry * snd) + (wetReverbVol * sigReverb) + (-30.dbamp * sigDelay))
 ! 2);
}).add;
)
(     // EXECUTE SYNTHDEFS  [ 4 ]  BASS
SynthDef(\acid, {
	arg atk=0, sus=0, rel=0.3, c1=1, c2=(-1),
	freq=5000,
	cf=1500, // mess around with this for 303 cutoff [ 12 ]
	rq=0.7, // mess around with this for 303 res
	amp=1, out=2;
	var sig, env;
	env = EnvGen.kr(Env([0,1,1,0],[atk,sus,rel],[c1,0,c2]),doneAction:2);
	sig = (SinOsc.ar(freq)) + (Saw.ar(freq));
	sig = RLPF.ar(sig, cf, rq);
	sig = sig * env * amp;
	Out.ar(out, sig ! 2);
}).add;
)
(
Pbind( // 303 acid bass sequence, STARTS 16th note BEHIND   [ 8 ]    ONLY DO ONCE!!!!!
	\instrument, \acid,
	\dur, 0.125,
	\midinote, Pseq([
		39,0,0,30,
		0,0,32,0,
		0,34,0,0,
		25,0,27,0],inf),
	\out, 0,
).play;
)
(      // EXECUTE SYNTHDEFS   [ 5 ]  CHORD
SynthDef(\pad, {
	arg atk=0.0005, sus=0, rel=1.2, c1=10, c2=(50),
	freq=400,
	cf=880, // mess with this for pad cutoff [ 11 ]
	rq=0.09, // mess around with this for pad res
	amp=0.2, out=0;
	var sig, env, filenv;
	env = EnvGen.kr(Env([0,1,1,0],[atk,sus,2.5],[c1,0,c2]),doneAction:2);
	filenv = EnvGen.kr(Env([0,1,0.6,0],[0.6,0.6,2.5],[c1,0,c2]),doneAction:2);
	sig = (SinOsc.ar(freq)) + ((Saw.ar(freq))/2);
	sig = RLPF.ar(sig, (cf * filenv), rq);
	sig = sig * env * amp;
	Out.ar(out, sig ! 2);
}).add;
)
(
Pbind( // pad chords 1, STARTS 8th Note BEHIND    [ 7 ]  ONLY DO ONCE!!!!!!
	\instrument, \pad,
	\dur, 2,
	\midinote, Pseq([
		[54,58,59,63],
		[56,60,61,65],
	],inf),
	\atk, 0.1,
	\rel, 2,
	\amp, 0.05,
	\out, 0,
).play;
)
(   //RUN GUI FOR BEAT    [ 6 ] OPEN BEAT GUI
Window.closeAll;
w = Window("The Beat", Rect(750,50,500,80))
.front
.alwaysOnTop_(true);

~slider = Slider(w, Rect(20,20,150,30))
.background_(Color(0.55,0.25,0.95))
.action_({
	arg obj;
	var cf;
	cf = obj.value.linexp(0,1,20,20000).postln;
	if(
		x.isPlaying,
		{x.set(\freq, cf)}
	);
	~numberBox.value_(obj.value.linexp(0,1,20,20000));
});

~numberBox = NumberBox(w, Rect(180,20,80,30))
.value_(100)
.clipLo_(20)
.clipHi_(20000)
.font_(Font("Futura", 16))
.decimals_(2)
.action_({
	arg obj;
	~slider.valueAction_(obj.value.explin(20,20000,0,1))
});

~freqLabel = StaticText(w, Rect(180,50,80,20))
.string_("freq")
.font_(Font("Futura", 14))
.align_(\center);
~volLabel = StaticText(w, Rect(245,50,80,20))
.string_("volume")
.font_(Font("Futura", 14))
.align_(\center);
~revLabel = StaticText(w, Rect(296,50,80,20))
.string_("reverb")
.font_(Font("Futura", 14))
.align_(\center);
~delLabel = StaticText(w, Rect(345,50,80,20))
.string_("delay")
.font_(Font("Futura", 14))
.align_(\center);

~knob = Knob(w, Rect(270,20,30,30))
.action_({
	arg obj;
	var qual;
	qual = obj.value.linexp(0,1,0.01,1);
	if(
		x.isPlaying,
		{x.set(\dry, qual)}
	);
});

~knob2 = Knob(w, Rect(320,20,30,30))
.action_({
	arg obj;
	var qual2;
	qual2 = obj.value.linexp(0,1,1,10);
	//qual2 = obj.value.linexp(0,1,0.05,1).reciprocal;
	if(
		x.isPlaying,
		{x.set(\sendReverbVol, qual2)}
	);
});

~knob3 = Knob(w, Rect(370,20,30,30))
.action_({
	arg obj;
	var qual2;
	qual2 = obj.value.linexp(0,1,1,20);
	//qual2 = obj.value.linexp(0,1,0.05,1).reciprocal;
	if(
		x.isPlaying,
		{x.set(\sendDelayVol, qual2)}
	);
});

~button = Button(w, Rect(430,20,50,30))
.states_([
	["OFF", Color.black, Color.gray(0.8)],
	["ON", Color.white, Color(0.2,0.75,0.95)]
])
.font_(Font("Futura", 18))
.action_({
	arg obj;
	if(
		obj.value == 1,
		{
			x = Synth.new(
				\break,
				[
					\freq, ~slider.value.linexp(0,1,20,20000),
					\dry, ~knob.value.linexp(0,1,1,).reciprocal
				]
			).register;
		},
		{x.free}
	);
})
)

~button.value_(0);

x.free;