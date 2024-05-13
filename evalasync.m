function out = evalasync(str)
%EVALASYNC Asynchronous version of eval (kind of)
%
% evalasync(str)  % evals code in str
% evalasync()     % gets results of previous call

persistent results status exception

if nargin == 0
    out = {status results exception}; % GetWorkspaceData doesn't like structs
    assignin('base', 'EVALASYNC_RESULTS', out); % HACK for Automation
    return
end

status = 'waiting';
    function wrapper(varargin)
        status = 'running';
        try
            results = eval(str);
            status = 'ok';
        catch err
            status = 'error';
            exception = err;
        end
    end

t = timer('Tag','evalasync', 'TimerFcn',@wrapper);
startat(t, now + (.2 / (60*60*24)));

end
