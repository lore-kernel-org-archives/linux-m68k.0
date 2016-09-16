From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Crash in entry.S:resume on Atari ST
Date: Fri, 16 Sep 2016 16:23:05 +0200
Message-ID: <87y42rx6t2.fsf@linux-m68k.org>
References: <8132f924080d98f2bbe149d35352507d@hu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <8132f924080d98f2bbe149d35352507d@hu-berlin.de> (Matthias Reis's
        message of "Fri, 16 Sep 2016 00:35:53 +0200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Matthias Reis <matthias.reis@hu-berlin.de>
Cc: linux-m68k@lists.linux-m68k.org

On Sep 16 2016, Matthias Reis <matthias.reis@hu-berlin.de> wrote:

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
> It can be seen from the register dump given by the hatari debugger, that
> USP contains 0x0 and the superuser bit (indicated by "S=0") is not set:
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

Given the value of SSP and the values loaded into D6/D7 (which match the
ROM shadow at address 0), it is clear that SP was 0 at $48ea.  So it
looks like A1 is just pointing at a block of zeros, not at a valid task
struct.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
