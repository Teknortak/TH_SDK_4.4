Attribute VB_Name = "mdlPublic"
'/******************************************************************/
'/*                            Function                            */
'/******************************************************************/
Public Const gstrNoDevice = "No Device"

'/******************************************************************/
'/*                            Constant                            */
'/******************************************************************/
'//=============== Backup Number Constant ===============//
Public Const BACKUP_FP_0 = 0                  ' Finger 0
Public Const BACKUP_FP_1 = 1                  ' Finger 1
Public Const BACKUP_FP_2 = 2                  ' Finger 2
Public Const BACKUP_FP_3 = 3                  ' Finger 3
Public Const BACKUP_FP_4 = 4                  ' Finger 4
Public Const BACKUP_FP_5 = 5                  ' Finger 5
Public Const BACKUP_FP_6 = 6                  ' Finger 6
Public Const BACKUP_FP_7 = 7                  ' Finger 7
Public Const BACKUP_FP_8 = 8                  ' Finger 8
Public Const BACKUP_FP_9 = 9                  ' Finger 9
Public Const BACKUP_PSW = 10                  ' Password
Public Const BACKUP_CARD = 11                 ' Card


Public Const LOG_OPEN_DOOR = 32               ' Door Open
Public Const LOG_OPEN_THREAT = 48             ' Door Open as threat

'//=============== IOMode of GeneralLogData ===============//
Public Const LOG_IOMODE_IN = 0
Public Const LOG_IOMODE_OUT = 1
Public Const LOG_IOMODE_OVER_IN = 2    ' = LOG_IOMODE_IO
Public Const LOG_IOMODE_OVER_OUT = 3

'//=============== Error code ===============//
Public Const RUN_SUCCESS = 1
Public Const RUNERR_NOSUPPORT = 0
Public Const RUNERR_UNKNOWNERROR = -1
Public Const RUNERR_NO_OPEN_COMM = -2
Public Const RUNERR_WRITE_FAIL = -3
Public Const RUNERR_READ_FAIL = -4
Public Const RUNERR_INVALID_PARAM = -5
Public Const RUNERR_NON_CARRYOUT = -6
Public Const RUNERR_DATAARRAY_END = -7
Public Const RUNERR_DATAARRAY_NONE = -8
Public Const RUNERR_MEMORY = -9
Public Const RUNERR_MIS_PASSWORD = -10
Public Const RUNERR_MEMORYOVER = -11
Public Const RUNERR_DATADOUBLE = -12
Public Const RUNERR_MANAGEROVER = -14
Public Const RUNERR_FPDATAVERSION = -15

Function ReturnResultPrint(anResultCode As Long) As String
   Select Case anResultCode
        Case RUN_SUCCESS
            ReturnResultPrint = "Successful!"
        Case RUNERR_NOSUPPORT
            ReturnResultPrint = "No support"
        Case RUNERR_UNKNOWNERROR
            ReturnResultPrint = "Unknown error"
        Case RUNERR_NO_OPEN_COMM
            ReturnResultPrint = "No Open Comm"
        Case RUNERR_WRITE_FAIL
            ReturnResultPrint = "Write Error"
        Case RUNERR_READ_FAIL
            ReturnResultPrint = "Read Error"
        Case RUNERR_INVALID_PARAM
            ReturnResultPrint = "Parameter Error"
        Case RUNERR_NON_CARRYOUT
            ReturnResultPrint = "execution of command failed"
        Case RUNERR_DATAARRAY_END
            ReturnResultPrint = "End of data"
        Case RUNERR_DATAARRAY_NONE
            ReturnResultPrint = "Nonexistence data"
        Case RUNERR_MEMORY
            ReturnResultPrint = "Memory Allocating Error"
        Case RUNERR_MIS_PASSWORD
            ReturnResultPrint = "License Error"
        Case RUNERR_MEMORYOVER
            ReturnResultPrint = "full enrolldata & can`t put enrolldata"
        Case RUNERR_DATADOUBLE
            ReturnResultPrint = "this ID is already  existed."
        Case RUNERR_MANAGEROVER
            ReturnResultPrint = "full manager & can`t put manager."
        Case RUNERR_FPDATAVERSION
            ReturnResultPrint = "mistake fp data version."
        Case Else
            ReturnResultPrint = "Unknown error"
    End Select
End Function
