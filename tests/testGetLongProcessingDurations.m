% This is an autogenerated sample test for file getLongProcessingDurations.m
classdef testGetLongProcessingDurations < matlab.unittest.TestCase
    
    properties 
        durations
    end

    methods (Test)

        function test_AllLong(testCase)
            % Specify the input(s) of
            % getLongProcessingDurations
            durationThreshold = seconds(0);

            % Specify the expected output(s) of
            % getLongProcessingDurations
            expected_numberOfDurations = length(testCase.durations);

            % Exercise the function getLongProcessingDurations
            [actual_numberOfDurations, ~] = getLongProcessingDurations(testCase.durations, durationThreshold);

            testCase.verifyEqual(actual_numberOfDurations, expected_numberOfDurations);
        end

        function test_NoneLong(testCase)
            % Specify the input(s) of
            % getLongProcessingDurations
            durationThreshold = max(testCase.durations)+seconds(1);

            % Specify the expected output(s) of
            % getLongProcessingDurations

            expected_numberOfDurations = 0;

            [actual_numberOfDurations,~] = getLongProcessingDurations(testCase.durations,...
                durationThreshold);

            % Exercise the function getLongProcessingDurations
            testCase.verifyEqual(actual_numberOfDurations, expected_numberOfDurations);
        end

        function test_MedianLong(testCase)
            % Specify the input(s) of
            % getLongProcessingDurations
            durationThreshold = median(testCase.durations);

            % Specify the expected output(s) of
            % getLongProcessingDurations

            expected_numberOfDurations = length(testCase.durations)/2;

            [actual_numberOfDurations,~] = getLongProcessingDurations(testCase.durations,...
                durationThreshold);

            % Exercise the function getLongProcessingDurations
            testCase.verifyEqual(actual_numberOfDurations, expected_numberOfDurations);
        end

        function test_NoDurationThresholdArgument(testCase)
            actualException = [];
            try
                getLongProcessingDurations(testCase.durations);
            catch actualException
            end
            testCase.verifyEmpty(actualException);
        end

    end
    
    methods (TestClassSetup)
        
        function durationsSetup(testCase)
            % Set up shared state for all tests.
            load timestampsCN.mat entryTimestamps exitTimestamps
            testCase.durations = exitTimestamps - entryTimestamps;
            % Tear down with testCase.addTeardown.
            testCase.addTeardown(@clear,"exitTimestamps entryTimestamps")
        end
        
    end
end