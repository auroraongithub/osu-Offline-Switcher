using System;
using System.Diagnostics;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ComponentFactory.Krypton.Toolkit;
using NetFwTypeLib;

namespace osubutoffline
{
    public partial class osubutofflineform : KryptonForm

    {
        public osubutofflineform()
        {
            InitializeComponent();
        }

        private void kryptonPalette1_PalettePaint(object sender, PaletteLayoutEventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void btnswitch_Click(object sender, EventArgs e)
        {
            INetFwPolicy2 firewallPolicy = (INetFwPolicy2)Activator.CreateInstance(Type.GetTypeFromProgID("HNetCfg.FwPolicy2"));
            INetFwRule firewallRule = (INetFwRule)Activator.CreateInstance(Type.GetTypeFromProgID("HNetCfg.FWRule"));

            bool isenabled = firewallPolicy.IsRuleGroupCurrentlyEnabled["osuoffline"];

            if (isenabled == true)
            {
                firewallPolicy.EnableRuleGroup(0x7fffffff, "osuoffline", false);
                lblstatus.Text = "osu! is online";
                var p = new Timer();
                p.Interval = 3000; // it will Tick in 3 seconds
                p.Tick += (s, en) =>
                {
                    lblstatus.Text = "osu!offline";
                    p.Stop();
                };
                p.Start();
            }
            else if (isenabled == false)
            {
                firewallPolicy.EnableRuleGroup(0x7fffffff, "osuoffline", true);
                lblstatus.Text = "osu! is offline";
                var t = new Timer();
                t.Interval = 3000; // it will Tick in 3 seconds
                t.Tick += (s, en) =>
                {
                    lblstatus.Text = "osu!offline";
                    t.Stop();
                };
                t.Start();
            }
        }

        private void btnrule_Click(object sender, EventArgs e)
        {
            OpenFileDialog addrule = new OpenFileDialog();
            addrule.Filter = "Executable (*.exe*)|*.exe*";
            addrule.FilterIndex = 1;
            addrule.Multiselect = false;

            if (addrule.ShowDialog() == DialogResult.OK)
            {
                string sFileName = addrule.FileName;

                INetFwPolicy2 firewallPolicy = (INetFwPolicy2)Activator.CreateInstance(Type.GetTypeFromProgID("HNetCfg.FwPolicy2"));
                INetFwRule firewallRule = (INetFwRule)Activator.CreateInstance(Type.GetTypeFromProgID("HNetCfg.FWRule"));


                firewallPolicy.Rules.Remove($"osuoffline"); //remove existing rule if there is

                firewallRule.ApplicationName = sFileName;

                firewallRule.Action = NET_FW_ACTION_.NET_FW_ACTION_BLOCK;
                firewallRule.Description = "rule for osuoffline.";
                firewallRule.Direction = NET_FW_RULE_DIRECTION_.NET_FW_RULE_DIR_OUT;
                firewallRule.Grouping = "osuoffline";
                firewallRule.Enabled = false;
                firewallRule.InterfaceTypes = "All";
                firewallRule.Name = "osuoffline";
                firewallPolicy.Rules.Add(firewallRule);
            }
 
        }

    }
}
