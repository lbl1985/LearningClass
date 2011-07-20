classdef NamedNode < dlnode
    %NAMEDNODE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Name = '';
    end
    
    methods
        function n = NamedNode(name, data)
            if nargin == 0
                name = '';
                data = [];
            end
            n = n@dlnode(data);
            n.Name = name;
        end
        
        function disp(node)
            if (isscalar(node))
                disp(['Node Name: ' node.Name]);
                disp@dlnode(node);
            else
                disp@dlnode(node);
            end
        end
    end
end

