From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Crash in entry.S:resume on Atari ST
Date: Fri, 16 Sep 2016 11:29:38 +0200
Message-ID: <87r38kxke5.fsf@linux-m68k.org>
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

SR should never contain S=0 at this point, as returning from kernel
context always happens with RTE (via resume_userspace).

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
