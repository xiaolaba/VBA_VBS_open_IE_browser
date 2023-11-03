
set src1="%cd%\WIN10_22H2_19405.3348_ieframe.dll"

set src2="%cd%\WIN10_22H2_19405.3636_ieframe.dll"

set system32=system32
set syswow64=syswow64

set dll=ieframe.inc

fc %src1%\%system32%\%dll% %src2%\%system32%\%dll%
fc %src1%\%syswow64%\%dll% %src2%\%syswow64%\%dll%

fc %src1%\%system32%\%dll% %src2%\%syswow64%\%dll%

pause