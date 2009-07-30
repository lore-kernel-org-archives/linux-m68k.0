From: "lanttor.g" <lanttor.g@gmail.com>
Subject: Re: [PATCH]: fix CACHE_ENABLE macro on mcf532x
	platform
Date: Fri, 31 Jul 2009 05:23:18 +0800
Message-ID: <4A720F46.40109@gmail.com>
References: <4A716808.9030705@freescale.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <uclinux-dev-bounces@uclinux.org>
In-Reply-To: <4A716808.9030705@freescale.com>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Sender: uclinux-dev-bounces@uclinux.org
Errors-To: uclinux-dev-bounces@uclinux.org
Cc: linux-m68k@vger.kernel.org, uClinux development list <uclinux-dev@uclinux.org>
List-Id: linux-m68k@vger.kernel.org

Lanttor wrote:
> Hi,
>
> This patch is to fix CACHE_ENABLE macro on the mcf532x platform, which
> is defined in the file: arch/m68k/include/asm/mcfcache.h.
> This patch is based on Linus' current git tree.
>
> Thanks,
>
>   
Consider the mcf5329 has 32M SDRAM, I think the original setting of ACR
(0x4001c0000) is OK.

So this patch is cancelled, sorry for that :)

Lanttor
_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
