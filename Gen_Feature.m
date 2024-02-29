LoadFeature
load("DataInfo.mat");
load("VS.mat")
% Define the feature list
VFeatureList = {"VchS1","VchS2","VchS3","VchS4","VchS5","VchS6","VchS7","VchS8","VchS9"};
QFeatureList = {"QchS1","QchS2","QchS3","QchS4","QchS5","QchS6","QchS7","QchS8","QchS9"};
Cnom = 1.15;
CList = [0.33,3,2.9,2.8,2.4,2,1.8,1.4,0.33];
RPTCycleListT25 = [100,300,400,500,600,800,1000,1200];
RPTCycleListT35 = [100,300,400,500,600,700,900,1100];
RPTCycleListT45 = [100,300,400,500,600,700,900];
RPTCycleListT55 = [100,300,400,500,600,700];
Features = struct(); % Initialize cLabel as an empty struct
numCyclesList = [repmat(1300,18,1)',repmat(1100,7,1)',repmat(900,7,1)'];
numPts = 9;

for i = 1:length(matfiles.ID)
    % Print the progress
    fprintf('BAT: %d/%d processed\n', i, length(matfiles.ID));

    numCycles = numCyclesList(i);
    feaMatrixName = ['B' num2str(matfiles.ID(i)) 'T' num2str(matfiles.Temperature(i))];
    feaMatrix = []; % Initialize matrix with zeros

    % Determine which RPTCycleList to use based on temperature
    temp = matfiles.Temperature(i);
    switch temp
        case 25
            RPTCycleList = RPTCycleListT25;
        case 35
            RPTCycleList = RPTCycleListT35;
        case 45
            RPTCycleList = RPTCycleListT45;
        case 55
            RPTCycleList = RPTCycleListT55;
        otherwise
            RPTCycleList = [];
    end

    for k = 1:numCycles-1

        % Check if k is in RPTCycleList, if yes delete and refill with the previous content
        if ismember(k, RPTCycleList)
            if k > 1
                feaMatrix(k,:) = feaMatrix(k-1,:);
                continue;
            else
                continue; % Skip the first cycle if it's to be deleted
            end
        end

        % temperature (T)
        feaMatrix(k,1) = matfiles.Temperature(i);
        % Cutting voltage for charging (U1-U9)
        feaMatrix(k,2:10) = VS(i,:);
        % Voltage changing from S8 to S9 (VC89)
        feaMatrix(k,11) = VchS9{i, 1}(k+1,1)-VchS8{i, 1}(k+1,end);
        % Voltage drop in S9 (VD9)
        feaMatrix(k,12) = VchS9{i, 1}(k+1,1)-min(VchS9{i, 1}(k+1,:));
        % Voltage drop time in S9 (tVD9)
        [~,tID] = min(VchS9{i, 1}(k+1,:));
        tList = tchS9{i, 1}(k+1,:);
        feaMatrix(k,13) = tList(tID); 
        % Voltage changing from S9 to Rest (ReVC)
        feaMatrix(k,14) = VchS9{i, 1}(k+1,end)-ReVch{i, 1}(k+1,1);
        % Voltage drop in Rest (ReVD)
        feaMatrix(k,15) = ReVch{i, 1}(k+1,1)-min(ReVch{i, 1}(k+1,:));
        % rest-IR drop time (tReVD)
        Vdelta = feaMatrix(k,15);
        treshold = ReVch{i, 1}(k+1,1)-0.8*Vdelta;
        [~,tID] = min(abs(ReVch{i, 1}(k+1,:)-treshold));
        tList = Retch{i, 1}(k+1,:);
        feaMatrix(k,16) = tList(tID);
        % Voltage gradient from S1 to S9 (Vg1-Vg9)
        feaMatrix(k,17) =  mean(calculate_slopes(VchS1{i, 1}(k+1,:)));
        feaMatrix(k,18) =  mean(calculate_slopes(VchS2{i, 1}(k+1,:)));
        feaMatrix(k,19) =  mean(calculate_slopes(VchS3{i, 1}(k+1,:)));
        feaMatrix(k,20) =  mean(calculate_slopes(VchS4{i, 1}(k+1,:)));
        feaMatrix(k,21) =  mean(calculate_slopes(VchS5{i, 1}(k+1,:)));
        feaMatrix(k,22) =  mean(calculate_slopes(VchS6{i, 1}(k+1,:)));
        feaMatrix(k,23) =  mean(calculate_slopes(VchS7{i, 1}(k+1,:)));
        feaMatrix(k,24) =  mean(calculate_slopes(VchS8{i, 1}(k+1,:)));
        [~,tID] = min(VchS9{i, 1}(k+1,:));
        tList = tchS9{i, 1}(k+1,:);
        feaMatrix(k,25) =  mean(calculate_slopes(VchS9{i, 1}(k+1,1:tID)));
        % Voltage gradient ratio between S1 and S2 (Rvg)
        feaMatrix(k,26) =  mean(calculate_slopes(VchS2{i, 1}(k+1,:)))/mean(calculate_slopes(VchS1{i, 1}(k+1,:)));
        % Charging capacity from S1 to S9 (Q1-Q9)
        feaMatrix(k,27) = QchS1{i, 1}(k+1,end);
        feaMatrix(k,28) = QchS2{i, 1}(k+1,end);
        feaMatrix(k,29) = QchS3{i, 1}(k+1,end);
        feaMatrix(k,30) = QchS4{i, 1}(k+1,end);
        feaMatrix(k,31) = QchS5{i, 1}(k+1,end);
        feaMatrix(k,32) = QchS6{i, 1}(k+1,end);
        feaMatrix(k,33) = QchS7{i, 1}(k+1,end);
        feaMatrix(k,34) = QchS8{i, 1}(k+1,end);
        feaMatrix(k,35) = QchS9{i, 1}(k+1,end);
        % DC resistance from S1 to S9, merged resistance (RL1-RL9)
        feaMatrix(k,36) = (VchS1{i, 1}(k+1,end) - VchS1{i, 1}(k+1,1))/...
                            ((3600*QchS1{i, 1}(k+1,end)/tchS1{i, 1}(k+1,end)));
        feaMatrix(k,37) = (VchS2{i, 1}(k+1,end) - VchS2{i, 1}(k+1,1))/...
                            ((3600*QchS2{i, 1}(k+1,end)/tchS2{i, 1}(k+1,end)));
        feaMatrix(k,38) = (VchS3{i, 1}(k+1,end) - VchS3{i, 1}(k+1,1))/...
                            ((3600*QchS3{i, 1}(k+1,end)/tchS3{i, 1}(k+1,end)));
        feaMatrix(k,39) = (VchS4{i, 1}(k+1,end) - VchS4{i, 1}(k+1,1))/...
                            ((3600*QchS4{i, 1}(k+1,end)/tchS4{i, 1}(k+1,end)));
        feaMatrix(k,40) = (VchS5{i, 1}(k+1,end) - VchS5{i, 1}(k+1,1))/...
                            ((3600*QchS5{i, 1}(k+1,end)/tchS5{i, 1}(k+1,end)));
        feaMatrix(k,41) = (VchS6{i, 1}(k+1,end) - VchS6{i, 1}(k+1,1))/...
                            ((3600*QchS6{i, 1}(k+1,end)/tchS6{i, 1}(k+1,end)));
        feaMatrix(k,42) = (VchS7{i, 1}(k+1,end) - VchS7{i, 1}(k+1,1))/...
                            ((3600*QchS7{i, 1}(k+1,end)/tchS7{i, 1}(k+1,end)));
        feaMatrix(k,43) = (VchS8{i, 1}(k+1,end) - VchS8{i, 1}(k+1,1))/...
                            ((3600*QchS8{i, 1}(k+1,end)/tchS8{i, 1}(k+1,end)));
        feaMatrix(k,44) = (VchS9{i, 1}(k+1,end) - VchS9{i, 1}(k+1,1))/...
                            ((3600*QchS9{i, 1}(k+1,end)/tchS9{i, 1}(k+1,end)));
        % ohmic resistance from S1 to S9 (RO1-RO8)
        feaMatrix(k,45) = (VchS2{i, 1}(k+1,1)-VchS1{i, 1}(k+1,end))/...
                            ((3600*QchS2{i, 1}(k+1,end)/tchS2{i, 1}(k+1,end))-...
                            (3600*QchS1{i, 1}(k+1,end)/tchS1{i, 1}(k+1,end)));
        feaMatrix(k,46) = (VchS3{i, 1}(k+1,1)-VchS2{i, 1}(k+1,end))/...
                            ((3600*QchS3{i, 1}(k+1,end)/tchS3{i, 1}(k+1,end))-...
                            (3600*QchS2{i, 1}(k+1,end)/tchS2{i, 1}(k+1,end)));
        feaMatrix(k,47) = (VchS4{i, 1}(k+1,1)-VchS3{i, 1}(k+1,end))/...
                            ((3600*QchS4{i, 1}(k+1,end)/tchS4{i, 1}(k+1,end))-...
                            (3600*QchS3{i, 1}(k+1,end)/tchS3{i, 1}(k+1,end)));
        feaMatrix(k,48) = (VchS5{i, 1}(k+1,1)-VchS4{i, 1}(k+1,end))/...
                            ((3600*QchS5{i, 1}(k+1,end)/tchS5{i, 1}(k+1,end))-...
                            (3600*QchS4{i, 1}(k+1,end)/tchS4{i, 1}(k+1,end)));
        feaMatrix(k,49) = (VchS6{i, 1}(k+1,1)-VchS5{i, 1}(k+1,end))/...
                            ((3600*QchS6{i, 1}(k+1,end)/tchS6{i, 1}(k+1,end))-...
                            (3600*QchS5{i, 1}(k+1,end)/tchS5{i, 1}(k+1,end)));
        feaMatrix(k,50) = (VchS7{i, 1}(k+1,1)-VchS6{i, 1}(k+1,end))/...
                            ((3600*QchS7{i, 1}(k+1,end)/tchS7{i, 1}(k+1,end))-...
                            (3600*QchS6{i, 1}(k+1,end)/tchS6{i, 1}(k+1,end)));
        feaMatrix(k,51) = (VchS8{i, 1}(k+1,1)-VchS7{i, 1}(k+1,end))/...
                            ((3600*QchS8{i, 1}(k+1,end)/tchS8{i, 1}(k+1,end))-...
                            (3600*QchS7{i, 1}(k+1,end)/tchS7{i, 1}(k+1,end)));
        feaMatrix(k,52) = (VchS9{i, 1}(k+1,1)-VchS8{i, 1}(k+1,end))/...
                            ((3600*QchS9{i, 1}(k+1,end)/tchS9{i, 1}(k+1,end))-...
                            (3600*QchS8{i, 1}(k+1,end)/tchS8{i, 1}(k+1,end)));
    end
    windowSize = 20; % Define the size of the moving window
    smoothedFeaMatrix = movmean(feaMatrix, windowSize, 1);
    Features.(feaMatrixName) = smoothedFeaMatrix;
end

clearvars -except Features
save("Features","Features")

OutData
