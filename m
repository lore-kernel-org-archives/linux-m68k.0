From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [RFC PATCH 2/2] arch/m68k: Add CONFIG_CPU_HAS_NO_MULDIV32
Date: Fri, 13 May 2016 14:01:05 +1000 (AEST)
Message-ID: <alpine.LNX.2.00.1605131400460.7564@nippy.intranet>
References: <20160513023932.16877.qmail@ns.horizon.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20160513023932.16877.qmail@ns.horizon.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: George Spelvin <linux@horizon.com>
Cc: geert@linux-m68k.org, gerg@linux-m68k.org, linux-m68k@lists.linux-m68k.org


On Fri, 12 May 2016, George Spelvin wrote:

> Finn Thain wrote:
> > On Fri, 12 May 2016, George Spelvin wrote:
> >> +# Old GCC versions fall back to -m5200 compilation, generating these calls
> >> +# even though the CPU doesn't actually need it.  See arch/m68k/Makefile.
> >
> > The comment is vague. Does anyone know which GCC versions do or don't 
> > work like this?
> 
> Yes, I looked it up in the archived GCC documentation.

Thanks.

>  My current patch says:
> 
> (commit comment)
>     Since the compiler version is not known at Kconfig time, this cannot 
>     be expressed in a CONFIG_ variable, but instead is handled by some 
>     Makefile hackery.  This only applies to GCC 4.2.4 and earlier, which 
>     is hopefully almost everyone, but Documentation/Changes says GCC 
>     3.2.

I think you meant to write, "This does not apply to GCC 4.3 or later", 
as that's what you put in the new comment below. 

> 
> (arch/m68k/lib/Makefile)
> +# GCC 4.2.4 and earlier don't know about ColdFire models that support
> +# DIV.L and fall back to -m5200, generating these calls even though the
> +# CPU doesn't actually need it.  Not needed on GCC 4.3 or later.
> +# See the $(call cc-option ...) lines in arch/m68k/Makefile.

-- 
