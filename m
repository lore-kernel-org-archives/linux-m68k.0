From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] NPTL support for uClinux
Date: Sun, 06 Dec 2009 20:13:14 +0100
Message-ID: <m28wdf6hmd.fsf@igel.home>
References: <4B1C0046.6050207@codesourcery.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:54097 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757207AbZLFTNN (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 6 Dec 2009 14:13:13 -0500
In-Reply-To: <4B1C0046.6050207@codesourcery.com> (Maxim Kuvyrkov's message of
	"Sun, 06 Dec 2009 22:04:38 +0300")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Maxim Kuvyrkov <maxim@codesourcery.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Maxim Kuvyrkov <maxim@codesourcery.com> writes:

> diff --git a/arch/m68knommu/kernel/ptrace.c b/arch/m68knommu/kernel/ptrace.c
> index 4d38289..c77c115 100644
> --- a/arch/m68knommu/kernel/ptrace.c
> +++ b/arch/m68knommu/kernel/ptrace.c
> @@ -319,6 +319,11 @@ long arch_ptrace(struct task_struct *child, long request, long addr, long data)
>  		}
>  #endif
>  
> +	case PTRACE_GET_THREAD_AREA:
> +		ret = put_user(task_thread_info(child)->tp_value,
> +				(unsigned long __user *) data);
> +		break;
> +
>  		default:
>  			ret = -EIO;
>  			break;

Indentation is off here.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
