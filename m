From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH v2 08/12] macintosh/via-pmu68k: Don't load driver on
 unsupported hardware
Date: Tue, 12 Jun 2018 09:47:06 +1000 (AEST)
Message-ID: <alpine.LNX.2.21.1806120911370.34@nippy.intranet>
References: <cover.1528423341.git.fthain@telegraphics.com.au>         <d9d626ca4e7ac9c7e81b24a34f5fbcae9d1d5046.1528423341.git.fthain@telegraphics.com.au>         <9f015684-4d91-70e4-d2a4-89fe167ff8ab@gmail.com>         <m2h8mc4ejw.fsf@linux-m68k.org>     
    <e1006b0a-a429-4744-7525-203cb91f1d5f@gmail.com>         <alpine.LNX.2.21.1806092140410.26@nippy.intranet> <3490f7d6f45ec2586858e4547e97474d93bd2d4d.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3490f7d6f45ec2586858e4547e97474d93bd2d4d.camel@kernel.crashing.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Andreas Schwab <schwab@linux-m68k.org>, linuxppc-dev@lists.ozlabs.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Laurent Vivier <lvivier@redhat.com>
List-Id: linux-m68k@vger.kernel.org

On Sun, 10 Jun 2018, Benjamin Herrenschmidt wrote:

> Pre-PCI is basically "NUBUS" based even in absence of an actual NuBus 
> slot :-) It has to do with the internal HW architecture. The only ones 
> that aren't are the even older designs (the 68000 based ones).
> 

There is already some disagreement in the comments in the nubus-pmac code 
about the suitability of "PMU_NUBUS_BASED" as opposed to e.g. 
"PMU_WHITNEY_BASED".

Point is, the PMU driver doesn't care about the expansion slots or 
architecture (Whitney-based PMU appears on m68k and powerpc). So NuBus vs. 
PCI is a red herring here. The pmu_kind relates to backlight, buttons and 
battery.

(Leaving aside the PMU driver, if a pre-OpenFirmware Mac has a "slot zero" 
ROM, one can argue that it is actually a NuBus machine, regardless of any 
actual expansion slots.)

> What's the situation with those NuBus things ? What do they use as a 
> bootloader ? The old Apple one or BootX ? We should merge that port of 
> it's maintained.
> 

I agree that this code should not languish out-of-tree. But it would need 
more work before it could reasonably be submitted to reviewers.

I do have some nubus-pmac hardware but I also have more mac/68k driver 
work to do before I can tackle another architecture.

I don't know what the bootloader situation is, but it looks messy...
http://nubus-pmac.sourceforge.net/#booters

Laurent, does Emile work on these machines?

-- 

> Cheers,
> Ben.
>  
