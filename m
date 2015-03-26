From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: [PATCH] m68knommu: fix fec setup warning for
	ColdFire 5271 builds
Date: Thu, 26 Mar 2015 18:50:18 +1000
Message-ID: <5513C84A.9060109@uclinux.org>
References: <1427340156-11839-1-git-send-email-gerg@uclinux.org>
 <mvma8z0yxh9.fsf@hawking.suse.de>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <uclinux-dev-bounces@uclinux.org>
In-Reply-To: <mvma8z0yxh9.fsf@hawking.suse.de>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/options/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Errors-To: uclinux-dev-bounces@uclinux.org
Sender: uclinux-dev-bounces@uclinux.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
List-Id: linux-m68k@vger.kernel.org


On 26/03/15 18:27, Andreas Schwab wrote:
> gerg@uclinux.org writes:
>
>> Fix it my moving the definition of par inside the 5271 conditional code.
> s/my/by/

Thanks Andreas, I'll fix that up.

Regards
Greg


_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
