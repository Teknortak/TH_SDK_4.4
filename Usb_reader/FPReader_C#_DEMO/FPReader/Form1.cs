using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using System.Data.OleDb;
using System.Runtime.InteropServices;
using System.IO;

namespace FPReader
{
    public partial class Form1 : Form
    {
        string strFPImagepath;
        OleDbConnection myAccessConn;

        public Form1()
        {
            InitializeComponent();
            Message.Text = "TIMMY DEMO";

            strFPImagepath = System.Environment.CurrentDirectory;
            strFPImagepath += "\\test.bmp";
            
//             pictureBox.Load(strFPImagepath);
//             pictureBox.Show();

            TB_ID.Text = "2";
            TB_FP_NUM.Text = "0";
            TB_Privilege.Text = "0";

            
        }

        private void detectDevice()
        {
            bool bRet;
            do
            {
                bRet = axFpreader1.DetectFinger();
                if (bRet)
                {
                    break;
                }
            } while (true); 
        }

        private void showFPPicture()
        {
            FileStream fs = new FileStream(strFPImagepath, FileMode.Open, FileAccess.Read);
            pictureBox.Image = Image.FromStream(fs);
            pictureBox.Show();
            pictureBox.Refresh();
            fs.Close();
        }

        private void EnrollFP_Click(object sender, EventArgs e)
        {

            bool bRet;
            int verIndex = 0;
            string strVersion = "";

            bRet = axFpreader1.ConnectUsb();
            if (!bRet)
            {

                Message.Text = "No device";
                Message.Update();

                return;
            }

            bRet = axFpreader1.GetVersion(ref verIndex, ref strVersion);
            if (!bRet)
            {
                Message.Text = "No device";
                Message.Update();

                return;
            }

            axFpreader1.OnoffLED(1);  //enable
            Message.Text = "press finger 1#";
            Message.Update();

            detectDevice();


            bRet = axFpreader1.GetImage(strFPImagepath);
            if (bRet)
            {
                showFPPicture();
                
            }
            else
            {
                Message.Text = "Get image fail";
                Message.Update();

                CloseDevice();
            }

            bRet = axFpreader1.GetTemplet(0);
            if (!bRet)
            {
                Message.Text = "Get Templet Fail";
                Message.Update();

                CloseDevice();
                return;
            }

            //int dwEMachineNumber;
            //int dwEnrollNumber;
            int dwFingerNumber;
            //int dwPrivilege;
            int[] dwData = new int[1420 / 4 * 5 + 4];
            byte[] byteData = new byte[2000];
            object obj;

            object objFPData = 0;
            int length;
            string str;

            OpenDB();
            string strAccessSelect = "SELECT * FROM tblEnroll";
            OleDbCommand myAccessCommand = new OleDbCommand(strAccessSelect, myAccessConn);
            OleDbDataAdapter myDataAdapter = new OleDbDataAdapter(myAccessCommand);
            DataSet myDataSet = new DataSet();

            myDataAdapter.Fill(myDataSet, "Categories");

            DataRowCollection dra = myDataSet.Tables["Categories"].Rows;
            if (dra.Count == 0)
            {
                Message.Text = "FP DataBase is empty.";
                Message.Update();                
                goto SKIP;
            }
            
            // check duplicated FPData
            foreach (DataRow dr in dra)
            {
                dwFingerNumber = (int)dr["FingerNumber"];
                str = dr["FPData"].GetType().ToString();
                if (str == "System.DBNull")
                {
                    length = 0;
                }
                else
                {
                    objFPData = dr["FPData"];
                    byteData = (byte[])objFPData;
                    length = byteData.Length;

                }

                if (dwFingerNumber < 10 && length != 0)
                {
                    for (int i = 0; i < 1420 / 4; i++)
                    {
                        dwData[i] = byteData[i * 5 + 1];
                        dwData[i] = dwData[i] * 256 + byteData[i * 5 + 2];
                        dwData[i] = dwData[i] * 256 + byteData[i * 5 + 3];
                        dwData[i] = dwData[i] * 256 + byteData[i * 5 + 4];
                        if (byteData[i * 5] == 0)
                        {
                            dwData[i] = ~dwData[i] + 1;
                        }

                    }
                    obj = new System.Runtime.InteropServices.VariantWrapper(dwData);
                    bRet = axFpreader1.VerifyFinger(ref obj);
                    if (bRet)
                    {
                        Message.Text = "FP DOUBLE";  // duplicate
                        Message.Update();
                        CloseDevice();
                        CloseDB();
                        return;
                    }
                } // if


            } // foreach
         
SKIP:
            CloseDB();

            Message.Text = "press figer 2 #";
            Message.Update();

            detectDevice();

            bRet = axFpreader1.GetImage(strFPImagepath);
            if (bRet)
            {

                showFPPicture();
            }
            else
            {
                Message.Text = "Get image fail";
                Message.Update();

                CloseDevice();
                return;
            }

            axFpreader1.GetTemplet(1);
            if (!bRet)
            {
                Message.Text = "Get Templet Fail";
                Message.Update();

                CloseDevice();
                return;
            }

            if (verIndex == 1)
            {
                Message.Text = "press figer 3 #";
                Message.Update();

                detectDevice();

                bRet = axFpreader1.GetImage(strFPImagepath);
                if (bRet)
                {

                    showFPPicture();
                }
                else
                {
                    Message.Text = "Get image fail";
                    Message.Update();

                    CloseDevice();
                    return;
                }

                bRet = axFpreader1.GetTemplet(2);
                if (!bRet)
                {
                    Message.Text = "Get Templet Fail";
                    Message.Update();

                    CloseDevice();
                    return;
                }

            }  // if (verIndex == 1)

            obj = new System.Runtime.InteropServices.VariantWrapper(dwData);
            bRet = axFpreader1.GetMergeChar(ref obj);
            if(bRet == false)
            {
                Message.Text = "MergeChar Error";
                Message.Update();

                CloseDevice();
                return;
            }

            int[] temp = (int[])obj;
            Array.Copy(temp, dwData, temp.Length);

            byte[] byteFPData = new byte[1420 / 4 * 5 + 1];

            ////////////////////////////////////////////////////////////////////////////////

            for(int i = 0; i < 1420 / 4; i++)
            {
                byteFPData[i * 5] = 1;
                if(dwData[i] < 0)
                {
                    byteFPData[i * 5] = 0;
                    dwData[i] = Math.Abs(dwData[i]);
                }

                byteFPData[i * 5 + 1] = (byte)(dwData[i] / (1 << 24));
                byteFPData[i * 5 + 2] = (byte)((dwData[i] / (1 << 16)) % 256);
                byteFPData[i * 5 + 3] = (byte)((dwData[i] / (1 << 8)) % 256);
                byteFPData[i * 5 + 4] = (byte)(dwData[i] % 256);
            }

            OleDbParameter[] parameters = new OleDbParameter[6];
            int index = 0;
            parameters[index] = new OleDbParameter("@EMachineNumber", OleDbType.Integer);
            parameters[index].Value = 1;
            index++;

            parameters[index] = new OleDbParameter("@EnrollNumber", OleDbType.Integer);
            parameters[index].Value = Int32.Parse(TB_ID.Text.ToString());
            index++;

            parameters[index] = new OleDbParameter("@FingerNumber", OleDbType.Integer);
            parameters[index].Value = Int32.Parse(TB_FP_NUM.Text.ToString());
            index++;

            parameters[index] = new OleDbParameter("@Privilige", OleDbType.Integer);
            parameters[index].Value = Int32.Parse(TB_Privilege.Text.ToString());
            index++;

            parameters[index] = new OleDbParameter("@enPassword", OleDbType.Integer);
            parameters[index].Value = 0;
            index++;

            parameters[index] = new OleDbParameter("@FPData", OleDbType.Binary);
            parameters[index].Value = byteFPData;   //accept byte[]
            index++;

//             parameters[index] = new OleDbParameter("@EnrollName", OleDbType.BSTR);
//             parameters[index].Value = "";   //accept byte[]
//             index++;
// 
//             parameters[index] = new OleDbParameter("@FPData_Str", OleDbType.BSTR);
//             parameters[index].Value = 0;   //accept byte[]

            OpenDB();
            string sqlEx = "insert into tblEnroll(EMachineNumber,EnrollNumber,FingerNumber,Privilige,enPassword,FPData)" +
                        "values(@EMachineNumber,@EnrollNumber,@FingerNumber,@Privilige,?,@FPData)";
            
            OleDbCommand cmd = new OleDbCommand(sqlEx, myAccessConn);
            try
            {
                //conn.Open();
                if (parameters != null)
                {
                    cmd.Parameters.AddRange(parameters);
                }
                cmd.ExecuteNonQuery();

            }
           
            catch (OleDbException eDB)
            {
                string errorMessages = "";

                for (int i = 0; i < eDB.Errors.Count; i++)
                {
                    errorMessages += "Index #" + i + "\n" +
                                     "Message: " + eDB.Errors[i].Message + "\n" +
                                     "NativeError: " + eDB.Errors[i].NativeError + "\n" +
                                     "Source: " + eDB.Errors[i].Source + "\n" +
                                     "SQLState: " + eDB.Errors[i].SQLState + "\n";
                }

                System.Diagnostics.EventLog log = new System.Diagnostics.EventLog();
                log.Source = "My Application";
                log.WriteEntry(errorMessages);
                Console.WriteLine("An exception occurred. Please contact your system administrator.");

                CloseDB();

                Message.Text = "fail to manipulate DB..... ";
                Message.Update();
                return;
            }
            catch (Exception ec)
            {
                throw ec;
            }

            CloseDB();

            Message.Text = "added new FPData to DB..... ";
            Message.Update();

        }

