%Fabrizio Roberts
%Assignment 6, Part A

clear
clc

choice = 1;
effectExists = false;

while choice ~= 0
    choice = menu ("What would you like to do?", 'Choose a file',...
        'Play/stop original audio', ...
        'Echo effect',...
        'Compress audio',...
        'Play/stop compressed audio',...
        'Display frequency spectrum');
    switch choice
        case 1
            %User types in audio file and file is read if .wav file
            
            audio = input ('Please enter audio file name. Must be a .wav file: \n', 's');
            [audioVec, Fs] = audioread (audio);
            player = audioplayer (audioVec, Fs);
        case 2
            %plays and pauses original audio using logical if statement
            if isplaying(player) == 0
                play(player);
            elseif isplaying(player) == 1
                pause(player);
            end
        case 3
            %adds echo effect to original audio by calling upon audioEcho
            %function
            delay = input('Enter delay: ');
            echoGain = input('Enter gain: ');
            [audioVecEcho] = audioEcho(audioVec, Fs, delay, echoGain);
             player = audioplayer (audioVecEcho, Fs);
        case 4
            %compresses original audio by calling upon compress function
            compression_ratio = input('Enter compression ratio: ');
            [compAudioVec] = compress(audioVec, compression_ratio);
            comPlayer = audioplayer (compAudioVec, Fs/compression_ratio);
        case 5
            %plays and pauses compressed audio using logical if statement
            if isplaying(comPlayer) == 0
                play(comPlayer);
            elseif isplaying(comPlayer) == 1
                pause(comPlayer);
            end
        case 6
            %by calling upon fftBar, calculates and displays on graph the
            %frequency spectrum
            fftbar(audioVec, Fs)
    end
end
if choice == 0
    stop(player);
end
