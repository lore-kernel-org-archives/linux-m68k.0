From: Alan Hourihane <alanh@fairlite.co.uk>
Subject: Re: Atari TT (next)
Date: Mon, 09 Jan 2012 01:25:48 +0000
Message-ID: <4F0A421C.9000600@fairlite.co.uk>
References: <4F079F6B.8080502@fairlite.co.uk> <4F07EA66.6020603@gmail.com> <4F08E748.4020305@fairlite.co.uk> <4F0917E9.9090600@gmail.com> <4F0964EC.2080505@fairlite.co.uk> <CAOmrzkLH18VCY0dzJPM14dn5ccWmSBkiPzq8EFqnCDHiM3bECQ@mail.gmail.com> <4F0A2DD0.4000707@fairlite.co.uk> <CAOmrzk+P3mPXu_Q_KxgEk_jx-JNhXY4ydrKoGM+43LpD5icTHw@mail.gmail.com> <4F0A3CDE.7070308@fairlite.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from fairlite.demon.co.uk ([80.176.228.186]:56646 "EHLO
	fairlite.demon.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755092Ab2AIBZ5 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 8 Jan 2012 20:25:57 -0500
In-Reply-To: <4F0A3CDE.7070308@fairlite.co.uk>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

It's o.k. a nice clean coldboot and things are well again. But a problem
with my initrd I think with process "start-udev" ?

Where's the latest initrd for 3.1 kernels ?

Thanks folks..

I'm booting up the initrd right now :-)
Linux version 3.1.0-atari-00246-gbff0dc7-dirty (root@server) (gcc
version 4.5.3 (Gentoo 4.5.3-r1 p1.0, pie-0.4.5) ) #33 Mon Jan 9 01:12:42
GMT 2012
console [debug0] enabled
Atari hardware found: TT_SHIFTER ST_MFP TT_MFP TT_SCSI_DMA TT_SCSI
YM2149 PCM SCC_DMA SCC VME SCU MICROWIRE TT_CLK FDC_SPEED ACSI
OFFSET 0x0 size 0x400000
On node 0 totalpages: 1024
free_area_init_node: node 0, pgdat 00200afc, node_mem_map 00230000
  DMA zone: 9 pages used for memmap
  DMA zone: 0 pages reserved
  DMA zone: 1015 pages, LIFO batch:0
On node 1 totalpages: 32768
free_area_init_node: node 1, pgdat 00201480, node_mem_map 00239030
  DMA zone: 288 pages used for memmap
  DMA zone: 0 pages reserved
  DMA zone: 32480 pages, LIFO batch:7
initrd: 08d51a08 - 09000000
atari_stram pool: size = 524288 bytes, resource = [???
0x0035a000-0x003d9fff flags 0x0]
pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
pcpu-alloc: [0] 0
Built 2 zonelists in Zone order, mobility grouping on.  Total pages: 33495
Kernel command line: fb=false root=/dev/ram load_ramdisk=1
stram_pool=524288 console=tty video=atafb:ttmid debug=ser2
BOOT_IMAGE=vmlinux.gz
PID hash table entries: 1024 (order: 0, 4096 bytes)
Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
Memory: 128244k/128244k available (1528k kernel code, 5308k data, 92k init)
NR_IRQS:72
sys stat 0x14
vme stat 0x0
Console: colour dummy device 80x25
console [tty0] enabled
Calibrating delay loop... 7.21 BogoMIPS (lpj=36096)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 512
NET: Registered protocol family 16
bio: create slab <bio-0> at 0
SCSI subsystem initialized
NET: Registered protocol family 2
IP route cache hash table entries: 2048 (order: 1, 8192 bytes)
TCP established hash table entries: 8192 (order: 4, 65536 bytes)
TCP bind hash table entries: 8192 (order: 3, 32768 bytes)
TCP: Hash tables configured (established 8192 bind 8192)
TCP reno registered
UDP hash table entries: 256 (order: 0, 4096 bytes)
UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
NET: Registered protocol family 1
Trying to unpack rootfs image as initramfs...
Freeing initrd memory: 687k freed
msgmni has been set to 255
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 254)
io scheduler noop registered
io scheduler cfq registered (default)
atafb_init: start
atafb_init: initializing TT hw
atari_stram_alloc: allocate 311296 bytes
atari_stram_alloc: returning [??? 0x0035a000-0x003a5fff flags 0x0]
atafb: screen_base 0035a000 real_screen_base 0035a000 screen_len 311296
Determined 640x480, depth 4
   virtual 640x972
