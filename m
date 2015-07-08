From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: [RFC 6/8] m68k: m5441x: set rambar to end of SRAM physical addr
 space
Date: Wed, 08 Jul 2015 23:53:39 +1000
Message-ID: <559D2B63.2000007@westnet.com.au>
References: <1436349092-2214-1-git-send-email-yannick.gicquel@gmail.com> <1436349092-2214-7-git-send-email-yannick.gicquel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out9.external.iinet.net.au ([203.59.1.226]:52191
	"EHLO icp-osb-irony-out9.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932771AbbGHNxm (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 8 Jul 2015 09:53:42 -0400
In-Reply-To: <1436349092-2214-7-git-send-email-yannick.gicquel@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Yannick GICQUEL <yannick.gicquel@open.eurogiciel.org>, linux-m68k@vger.kernel.org

Hi Yannick,

On 08/07/15 19:51, Yannick GICQUEL wrote:
> Even if SRAM is not used, this is required to avoid inconsistency at runtime.
> Otherwise, an assertion failed in ld.so during init process execution:
>
> Inconsistency detected by ld.so: rtld.c: 1290: dl_main: Assertion `_rtld_local._dl_rtld_map.l_libname' failed!

Can you explain further?
Is this really the underlying problem?
Surely the presence of the SRAM block mapped in shouldn't
have any impact on running applications.

Where does CONFIG_SRAM_BASE come from?
I didn't see in this series anywhere.

Regards
Greg



> Signed-off-by: Yannick GICQUEL <yannick.gicquel@gmail.com>
> ---
>   arch/m68k/coldfire/head.S | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/arch/m68k/coldfire/head.S b/arch/m68k/coldfire/head.S
> index fa31be2..bf39885 100644
> --- a/arch/m68k/coldfire/head.S
> +++ b/arch/m68k/coldfire/head.S
> @@ -151,6 +151,15 @@ _start0:
>
>   _start:
>   	nop					/* filler */
> +#if defined(CONFIG_M5441x)
> +#if defined(CONFIG_SRAM_BASE)
> +	movel	#(CONFIG_SRAM_BASE+0x221), %d0
> +#else
> +	movel	#(0x8ff00000+0x221), %d0
> +#endif
> +	movec	%d0, %rambar1
> +#endif
> +
>   	movew	#0x2700, %sr			/* no interrupts */
>   	movel	#CACHE_INIT,%d0			/* disable cache */
>   	movec	%d0,%CACR
>
