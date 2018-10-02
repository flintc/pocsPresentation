load('nmse.mat')
load('nmseGT.mat')
load('psnr.mat')
load('s1.mat')


resErr_pocs = nmse(:,end);
reconErr_pocs = nmseGT(:,end);
psnr_pocs = psnr(:,end);

stopCriteria = -7e-7;
imGT = double(imread('imHR_GT.png'));
magFactors = [16,8,4,2];
for i = 1:4
    foo = diff(nmse(i,:));
    stopInd(i) = find(abs(foo-stopCriteria) == min(abs(foo-stopCriteria)));
    reconErr_pocs(i) = nmseGT(i,stopInd(i));
    resErr_pocs(i) = nmse(i,stopInd(i));
    
    %percentWithin(i) = conFac(i,stopInd(i));
    %sharpness(i) = s1(i,stopInd(i));
    %psnrE(i) = psnr(i,stopInd(i));
    
    
    imSFBL = double(imread(['estImSFBL_mFac',num2str(magFactors(i)),'.png']));
    imMFBL = double(imread(['estImMFBL_mFac',num2str(magFactors(i)),'.png']));
    tmpShifts = -1*keren_shift({imGT,imSFBL});
    %tmpIm = shiftIm(imMFBL,[magFactors(i)/2,magFactors(i)/2]);
    tmpIm = shiftIm(imSFBL,tmpShifts(2,:));
    %imwrite(uint8(tmpIm),['estImSFBL_mFac',num2str(magFactors(i)),'_shift.png'])
    reconErr_sfbl(i) = normSSE(imGT,tmpIm);
    tmpShifts = -1*keren_shift({imGT,imMFBL});
    %tmpIm = shiftIm(imMFBL,[magFactors(i)/2,magFactors(i)/2]);
    tmpIm = shiftIm(imMFBL,tmpShifts(2,:));
    reconErr_mfbl(i) = normSSE(imGT,tmpIm);
    [mm,nn] = size(imGT);
    mse = sum(abs(imGT(:)-tmpIm(:)).^2)./(mm.*nn);
    psnr_mfbl(i) = 20*log10(255.^2/sqrt(mse));
    
    %imwrite(uint8(tmpIm),['estImMFBL_mFac',num2str(magFactors(i)),'_shift.png'])

end
figure(5)

plot(magFactors,sqrt(resErr_pocs),'.-.b')
hold on
plot(magFactors,sqrt(reconErr_pocs),'.-b')
plot(magFactors,sqrt(reconErr_sfbl),'.-r')
plot(magFactors,sqrt(reconErr_mfbl),'.-g')
hold off
legend('Residual Error - POCS','Reconstruction Error - POCS','Reconstruction Error - SF BL','Reconstruction Error - MF BL','Location','NorthWest')
xlabel('Magnification Factor (L/M)')
ylabel('Normalized RMS Error')

% figure(6)
% plot(magFactors,psnr_pocs,'-b')
% hold on
% plot(magFactors,psnr_mfbl,'-g')
% hold off
