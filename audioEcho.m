function [audioVecEcho] = audioEcho(audioVec, Fs, delay, echoGain)
	% audioEcho gives inputted audio file an echo effect
	space = zeros (delay*Fs,1);
    first = echoGain*[space;audioVec];
    second = [audioVec;space];
    audioVecEcho = [first,second];
end