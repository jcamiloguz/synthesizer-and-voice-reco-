y = audiorecorder(8000, 8, 1);
recordblocking(y,3.5);
audioarray = getaudiodata(recorder);
x=getaudiodata(y)
player = play(y); 
stop(player);
