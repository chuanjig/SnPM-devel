% Perform non-regression tests on 1 subject, 2 conditions tests in SnPM. 
% Check that results obtained using the batch version are identical to the 
% results computed manually (using the interactive GUI).
%_______________________________________________________________________
% Copyright (C) 2013 The University of Warwick
% Id: test_onesub_twocondrepl.m  SnPM13 2013/10/12
% Camille Maumet
classdef test_onesub_twocondrepl < generic_test_snpm
    properties
    end
    
    methods (TestMethodSetup)
        function create_basis_matlabbatch(testCase)
            testCase.compaWithSpm = false;
            
            % Fill the design part in the batch
            testCase.matlabbatch{1}.spm.tools.snpm.des.TwoSampTss.P = {
                 fullfile(testCase.testDataDir, 'PET_motor', 's8np01160em01R.img,1')
                 fullfile(testCase.testDataDir, 'PET_motor', 's8np01160em02R.img,1')
                 fullfile(testCase.testDataDir, 'PET_motor', 's8np01160em03R.img,1')
                 fullfile(testCase.testDataDir, 'PET_motor', 's8np01160em04R.img,1')
                 fullfile(testCase.testDataDir, 'PET_motor', 's8np01160em05R.img,1')
                 fullfile(testCase.testDataDir, 'PET_motor', 's8np01160em06R.img,1')
                 fullfile(testCase.testDataDir, 'PET_motor', 's8np01160em07R.img,1')
                 fullfile(testCase.testDataDir, 'PET_motor', 's8np01160em08R.img,1')
                 fullfile(testCase.testDataDir, 'PET_motor', 's8np01160em09R.img,1')
                 fullfile(testCase.testDataDir, 'PET_motor', 's8np01160em10R.img,1')
                 fullfile(testCase.testDataDir, 'PET_motor', 's8np01160em11R.img,1')
                 fullfile(testCase.testDataDir, 'PET_motor', 's8np01160em12R.img,1')
                 };
            testCase.matlabbatch{1}.spm.tools.snpm.des.TwoSampTss.condidx = [1 2 1 2 1 2 1 2 1 2 1 2];
            testCase.matlabbatch{1}.spm.tools.snpm.des.TwoSampTss.Tss_repc = 6;
            testCase.matlabbatch{1}.spm.tools.snpm.des.TwoSampTss.TwosampTss_Block = 4;
        end
    end
    
    methods (Test)
        % No covariate, no variance smoothing
        function test_onesub_twocondrepl_1(testCase)
            % Nominal test
            testCase.testName = 'onesub_twocondrepl_1';
        end
        
        % No covariate, no variance smoothing
        function test_onesub_twocondrepl_1_other_design(testCase)
            % Nominal test with alternative design
            testCase.testName = 'onesub_twocondrepl_1_other_design';
            % Discard last two volumes
            testCase.matlabbatch{1}.spm.tools.snpm.des.TwoSampTss.P(end) = [];
            testCase.matlabbatch{1}.spm.tools.snpm.des.TwoSampTss.P(end) = [];
            % Change conditions
            testCase.matlabbatch{1}.spm.tools.snpm.des.TwoSampTss.condidx = [1 2 1 2 1 2 1 2 1 2];
            % Change number of replications
            testCase.matlabbatch{1}.spm.tools.snpm.des.TwoSampTss.Tss_repc = 5;
            % Change exchangeability block size
            testCase.matlabbatch{1}.spm.tools.snpm.des.TwoSampTss.TwosampTss_Block = 10;
        end

        % With variance smoothing
        function test_onesub_twocondrepl_var(testCase)
            testCase.testName = 'onesub_twocondrepl_var';
            
            testCase.matlabbatch{1}.spm.tools.snpm.des.TwoSampTss.vFWHM = [12 12 12];
        end
    end
    
    methods (TestMethodTeardown)
        function complete_batch(testCase)
            % Find the result directory for the batch execution and the
            % corresponding result directory computed manually using the
            % original spm2-like interface
            testCase.batchResDir = fullfile(testCase.parentDataDir, 'results', 'batch', testCase.testName);
            testCase.matlabbatch{1}.spm.tools.snpm.des.TwoSampTss.dir = {testCase.batchResDir};
        end
    end
end