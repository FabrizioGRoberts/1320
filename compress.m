function [compAudioVec] = compress(audioVec, compression_ratio)
	% compress compresses the input audio to the inputted compression ratio
	compAudioVec = audioVec(1:compression_ratio:end);
end