Console: switching to colour frame buffer device 80x30
fb0: frame buffer device, using 304K of video memory
Non-volatile memory driver v1.3
brd: module loaded
loop: module loaded
Atari SCSI: resetting the SCSI bus... done
scsi0: options CAN_QUEUE=16 CMD_PER_LUN=8 SCAT-GAT=128 TAGGED-QUEUING=no
HOSTID=7 generic options AUTOSENSE REAL DMA SCSI-2 TAGGED QUEUING
generic release=7
scsi0 : Atari native SCSI
scsi 0:0:0:0: Direct-Access     SEAGATE  ST34520N         1498 PQ: 0 ANSI: 2
eth0: Riebl-Card (without battery) at io 0xfe00fff0, mem 0xfe010000, irq
56, hwaddr 00:00:36:04:00:00
eth0: Warning: This is a default ethernet address!
      Use "ifconfig hw ether ..." to set the address.
atarilance.c: v1.3 04/04/96 Roman.Hodek@informatik.uni-erlangen.de
sd 0:0:0:0: [sda] 8888924 512-byte logical blocks: (4.55 GB/4.23 GiB)
sd 0:0:0:0: [sda] Write Protect is off
sd 0:0:0:0: [sda] Mode Sense: 93 00 10 08
sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, supports
DPO and FUA
mousedev: PS/2 mouse device common for all mice
WARNING: keyboard self test failed!
input: Atari Keyboard as /devices/virtual/input/input0
TCP cubic registered
NET: Registered protocol family 17
 sda: AHDI sda1 sda2 sda3 XGM< sda4 sda5 sda6 sda7 >
sd 0:0:0:0: [sda] Attached SCSI disk
*** FORMAT ERROR ***   FORMAT=0
Current process id is 768
BAD KERNEL TRAP: 00000000
Modules linked in:
PC: [<000029de>] flush_thread+0x8/0xe
SR: 2300  SP: 07de1e68  a2: 07ddc070
d0: 00000001    d1: 07ddb000    d2: 00220c50    d3: 00000001
d4: 00226e90    d5: 00000000    a0: 003f6660    a1: 00330310
Process start-udev (pid: 768, task=07ddc070)
Frame format=0
Stack from 07de1e9c:
        23000007 0007239e 00000080 00000001 0022af40 07d3b080 08836ba0
07ddf200
        80000002 07def600 000987b2 07d3b080 00000000 07de1fcc fffffff8
00000000
        00000300 efb1a71c 07d3b080 001f614c 00032b28 00043fe4 00000000
07de1f30
        00000020 00071d06 07ddc070 00220c50 efffff92 00000001 00002000
00071d2e
        07d3b104 00000002 00000008 07d3b080 00358ad8 00000003 00071e7e
08fdaf7e
        00071eb2 000716d0 00043fe4 00071710 07d3b080 07de1fcc 00000001
08835000
Call Trace: [<0007239e>] flush_old_exec+0x424/0x434
 [<000987b2>] load_elf_binary+0x22c/0xc72
 [<00032b28>] __request_module+0x0/0xfe
 [<00043fe4>] module_put+0x0/0x24
 [<00071d06>] get_arg_page+0x30/0x96
 [<00220c50>] unlzma+0x284/0xc10
 [<00002000>] _start+0x0/0x8
 [<00071d2e>] get_arg_page+0x58/0x96
 [<00071e7e>] copy_strings+0x112/0x168
 [<00071eb2>] copy_strings+0x146/0x168
 [<000716d0>] search_binary_handler+0x26/0x1be
 [<00043fe4>] module_put+0x0/0x24
 [<00071710>] search_binary_handler+0x66/0x1be
 [<00071d6c>] copy_strings+0x0/0x168
 [<00072896>] do_execve+0x14e/0x224
 [<00002b24>] sys_execve+0x32/0x54
 [<000025b8>] syscall+0x8/0xc

Code: 508f 265f 285f 4e75 598f 357c 0001 01c4 <f357> 588f 4e75 4e68 42a7
42a7 42a7 2f2f 0010 2f08 4878 0011 4eb9 0002 5382 4fef
Disabling lock debugging due to kernel taint
Kernel panic - not syncing: Attempted to kill init!
Call Trace: [<0017b77c>] panic+0x54/0x192
 [<00008b00>] bindec+0x180/0x198
 [<00027d42>] do_exit+0x72/0x52a
 [<00008b00>] bindec+0x180/0x198
 [<00028408>] do_group_exit+0x6a/0x8c
 [<00008b00>] bindec+0x180/0x198
 [<0002843e>] sys_exit_group+0x14/0x1a
 [<00008b00>] bindec+0x180/0x198
 [<000025b8>] syscall+0x8/0xc
 [<00002024>] run_init_process+0x1c/0x22
 [<0000205a>] init_post+0x30/0x9a
 [<0007873e>] sys_dup+0x0/0x42
 [<00216134>] kernel_init+0xe6/0xee
 [<0021604e>] kernel_init+0x0/0xee
 [<00001000>] kernel_pg_dir+0x0/0x1000
 [<00002874>] kernel_thread+0x3a/0x4e

Alan.