        private void EnrollFPWithStr_Click(object sender, EventArgs e)
        {
            bool bRet;
            int verIndex = 0;
            string strVersion = "";

            bRet = axFpreader1.ConnectUsb();
            if (!bRet)
            {

                Message.Text = "No device";
                Message.Update();

                return;
            }

            bRet = axFpreader1.GetVersion(ref verIndex, ref strVersion);
            if (!bRet)
            {
                Message.Text = "No device";
                Message.Update();

                return;
            }

            axFpreader1.OnoffLED(1);  //enable
            Message.Text = "press finger 1#";
            Message.Update();

            detectDevice();


            bRet = axFpreader1.GetImage(strFPImagepath);
            if (bRet)
            {
                showFPPicture();

            }
            else
            {
                Message.Text = "Get image fail";
                Message.Update();

                CloseDevice();
            }

            bRet = axFpreader1.GetTemplet(0);
            if (!bRet)
            {
                Message.Text = "Get Templet Fail";
                Message.Update();

                CloseDevice();
                return;
            }

            /////////////////////////////////////check DB/////////////////////////////////////
            OpenDB();
            string strAccessSelect = "SELECT * FROM tblEnroll";
            OleDbCommand myAccessCommand = new OleDbCommand(strAccessSelect, myAccessConn);
            OleDbDataAdapter myDataAdapter = new OleDbDataAdapter(myAccessCommand);
            DataSet myDataSet = new DataSet();

            myDataAdapter.Fill(myDataSet, "Categories");
            DataRowCollection dra = myDataSet.Tables["Categories"].Rows;
            if (dra.Count == 0)
            {
                Message.Text = "FP DataBase is empty.";
                Message.Update();
                goto jumpNext;
            }

            int dwFingerNumber;
            string str;
            object objFPData;
            byte[] byteData = new byte[2000];
            string strFPData;

            foreach (DataRow dr in dra)
            {
                dwFingerNumber = (int)dr["FingerNumber"];
                str = dr["FPData_Str"].GetType().ToString();
                if (str == "System.DBNull")
                {
                    continue;
                }
                else
                {
                    objFPData = dr["FPData_Str"];
                    if (objFPData.ToString() == "")  // this can be happen
                    {
                        continue;
                    }
                    strFPData = (string)objFPData;
                }

                if (dwFingerNumber < 10 )
                {
                    bRet = axFpreader1.VerifyFingerWithstring(ref strFPData);
                    if (bRet)
                    {
                        Message.Text = "FP DOUBLE";  // duplicate
                        Message.Update();
                        CloseDevice();
                        CloseDB();
                        return;
                    }

                }

            } // foreach

        jumpNext:
            CloseDB();

            Message.Text = "press figer 2 #";
            Message.Update();

            detectDevice();

            bRet = axFpreader1.GetImage(strFPImagepath);
            if (bRet)
            {

                showFPPicture();
            }
            else
            {
                Message.Text = "Get image fail";
                Message.Update();

                CloseDevice();
                return;
            }

            axFpreader1.GetTemplet(1);
            if (!bRet)
            {
                Message.Text = "Get Templet Fail";
                Message.Update();

                CloseDevice();
                return;
            }

            if (verIndex == 1)
            {
                Message.Text = "press figer 3 #";
                Message.Update();

                detectDevice();

                bRet = axFpreader1.GetImage(strFPImagepath);
                if (bRet)
                {

                    showFPPicture();
                }
                else
                {
                    Message.Text = "Get image fail";
                    Message.Update();

                    CloseDevice();
                    return;
                }

                bRet = axFpreader1.GetTemplet(2);
                if (!bRet)
                {
                    Message.Text = "Get Templet Fail";
                    Message.Update();

                    CloseDevice();
                    return;
                }

            }  // if (verIndex == 1)

            ////////////////////////////get merged data//////////////////////////////////////////////
            string strInfo = "";
           
            bRet = axFpreader1.GetMergeCharWithstring(ref strInfo);
            if (!bRet)
            {
                Message.Text = "MergeChar Error";
                Message.Update();

                CloseDevice();
                return;
            }

            OleDbParameter[] parameters = new OleDbParameter[6];
            int index = 0;
            parameters[index] = new OleDbParameter("@EMachineNumber", OleDbType.Integer);
            parameters[index].Value = 1;
            index++;

            parameters[index] = new OleDbParameter("@EnrollNumber", OleDbType.Integer);
            parameters[index].Value = Int32.Parse(TB_ID.Text.ToString());
            index++;

            parameters[index] = new OleDbParameter("@FingerNumber", OleDbType.Integer);
            parameters[index].Value = Int32.Parse(TB_FP_NUM.Text.ToString());
            index++;

            parameters[index] = new OleDbParameter("@Privilige", OleDbType.Integer);
            parameters[index].Value = Int32.Parse(TB_Privilege.Text.ToString());
            index++;

            parameters[index] = new OleDbParameter("@enPassword", OleDbType.Integer);
            parameters[index].Value = 0;
            index++;

//             parameters[index] = new OleDbParameter("@FPData", OleDbType.Binary);
//             parameters[index].Value = byteFPData;   //accept byte[]
//             index++;

//             parameters[index] = new OleDbParameter("@EnrollName", OleDbType.BSTR);
//             parameters[index].Value = "";   //accept byte[]
//             index++;

            parameters[index] = new OleDbParameter("@FPData_Str", OleDbType.BSTR);
            parameters[index].Value = strInfo;   //accept byte[]

            OpenDB();
            string sqlEx = "insert into tblEnroll(EMachineNumber,EnrollNumber,FingerNumber,Privilige,enPassword,FPData_Str)" +
                        "values(@EMachineNumber,@EnrollNumber,@FingerNumber,@Privilige,?,@FPData_Str)";

            OleDbCommand cmd = new OleDbCommand(sqlEx, myAccessConn);
            try
            {
                //conn.Open();
                if (parameters != null)
                {
                    cmd.Parameters.AddRange(parameters);
                }
                cmd.ExecuteNonQuery();

            }

            catch (OleDbException eDB)
            {
                string errorMessages = "";

                for (int i = 0; i < eDB.Errors.Count; i++)
                {
                    errorMessages += "Index #" + i + "\n" +
                                     "Message: " + eDB.Errors[i].Message + "\n" +
                                     "NativeError: " + eDB.Errors[i].NativeError + "\n" +
                                     "Source: " + eDB.Errors[i].Source + "\n" +
                                     "SQLState: " + eDB.Errors[i].SQLState + "\n";
                }

                System.Diagnostics.EventLog log = new System.Diagnostics.EventLog();
                log.Source = "My Application";
                log.WriteEntry(errorMessages);
                Console.WriteLine("An exception occurred. Please contact your system administrator.");
            }
            catch (Exception ec)
            {
                throw ec;
            }

            CloseDB();

            Message.Text = "added new FPDataString to DB..... ";
            Message.Update();

        }

