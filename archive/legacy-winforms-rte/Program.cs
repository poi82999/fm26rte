using System;
using System.Windows.Forms;

namespace FM26RTE;

internal static class Program
{
    [STAThread]
    static void Main()
    {
        ApplicationConfiguration.Initialize();
        Application.Run(new MvpMainForm());
    }
}
