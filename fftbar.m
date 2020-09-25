function [] = fftbar(audioVec, Fs) 
	%fftbar graphs the frequency spectrum with the amplitude of given audio
    
    %Only use at the first 1000 samples of the audio vector
    audioVec = audioVec(1:1000);
    %convert the audio signal into the frequency domain
    Y = fft(audioVec);
    %Getting rid of imaginary numbers
    Y = abs(Y);
    %keeping only positive values for Y
    Y2 = Y(1:(end/2));
    %calculating f
    f = Fs*(0:(length(Y)-1)/2)/length(Y);
    f = f';
    %graphing f and Y
    bar(f,Y2);
    xlabel('Frequency Spectrum (Hz)');
    ylabel('Amplitude');
    title('FFT of an audio signal');
    xlim([0 5000]);
    ylim([0 inf]); 
end