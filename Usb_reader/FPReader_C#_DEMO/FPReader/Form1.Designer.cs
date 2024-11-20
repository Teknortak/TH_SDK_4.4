namespace FPReader
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.button1 = new System.Windows.Forms.Button();
            this.pictureBox = new System.Windows.Forms.PictureBox();
            this.EnrollFPWithStr = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.TB_ID = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.TB_FP_NUM = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.TB_Privilege = new System.Windows.Forms.TextBox();
            this.Message = new System.Windows.Forms.TextBox();
            this.btn_setmonitor = new System.Windows.Forms.Button();
            this.txtsecond = new System.Windows.Forms.TextBox();
            this.axFpreader1 = new AxFPREADERLib.AxFpreader();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.axFpreader1)).BeginInit();
            this.SuspendLayout();
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(387, 25);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(123, 21);
            this.button1.TabIndex = 0;
            this.button1.Text = "EnrollFP";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.EnrollFP_Click);
            // 
            // pictureBox
            // 
            this.pictureBox.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.pictureBox.ErrorImage = null;
            this.pictureBox.Image = global::FPReader.Properties.Resources.test;
            this.pictureBox.ImageLocation = "";
            this.pictureBox.InitialImage = null;
            this.pictureBox.Location = new System.Drawing.Point(37, 25);
            this.pictureBox.Name = "pictureBox";
            this.pictureBox.Size = new System.Drawing.Size(260, 270);
            this.pictureBox.TabIndex = 1;
            this.pictureBox.TabStop = false;
            // 
            // EnrollFPWithStr
            // 
            this.EnrollFPWithStr.Location = new System.Drawing.Point(387, 52);
            this.EnrollFPWithStr.Name = "EnrollFPWithStr";
            this.EnrollFPWithStr.Size = new System.Drawing.Size(123, 21);
            this.EnrollFPWithStr.TabIndex = 0;
            this.EnrollFPWithStr.Text = "EnrollFPWithString";
            this.EnrollFPWithStr.UseVisualStyleBackColor = true;
            this.EnrollFPWithStr.Click += new System.EventHandler(this.EnrollFPWithStr_Click);
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(387, 240);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(113, 21);
            this.button3.TabIndex = 0;
            this.button3.Text = "DeleteAll";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(345, 128);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(23, 12);
            this.label1.TabIndex = 2;
            this.label1.Text = "ID:";
            this.label1.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // TB_ID
            // 
            this.TB_ID.Location = new System.Drawing.Point(400, 122);
            this.TB_ID.Name = "TB_ID";
            this.TB_ID.Size = new System.Drawing.Size(100, 21);
            this.TB_ID.TabIndex = 3;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(318, 153);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(47, 12);
            this.label2.TabIndex = 2;
            this.label2.Text = "FP Num:";
            this.label2.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // TB_FP_NUM
            // 
            this.TB_FP_NUM.Location = new System.Drawing.Point(400, 146);
            this.TB_FP_NUM.Name = "TB_FP_NUM";
            this.TB_FP_NUM.Size = new System.Drawing.Size(100, 21);
            this.TB_FP_NUM.TabIndex = 3;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(316, 176);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(65, 12);
            this.label3.TabIndex = 2;
            this.label3.Text = "Privilege:";
            // 
            // TB_Privilege
            // 
            this.TB_Privilege.Location = new System.Drawing.Point(400, 170);
            this.TB_Privilege.Name = "TB_Privilege";
            this.TB_Privilege.Size = new System.Drawing.Size(100, 21);
            this.TB_Privilege.TabIndex = 3;
            // 
            // Message
            // 
            this.Message.Location = new System.Drawing.Point(37, 329);
            this.Message.Name = "Message";
            this.Message.ReadOnly = true;
            this.Message.Size = new System.Drawing.Size(463, 21);
            this.Message.TabIndex = 4;
            this.Message.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // btn_setmonitor
            // 
            this.btn_setmonitor.Location = new System.Drawing.Point(37, 360);
            this.btn_setmonitor.Name = "btn_setmonitor";
            this.btn_setmonitor.Size = new System.Drawing.Size(123, 21);
            this.btn_setmonitor.TabIndex = 6;
            this.btn_setmonitor.Text = "setmonitorsecond";
            this.btn_setmonitor.UseVisualStyleBackColor = true;
            this.btn_setmonitor.Click += new System.EventHandler(this.btn_setmonitor_Click);
            // 
            // txtsecond
            // 
            this.txtsecond.Location = new System.Drawing.Point(180, 361);
            this.txtsecond.Name = "txtsecond";
            this.txtsecond.Size = new System.Drawing.Size(49, 21);
            this.txtsecond.TabIndex = 7;
            this.txtsecond.Text = "0";
            // 
            // axFpreader1
            // 
            this.axFpreader1.Enabled = true;
            this.axFpreader1.Location = new System.Drawing.Point(387, 285);
            this.axFpreader1.Name = "axFpreader1";
            this.axFpreader1.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("axFpreader1.OcxState")));
            this.axFpreader1.Size = new System.Drawing.Size(100, 50);
            this.axFpreader1.TabIndex = 8;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(545, 393);
            this.Controls.Add(this.axFpreader1);
            this.Controls.Add(this.txtsecond);
            this.Controls.Add(this.btn_setmonitor);
            this.Controls.Add(this.Message);
            this.Controls.Add(this.TB_Privilege);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.TB_FP_NUM);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.TB_ID);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.pictureBox);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.EnrollFPWithStr);
            this.Controls.Add(this.button1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Fixed3D;
            this.Name = "Form1";
            this.Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.axFpreader1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.PictureBox pictureBox;
        private System.Windows.Forms.Button EnrollFPWithStr;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox TB_ID;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox TB_FP_NUM;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox TB_Privilege;
        private System.Windows.Forms.TextBox Message;
        private System.Windows.Forms.Button btn_setmonitor;
        private System.Windows.Forms.TextBox txtsecond;
        private AxFPREADERLib.AxFpreader axFpreader1;
    }
}

