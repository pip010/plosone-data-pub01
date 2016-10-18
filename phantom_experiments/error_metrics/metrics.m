clear all
clc
close all
load('data.mat')


% Single loop simulation
%data_singlecoil=reshape(Bz_scirun.field, [160 160]);
single = rot90(data_singlecoil);
% Multi loop simulation
%data_multicoil=reshape(Bz_scirun.field, [160 160]);
multi = rot90(data_multicoil);
% Layer loop simulation
%data_layercoil=reshape(Bz_scirun.field, [160 160]);
layer = rot90(data_layercoil);

% just for reviers sake
%data_xcoil=reshape(Bz_scirun.field, [160 160]);
singlex = rot90(data_xcoil);


% mask rel-err
mask=(single*10000)~=0;
figure
imagesc(mask)
colorbar
set(gca,'DataAspectRatio',[1 1 1])
print -dpng MASK_RE.png;

%mask abs-dif
absmask=(mask-1).*1;
imagesc(absmask)
colorbar
set(gca,'DataAspectRatio',[1 1 1])
print -dpng MASK_AD.png;


% Visual control
figure
subplot(1,4,1)
imagesc(data_MRI1,[-1.8E-4 1.8E-4])
title('MRI DATA')
colorbar
subplot(1,4,2)
imagesc(single,[-1.8E-4 1.8E-4])
title('Single Loop')
colorbar
subplot(1,4,3)
imagesc(multi,[-1.8E-4 1.8E-4])
title('Multi Loop')
colorbar
subplot(1,4,4)
imagesc(layer,[-1.8E-4 1.8E-4])
title('Layer Loop')
colorbar






%% Plotting 1D Profiles

YY_1D = 50 %where to cut for the 1D profile plot # 44

figure
imagesc(single,[-1.8E-4 1.8E-4]);
line([0 160],[YY_1D YY_1D]);

% 1D profile
data_MRI1_1D = data_MRI1(YY_1D,:);
single_1D = single(YY_1D,:);
multi_1D = multi(YY_1D,:);
layer_1D = layer(YY_1D,:);

figure
subplot(1,2,1);
plot1=plot(data_MRI1_1D,'k', single_1D,'r', multi_1D,'g',layer_1D,'b');
set(findall(gcf,'type','text'),'fontSize',14,'fontWeight','bold');
set(findall(gcf,'type','axes'),'fontSize',12,'fontWeight','bold');
set(plot1(1),'linewidth',1);
set(plot1(2),'linewidth',1);
set(plot1(3),'linewidth',1);
set(plot1(4),'linewidth',1);
set(gca,'XLim',[30 130]);
%set(gca,'YLim',[-0.00012 0.00012]);
set(gca,'YScale','semilog')
legend('MRI','BSM-811','BSM-819','BSM-879');

% use single coil as a baseline (substract from rest)
data_MRI1_1DN = data_MRI1(YY_1D,:) - single(YY_1D,:);
multi_1DN = multi(YY_1D,:) - single(YY_1D,:);
layer_1DN = layer(YY_1D,:) - single(YY_1D,:);

subplot(1,2,2);
plot2=plot(data_MRI1_1DN,'k', multi_1DN,'g',layer_1DN,'b');
set(findall(gcf,'type','text'),'fontSize',14,'fontWeight','bold')
set(plot2(1),'linewidth',1);
set(plot2(2),'linewidth',1);
set(plot2(3),'linewidth',1);
set(gca,'XLim',[30 130]);
set(gca,'YLim',[-0.000005 0.000005]);
set(findall(gcf,'type','text'),'fontSize',14,'fontWeight','bold');
set(findall(gcf,'type','axes'),'fontSize',12,'fontWeight','bold');
legend('MRI','BSM-819','BSM-879');




%% RELATIVE ERROR
err_single=100*(data_MRI1 - single)./(single);
err_multi=100*(data_MRI1 - multi)./(multi);
err_layer=100*(data_MRI1 - layer)./(layer);
err_singlex=100*(data_MRI1 - singlex)./(singlex);





