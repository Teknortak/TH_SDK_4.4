namespace fp_server
{
    partial class Form1
    {
        /// <summary>
        /// 必需的设计器变量。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 清理所有正在使用的资源。
        /// </summary>
        /// <param name="disposing">如果应释放托管资源，为 true；否则为 false。</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows 窗体设计器生成的代码

        /// <summary>
        /// 设计器支持所需的方法 - 不要
        /// 使用代码编辑器修改此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.connect = new System.Windows.Forms.Button();
            this.listView1 = new System.Windows.Forms.ListView();
            this.label1 = new System.Windows.Forms.Label();
            this.textPort = new System.Windows.Forms.TextBox();
            this.Disconnect = new System.Windows.Forms.Button();
            this.clearList = new System.Windows.Forms.Button();
            this.axFPCLOCK_Svr1 = new AxFPCLOCK_SVRLib.AxFPCLOCK_Svr();
            ((System.ComponentModel.ISupportInitialize)(this.axFPCLOCK_Svr1)).BeginInit();
            this.SuspendLayout();
            // 
            // connect
            // 
            this.connect.Location = new System.Drawing.Point(188, 311);
            this.connect.Margin = new System.Windows.Forms.Padding(2);
            this.connect.Name = "connect";
            this.connect.Size = new System.Drawing.Size(56, 18);
            this.connect.TabIndex = 0;
            this.connect.Text = "connect";
            this.connect.UseVisualStyleBackColor = true;
            this.connect.Click += new System.EventHandler(this.button1_Click);
            // 
            // listView1
            // 
            this.listView1.FullRowSelect = true;
            this.listView1.GridLines = true;
            this.listView1.Location = new System.Drawing.Point(11, 10);
            this.listView1.Margin = new System.Windows.Forms.Padding(2);
            this.listView1.MultiSelect = false;
            this.listView1.Name = "listView1";
            this.listView1.ShowItemToolTips = true;
            this.listView1.Size = new System.Drawing.Size(787, 270);
            this.listView1.TabIndex = 1;
            this.listView1.UseCompatibleStateImageBehavior = false;
            this.listView1.View = System.Windows.Forms.View.Details;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(28, 318);
            this.label1.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(53, 12);
            this.label1.TabIndex = 2;
            this.label1.Text = "HostPort";
            // 
            // textPort
            // 
            this.textPort.Location = new System.Drawing.Point(98, 312);
            this.textPort.Margin = new System.Windows.Forms.Padding(2);
            this.textPort.Name = "textPort";
            this.textPort.Size = new System.Drawing.Size(76, 21);
            this.textPort.TabIndex = 3;
            // 
            // Disconnect
            // 
            this.Disconnect.Location = new System.Drawing.Point(260, 311);
            this.Disconnect.Margin = new System.Windows.Forms.Padding(2);
            this.Disconnect.Name = "Disconnect";
            this.Disconnect.Size = new System.Drawing.Size(77, 18);
            this.Disconnect.TabIndex = 0;
            this.Disconnect.Text = "Disconnect";
            this.Disconnect.UseVisualStyleBackColor = true;
            this.Disconnect.Click += new System.EventHandler(this.Disconnect_Click);
            // 
            // clearList
            // 
            this.clearList.ForeColor = System.Drawing.Color.SaddleBrown;
            this.clearList.Location = new System.Drawing.Point(352, 311);
            this.clearList.Margin = new System.Windows.Forms.Padding(2);
            this.clearList.Name = "clearList";
            this.clearList.Size = new System.Drawing.Size(75, 18);
            this.clearList.TabIndex = 0;
            this.clearList.Text = "ClearList";
            this.clearList.UseVisualStyleBackColor = true;
            this.clearList.Click += new System.EventHandler(this.clearList_Click);
            // 
            // axFPCLOCK_Svr1
            // 
            this.axFPCLOCK_Svr1.Enabled = true;
            this.axFPCLOCK_Svr1.Location = new System.Drawing.Point(697, 285);
            this.axFPCLOCK_Svr1.Name = "axFPCLOCK_Svr1";
            this.axFPCLOCK_Svr1.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("axFPCLOCK_Svr1.OcxState")));
            this.axFPCLOCK_Svr1.Size = new System.Drawing.Size(100, 41);
            this.axFPCLOCK_Svr1.TabIndex = 4;
            this.axFPCLOCK_Svr1.Visible = false;
            this.axFPCLOCK_Svr1.OnReceiveGLogData += new AxFPCLOCK_SVRLib._DFPCLOCK_SvrEvents_OnReceiveGLogDataEventHandler(this.axFPCLOCK_Svr1_OnReceiveGLogData);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(809, 340);
            this.Controls.Add(this.axFPCLOCK_Svr1);
            this.Controls.Add(this.textPort);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.listView1);
            this.Controls.Add(this.clearList);
            this.Controls.Add(this.Disconnect);
            this.Controls.Add(this.connect);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Margin = new System.Windows.Forms.Padding(2);
            this.MaximizeBox = false;
            this.Name = "Form1";
            this.Text = "FPServer";
            ((System.ComponentModel.ISupportInitialize)(this.axFPCLOCK_Svr1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button connect;
        private System.Windows.Forms.ListView listView1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox textPort;
        private AxFPCLOCK_SVRLib.AxFPCLOCK_Svr axFPCLOCK_Svr1;
        private System.Windows.Forms.Button Disconnect;
        private System.Windows.Forms.Button clearList;       
    }
}

