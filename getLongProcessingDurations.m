function [numberOfDurations,isLong] = getLongProcessingDurations(durations,durationThreshold)
arguments
    durations (:,1) duration
    durationThreshold (1,1) duration = std(durations)*3
end
isLong = durations>durationThreshold;
numberOfDurations = nnz(isLong);
end