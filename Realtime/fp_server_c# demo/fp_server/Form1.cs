using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace fp_server
{
    public partial class Form1 : Form
    {
        private int nIndex = 0;       

        public Form1()
        {
            InitializeComponent();
            this.connect.Enabled = true;
            this.Disconnect.Enabled = false;

            this.textPort.Text = "7005";

            this.listView1.Columns.Add(" ", 40, HorizontalAlignment.Left);          //一步添加
            this.listView1.Columns.Add("EnrollNo", 100, HorizontalAlignment.Left); 
            this.listView1.Columns.Add("VerifyMode", 100, HorizontalAlignment.Left); 
            this.listView1.Columns.Add("InOut", 60, HorizontalAlignment.Left); 
            this.listView1.Columns.Add("DateTime", 140, HorizontalAlignment.Left); 
            this.listView1.Columns.Add("IP", 130, HorizontalAlignment.Left); 
            this.listView1.Columns.Add("Port", 60, HorizontalAlignment.Left); 
            this.listView1.Columns.Add("DevID", 60, HorizontalAlignment.Left); 
            this.listView1.Columns.Add("SerialNo", 60, HorizontalAlignment.Left);

           
        }

        private void button1_Click(object sender, EventArgs e)
        {
            String str = this.textPort.Text;
            int nPort  = Convert.ToInt32(str);
            this.axFPCLOCK_Svr1.OpenNetwork(nPort);
            this.connect.Enabled = false;
            this.Disconnect.Enabled = true;
        }

        private void axFPCLOCK_Svr1_OnReceiveGLogData(object sender, AxFPCLOCK_SVRLib._DFPCLOCK_SvrEvents_OnReceiveGLogDataEvent e)
        {
            String strKey = Convert.ToString(nIndex+1);
            String str = e.anSEnrollNumber.ToString("D8"); 

            //数据更新，UI暂时挂起，直到EndUpdate绘制控件，可以有效避免闪烁并大大提高加载速度
            this.listView1.BeginUpdate();

            //this.listView1.Focus();
            ListViewItem lvi = new ListViewItem();  
            lvi.Text = strKey;
            
            lvi.SubItems.Add(str);    
            
            str = FormString(e.anVerifyMode, e.anSEnrollNumber);
            lvi.SubItems.Add(str);

            if(e.anInOutMode == 1)
            {
                str = "OUT";
            }
            else if(0 == e.anInOutMode)
            {
                str = "IN";
            }   
            else
            {
                str = "--";
            }
            lvi.SubItems.Add(str);

            str = Convert.ToString(e.anLogDate.ToString("yyyy/MM/dd HH:mm"));
            lvi.SubItems.Add(str);

            //str = Convert.ToString(e.astrDeviceIP);
            lvi.SubItems.Add(e.astrDeviceIP);

            str = Convert.ToString(e.anDevicePort);
            lvi.SubItems.Add(str);

            str = Convert.ToString(e.vnDeviceID);
            lvi.SubItems.Add(str);

            str = Convert.ToString(e.linkindex);
            lvi.SubItems.Add(str);

            this.listView1.Items.Add(lvi);
            //this.listView1.Items.(5, str);

            this.listView1.Update();

            this.listView1.EnsureVisible(nIndex);
            this.listView1.EndUpdate();  //结束数据处理，UI界面一次性绘制。
            
            int nResult = 1;

            this.axFPCLOCK_Svr1.SendResultandTime(e.linkindex, e.vnDeviceID, e.anSEnrollNumber, nResult);

            nIndex++;
        }

        private void Disconnect_Click(object sender, EventArgs e)
        {
            String str = this.textPort.Text;
            int nPort  = Convert.ToInt32(str);
            this.axFPCLOCK_Svr1.CloseNetwork(nPort);

            this.connect.Enabled = true;
            this.Disconnect.Enabled = false;
        }

        public String FormString(int nVerify, int nEnrollNum)
        {
            int nAction = nVerify % 8;
            if (nEnrollNum == 0)
            {
                 switch(nAction)
                {
                     case 0:
                        return "Closed";
                         //break;
                     case 1:
                         return "Opened";
                        // break;
                     case 2:
                         return "HandOpen";
                        // break;
                     case 3:
                         return "ProcOpen";
                        // break;
                     case 4:
                         return "ProcClose";
                        // break;
                     case 5:
                         return "IllegalOpen";
                         //break;
                     case 6:
                         return "IlleagalRemove";
                         //break;
                     case 7:
                         return "Alarm";
                         //break;
                     case 8:
                         return "--";
                         //break;
                }
            }
            else
            {
                switch (nAction)
                {
                    case 0:
                        return "Normal";
                        //break;

                    case 1:
                        return "f1";
                        //break;

                    case 2:
                        return "f2";
                        //break;

                    case 3:
                        return "f3";
                        //break;

                    case 4:
                        return "f4";
                       // break;

                    case 5:
                        return "in";
                       // break;

                    case 6:
                        return "out";
                        //break;

                    case 7:
                        return "--";
                        //break;
                }
            }
           
            return "Not my fault";
        }

        private void clearList_Click(object sender, EventArgs e)
        {
            
            this.nIndex = 0;
            this.listView1.Items.Clear();
        }
        
    }
}
