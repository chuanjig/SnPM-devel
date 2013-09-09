function snpmui = snpm_bch_ui_TwoSampPairT
% Example script that creates an cfg_exbranch to sum two numbers. The
% inputs are entered as two single numbers, the output is just a single
% number.
%
% This code is part of a batch job configuration system for MATLAB. See 
%      help matlabbatch
% for a general overview.
%_______________________________________________________________________
% Copyright (C) 2007 Freiburg Brain Imaging

% Volkmar Glauche
% $Id: cfg_example_add1.m 1716 2008-05-23 08:18:45Z volkmar $

snpm_defaults 

rev = '$Rev: 1716 $'; %#ok

DesNm = '2 Groups: Test diff of response; 2 conditions, 1 scan per condition';
DesFile = mfilename;
DesHelp = {'',...
	  'stuff.',...
	  '',...
	  'stuff ',...
	  '    stuff',...
	  'stuff.',...
	  };

%% Questions


% Number of Covariates
cv_none         = cfg_const;
cv_none.tag     = 'cv_none';
cv_none.name    = 'None';
cv_none.val     = {1};
cv_none.help    = {'Covariate value = none'};

cov_Val         = cfg_entry;
cov_Val.tag     = 'cov_Val';
cov_Val.name    = 'Covariate';%arbitary name
cov_Val.help    = {'Help'};
cov_Val.strtype = 'e';
cov_Val.num     = [1 Inf];

cv_one         = cfg_branch;
cv_one.tag     = 'cv_one';
cv_one.name    = 'Enter Different Covariate Value';
cv_one.val     = {cov_Val};
cv_one.help    = {'Help'};

covariate         = cfg_choice;
covariate.tag     = 'covariate';
covariate.name    = 'Covariate Value'; %arbitary name
covariate.val     = {cv_none };
covariate.help    = {'Help'};
covariate.values  = {cv_none cov_Val };


%% Executable Branch
snpmui = snpm_bch_ui(DesNm,DesFile,DesHelp,{covariate});
