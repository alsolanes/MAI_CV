% 2.3 Enhancing images with edges
% In this video, the parameter which seemed to produce better results were
% applying canny, and values 0.4 and 0.1 for threshold and sigma.
% The problems seen, are those referring to some edges detected for example
% in places like clouds, where a different value should be chosen. If we
% chose only one type of filter for all the video, some images could show
% incorrect edges.
% Another problem is that in a frame, maybe an edge is detected, and in the
% next one maybe it is not detected, and when showing the video the output
% image seems moving, and does not look stable at all.
vid = VideoReader('video/Maldives.mp4');
vid_out = VideoWriter('Maldives_out.avi');
open(vid_out);
for i = 1:vid.Duration
    pic = read(vid,i);
    [edges overlap]  = edges_canny(pic,0.4,0.1);
    writeVideo(vid_out,overlap);
end
close(vid_out);

