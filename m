From: "Matthew Lear" <matt@bubblegen.co.uk>
Subject: Re: 2.6.29 & network stack strangeness
Date: Tue, 9 Jun 2009 11:04:11 +0100
Message-ID: <3585ad3f94615c5bfa3f8100f6cfeb0d.squirrel@webmail.plus.net>
References: <4A2936AF.4080601@bubblegen.co.uk>
    <Pine.LNX.4.64.0906060149130.16687@loopy.telegraphics.com.au>
    <4A294532.7030904@bubblegen.co.uk>
    <Pine.LNX.4.64.0906060233071.16687@loopy.telegraphics.com.au>
    <4A294B63.7010404@bubblegen.co.uk> <4A2DC70F.7080401@freescale.com>
Reply-To: matt@bubblegen.co.uk
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from relay.ptn-ipout02.plus.net ([212.159.7.36]:60560 "EHLO
	relay.ptn-ipout02.plus.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1759207AbZFIKEL (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 9 Jun 2009 06:04:11 -0400
In-Reply-To: <4A2DC70F.7080401@freescale.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Lanttor <lanttor.guo@freescale.com>
Cc: linux-m68k@vger.kernel.org


> Could you run "top" command and print out its information?
> "cat /proc/stat" && "cat /proc/interrupts" information are also
> appreciated.

Sure. Info below.

Before running netcat test:

top - 00:02:37 up 2 min,  1 user,  load average: 0.07, 0.07, 0.02
Tasks:  24 total,   1 running,  23 sleeping,   0 stopped,   0 zombie
Cpu(s):  0.7%us,  0.0%sy,  0.0%ni, 98.7%id,  0.0%wa,  0.7%hi,  0.0%si, 
0.0%st
Mem:    254912k total,     6680k used,   248232k free,        0k buffers
Swap:        0k total,        0k used,        0k free,     3008k cached

  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND
  359 root      20   0  2856 1160  944 R  1.0  0.5   0:01.49 top
    3 root      15  -5     0    0    0 S  0.3  0.0   0:00.11 ksoftirqd/0
    1 root      20   0  3280  776  656 S  0.0  0.3   0:01.46 init
    2 root      15  -5     0    0    0 S  0.0  0.0   0:00.00 kthreadd
    4 root      RT  -5     0    0    0 S  0.0  0.0   0:00.00 watchdog/0
    5 root      15  -5     0    0    0 S  0.0  0.0   0:00.00 events/0
    6 root      15  -5     0    0    0 S  0.0  0.0   0:00.06 khelper
   56 root      15  -5     0    0    0 S  0.0  0.0   0:00.00 kblockd/0
   62 root      15  -5     0    0    0 S  0.0  0.0   0:00.00 kseriod
   80 root      20   0     0    0    0 S  0.0  0.0   0:00.00 pdflush
   81 root      20   0     0    0    0 S  0.0  0.0   0:00.00 pdflush
   82 root      15  -5     0    0    0 S  0.0  0.0   0:00.00 kswapd0
   83 root      15  -5     0    0    0 S  0.0  0.0   0:00.00 aio/0
   84 root      15  -5     0    0    0 S  0.0  0.0   0:00.00 nfsiod
  215 root      15  -5     0    0    0 S  0.0  0.0   0:00.00 mtdblockd
  227 root      15  -5     0    0    0 S  0.0  0.0   0:00.00 hid_compat
  230 root      15  -5     0    0    0 S  0.0  0.0   0:00.00 rpciod/0


~ # cat /proc/stat
cpu  209 0 0 16892 0 757 0 0 0
cpu0 209 0 0 16892 0 757 0 0 0
intr 79221 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 61353 0 0 0 0 0 17858 0 0 5 2 0 0 0 2 0 1 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
ctxt 72511
btime 0
processes 360
procs_running 1
procs_blocked 0
~ #


~ # cat /proc/interrupts
M5445X    90:      62109 UART
M5445X    96:      19793 timer
M5445X    99:          6 timer
M5445X   100:          2 fec(TXF)
M5445X   101:          0 fec(TXB)
M5445X   102:          0 fec(TXFIFO)
M5445X   103:          0 fec(TXCR)
M5445X   104:          2 fec(RXF)
M5445X   105:          0 fec(RXB)
M5445X   106:          1 fec(MII)
M5445X   107:          0 fec(LC)
M5445X   108:          0 fec(HBERR)
M5445X   109:          0 fec(GRA)
M5445X   110:          0 fec(EBERR)
M5445X   111:          0 fec(BABT)
M5445X   112:          0 fec(BABR)
~ #


Run netcat test:

target: nc -l -p 3333 > /dev/null &
host: dd if=/dev/zero | nc <target-ip> 3333

Netcat test activity on ethernet ceases after only a few seconds.
Wireshark concurs.


top - 00:05:04 up 5 min,  1 user,  load average: 0.00, 0.04, 0.01
Tasks:  25 total,   1 running,  24 sleeping,   0 stopped,   0 zombie
Cpu(s):  0.7%us,  0.0%sy,  0.0%ni, 98.7%id,  0.0%wa,  0.7%hi,  0.0%si, 
0.0%st
Mem:    254912k total,     6904k used,   248008k free,        0k buffers
Swap:        0k total,        0k used,        0k free,     3008k cached

  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND
  363 root      20   0  2856 1160  944 R  1.0  0.5   0:00.27 top
  362 root      20   0  3280  688  576 S  0.3  0.3   0:00.05 nc
    1 root      20   0  3280  776  656 S  0.0  0.3   0:01.46 init
    2 root      15  -5     0    0    0 S  0.0  0.0   0:00.00 kthreadd
    3 root      15  -5     0    0    0 S  0.0  0.0   0:00.12 ksoftirqd/0
    4 root      RT  -5     0    0    0 S  0.0  0.0   0:00.00 watchdog/0
    5 root      15  -5     0    0    0 S  0.0  0.0   0:00.00 events/0
    6 root      15  -5     0    0    0 S  0.0  0.0   0:00.06 khelper
   56 root      15  -5     0    0    0 S  0.0  0.0   0:00.00 kblockd/0
   62 root      15  -5     0    0    0 S  0.0  0.0   0:00.00 kseriod
   80 root      20   0     0    0    0 S  0.0  0.0   0:00.00 pdflush
   81 root      20   0     0    0    0 S  0.0  0.0   0:00.00 pdflush
   82 root      15  -5     0    0    0 S  0.0  0.0   0:00.00 kswapd0
   83 root      15  -5     0    0    0 S  0.0  0.0   0:00.00 aio/0
   84 root      15  -5     0    0    0 S  0.0  0.0   0:00.00 nfsiod
  215 root      15  -5     0    0    0 S  0.0  0.0   0:00.00 mtdblockd
  227 root      15  -5     0    0    0 S  0.0  0.0   0:00.00 hid_compat


~ # cat /proc/stat
cpu  228 0 0 31924 0 778 0 0 0
cpu0 228 0 0 31924 0 778 0 0 0
intr 106918 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 73732 0 0 0 0 0 32930 0 0 10 96 0 0 0 149 0 1 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0
ctxt 110292
btime 0
processes 364
procs_running 1
procs_blocked 0
~ #


~ # cat /proc/interrupts
M5445X    90:      74523 UART
M5445X    96:      34522 timer
M5445X    99:         10 timer
M5445X   100:        100 fec(TXF)
M5445X   101:          0 fec(TXB)
M5445X   102:          0 fec(TXFIFO)
M5445X   103:          0 fec(TXCR)
M5445X   104:        155 fec(RXF)
M5445X   105:          0 fec(RXB)
M5445X   106:          1 fec(MII)
M5445X   107:          0 fec(LC)
M5445X   108:          0 fec(HBERR)
M5445X   109:          0 fec(GRA)
M5445X   110:          0 fec(EBERR)
M5445X   111:          0 fec(BABT)
M5445X   112:          0 fec(BABR)
~ #


At this point, my proc entry in the fec driver does not indicate any problem:

~ # cat /proc/driver/fec
total interrupts: 284
last interrupt type: 2 [1=tx, 2=rx, 3=mii]
total tx interrupts: 111
total rx interrupts: 172
total mii interrupts: 1
last interrupt event: 0x2000000
total eberr interrupts: 0
total hberr interrupts: 0
tx loop current count: 0
tx loop last count: 1
rx loop current count: 0
rx loop last count: 1
rx last cbd ctrl/status: 0x800
rx last cbd len: 64
rx last cbd buff addr: 0x40407800
rx last netif_rx status: 0
~ #

When starting the netcat test, activity on the ethernet ceases after only
a few seconds. After stopping the dd/nc on the host, I cannot ping the
host from the target or vice versa and the rs-232 console running on the
target does not respond to every key press (usually every second key
press).

I instrumented some of the raw packet handling in the network stack to
attempt to glean a little more info about ping. Running ping from target
to host shows:

~ # ping 192.168.0.2
PING 192.168.0.2 (192.168.0.2): 56 data bytes
[  490.489407] ping:367 /mnt/nht/linux-2.6.29/net/core/datagram.c:99
wait_for_packet - interrupted
[  490.500812] ping:367 /mnt/nht/linux-2.6.29/net/core/datagram.c:110
wait_for_packet - timeo=2147483647, err=-512
[  490.513637] ping:367 /mnt/nht/linux-2.6.29/net/ipv4/raw.c:668
raw_recvmsg - skb_recv_datagram
[  490.524790] ping:367 /mnt/nht/linux-2.6.29/net/ipv4/raw.c:701
raw_recvmsg - returning err -512
[  490.536035] ping:367 /mnt/nht/linux-2.6.29/net/core/sock.c:1869
sock_common_recvmsg - recvmsg returned -512
[  490.548497] ping:367
/mnt/nht/linux-2.6.29/arch/m68k/coldfire/signal.c:804 ERESTART

Other tests which induce similar problems in the network stack include
using wget to pull a large file onto the target.

I can also force netif_rx() to eventually constantly return 1 (pkt
dropped) by using a flood ping at high frequency (see previous post). This
is a different scenario that netcat/wget but possible related to same
cause.

--  Matt