%% RERR 1D closest to the coil =================================================
err_single_hotspot = [];
err_multi_hotspot = [];
for i = 25 : 44
  for j = 1 : 160   
    v = err_single(i,j);  
    if isfinite(v)
      err_single_hotspot(end+1) = min(abs(v),50);
    end   
    v = err_multi(i,j);
    if isfinite(v)
      err_multi_hotspot(end+1) = min(abs(v),50);
    end
  end
end
plot(err_single_hotspot,'r',err_multi_hotspot,'g');

%% =============================================================================



% Visual control
figure
subplot(1,3,1)
imagesc(abs(err_single),[0 50])
colorbar
title('MRI DATA VS Single Loop error%')
subplot(1,3,2)
imagesc(abs(err_multi),[0 50])
colorbar
title('MRI DATA VS Multi Loop error%')
subplot(1,3,3)
imagesc(abs(err_layer),[0 50])
colorbar
title('MRI DATA VS Layer Loop error%')

%% GENERAL FIGURE
figure
imagesc(data_MRI1,[-1.8E-4 1.8E-4])
title('MRI DATA')
colorbar
colormap(redblue)
set(gca,'DataAspectRatio',[1 1 1])
print -dpng MRIdata.png

figure
imagesc(single,[-1.8E-4 1.8E-4])
title('Single')
colorbar
colormap(redblue)
set(gca,'DataAspectRatio',[1 1 1])
print -dpng Single.png

figure
imagesc(multi,[-1.8E-4 1.8E-4])
title('Multi')
colorbar
colormap(redblue)
set(gca,'DataAspectRatio',[1 1 1])
print -dpng Multi.png

figure
imagesc(layer,[-1.8E-4 1.8E-4])
colorbar
title('Layer')
colormap(redblue)
set(gca,'DataAspectRatio',[1 1 1])
print -dpng Layer.png

%%

figure
imagesc(abs(err_single),[0 30])
title('MRI DATA VS Single error [%]')
colorbar
colormap(flipud(colormap(hot)))
print -dpng MRvsSINGLErel.png

figure
imagesc(abs(err_multi),[0 30])
title('MRI DATA VS Multi error [%]')
colorbar
colormap(flipud(colormap(hot)))
print -dpng MRvsMULTIrel.png

figure
imagesc(abs(err_layer),[0 30])
title('MRI DATA VS Layer error [%]')
colorbar
colormap(flipud(colormap(hot)))
print -dpng MRvsLAYERrel.png

figure
imagesc(abs(err_singlex),[0 30])
title('MRI DATA VS SingleX error [%]')
colorbar
colormap(flipud(colormap(hot)))
print -dpng MRvsSINGLEXrel.png




% ABS DIFF


figure
imagesc(abs(data_MRI1-single).*mask,[0 5E-6])
title('MRI DATA VS Single absolute difference')
colorbar
colormap(winter)
set(gca,'DataAspectRatio',[1 1 1])
print -dpng MRvsSINGLEabs.png;

figure
imagesc(abs(data_MRI1-multi).*mask,[0 5E-6])
title('MRI DATA VS Multi absolute difference')
colorbar
colormap(winter)
set(gca,'DataAspectRatio',[1 1 1])
print -dpng MRvsMULTIabs.png;

figure
imagesc(abs(data_MRI1-layer).*mask,[0 5E-6])
title('MRI DATA VS Layer absolute difference')
colorbar
colormap(winter)
set(gca,'DataAspectRatio',[1 1 1])
print -dpng MRvsLAYERabs.png;

%% colormap
close all
%% GENERAL FIGURE
figure
imagesc(data_MRI1,[-1.8E-4 1.8E-4])
title('MRI DATA')
colorbar('SouthOutside')
colormap(redblue)
print -dpng MRIcolorbar.png

figure
imagesc(abs(err_single),[0 30])
title('MRI DATA VS Single error [%]')
colorbar('SouthOutside')
colormap(flipud(colormap(hot)))
print -dpng RelErrorcolorbar.png

figure
imagesc(abs(data_MRI1-single),[-5E-6 5E-6])
title('MRI DATA VS Single absolute difference')
colorbar('SouthOutside')
colormap(winter)
print -dpng ABSDIFFcolorbar.png


