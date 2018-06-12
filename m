From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH v2 08/12] macintosh/via-pmu68k: Don't load driver on
 unsupported hardware
Date: Wed, 13 Jun 2018 08:12:48 +1200
Message-ID: <CAOmrzkLwv0aWna_Puru6QHvRRDO5y5v9jSvoZ+mwBh7XbJ=t7A@mail.gmail.com>
References: <cover.1528423341.git.fthain@telegraphics.com.au>
 <d9d626ca4e7ac9c7e81b24a34f5fbcae9d1d5046.1528423341.git.fthain@telegraphics.com.au>
 <9f015684-4d91-70e4-d2a4-89fe167ff8ab@gmail.com> <m2h8mc4ejw.fsf@linux-m68k.org>
 <e1006b0a-a429-4744-7525-203cb91f1d5f@gmail.com> <alpine.LNX.2.21.1806092140410.26@nippy.intranet>
 <3490f7d6f45ec2586858e4547e97474d93bd2d4d.camel@kernel.crashing.org>
 <alpine.LNX.2.21.1806120911370.34@nippy.intranet> <6c1205cb-7d65-8b30-c4df-59a0ed041313@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6c1205cb-7d65-8b30-c4df-59a0ed041313@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laurent Vivier <lvivier@redhat.com>
Cc: Finn Thain <fthain@telegraphics.com.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Andreas Schwab <schwab@linux-m68k.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: linux-m68k@vger.kernel.org

Hi,

On Tue, Jun 12, 2018 at 6:53 PM, Laurent Vivier <lvivier@redhat.com> wrote:
> On 12/06/2018 01:47, Finn Thain wrote:
>> On Sun, 10 Jun 2018, Benjamin Herrenschmidt wrote:
> ...
>> I don't know what the bootloader situation is, but it looks messy...
>> http://nubus-pmac.sourceforge.net/#booters
>>
>> Laurent, does Emile work on these machines?
>>
>
> No, Emile doesn't work on pmac-nubus, I tried to implement the switch
> from m68k to ppc, but it has never worked.

On the PowerMac 6100 that I installed Linux on many years ago, I'm
pretty sure I used Apple's mkLinux boot loader.

Not sure how that would work with modern kernels and initrds though.
Haven't got that hardware anymore so no way try.

Cheers,

  Michael

>
> Laurent
