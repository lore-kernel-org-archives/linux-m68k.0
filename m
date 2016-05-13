From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [RFC PATCH 2/2] arch/m68k: Add CONFIG_CPU_HAS_NO_MULDIV32
Date: Fri, 13 May 2016 13:28:49 +1000 (AEST)
Message-ID: <alpine.LNX.2.00.1605131323500.7564@nippy.intranet>
References: <20160512203116.8654.qmail@ns.horizon.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20160512203116.8654.qmail@ns.horizon.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: George Spelvin <linux@horizon.com>
Cc: geert@linux-m68k.org, gerg@linux-m68k.org, linux-m68k@lists.linux-m68k.org


On Fri, 12 May 2016, George Spelvin wrote:

> 
> +lib-$(CONFIG_CPU_HAS_NO_MUL32) += mulsi3.o
> +lib-$(CONFIG_CPU_HAS_NO_DIV32) += divsi3.o udivsi3.o modsi3.o umodsi3.o
> +
> +# Old GCC versions fall back to -m5200 compilation, generating these calls
> +# even though the CPU doesn't actually need it.  See arch/m68k/Makefile.
> +
> +ifeq ($(cpuflags-y),-m5200)
> +lib-y += divsi3.o udivsi3.o modsi3.o umodsi3.o
> +endif

The comment is vague. Does anyone know which GCC versions do or don't work 
like this?

-- 
