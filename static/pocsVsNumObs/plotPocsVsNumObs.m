load('nmse.mat')
load('nmseGT.mat')
load('conFac.mat')
load('s1.mat')
load('psnr.mat')

numObs = [2,4,8,16,32,64,128];

stopCriteria = -7e-7;
imGT = double(imread(['imGT.png']));

for i =1:length(numObs)
    foo = diff(nmse(i,:));
    stopInd(i) = find(abs(foo-stopCriteria) == min(abs(foo-stopCriteria)));
    reconstructionError(i) = nmseGT(i,stopInd(i));
    residualError(i) = nmse(i,stopInd(i));
    percentWithin(i) = conFac(i,stopInd(i));
    sharpness(i) = s1(i,stopInd(i));
    psnrE(i) = psnr(i,stopInd(i));
    
    estImMFBL = double(imread(['estImMFBL_nObs',num2str(numObs(i)),'.png']));
    shifts = -1*keren_shift({imGT,estImMFBL});
    estImMFBL_shift = shiftIm(estImMFBL,shifts);
    imwrite(uint8(estImMFBL_shift),['estImMFBL_nObs',num2str(numObs(i)),'_shift.png']);
    reconstructionError_mfbl(i) = normSSE(imGT,estImMFBL_shift);
    sharpness_mfbl(i) = sum(estImMFBL(:).^4)./sum(imGT(:).^4);
    
end

figure(15)
plot(numObs,stopInd,'.-')
xlabel('Number of Input LR Images')
ylabel('Stop Iteration')

figure(16)
plot(numObs,sqrt(reconstructionError),'.-')
hold on
plot(numObs,sqrt(reconstructionError_mfbl),'.-g')
hold off
legend('POCS','MF BL','Location','SouthEast')
xlabel('Number of Input LR Images')
ylabel('Reconstruction Error (Normalized RMSE)')

figure(17)
plot(numObs,sqrt(residualError),'.-')
xlabel('Number of Input LR Images')
ylabel('Residual Error (Normalized RMSE)')

figure(18)
plot(numObs,sharpness,'.-')
hold on
plot(numObs,sharpness_mfbl,'.-g')
hold off
legend('POCS','MF BL','Location','SouthEast')
xlabel('Number of Input LR Images')
ylabel('Sharpness, S_1')
