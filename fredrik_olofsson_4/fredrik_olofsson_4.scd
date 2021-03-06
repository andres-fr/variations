(

SynthDef(\mainfx, {
 var sig = In.ar(0,2);
 Out.ar(0, Limiter.ar(sig));
}).add;

SynthDef(\redfrikBlip, {|numFrames=8e4,freq=3,mul=4e4,add=4e4,rate=8e4,inputArray0=2,inputArray1=3,sweepDivisor0=1,sweepDivisor1=1,ampDivisor=1|

 Out.ar(0,
  b=LocalBuf(numFrames,2).clear;
  i=Sweep.ar(BufRd.ar(2,b,Saw.ar(freq,mul,add)),rate);
  BufWr.ar(Blip.ar([inputArray0,inputArray1]),b,i/sweepDivisor0);
  BufRd.ar(2,b,i/sweepDivisor1)/ampDivisor
 )
}
).add;

SynthDef(\redfrikSaw, {
 |numFrames=5e3, freq=50, mul=2e3, add=5e3, rate=2e4, inputArray0=4, inputArray1=3, sweepDivisor0=1, sweepDivisor1=1, ampDivisor=6|
 Out.ar(0,
  b=LocalBuf(numFrames,2).clear;
  i=Sweep.ar(BufRd.ar(2,b,Saw.ar(freq,mul,add)),rate);
  BufWr.ar(Saw.ar([inputArray0,inputArray1]),b,i/sweepDivisor0);
  BufRd.ar(2,b,i/sweepDivisor1)/ampDivisor
 )
}
).add;

Routine.run({

 ~mainfx = Synth(\mainfx);

 "a".postln;
 a = Synth(\redfrikBlip);
 20.wait;

 "b".postln;
 b = Synth(\redfrikSaw);
 20.wait;

 "c".postln;
 c = Synth(\redfrikSaw, [\inputArray0,4, \inputArray1,6, \sweepDivisor1,4]);
 20.wait;

 "d".postln;
 d = Synth(\redfrikSaw, [\numFrames, 1e4, \freq,1, \rate,4e4, \inputArray0,4, \inputArray1,50, \ampDivisor,2]);
 20.wait;

 "e".postln;
 e = Synth(\redfrikSaw, [\freq,400, \rate,6e4, \sweepDivisor1,16, \ampDivisor,6]);
 20.wait;



 "free".postln;
 a.free;b.free;c.free;d.free;e.free; // maybe don't stop these? will have to use different vars below though

 a = Synth(\redfrikBlip, [\ampDivisor,0.5, \mul,5e3, \add,5e4, \inputArray0,1, \inputArray1,3, \freq,200, \sweepDivisor1, 2]);
 6.wait;
 e = Synth(\redfrikSaw, [\freq,840, \rate,5e5, \sweepDivisor1,16, \ampDivisor,2]);
 2.wait;
 f = Synth(\redfrikSaw, [\freq,1080, \rate,5e6, \sweepDivisor1,16, \ampDivisor,1]);
 2.wait;

 "resume".postln;
 a.free;
 e.free;
 f.free;



 a = Synth(\redfrikBlip);
 b = Synth(\redfrikSaw);

 c = Synth(\redfrikSaw, [\inputArray0,4, \inputArray1,6, \sweepDivisor1,4]);
 d = Synth(\redfrikSaw, [\numFrames, 1e4, \freq,1, \rate,4e4, \inputArray0,4, \inputArray1,48, \ampDivisor,2]);

 z = Synth(\redfrikBlip, [\ampDivisor,0.15, \mul,5e3, \add,5e4, \inputArray0,4, \inputArray1,2, \freq,200, \rate,1e3, \sweepDivisor1, 2]);
 y = Synth(\redfrikBlip, [\ampDivisor,0.025, \mul,5e3, \add,5e4, \inputArray0,4, \inputArray1,3, \freq,200, \rate,1e3, \sweepDivisor1, 4]);
 x = Synth(\redfrikBlip, [\ampDivisor,0.05, \mul,5e3, \add,5e4, \inputArray0,8, \inputArray1,3, \freq,200, \rate,1e2, \sweepDivisor1, 8]); // lower rate for silence

 20.wait;

 m = Synth(\redfrikSaw, [\freq,1080, \rate,5e6, \sweepDivisor1,16, \ampDivisor,3]);
 2.wait;
 n = Synth(\redfrikSaw, [\freq,840, \rate,5e5, \sweepDivisor1,16, \ampDivisor,2]);
 1.wait;
 a.free;b.free;c.free;d.free;z.free;y.free;x.free;
 1.wait;

 n.free;m.free;

 a = Synth(\redfrikBlip);
 b = Synth(\redfrikSaw);

 c = Synth(\redfrikSaw, [\inputArray0,4, \inputArray1,6, \sweepDivisor1,4]);
 d = Synth(\redfrikSaw, [\numFrames,1e4, \freq,1, \rate,4e4, \inputArray0,4, \inputArray1,48, \ampDivisor,2]);

 z = Synth(\redfrikBlip, [\ampDivisor,0.15, \mul,5e3, \add,5e4, \inputArray0,4, \inputArray1,3, \freq,200, \rate,1e3, \sweepDivisor1, 2]);
 y = Synth(\redfrikBlip, [\ampDivisor,0.025, \mul,5e3, \add,5e4, \inputArray0,4, \inputArray1,3, \freq,200, \rate,1e3, \sweepDivisor1, 4]);
 x = Synth(\redfrikBlip, [\ampDivisor,0.05, \mul,5e3, \add,5e4, \inputArray0,4, \inputArray1,3, \freq,200, \rate,1e3, \sweepDivisor1, 4]);

 20.wait;

 m = Synth(\redfrikSaw, [\freq,840, \rate,5e6, \sweepDivisor1,16, \ampDivisor,3]);
 3.wait;
 n = Synth(\redfrikSaw, [\freq,720, \rate,5e5, \sweepDivisor1,16, \ampDivisor,2]);
 a.free; b.free; c.free; d.free; z.free; y.free; x.free;
 1.wait;

 n.free;m.free;

 a = Synth(\redfrikBlip);
 b = Synth(\redfrikSaw);
 c = Synth(\redfrikSaw, [\inputArray0,4, \inputArray1,6, \sweepDivisor1,1]);
 d = Synth(\redfrikSaw, [\numFrames,1e4, \freq,3, \rate,3e3, \inputArray0,6, \inputArray1,48, \ampDivisor,2]);

 e = Synth(\redfrikSaw, [\freq,800, \rate,5e5, \mul,2e2, \add,5e2, \sweepDivisor1,8, \ampDivisor,1]);

 z = Synth(\redfrikBlip, [\ampDivisor,0.15, \mul,5e3, \add,5e4, \inputArray0,4, \inputArray1,3, \freq,200, \rate,1e3, \sweepDivisor1, 2]);
 y = Synth(\redfrikBlip, [\ampDivisor,0.025, \mul,5e3, \add,5e4, \inputArray0,4, \inputArray1,3, \freq,200, \rate,1e3, \sweepDivisor1, 4]);
 x = Synth(\redfrikBlip, [\ampDivisor,0.05, \mul,5e3, \add,5e4, \inputArray0,4, \inputArray1,3, \freq,200, \rate,1e2, \sweepDivisor1, 8]);

 20.wait;

 m = Synth(\redfrikSaw, [\freq,840, \rate,5e6, \sweepDivisor1,16, \ampDivisor,2]);
 3.wait;
 n = Synth(\redfrikSaw, [\freq,210, \rate,5e3, \sweepDivisor0,8, \ampDivisor,1]);
 a.free; b.free; c.free; d.free; z.free; y.free; x.free; m.free;
 1.wait;

 n.free; m.free;

 a = Synth(\redfrikBlip);
 b = Synth(\redfrikSaw);
 c = Synth(\redfrikSaw, [\inputArray0,4, \inputArray1,6, \sweepDivisor1,1]);
 d = Synth(\redfrikSaw, [\numFrames,1e4, \freq,3, \rate,3e3, \inputArray0,6, \inputArray1,48, \ampDivisor,2]);

 e = Synth(\redfrikSaw, [\freq,200, \rate,5e5, \mul,2e2, \add,5e2, \sweepDivisor1,8, \ampDivisor,1]);

 z = Synth(\redfrikBlip, [\ampDivisor,0.15, \mul,5e3, \add,5e4, \inputArray0,4, \inputArray1,3, \freq,200, \rate,1e3, \sweepDivisor1, 8]);
 y = Synth(\redfrikBlip, [\ampDivisor,0.025, \mul,5e3, \add,5e4, \inputArray0,4, \inputArray1,3, \freq,200, \rate,1e3, \sweepDivisor1, 4]);
 x = Synth(\redfrikBlip, [\ampDivisor,0.05, \mul,5e3, \add,5e4, \inputArray0,4, \inputArray1,3, \freq,200, \rate,1e2, \sweepDivisor1, 2]);

 20.wait;

 ~mainfx.release;

});