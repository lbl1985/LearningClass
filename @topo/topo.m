classdef topo < handle
    %TOPO Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        FigHandle
        FofXY
        Lm = [-2 * pi 2 * pi];
    end
    
    properties (Dependent = true, SetAccess = private)
        Data
    end
    
    methods
        function obj = topo(fnc, limits)
            obj.FofXY = fnc;
            obj.Lm = limits;
        end
        function set.Lm(obj, lim)
            if ~(lim(1) < lim(2))
                error('Limits must be monotonically increasing');
            else
                obj.Lm = lim;
            end
        end
        function data = get.Data(obj)
            [x, y] = topo.grid(obj.Lm);
            matrix = obj.FofXY(x, y);
            data.X = x;
            data.Y = y;
            data.Matrix = matrix;
        end
        
        function surflight(obj)
            obj.FigHandle = figure;
            surf(obj.Data.X, obj.Data.Y, obj.Data.Matrix, ...
                'FaceColor', [.8 .8 0], 'EdgeColor', [0 .2 0], ...
                'FaceLighting', 'phong');
            camlight left; material shiny; grid off;
            colormap copper
        end
        
        function delete(obj)
            h = obj.FigHandle;
            if ishandle(h)
                delete(h);
            else
                return
            end
        end
    end
    
    methods (Static = true)
        function [x, y] = grid(lim)
            inc = (lim(2) - lim(1))/ 35;
            [x, y] = meshgrid(lim(1):inc : lim(2));
        end
    end
end

