_addon.author   = 'Almavivaconte';
_addon.name     = 'shruggie';
_addon.version  = '0.0.1';

require 'common'

ashita.register_event('outgoing_text', function(mode, message, modifiedmode, modifiedmessage, blocked)
    if string.contains(message, "%shrug") then
        outstr = [[\x81\x50\x5c\x5f\x28\x83\x63\x29\x5f\x2f\x81\x50]]
        --outstr = [[\x01\x02\x03\x04\x05\x06\x07\x08\x09\x10\x11\x12]]
        outstr = outstr:gsub("\\x(%x%x)",function (x) return string.char(tonumber(x,16)) end);
        return ashita.regex.replace(message, "%shrug", outstr);
    end
    return false;
end);