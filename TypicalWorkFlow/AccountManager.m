classdef AccountManager
    %ACCOUNTMANAGER Summary of this class goes here
    %   Detailed explanation goes here
    methods(Static)
        function assignStatus(BA)
            if BA.AccountBalance < 0
                if BA.AccountBalance < -200
                    BA.AccountStatus = 'closed';
                else
                    BA.AccountStatus = 'overdrawn';
                end
            end
        end
        function addAccount(BA)
            addlistener(BA, 'InsufficientFunds', ...
                @(src, evnt)AccountManager.assignStatus(src));
        end
    end    
end