        private void CloseDevice()
        {
            bool bRet;

            bRet = axFpreader1.OnoffLED(0);
            bRet = axFpreader1.DisConnectUsb();
        }
        
        private void OpenDB()
        {            
            string strConnection = @"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=.\EnrollData.mdb";
            myAccessConn = new OleDbConnection(strConnection);
            myAccessConn.Open();

            if (myAccessConn.State != ConnectionState.Open)
            {
                MessageBox.Show("Access数据库的连接失败!", "Access数据库的连接");
                return;
            }
        }

        private void CloseDB()
        {
            if (myAccessConn.State == ConnectionState.Open)
            {
                myAccessConn.Close();
            }
        }

        // delete all data in DB
        private void button3_Click(object sender, EventArgs e)
        {
            DialogResult dr;
            dr = MessageBox.Show("Continue?", "Delete All data in database? ", MessageBoxButtons.YesNo, MessageBoxIcon.Asterisk);
            if (dr == DialogResult.No)
            {
                return;
            }
            OpenDB();

            string sql = "delete * from tblEnroll";
            OleDbCommand cmd = new OleDbCommand(sql, myAccessConn);

            try
            {                
                cmd.ExecuteNonQuery();
            }
            catch (Exception ec)
            {
                throw ec;
            }
            CloseDB();


            Message.Text = "deleted all data in DB..... ";
            Message.Update();
        }

        private void btn_setmonitor_Click(object sender, EventArgs e)
        {
            bool bRet;
            int verIndex = 0;
            string strVersion = "";

            bRet = axFpreader1.ConnectUsb();
            bRet = axFpreader1.SetMonitorMode(10);
            Message.Text = "setmonitormode ok ";
            Message.Update();
            CloseDevice();
        }
    }
}
