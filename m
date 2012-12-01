From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH] m68k: merge arch free memory functions
 into a single function
Date: Sat, 1 Dec 2012 14:49:56 +1100 (EST)
Message-ID: <alpine.LNX.2.00.1212011441010.9740@nippy.intranet>
References: <1354249670-4376-1-git-send-email-gerg@snapgear.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <uclinux-dev-bounces@uclinux.org>
In-Reply-To: <1354249670-4376-1-git-send-email-gerg@snapgear.com>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/options/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Errors-To: uclinux-dev-bounces@uclinux.org
Sender: uclinux-dev-bounces@uclinux.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>
List-Id: linux-m68k@vger.kernel.org


On Fri, 30 Nov 2012, gerg@snapgear.com wrote:

> -	pr_notice("Freeing unused kernel memory: %luk freed (0x%x - 0x%x)\n",
> -		(addr - (unsigned long) __init_begin) >> 10,
> -		(unsigned int) __init_begin, (unsigned int) __init_end);
> +	pr_notice("Freeing %s memory: %dk freed (0x%lx-0x%lx)\n", name, 
> +		pages << (PAGE_SHIFT - 10), start, end);

Perhaps "Freed %d KiB %s memory: 0x%lx - 0x%lx\n" is better (a tad shorter 
and has the correct unit).

Finn
_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
