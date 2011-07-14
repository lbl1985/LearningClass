function writeClassFile(classname, superclass)
fw = Filewriter([classname '.m']);
if nargin > 1
    fw.writeToFile(['classdef ' classname ' < ' superclass]);
else
    fw.writeToFile(['classdef ' classname]);
end

fw.writeToFile('    properties ')
fw.writeToFile(' ')
fw.writeToFile('    end % properties')
fw.writeToFile(' ')
fw.writeToFile('    method ')
fw.writeToFile(['     function obj = ' classname '()'])
fw.writeToFile(' ')
fw.writeToFile('        end')
fw.writeToFile('    end % methods')
fw.writeToFile('end % classdef')
delete(fw)
end