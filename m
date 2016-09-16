From: Greg Ungerer <gerg@linux-m68k.org>
Subject: Re: Crash in entry.S:resume on Atari ST
Date: Fri, 16 Sep 2016 16:39:06 +1000
Message-ID: <7d38f54e-4b7a-af7b-3cc8-15be7369f0e4@linux-m68k.org>
References: <8132f924080d98f2bbe149d35352507d@hu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <8132f924080d98f2bbe149d35352507d@hu-berlin.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Matthias Reis <matthias.reis@hu-berlin.de>, linux-m68k@lists.linux-m68k.org

Hi Matthias,

On 16/09/16 08:35, Matthias Reis wrote:
> Hi all,
> 
> in the frame of a hobby project (https://ford.biologie.hu-berlin.de/matze/linux-m68k-atarinommu/wikis/home), I did some changes to the kernel to make it boot on MMU-less, original Atari ST machines.
> 
> So far, my kernel manages to mount a root filesystem from fd0 and run busybox.
> 
> However, busybox (nano-X as well), produces a bus error and crashes the whole kernel:

What procedure did you follow to build your apps?
Are you using flat format binaries?


> ==== hatari emulator output:
> M68000 Bus Error reading at address $0 PC=$48f2.
> Bus error exception at 0x48f2!
> ====
> 
> The disassembly from objdump -D shows, that this happens in resume (https://ford.biologie.hu-berlin.de/matze/linux-m68k-atarinommu/blob/master/arch/m68k/kernel/entry.S#L2195):
> 
> === objdump -D vmlinux output:
> 000048cc <resume>:
>     48cc:       2208            movel %a0,%d1
>     48ce:       40e8 0320       movew %sr,%a0@(800)
>     48d2:       48e7 031e       moveml %d6-%d7/%a3-%fp,%sp@-
>     48d6:       214f 0318       movel %sp,%a0@(792)
>     48da:       4e6b            movel %usp,%a3
>     48dc:       214b 031c       movel %a3,%a0@(796)
>     48e0:       2669 031c       moveal %a1@(796),%a3
>     48e4:       4e63            movel %a3,%usp
>     48e6:       2e69 0318       moveal %a1@(792),%sp
>     48ea:       4cdf 78c0       moveml %sp@+,%d6-%d7/%a3-%fp
>     48ee:       46e9 0320       movew %a1@(800),%sr
>     48f2:       4e75            rtsp
> ===
> 
> It can be seen from the register dump given by the hatari debugger, that USP contains 0x0 and the superuser bit (indicated by "S=0") is not set:
> 
> ===  hatari emulator output:
> CPU=$48f2, VBL=6379, FrameCycles=86856, HBL=387, LineCycles=168, DSP=N/A
> $000048f2 : 4e75                               rts
> r
>   D0 00000008   D1 00002200   D2 00005401   D3 00961EC8
>   D4 00000000   D5 00940020   D6 602E0206   D7 00E00030
>   A0 00865B68   A1 00961EEC   A2 0080E000   A3 000026E4
>   A4 000045C0   A5 000045E4   A6 00004794   A7 00000000
> USP  00000000 ISP  00000018
> T=00 S=0 M=0 X=0 N=0 Z=0 V=0 C=0 IMASK=2 STP=0
> Prefetch 42a7 (CLR) 4e75 (RTS) Chip latch 00000000
> 000048F2 4e75                     RTS
> Next PC: 000048f4
> 
> ===
> 
> If I understand correctly, the problem is that RTS sets the PC to USP, so the Atari wants to execute the code at 0x0, which is wrong and not allowed, of course.
> 
> I found the line "p->thread.usp = 0;" in the function copy_thread  (https://ford.biologie.hu-berlin.de/matze/linux-m68k-atarinommu/blob/master/arch/m68k/kernel/process.c#L158), which is executed under the condition "unlikely(p->flags & PF_KTHREAD)". Just setting p->thread.usp = usp; did not help and I'm not sure why this should be necessary anyway.

It is unlikely you would need to change anything here. That code works
as is on nommu ColdFire and other 68k nommu parts (68328 for example).


> Another thing I found out is that the crash happens at first call of resume with the superuser bit set to zero. Before that certain call, there are many successful calls in superuser mode.
> 
> Do you have any idea why this might happen? Is it maybe a nommu-related issue? Any speculations are welcome.

So is this crashing at the step of trying to load and run the
first user app?

Regards
Greg
