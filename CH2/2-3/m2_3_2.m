wsc=100; J=0.00016;
Kp_w=J*wsc; Ki_w=Kp_w*wsc/5;
tf_pi=tf([Kp_w Ki_w],[1 0]);
tf_currLoop = tf(1000,[1 1000]);
tf_plant=tf(1,[J 0]);
Go_w = tf_pi*tf_currLoop*tf_plant;
h=bodeoptions;
h.PhaseMatching='on';
h.Title.FontSize = 14;
h.XLabel.FontSize = 14;
h.YLabel.FontSize = 14;
h.TickLabel.FontSize = 14;
bodeplot(Go_w,'-b',{1,100000},h);
h = findobj(gcf,'type','line');
set(h,'linewidth',2);
grid on;