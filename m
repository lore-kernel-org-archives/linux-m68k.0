From: Lars Michael <lh_post@yahoo.com>
Subject: Coldfire v4 low performance of read/write to shared memory
Date: Wed, 13 Feb 2013 03:20:06 -0800 (PST)
Message-ID: <1360754406.53672.YahooMailClassic@web125605.mail.ne1.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: lh_post@yahoo.com

Hello,

We are having some performance issues on our Coldfire v4 based board and hope we can get some help from the forum.

The CPU is the 54418 running a 2.6.38 kernel. 128MB NAND flash and 256MB SDRAM. The compiler is GCC 4.5.97.

At first we had a low throughput on the ethernet and it drops significantly when CPU load increases. We have tested the controller and kernel module and found that it is not the bottleneck. It is like the kernel network layers do not process packets very fast. So we did more tests, one being access to SDRAM. Here are the main results:

Write 25MB to shared memory:
[root@CPB529 /]# dd if=/dev/zero bs=1M count=25 of=/dev/shm/25MiB
26214400 bytes (26 MB) copied, 1.58318 s, 16.6 MB/s

Read 25MiB from shared mem:
[root@CPB529 /]# dd if=/dev/shm/25MiB of=/dev/null
26214400 bytes (26 MB) copied, 1.2091 s, 21.7 MB/s

Read/write 25MiB to shared mem:
[root@CPB529 /]# dd if=/dev/shm/25MiB of=/dev/shm/25MiBnew
26214400 bytes (26 MB) copied, 6.36459 s, 4.1 MB/s

In the last test, we would expect a much higher throughput. At least 8MB/s! Why is it so low? and could this indicate a problem in e.g. the kernel that can affect all processes running (including slowing down the kernel network layers)?

How can we diagnose this further? 

At the same time we noticed (by using strace) that there is an excessive and continously sequence of system calls at normal program execusion:
 
333 (__NR_GET_THREAD_AREA), and 335 (__NR_ATOMIC_CMPXCHG_32)

They appear for both single and multithreaded programs.

Are all these calls required? are they adding unnecessary load on the CPU?

Example:
SYS_333(0, 0x601c2dc0, 0x602f8059, 0x8, 0x16078) = 1612489920
SYS_335(0x1, 0, 0xffffffff, 0x8, 0x80000000) = 0
SYS_335(0x602f4634, 0, 0, 0x8, 0x80000000) = 0
SYS_335(0, 0x1, 0, 0x8, 0x80000000)     = 1
SYS_333(0x8de, 0x601c2a90, 0x6003b37c, 0x2, 0xd8630) = 1612489920
SYS_333(0, 0x601c2a90, 0x6003b41f, 0x2, 0xd8630) = 1612489920
SYS_333(0x487, 0, 0x6003b37c, 0x2, 0xd833c) = 1612489920
SYS_333(0, 0, 0x6003b9a0, 0x2, 0xd833c) = 1612489920
SYS_335(0x1, 0, 0, 0x2, 0xbf839e84)     = 0

Anybody running Linux on v4 Coldfire that has experienced similiar issues?

Appreciate all comments and help on this. Let me know if more information is needed.

Thanks and regards,
Lars Horvath
