From: "George Spelvin" <linux@horizon.com>
Subject: Re: [RFC PATCH 2/2] arch/m68k: Add CONFIG_CPU_HAS_NO_MULDIV32
Date: 12 May 2016 22:39:32 -0400
Message-ID: <20160513023932.16877.qmail@ns.horizon.com>
References: <alpine.LNX.2.00.1605131323500.7564@nippy.intranet>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from ns.horizon.com ([71.41.210.147]:57096 "HELO ns.horizon.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1752216AbcEMCje (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Thu, 12 May 2016 22:39:34 -0400
In-Reply-To: <alpine.LNX.2.00.1605131323500.7564@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: fthain@telegraphics.com.au, linux@horizon.com
Cc: geert@linux-m68k.org, gerg@linux-m68k.org, linux-m68k@lists.linux-m68k.org

Finn Thain wrote:
> On Fri, 12 May 2016, George Spelvin wrote:
>> +# Old GCC versions fall back to -m5200 compilation, generating these calls
>> +# even though the CPU doesn't actually need it.  See arch/m68k/Makefile.
>
> The comment is vague. Does anyone know which GCC versions do or don't work 
> like this?

Yes, I looked it up in the archived GCC documentation.  My current patch says:

(commit comment)
    Since the compiler version is not known at Kconfig time, this cannot
    be expressed in a CONFIG_ variable, but instead is handled by some
    Makefile hackery.  This only applies to GCC 4.2.4 and earlier, which
    is hopefully almost everyone, but Documentation/Changes says GCC 3.2.

(arch/m68k/lib/Makefile)
+# GCC 4.2.4 and earlier don't know about ColdFire models that support
+# DIV.L and fall back to -m5200, generating these calls even though the
+# CPU doesn't actually need it.  Not needed on GCC 4.3 or later.
+# See the $(call cc-option ...) lines in arch/m68k/Makefile.
